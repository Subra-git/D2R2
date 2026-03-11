Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ProfileSearchService
    Implements IProfileSearchService

    Public Function GetAllProfiles(ByVal request As GetAllProfilesRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetAllProfiles

        Dim proxy As IProfileSearchService = ProxyFactory.GetProxy(Of IProfileSearchService)("ProfileSearchService")
        Return ProxyFactory.CallProxyMethod(Of IProfileSearchService, GetAllProfilesRequest, List(Of ProfileSearchProfileInfo))(proxy, request, AddressOf proxy.GetAllProfiles)

    End Function

    Public Function GetProfileVersion(ByVal request As Contracts.DataContracts.GetProfileVersionRequest) As Contracts.DataContracts.ProfileSearchProfileVersionInfo Implements Contracts.ServiceContracts.IProfileSearchService.GetProfileVersion

        Dim proxy As IProfileSearchService = ProxyFactory.GetProxy(Of IProfileSearchService)("ProfileSearchService")
        Return ProxyFactory.CallProxyMethod(Of IProfileSearchService, GetProfileVersionRequest, ProfileSearchProfileVersionInfo)(proxy, request, AddressOf proxy.GetProfileVersion)

    End Function

    Public Function GetPublicProfileHistory(ByVal request As Contracts.DataContracts.GetPublicProfileHistoryRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetPublicProfileHistory

        Dim proxy As IProfileSearchService = ProxyFactory.GetProxy(Of IProfileSearchService)("ProfileSearchService")
        Return ProxyFactory.CallProxyMethod(Of IProfileSearchService, GetPublicProfileHistoryRequest, List(Of ProfileSearchProfileVersionInfo))(proxy, request, AddressOf proxy.GetPublicProfileHistory)

    End Function

    Public Function GetDraftProfileHistory(ByVal request As Contracts.DataContracts.GetDraftProfileHistoryRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetDraftProfileHistory
        Throw New InvalidOperationException("You cannot get a draft profile history via the web service.")
    End Function

    Public Function GetPublishedProfileHistory(ByVal request As Contracts.DataContracts.GetPublishedProfileHistoryRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetPublishedProfileHistory
        Throw New InvalidOperationException("You cannot get a published profile history via the web service.")
    End Function

    Public Function GetCurrentPublicCurrentSituation() As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicCurrentSituation

        Dim proxy As IProfileSearchService = ProxyFactory.GetProxy(Of IProfileSearchService)("ProfileSearchService")
        Return ProxyFactory.CallProxyMethod(Of IProfileSearchService, List(Of ProfileSearchProfileVersionInfo))(proxy, AddressOf proxy.GetCurrentPublicCurrentSituation)

    End Function

    Public Function GetCurrentPublicWhatIfScenario(ByVal request As Contracts.DataContracts.GetCurrentPublicWhatIfScenarioRequest) As List(Of Contracts.DataContracts.ProfileSearchProfileVersionInfo) Implements Contracts.ServiceContracts.IProfileSearchService.GetCurrentPublicWhatIfScenario

        Dim proxy As IProfileSearchService = ProxyFactory.GetProxy(Of IProfileSearchService)("ProfileSearchService")
        Return ProxyFactory.CallProxyMethod(Of IProfileSearchService, GetCurrentPublicWhatIfScenarioRequest, List(Of ProfileSearchProfileVersionInfo))(proxy, request, AddressOf proxy.GetCurrentPublicWhatIfScenario)

    End Function

End Class
