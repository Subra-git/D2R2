Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IPrioritisationService

        Function GetProfilePrioritisationMetadata() As ProfilePrioritisationMetadata

        Function GetSpeciesPrioritisationMetadata() As SpeciesPrioritisationMetadata

        Function UpdateProfilePrioritisationMetadata(ByVal request As DataContracts.PrioritisationChangeSet) As PrioritisationChangeResult

        Function UpdateSpeciesPrioritisationMetadata(ByVal request As DataContracts.PrioritisationChangeSet) As PrioritisationChangeResult

        Function GetScoreData() As DataContracts.ScoreData

        Function GetPrioritisationCategoryScores(ByVal request As DataContracts.ProfileVersionIdRequest) As List(Of DataContracts.PrioritisationCategoryScore)

        Function GetPrioritisationCriterionScores(ByVal request As DataContracts.ProfileVersionIdRequest) As List(Of DataContracts.PrioritisationCriterionScore)

        Function GetPrioritisedSpecies(ByVal request As DataContracts.ProfileVersionIdRequest) As List(Of DataContracts.PrioritisedSpecies)

        <OperationContract()> _
        Sub PrioritiseProfiles(ByVal request As DataContracts.PrioritiseProfilesRequest)

        <OperationContract()> _
        Sub PrioritiseProfile(ByVal request As DataContracts.ProfileVersionIdRequest)

        Function GetRankProfileData() As List(Of RankProfileData)

        Function GetRankProfileData(ByVal request As DataContracts.GetProfileRankingReportRequest) As List(Of RankProfileData)

        Function GetPrioritisationGuidanceData() As DataContracts.PrioritisationGuidanceData

        Function GetRankProfileDataForFilter(ByVal value As String) As List(Of RankProfileData)

        Function GetDiseaseReviewsDataForFilter(ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal authorId As Guid) As List(Of DiseaseReviewsData)

    End Interface

End Namespace

