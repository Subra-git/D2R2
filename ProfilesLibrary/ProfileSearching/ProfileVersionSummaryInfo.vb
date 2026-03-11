Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionSummaryInfo
    Inherits ReadOnlyBase(Of ProfileVersionSummaryInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mScenarioId As Guid
    Private mProfileId As Guid
    Private mAffectedSpeciesNameDictionary As New Dictionary(Of Guid, String)
    Private mAffectedSpeciesList As New List(Of ProfileVersionAffectedSpecies)
    Private mAnswers As New List(Of ProfileVersionAnswer)
    Private mNotes As New List(Of ProfileVersionNote)
    Private mProfileVersionSearchResult As New List(Of ProfileVersionSearchResult)

    Private mProfiledSpecies As String = String.Empty
    Private mProfiledSpeciesCount As Integer
    Private mOtherAffectedSpecies As String = String.Empty
    Private mOtherAffectedSpeciesCount As Integer
    Private mVersionMajor As Byte
    Private mVersionMinor As Byte
    Private mStatus As ProfileVersionStatus
    Private mEffectiveDateFrom As SmartDate
	Private mEffectiveDateTo As SmartDate
	Private mLastContributionDate As SmartDate
	Private mIsPublic As Boolean

	Public ReadOnly Property Id() As Guid
		Get
			Return mId
		End Get
	End Property

	Public ReadOnly Property ScenarioId() As Guid
		Get
			Return mScenarioId
		End Get
	End Property

	Public ReadOnly Property ProfileId() As Guid
		Get
			Return mProfileId
		End Get
	End Property

	Public ReadOnly Property ProfiledSpecies() As String
		Get
			Return mProfiledSpecies
		End Get
	End Property

	Public ReadOnly Property ProfiledSpeciesCount() As Integer
		Get
			Return mProfiledSpeciesCount
		End Get
	End Property

	Public ReadOnly Property OtherAffectedSpecies() As String
		Get
			Return mOtherAffectedSpecies
		End Get
	End Property

	Public ReadOnly Property OtherAffectedSpeciesCount() As Integer
		Get
			Return mOtherAffectedSpeciesCount
		End Get
	End Property

	Public ReadOnly Property AffectedSpeciesList() As List(Of ProfileVersionAffectedSpecies)
		Get
			Return mAffectedSpeciesList
		End Get
	End Property

	Public ReadOnly Property Answers() As List(Of ProfileVersionAnswer)
		Get
			Return mAnswers
		End Get
	End Property

	Public ReadOnly Property Notes() As List(Of ProfileVersionNote)
		Get
			Return mNotes
		End Get
	End Property

	Public ReadOnly Property Version() As String
		Get
			Return mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture) & "." & mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture)
		End Get
	End Property

	Public ReadOnly Property VersionMajor() As Byte
		Get
			Return mVersionMajor
		End Get
	End Property

	Public ReadOnly Property VersionMinor() As Byte
		Get
			Return mVersionMinor
		End Get
	End Property

	Public ReadOnly Property VersionSortValue() As Integer
		Get
			Return (mVersionMajor * 256) + mVersionMinor
		End Get
	End Property

	Public ReadOnly Property Status() As ProfileVersionStatus
		Get
			Return mStatus
		End Get
	End Property

	Public ReadOnly Property IsCurrent() As Boolean
		Get
			Return mEffectiveDateTo.IsEmpty
		End Get
	End Property

	Public ReadOnly Property IsWhatIfScenario() As Boolean
		Get
			Return Not mScenarioId.Equals(mProfileId)
		End Get
	End Property

	Public ReadOnly Property IsPublic() As Boolean
		Get
			Return mIsPublic
		End Get
	End Property

	Public ReadOnly Property EffectiveDates() As String
		Get
			Return mEffectiveDateFrom.ToString() & " - " & mEffectiveDateTo.ToString()
		End Get
	End Property

	Public ReadOnly Property EffectiveDateFrom() As Date
		Get
			Return mEffectiveDateFrom.Date
		End Get
	End Property

	Public ReadOnly Property EffectiveDateTo() As Date
		Get
			Return mEffectiveDateTo.Date
		End Get
	End Property

	Public ReadOnly Property LastContributionDate() As DateTime
		Get
			Return mLastContributionDate.Date
		End Get
	End Property

	Public ReadOnly Property ProfileVersionSearchResults As List(Of ProfileVersionSearchResult)
		Get
			Return mProfileVersionSearchResult.Distinct().ToList()
		End Get
	End Property

	Public ReadOnly Property SearchResults() As String
		Get
			Dim resultString As String = ""
			For Each result As ProfileVersionSearchResult In ProfileVersionSearchResults
				resultString &= $"{result.DisplayString}<br>"
			Next
			Return resultString
		End Get
	End Property

	Protected Overrides Function GetIdValue() As Object
		Return mId
	End Function

	Public Overrides Function ToString() As String

		Return "v" & mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture) & "." & mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture) & " (" & mStatus.ToString() & ") " & Me.EffectiveDates

	End Function

	Public Function ContainsSpecies(ByVal speciesId As Guid) As Boolean
		Return mAffectedSpeciesNameDictionary.ContainsKey(speciesId)
	End Function

	Public Function SectionsContainWords(ByVal words As List(Of String), ByVal sectionSelection As List(Of Integer), ByVal useExactWordMatch As Boolean) As Boolean
		Dim answersContainWords As Boolean = False

		For Each section As Integer In sectionSelection
			Dim sectionFilteredAnswers As IEnumerable(Of ProfileVersionAnswer) = mAnswers.Where(Function(profileAnswers) profileAnswers.SectionNumber = section)
			Dim wordsFoundMap As New HashSet(Of String)

			For Each word As String In words
				For Each answer As ProfileVersionAnswer In sectionFilteredAnswers
					Dim answerWords As List(Of String) = WordProcessor.ProcessWords(answer.Answer)
					Dim guidanceWords As List(Of String) = WordProcessor.ProcessWords(answer.Guidance)

					If useExactWordMatch AndAlso Not word.Contains(" ") Then
						If Not wordsFoundMap.Contains(word) Then
							If answerWords.Contains(word.ToLower()) Then
								wordsFoundMap.Add(word)
								answer.AddMatchedWord(word, False)
							ElseIf guidanceWords.Contains(word.ToLower()) Then
								answer.AddMatchedWord(word, True)
							End If

						End If
					Else
						If answer.AnswerContainsWords(words, sectionSelection) Then
							wordsFoundMap.Add(word)
							answer.AddMatchedWord(word, False)
						ElseIf answer.GuidanceContainsWords(words, sectionSelection) Then
							wordsFoundMap.Add(word)
							answer.AddMatchedWord(word, True)
						End If
					End If
				Next
			Next

			Dim allWordsFoundInSection As Boolean = words.All(Function(word) wordsFoundMap.Contains(word))

			If allWordsFoundInSection Then
				For Each answer As ProfileVersionAnswer In sectionFilteredAnswers
					If answer.WordsMatched.Any() Then
						mProfileVersionSearchResult.Add(ProfileVersionSearchResult.GetSectionProfileVersionSearchResult(answer.SectionNumber, answer.QuestionNumber, answer.QuestionShortName, answer.WordsMatched, answer.MatchedInGuidance))
					End If
				Next
				answersContainWords = True
			Else
				For Each answer As ProfileVersionAnswer In sectionFilteredAnswers
					answer.ClearMatchedWords()
				Next
			End If
		Next

		Return answersContainWords
	End Function

	Public Function NotesContainWords(ByVal words As List(Of String), ByVal searchReference As Boolean, ByVal useExactWordMatch As Boolean) As Boolean
		Dim found As Boolean = False

		For Each profileNote As ProfileVersionNote In mNotes
			If profileNote.NoteContainsWords(words, searchReference, useExactWordMatch) Then
				mProfileVersionSearchResult.Add(ProfileVersionSearchResult.GetNoteProfileVersionSearchResult(profileNote.NoteType, words))
				found = True
			End If
		Next

		Return found
	End Function

#End Region

#Region " Factory Methods "

	Friend Shared Function GetProfileVersionSummaryInfo(ByVal profileVersionInfo As DataContracts.ProfileSearchProfileVersionSummaryInfo) As ProfileVersionSummaryInfo
		Return New ProfileVersionSummaryInfo(profileVersionInfo)
	End Function

	Private Sub New()
		' require use of factory methods
	End Sub

	Private Sub New(ByVal profileVersionInfo As DataContracts.ProfileSearchProfileVersionSummaryInfo)
		Fetch(profileVersionInfo)
	End Sub

#End Region

#Region " Data Access "

	Private Sub Fetch(ByVal profileVersionInfo As DataContracts.ProfileSearchProfileVersionSummaryInfo)
		' load values
		mId = profileVersionInfo.Id
		mScenarioId = profileVersionInfo.ScenarioId
		mProfileId = profileVersionInfo.ProfileId
		mVersionMajor = profileVersionInfo.VersionMajor
		mVersionMinor = profileVersionInfo.VersionMinor
		If profileVersionInfo.IsPublished Then
			mStatus = ProfileVersionStatus.Published
		Else
			mStatus = ProfileVersionStatus.Draft
		End If
		mEffectiveDateFrom = New Csla.SmartDate(profileVersionInfo.EffectiveDateFrom)
		mEffectiveDateTo = New Csla.SmartDate(profileVersionInfo.EffectiveDateTo)
		mLastContributionDate = New Csla.SmartDate(profileVersionInfo.LastContributionDate)
		mIsPublic = profileVersionInfo.IsPublic
		For Each species As DataContracts.ProfileSearchProfileAffectedSpecies In profileVersionInfo.AffectedSpecies
            AddSpecies(species.SpeciesId, species.Name, species.Type, species.IsActive)
            mAffectedSpeciesList.Add(ProfileVersionAffectedSpecies.GetProfileVersionAffectedSpecies(species))
        Next
        For Each answer As DataContracts.ProfileSearchProfileAnswer In profileVersionInfo.Answers
            mAnswers.Add(ProfileVersionAnswer.GetProfileVersionAnswer(answer))
        Next
        For Each note As DataContracts.ProfileSearchProfileNote In profileVersionInfo.Notes
            mNotes.Add(ProfileVersionNote.GetProfileVersionNote(note))
        Next
        mProfileVersionSearchResult = New List(Of ProfileVersionSearchResult)
    End Sub

    Friend Sub AddSpecies(ByVal id As Guid, ByVal species As String, ByVal type As String, ByVal isActive As Boolean)

        mAffectedSpeciesNameDictionary.Add(id, species)

        If type = "Profiled" Then
            If mProfiledSpecies.Length > 0 Then
                mProfiledSpecies &= ", "
            End If

            mProfiledSpecies &= species
            If Not isActive Then
                mProfiledSpecies &= " (inactive)"
            End If
            mProfiledSpeciesCount += 1
        Else
            If mOtherAffectedSpecies.Length > 0 Then
                mOtherAffectedSpecies &= ", "
            End If

            mOtherAffectedSpecies &= species
            If Not isActive Then
                mOtherAffectedSpecies &= " (inactive)"
            End If
            mOtherAffectedSpeciesCount += 1
        End If

    End Sub

#End Region

End Class



