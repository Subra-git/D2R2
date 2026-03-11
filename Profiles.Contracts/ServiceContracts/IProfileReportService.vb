Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileReportService

        <OperationContract()> _
        Function GetProfileVersionReports(ByVal request As GetProfileVersionReportsRequest) As List(Of ProfileVersionReport)

        <OperationContract()> _
        Function GetProfileReportData(ByVal request As GetProfileReportDataRequest) As ProfileReportData

        Sub CreateProfileReport(ByVal request As CreateProfileReportRequest)

        <OperationContract()> _
        Function GetContributionsReport(ByVal request As GetContributionsReportRequest) As ContributionsReportData

        <OperationContract()> _
        Function GetProfilePrintVersion(ByVal request As GetProfilePrintVersionRequest) As ProfilePrintVersionData

        <OperationContract()> _
        Function GetSummaryPrioritisationReport(ByVal request As GetSummaryPrioritisationReportRequest) As SummaryPrioritisationReportData

        Function GetProfileVersionComparisonReport(ByVal request As GetProfileVersionComparisonReportRequest) As ProfileVersionComparisonReportData

		<OperationContract()>
		Function GetProfileVersionBespokeReport(ByVal request As GetProfileVersionBespokeReportRequest) As ProfileVersionBespokeReportData

		Function GetProfileRankingReport() As ProfileRankingReportData

        Function GetProfileRankingReport(ByVal request As GetProfileRankingReportRequest) As ProfileRankingReportData

        Function GetProfileRankingRFIReport() As ProfileRankingReportData

        Function GetProfileRankingRFIReport(ByVal request As GetProfileRankingRFIReportRequest) As ProfileRankingReportData

        <OperationContract()> _
        Function GetSummaryProfileReport(ByVal request As GetSummaryProfileReportRequest) As SummaryProfileReportData

        Function GetProfileDiseaseReviewsReport(ByVal request As DataContracts.DiseaseReviewsData) As DiseaseReviewsData

    End Interface

End Namespace
