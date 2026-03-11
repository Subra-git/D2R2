Imports System.ComponentModel
Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class ProfileInfoList
	Inherits ReadOnlyListBase(Of ProfileInfoList, ProfileInfo)

	Private mProfileInfoDictionary As Dictionary(Of Guid, ProfileInfo)

	Public Function GetProfileInfo(ByVal profileId As Guid) As ProfileInfo
		Return mProfileInfoDictionary(profileId)
	End Function

#Region "Filtering"

	Private Class FilterCriteria
		Private mDisplayPublished As Boolean
		Private mDisplayDraft As Boolean
		Private mDisplayScenarios As Boolean
		Private mDisplayMyProfiles As Boolean
		Private mFilterLetter As String = String.Empty
		Private mTitleMatches As New List(Of String)
		Private mSpeciesList As List(Of Guid)
		Private mSearchForType As SearchForType
		Private mSearchAppearsInType As SearchAppearsInType
		Private mSectionSelection As List(Of Integer)
		Private mUseExactWordMatch As Boolean

		Public ReadOnly Property DisplayPublished() As Boolean
			Get
				Return mDisplayPublished
			End Get
		End Property

		Public ReadOnly Property DisplayDraft() As Boolean
			Get
				Return mDisplayDraft
			End Get
		End Property

		Public ReadOnly Property DisplayScenarios() As Boolean
			Get
				Return mDisplayScenarios
			End Get
		End Property

		Public ReadOnly Property DisplayMyProfiles() As Boolean
			Get
				Return mDisplayMyProfiles
			End Get
		End Property

		Public Property FilterLetter() As String
			Get
				Return mFilterLetter
			End Get
			Set(ByVal value As String)
				mFilterLetter = value
			End Set
		End Property

		Public ReadOnly Property TitleMatches() As List(Of String)
			Get
				Return mTitleMatches
			End Get
		End Property

		Public ReadOnly Property SearchAppearsInType() As SearchAppearsInType
			Get
				Return mSearchAppearsInType
			End Get
		End Property

		Public ReadOnly Property SearchForType() As SearchForType
			Get
				Return mSearchForType
			End Get
		End Property

		Public Property SpeciesList() As List(Of Guid)
			Get
				Return mSpeciesList
			End Get
			Set(ByVal value As List(Of Guid))
				mSpeciesList = value
			End Set
		End Property

		Public Property SectionSelection() As List(Of Integer)
			Get
				Return mSectionSelection
			End Get
			Set(value As List(Of Integer))
				mSectionSelection = value
			End Set
		End Property

		Public Property UseExactWordMatch As Boolean
			Get
				Return mUseExactWordMatch
			End Get
			Set(value As Boolean)
				mUseExactWordMatch = value
			End Set
		End Property

		Public Sub SetTitleMatch(ByVal title As String)
			mTitleMatches.Add(title)
		End Sub

		Public Sub New(ByVal displayPublished As Boolean, ByVal displayDraft As Boolean, ByVal displayScenarios As Boolean,
					   ByVal displayMyProfiles As Boolean, ByVal searchAppearsInType As SearchAppearsInType, ByVal searchForType As SearchForType,
					   ByVal sectionSelection As List(Of Integer), ByVal useExactWordMatch As Boolean)
			mDisplayPublished = displayPublished
			mDisplayDraft = displayDraft
			mDisplayScenarios = displayScenarios
			mDisplayMyProfiles = displayMyProfiles
			mSearchAppearsInType = searchAppearsInType
			mSearchForType = searchForType
			mSectionSelection = sectionSelection
			mUseExactWordMatch = useExactWordMatch
		End Sub

	End Class

	Private Shared Function Filter(ByVal item As Object, ByVal filterValue As Object) As Boolean

		Dim profile As ProfileInfo = DirectCast(item, ProfileInfo)
		Dim criteria As FilterCriteria = DirectCast(filterValue, FilterCriteria)
		Dim criteriaMatch As Boolean = True

		If criteria.FilterLetter.Length = 1 AndAlso Not profile.Title.ToLower().StripHtmlTags().StartsWith(criteria.FilterLetter) Then
			Return False
		End If

		If criteria.SpeciesList IsNot Nothing Then
			Dim speciesFound As Boolean
			For Each matchSpecies As Guid In criteria.SpeciesList
				If profile.ContainsSpecies(matchSpecies) Then
					speciesFound = True
					Exit For
				End If
			Next
			If Not speciesFound Then
				Return False
			End If
		End If

		Dim words As List(Of String) = New List(Of String)

		If criteria.TitleMatches.Count = 1 Then
			criteriaMatch = False
			If criteria.SearchForType = SearchForType.ExactWordOrPhrase Then
				words.Add(criteria.TitleMatches.ElementAt(0).Trim())
			Else
				words.AddRange(criteria.TitleMatches.ElementAt(0).Split(New Char() {" "c}, StringSplitOptions.RemoveEmptyEntries).ToList())
			End If
			Select Case criteria.SearchAppearsInType
				Case SearchAppearsInType.All
					If TitleMatchesWords(profile, words) Then
						criteriaMatch = True
					End If
					If profile.SectionsContainWords(words, criteria.SectionSelection, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If
					If profile.NotesContainWords(words, True, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If
					If profile.NotesContainWords(words, False, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If

				Case SearchAppearsInType.ProfileAnswers
					If profile.SectionsContainWords(words, criteria.SectionSelection, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If

				Case SearchAppearsInType.ProfileTitles
					If TitleMatchesWords(profile, words) Then
						criteriaMatch = True
					End If

				Case SearchAppearsInType.References
					If profile.NotesContainWords(words, True, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If

				Case SearchAppearsInType.FurtherInformation
					If profile.NotesContainWords(words, False, criteria.UseExactWordMatch) Then
						criteriaMatch = True
					End If
			End Select
		End If

		Dim hasPublished As Boolean
		Dim hasDraft As Boolean
		Dim hasUserProfiles As Boolean
		For Each scenario As ProfileScenarioInfo In profile.GetScenarios()
			If scenario.GetPublishedVersions().Count > 0 Then
				hasPublished = True
			End If
			If scenario.GetDraftVersions().Count > 0 Then
				hasDraft = True
			End If

			If scenario.UserRole.Length > 0 AndAlso ((Not scenario.IsWhatIfScenario) OrElse criteria.DisplayScenarios) Then
				hasUserProfiles = True
			End If
		Next

		Return criteriaMatch And ((hasPublished And criteria.DisplayPublished) Or (hasDraft And criteria.DisplayDraft)) And ((Not criteria.DisplayMyProfiles) Or hasUserProfiles)

	End Function

	Public Function GetFilteredList(ByVal displayPublished As Boolean,
									ByVal displayDraft As Boolean,
									ByVal displayScenarios As Boolean,
									ByVal displayMyProfiles As Boolean,
									ByVal filterLetter As String,
									ByVal title As String,
									ByVal speciesList As List(Of Guid),
									ByVal searchAppearsInType As SearchAppearsInType,
									ByVal searchForType As SearchForType,
									ByVal selectedSections As List(Of Integer),
									ByVal useExactWordMatch As Boolean,
									ByVal sortBy As SortByType) As FilteredBindingList(Of ProfileInfo)
		Dim filteredList As New FilteredBindingList(Of ProfileInfo)(Me, AddressOf Filter)

		Dim criteria As New FilterCriteria(displayPublished, displayDraft, displayScenarios, displayMyProfiles, searchAppearsInType, searchForType, selectedSections, useExactWordMatch)

		If filterLetter.Length = 1 Then
			criteria.FilterLetter = filterLetter.ToLower()
		End If

		If title.Length > 0 Then
			criteria.SetTitleMatch(title)
		End If

		If speciesList IsNot Nothing AndAlso speciesList.Count > 0 Then
			criteria.SpeciesList = speciesList
		End If

		filteredList.ApplyFilter(String.Empty, criteria)

		Dim sortList As IEnumerable(Of ProfileInfo) = ProfileInfoList.SortList(sortBy, filteredList)

		Return New FilteredBindingList(Of ProfileInfo)(sortList.ToList())

	End Function

	Private Shared Function SortList(sortBy As SortByType, filteredList As FilteredBindingList(Of ProfileInfo)) As IEnumerable(Of ProfileInfo)
		Dim result As IEnumerable(Of ProfileInfo) = filteredList

		Select Case sortBy
			Case SortByType.Za
				result = filteredList.OrderByDescending((Function(profile) profile.Title.StripHtmlTags))
			Case SortByType.Az
				result = filteredList.OrderBy((Function(profile) profile.Title.StripHtmlTags))
			Case SortByType.LeastRecentlyUpdated
				Dim ascendingOrder As Boolean = True
				Dim comparer As New ProfileInfoEffectiveDateComparer(ascendingOrder)
				result = filteredList.OrderBy(Function(profile) profile, comparer)
			Case SortByType.MostRecentlyUpdated
				Dim ascendingOrder As Boolean = False
				Dim comparer As New ProfileInfoEffectiveDateComparer(ascendingOrder)
				result = filteredList.OrderBy(Function(profile) profile, comparer)
		End Select

		Return result
	End Function

	Private Shared Function TitleMatchesWords(profile As ProfileInfo, words As List(Of String)) As Boolean
		Dim allMatchedWords As Boolean = True
		For Each word As String In words
			If Not profile.Title.ToLower().Contains(word.ToLower()) Then
				allMatchedWords = False
				Exit For
			End If
		Next

		Return allMatchedWords
	End Function

#End Region

#Region " Authorization Rules "

	Public Shared Function CanGetProfileInfoList() As Boolean

		If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
			Return False
		End If

		Return True  'this data is available to all, even anonymous users
	End Function

#End Region

#Region " Factory Methods "

	Public Shared Function GetProfileInfoList(ByVal returnQuestionAnswers As Boolean, ByVal returnNotes As Boolean, ByVal words As String, ByVal performSqlSearch As Boolean, ByVal sectionSelection As List(Of Integer)) As ProfileInfoList

		If Not CanGetProfileInfoList() Then
			Throw New System.Security.SecurityException("You do not have permission to view a list of profile search results")
		End If

		Return DataPortal.Fetch(Of ProfileInfoList)(New Criteria(returnQuestionAnswers, returnNotes, words, performSqlSearch, sectionSelection))

	End Function

	Private Sub New()
		' require use of factory methods
	End Sub

#End Region

#Region " Data Access "

	<Serializable()>
	Private Class Criteria

		Private mReturnQuestionAnswers As Boolean
		Private mReturnNotes As Boolean
		Private mWords As String
		Private mPerformSqlWordSearch As Boolean
		Private mSectionSelection As List(Of Integer)

		Public Property ReturnQuestionAnswers() As Boolean
			Get
				Return mReturnQuestionAnswers
			End Get
			Private Set(ByVal value As Boolean)
				mReturnQuestionAnswers = value
			End Set
		End Property

		Public Property ReturnNotes() As Boolean
			Get
				Return mReturnNotes
			End Get
			Private Set(ByVal value As Boolean)
				mReturnNotes = value
			End Set
		End Property

		Public Property Words() As String
			Get
				Return mWords
			End Get
			Private Set(ByVal value As String)
				mWords = value
			End Set
		End Property

		Public Property PerformSqlWordSearch() As Boolean
			Get
				Return mPerformSqlWordSearch
			End Get
			Private Set(ByVal value As Boolean)
				mPerformSqlWordSearch = value
			End Set
		End Property

		Public Property SectionSelection As List(Of Integer)
			Get
				Return mSectionSelection
			End Get
			Set(value As List(Of Integer))
				mSectionSelection = value
			End Set
		End Property

		Public Sub New(ByVal returnQuestionAnswers As Boolean, ByVal returnNotes As Boolean, ByVal words As String, ByVal performSqlSearch As Boolean, ByVal sectionSelection As List(Of Integer))
			mReturnQuestionAnswers = returnQuestionAnswers
			mReturnNotes = returnNotes
			mWords = words
			mPerformSqlWordSearch = performSqlSearch
			mSectionSelection = sectionSelection
		End Sub

	End Class

	Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

		RaiseListChangedEvents = False
		IsReadOnly = False

		mProfileInfoDictionary = New Dictionary(Of Guid, ProfileInfo)

		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

		Dim db As ServiceContracts.IProfileSearchService = DataFactory.GetProfileSearchService()
		Dim profileSearchProfileInfos As List(Of DataContracts.ProfileSearchProfileInfo) =
			db.GetAllProfiles(New DataContracts.GetAllProfilesRequest(identity.UserId, criteria.ReturnQuestionAnswers, criteria.ReturnNotes, criteria.Words, criteria.PerformSqlWordSearch, criteria.SectionSelection))

		For Each profileSearchProfileInfo As DataContracts.ProfileSearchProfileInfo In profileSearchProfileInfos
			Dim profile As ProfileInfo = ProfileInfo.GetProfileInfo(profileSearchProfileInfo)
			mProfileInfoDictionary.Add(profile.Id, profile)
			Add(profile)
		Next

		IsReadOnly = True
		RaiseListChangedEvents = True

	End Sub

#End Region

End Class

