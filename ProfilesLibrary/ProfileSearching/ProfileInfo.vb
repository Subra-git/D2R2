Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class ProfileInfo
    Inherits ReadOnlyBase(Of ProfileInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mTitle As String = String.Empty

    Private mProfileScenarios As ProfileScenarioInfoList

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle.StripPTags
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mTitle
    End Function

    Public Function GetScenarios() As ProfileScenarioInfoList
        Return mProfileScenarios
    End Function

    Public Function ContainsSpecies(ByVal speciesId As Guid) As Boolean
        For Each currentScenario As ProfileScenarioInfo In mProfileScenarios
            If currentScenario.ContainsSpecies(speciesId) Then
                Return True
            End If
        Next
        Return False

    End Function

    Public Function SectionsContainWords(ByVal words As List(Of String), ByVal sectionSelection As List(Of Integer), ByVal useExactWordMatch As Boolean) As Boolean
        For Each currentScenario As ProfileScenarioInfo In mProfileScenarios
            If currentScenario.SectionsContainWords(words, sectionSelection, useExactWordMatch) Then
                Return True
            End If
        Next
        Return False

    End Function

    Public Function NotesContainWords(ByVal words As List(Of String), ByVal searchReference As Boolean, ByVal useExactWordMatch As Boolean) As Boolean
        For Each currentScenario As ProfileScenarioInfo In mProfileScenarios
            If currentScenario.NotesContainWords(words, searchReference, useExactWordMatch) Then
                Return True
            End If
        Next
        Return False
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileInfo(ByVal profileSearchProfileInfo As DataContracts.ProfileSearchProfileInfo) As ProfileInfo

        Return New ProfileInfo(profileSearchProfileInfo)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal profileSearchProfileInfo As DataContracts.ProfileSearchProfileInfo)
        Fetch(profileSearchProfileInfo)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileSearchProfileInfo As DataContracts.ProfileSearchProfileInfo)
        ' load values
        mId = profileSearchProfileInfo.Id
        mTitle = profileSearchProfileInfo.Title

        mProfileScenarios = ProfileScenarioInfoList.GetProfileScenarioInfoList(profileSearchProfileInfo)
    End Sub

#End Region

End Class

