Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileSearchService

        <OperationContract()> _
        Function GetAllProfiles(ByVal request As GetAllProfilesRequest) As List(Of ProfileSearchProfileInfo)

        <OperationContract()> _
        Function GetProfileVersion(ByVal request As GetProfileVersionRequest) As ProfileSearchProfileVersionInfo

        <OperationContract()> _
        Function GetPublicProfileHistory(ByVal request As GetPublicProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo)

        Function GetPublishedProfileHistory(ByVal request As GetPublishedProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo)

        Function GetDraftProfileHistory(ByVal request As GetDraftProfileHistoryRequest) As List(Of ProfileSearchProfileVersionInfo)

        <OperationContract()> _
        Function GetCurrentPublicCurrentSituation() As List(Of ProfileSearchProfileVersionInfo)

        <OperationContract()> _
        Function GetCurrentPublicWhatIfScenario(ByVal request As GetCurrentPublicWhatIfScenarioRequest) As List(Of ProfileSearchProfileVersionInfo)


    End Interface

End Namespace
