Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
   Public Interface IDiseaseRankingService

        Sub InsertDiseaseFilterValue(ByVal request As DiseaseRankingValues)

        <OperationContract()> _
        Function GetFilterNumberFetchedFromDatabase(ByVal request As DiseaseRankingValues, ByVal reDiseaseName As String) As DiseaseRankingValues

        Function GetDiseaseDropReferenceTables() As List(Of DiseaseFilterNameValues)

        Sub DeleteFilterNumberFromFilterService(ByVal request As DiseaseRankingValues)

        Sub UpdateDisableDiseaseFilterValue(ByVal request As DiseaseRankingValues)

        Sub UpdateDiseaseFilterValue(ByVal request As DiseaseRankingValues)

        Function GetAllDiseaseReviewsForSelectedDates(ByVal description As String, ByVal todate As String, ByVal fromdate As String, ByVal valueProfile As Integer) As List(Of DiseaseReviewsData)

    End Interface

End Namespace
