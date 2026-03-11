Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileScenarioInfoList
    Inherits ReadOnlyListBase(Of ProfileScenarioInfoList, ProfileScenarioInfo)

    Private mScenarioInfoDictionary As Dictionary(Of Guid, ProfileScenarioInfo)

    Public Function GetScenarioInfo(ByVal scenarioId As Guid) As ProfileScenarioInfo
        Return mScenarioInfoDictionary(scenarioId)
    End Function

#Region " Factory Methods "

    Friend Shared Function GetProfileScenarioInfoList(ByVal profileInfo As DataContracts.ProfileSearchProfileInfo) As ProfileScenarioInfoList
        Return New ProfileScenarioInfoList(profileInfo)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal profileInfo As DataContracts.ProfileSearchProfileInfo)
        FetchScenario(profileInfo)
    End Sub

#End Region

#Region " Data Access "

    Friend Sub FetchScenario(ByVal profileSearchProfileInfo As DataContracts.ProfileSearchProfileInfo)

        RaiseListChangedEvents = False
        IsReadOnly = False

        mScenarioInfoDictionary = New Dictionary(Of Guid, ProfileScenarioInfo)

        For Each profileSearchProfileScenarioInfo As DataContracts.ProfileSearchProfileScenarioInfo In profileSearchProfileInfo.ProfileScenarios
            Dim scenario As ProfileScenarioInfo = ProfileScenarioInfo.GetScenarioProfileInfo(profileSearchProfileScenarioInfo)
            Add(scenario)
            mScenarioInfoDictionary.Add(scenario.Id, scenario)
        Next
        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class


