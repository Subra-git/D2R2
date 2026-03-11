Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class PrioritisationService
    Implements IPrioritisationService

    Public Function GetPrioritisationCategoryScores(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisationCategoryScore) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationCategoryScores
        Throw New System.Security.SecurityException("You cannot get prioritisation category scores via WCF")
    End Function

    Public Function GetPrioritisationCriterionScores(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisationCriterionScore) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationCriterionScores
        Throw New System.Security.SecurityException("You cannot get prioritisation criterion scores via WCF")
    End Function

    Public Function GetPrioritisedSpecies(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.PrioritisedSpecies) Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisedSpecies
        Throw New System.Security.SecurityException("You cannot get prioritised species via WCF")
    End Function

    Public Function GetProfilePrioritisationMetadata() As Contracts.DataContracts.ProfilePrioritisationMetadata Implements Contracts.ServiceContracts.IPrioritisationService.GetProfilePrioritisationMetadata
        Throw New System.Security.SecurityException("You cannot get profile prioritisation metadata via WCF")
    End Function

    Public Function GetSpeciesPrioritisationMetadata() As Contracts.DataContracts.SpeciesPrioritisationMetadata Implements Contracts.ServiceContracts.IPrioritisationService.GetSpeciesPrioritisationMetadata
        Throw New System.Security.SecurityException("You cannot get species prioritisation metadata via WCF")
    End Function

    Public Sub PrioritiseProfile(ByVal request As Contracts.DataContracts.ProfileVersionIdRequest) Implements Contracts.ServiceContracts.IPrioritisationService.PrioritiseProfile
        Dim proxy As IPrioritisationService = ProxyFactory.GetProxy(Of IPrioritisationService)("PrioritisationService")
        ProxyFactory.CallProxyMethod(Of IPrioritisationService, ProfileVersionIdRequest)(proxy, request, AddressOf proxy.PrioritiseProfile)
    End Sub

    Public Sub PrioritiseProfiles(ByVal request As Contracts.DataContracts.PrioritiseProfilesRequest) Implements Contracts.ServiceContracts.IPrioritisationService.PrioritiseProfiles
        Dim proxy As IPrioritisationService = ProxyFactory.GetProxy(Of IPrioritisationService)("PrioritisationService")
        ProxyFactory.CallProxyMethod(Of IPrioritisationService, PrioritiseProfilesRequest)(proxy, request, AddressOf proxy.PrioritiseProfiles)
    End Sub

    Public Function UpdateProfilePrioritisationMetadata(ByVal request As Contracts.DataContracts.PrioritisationChangeSet) As Contracts.DataContracts.PrioritisationChangeResult Implements Contracts.ServiceContracts.IPrioritisationService.UpdateProfilePrioritisationMetadata
        Throw New System.Security.SecurityException("You cannot update the profile prioritisation metadata via WCF")
    End Function

    Public Function UpdateSpeciesPrioritisationMetadata(ByVal request As Contracts.DataContracts.PrioritisationChangeSet) As Contracts.DataContracts.PrioritisationChangeResult Implements Contracts.ServiceContracts.IPrioritisationService.UpdateSpeciesPrioritisationMetadata
        Throw New System.Security.SecurityException("You cannot update the species prioritisation metadata via WCF")
    End Function

    Public Function GetScoreData() As Contracts.DataContracts.ScoreData Implements Contracts.ServiceContracts.IPrioritisationService.GetScoreData
        Throw New System.Security.SecurityException("You cannot get the score data via WCF")
    End Function

    Public Function GetRankProfileData() As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileData
        Throw New System.Security.SecurityException("You cannot get the score data via WCF")
    End Function

    Public Function GetRankProfileData(ByVal request As Contracts.DataContracts.GetProfileRankingReportRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileData
        Throw New System.Security.SecurityException("You cannot get the score data via WCF")
    End Function

    Public Function GetPrioritisationGuidanceData() As Contracts.DataContracts.PrioritisationGuidanceData Implements Contracts.ServiceContracts.IPrioritisationService.GetPrioritisationGuidanceData
        Throw New System.Security.SecurityException("You cannot get the guidance data via WCF")
    End Function

    Public Function GetRankProfileDataForFilter(ByVal value As String) As System.Collections.Generic.List(Of Contracts.DataContracts.RankProfileData) Implements Contracts.ServiceContracts.IPrioritisationService.GetRankProfileDataForFilter
        Throw New System.Security.SecurityException("You cannot get the score data via WCF")
    End Function

    Public Function GetDiseaseReviewsDataForFilter(ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal authorId As Guid) As System.Collections.Generic.List(Of Contracts.DataContracts.DiseaseReviewsData) Implements Contracts.ServiceContracts.IPrioritisationService.GetDiseaseReviewsDataForFilter
        Throw New System.Security.SecurityException("You cannot get the score data via WCF")
    End Function
End Class
