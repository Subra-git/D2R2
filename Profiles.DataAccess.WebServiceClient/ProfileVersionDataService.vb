Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ProfileVersionDataService
    Implements IProfileVersionDataService

    Public Function GetProfileMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileSectionMetadata) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileMetadata

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, List(Of ProfileSectionMetadata))(proxy, AddressOf proxy.GetProfileMetadata)

    End Function

    Public Function GetContributions(ByVal request As Contracts.DataContracts.GetContributionsRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileContributionData) Implements IProfileVersionDataService.GetContributions

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, GetContributionsRequest, List(Of ProfileContributionData))(proxy, request, AddressOf proxy.GetContributions)

    End Function

    Public Function GetProfileVersionAnswerData(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataRequest) As Contracts.DataContracts.ProfileAnswerData Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerData

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, GetProfilesAnswerDataRequest, ProfileAnswerData)(proxy, request, AddressOf proxy.GetProfileVersionAnswerData)

    End Function

    Public Function GetProfileVersionAnswerDataSingleSection(ByVal request As Contracts.DataContracts.GetProfilesAnswerDataSingleSectionRequest) As Contracts.DataContracts.ProfileAnswerDataSingleSection Implements Contracts.ServiceContracts.IProfileVersionDataService.GetProfileVersionAnswerDataSingleSection

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, GetProfilesAnswerDataSingleSectionRequest, ProfileAnswerDataSingleSection)(proxy, request, AddressOf proxy.GetProfileVersionAnswerDataSingleSection)

    End Function
    Public Function GetSectionReviewFrequencies() As System.Collections.Generic.List(Of Contracts.DataContracts.SectionReviewFrequency) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetSectionReviewFrequencies

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, List(Of SectionReviewFrequency))(proxy, AddressOf proxy.GetSectionReviewFrequencies)

    End Function

    Public Function GetSectionReviewStatusTypes() As System.Collections.Generic.List(Of Contracts.DataContracts.SectionReviewStatusType) Implements Contracts.ServiceContracts.IProfileVersionDataService.GetSectionReviewStatusTypes

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, List(Of SectionReviewStatusType))(proxy, AddressOf proxy.GetSectionReviewStatusTypes)

    End Function

    Public Function UpdateProfileVersionAnswerData(ByVal request As Contracts.DataContracts.ProfileAnswerDataChangeSet) As Contracts.DataContracts.ProfileAnswerDataChangeResult Implements Contracts.ServiceContracts.IProfileVersionDataService.UpdateProfileVersionAnswerData

        Dim proxy As IProfileVersionDataService = ProxyFactory.GetProxy(Of IProfileVersionDataService)("ProfileVersionDataService")
        Return ProxyFactory.CallProxyMethod(Of IProfileVersionDataService, ProfileAnswerDataChangeSet, ProfileAnswerDataChangeResult)(proxy, request, AddressOf proxy.UpdateProfileVersionAnswerData)

    End Function
End Class
