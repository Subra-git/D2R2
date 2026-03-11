Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionData
    Inherits ReadOnlyBase(Of ProfileVersionData)

    Private mId As Guid
    Private mTitle As String
    Private mVersionMajor As Integer
    Private mVersionMinor As Integer
    Private mProfileVersionState As String
    Private mScenarioTitle As String
    Private mIsProfileScenario As Boolean
    Private mProfileStatusName As String
    Private mProfileStatusId As Guid
    Private mPrioritisationScoreDataList As PrioritisationScoreDataList
    Private mCommonAnswerDataList As CommonAnswerDataList
    Private mPrioritisationAnswerDataList As PrioritisationAnswerDataList
    Private mProfiledSpeciesDataList As ProfiledSpeciesDataList

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property DisplayVersionNumber() As String
        Get
            Return "v" & mVersionMajor.ToString() & "." & mVersionMinor.ToString()
        End Get
    End Property

    Public ReadOnly Property ProfileVersionState() As String
        Get
            Return mProfileVersionState
        End Get
    End Property

    Public ReadOnly Property ScenarioTitle() As String
        Get
            Return mScenarioTitle
        End Get
    End Property

    Public ReadOnly Property IsProfileScenario() As Boolean
        Get
            Return mIsProfileScenario
        End Get
    End Property

    Public ReadOnly Property PrioritisationScoreDataList() As PrioritisationScoreDataList
        Get
            Return mPrioritisationScoreDataList
        End Get
    End Property

    Public ReadOnly Property CommonAnswerDataList() As CommonAnswerDataList
        Get
            Return mCommonAnswerDataList
        End Get
    End Property

    Public ReadOnly Property PrioritisationAnswerDataList() As PrioritisationAnswerDataList
        Get
            Return mPrioritisationAnswerDataList
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesDataList() As ProfiledSpeciesDataList
        Get
            Return mProfiledSpeciesDataList
        End Get
    End Property

    Public Function GetProfiledSpeciesBySpeciesId(ByVal speciesId As Guid) As ProfiledSpeciesData

        For Each species As ProfiledSpeciesData In mProfiledSpeciesDataList
            If species.Id = speciesId Then
                Return species
            End If
        Next
        Return Nothing
    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionData(ByVal dtoProfileVersionData As DataContracts.ProfileVersionData) As ProfileVersionData
        Return New ProfileVersionData(dtoProfileVersionData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoProfileVersionData As DataContracts.ProfileVersionData)
        Fetch(dtoProfileVersionData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfileVersionData As DataContracts.ProfileVersionData)
        mId = dtoProfileVersionData.Id
        mVersionMajor = dtoProfileVersionData.VersionMajor
        mVersionMinor = dtoProfileVersionData.VersionMinor
        mProfileVersionState = dtoProfileVersionData.ProfileVersionState
        mScenarioTitle = dtoProfileVersionData.ScenarioTitle
        mIsProfileScenario = dtoProfileVersionData.IsProfileScenario
        mProfileStatusName = dtoProfileVersionData.ProfileStatusName
        mProfileStatusId = dtoProfileVersionData.ProfileStatusId
        mPrioritisationScoreDataList = PrioritisationScoreDataList.GetPrioritisationScoreDataList(dtoProfileVersionData.PrioritisationScoreDataList)
        mCommonAnswerDataList = CommonAnswerDataList.GetCommonAnswerDataList(dtoProfileVersionData.CommonAnswerDataList)
        mPrioritisationAnswerDataList = PrioritisationAnswerDataList.GetPrioritisationAnswerDataList(dtoProfileVersionData.PrioritisationAnswerDataList)
        mProfiledSpeciesDataList = ProfiledSpeciesDataList.GetProfiledSpeciesDataList(dtoProfileVersionData.ProfiledSpeciesDataList)
    End Sub

#End Region


End Class
