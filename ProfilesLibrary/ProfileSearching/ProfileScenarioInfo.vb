Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileScenarioInfo
    Inherits ReadOnlyBase(Of ProfileScenarioInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileId As Guid
    Private mScenarioTitle As String = String.Empty
    Private mUserRole As String = String.Empty
    Private mProfileStatus As String
    Private mNextReviewDate As Csla.SmartDate
    Private mReviewIncomplete As Boolean
    Private mDraftProfileVersions As ProfileVersionSummaryInfoList
    Private mPublishedProfileVersions As ProfileVersionSummaryInfoList
    Private mAllProfileVersions As ProfileVersionSummaryInfoList
    Private mProfileVersionDictionary As Dictionary(Of Guid, ProfileVersionSummaryInfo)

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property IsWhatIfScenario() As Boolean
        Get
            Return Not mProfileId.Equals(mId)
        End Get
    End Property

    Public ReadOnly Property ScenarioTitle() As String
        Get
            Return mScenarioTitle
        End Get
    End Property

    Public ReadOnly Property ProfileStatus() As String
        Get
            Return mProfileStatus
        End Get
    End Property

    Public ReadOnly Property NextReviewDate() As SmartDate
        Get
            Return mNextReviewDate
        End Get
    End Property

    Public ReadOnly Property ReviewIncomplete() As Boolean
        Get
            Return mReviewIncomplete
        End Get
    End Property

    Public ReadOnly Property UserRole() As String
        Get
            Return mUserRole
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mScenarioTitle
    End Function

    Public Function GetDraftVersions() As ProfileVersionSummaryInfoList
        Return mDraftProfileVersions
    End Function

    Public Function GetPublishedVersions() As ProfileVersionSummaryInfoList
        Return mPublishedProfileVersions
    End Function

    Public Function GetAllVersions() As ProfileVersionSummaryInfoList
        Return mAllProfileVersions
    End Function

    Public Function GetVersion(ByVal id As Guid) As ProfileVersionSummaryInfo
        Return mProfileVersionDictionary(id)
    End Function

    Public Function ContainsSpecies(ByVal speciesId As Guid) As Boolean

        If mDraftProfileVersions.CurrentVersion IsNot Nothing AndAlso mDraftProfileVersions.CurrentVersion.ContainsSpecies(speciesId) Then
            Return True
        End If

        If mPublishedProfileVersions.CurrentVersion IsNot Nothing AndAlso mPublishedProfileVersions.CurrentVersion.ContainsSpecies(speciesId) Then
            Return True
        End If

        Return False

    End Function

    Public Function SectionsContainWords(ByVal words As List(Of String), ByVal sectionSelection As List(Of Integer), ByVal useExactWordMatch As Boolean) As Boolean
        If mDraftProfileVersions.CurrentVersion IsNot Nothing AndAlso mDraftProfileVersions.CurrentVersion.SectionsContainWords(words, sectionSelection, useExactWordMatch) Then
            Return True
        End If

        If mPublishedProfileVersions.CurrentVersion IsNot Nothing AndAlso mPublishedProfileVersions.CurrentVersion.SectionsContainWords(words, sectionSelection, useExactWordMatch) Then
            Return True
        End If

        Return False
    End Function

    Public Function NotesContainWords(ByVal words As List(Of String), ByVal searchReference As Boolean, ByVal useExactWordMatch As Boolean) As Boolean
        If mDraftProfileVersions.CurrentVersion IsNot Nothing AndAlso mDraftProfileVersions.CurrentVersion.NotesContainWords(words, searchReference, useExactWordMatch) Then
            Return True
        End If

        If mPublishedProfileVersions.CurrentVersion IsNot Nothing AndAlso mPublishedProfileVersions.CurrentVersion.NotesContainWords(words, searchReference, useExactWordMatch) Then
            Return True
        End If

        Return False

    End Function

    'returns true if the scenario contains all the species in the passed in list of species IDs
    Public Function ContainsSpecies(ByVal speciesList As List(Of Guid)) As Boolean

        For Each currentSpecies As Guid In speciesList
            If ContainsSpecies(currentSpecies) Then
                Return True
            End If
        Next

        Return False

    End Function

    Public Function SearchResultsString() As String

        Dim resultString As String = ""
		If mDraftProfileVersions.CurrentVersion IsNot Nothing Then
			For Each result As ProfileVersionSearchResult In mDraftProfileVersions.CurrentVersion.ProfileVersionSearchResults _
																								.OrderBy(Function(section) section.Section) _
																								.ThenBy(Function(question) question.Question)
				resultString &= $"{result.DisplayString}<br>"
			Next
			Return resultString
        End If

        If mPublishedProfileVersions.CurrentVersion IsNot Nothing Then
			For Each result As ProfileVersionSearchResult In mPublishedProfileVersions.CurrentVersion.ProfileVersionSearchResults _
																								.OrderBy(Function(section) section.Section) _
																								.ThenBy(Function(question) question.Question)
				resultString &= $"{result.DisplayString}<br>"
			Next
			Return resultString
        End If

        Return resultString

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetScenarioProfileInfo(ByVal profileScenarioInfo As DataContracts.ProfileSearchProfileScenarioInfo) As ProfileScenarioInfo
        Return New ProfileScenarioInfo(profileScenarioInfo)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal profileScenarioInfo As DataContracts.ProfileSearchProfileScenarioInfo)
        Fetch(profileScenarioInfo)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileScenarioInfo As DataContracts.ProfileSearchProfileScenarioInfo)
        ' load values
        mId = profileScenarioInfo.Id
        mProfileId = profileScenarioInfo.ProfileId
        mScenarioTitle = profileScenarioInfo.ScenarioTitle
        mUserRole = profileScenarioInfo.UserRole
        mProfileStatus = profileScenarioInfo.ProfileStatus
        If profileScenarioInfo.NextReviewDate.HasValue Then
            mNextReviewDate = New Csla.SmartDate(profileScenarioInfo.NextReviewDate.Value)
        End If
        mReviewIncomplete = profileScenarioInfo.ReviewIncomplete
        mDraftProfileVersions = ProfileVersionSummaryInfoList.NewProfileVersionSummaryInfoList()
        mPublishedProfileVersions = ProfileVersionSummaryInfoList.NewProfileVersionSummaryInfoList()
        mAllProfileVersions = ProfileVersionSummaryInfoList.NewProfileVersionSummaryInfoList()
        mProfileVersionDictionary = New Dictionary(Of Guid, ProfileVersionSummaryInfo)
        For Each profileVersion As DataContracts.ProfileSearchProfileVersionSummaryInfo In profileScenarioInfo.ProfileVersions
            FetchProfileVersion(profileVersion)
        Next

    End Sub

    Friend Sub FetchProfileVersion(ByVal profileVersionInfo As DataContracts.ProfileSearchProfileVersionSummaryInfo)

        Dim version As ProfileVersionSummaryInfo

        If profileVersionInfo.IsPublished Then
            version = mPublishedProfileVersions.FetchProfileVersion(profileVersionInfo)
        Else
            version = mDraftProfileVersions.FetchProfileVersion(profileVersionInfo)
        End If

        mAllProfileVersions.AddProfileVersion(version)
        mProfileVersionDictionary.Add(version.Id, version)

    End Sub

#End Region

End Class


