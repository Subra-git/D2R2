Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ProfileReportService
    Implements IProfileReportService

    Public Function GetProfileVersionReports(ByVal request As GetProfileVersionReportsRequest) As List(Of ProfileVersionReport) Implements IProfileReportService.GetProfileVersionReports

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetProfileVersionReportsRequest, List(Of ProfileVersionReport))(proxy, request, AddressOf proxy.GetProfileVersionReports)

    End Function

    Public Function GetProfileReportData(ByVal request As GetProfileReportDataRequest) As ProfileReportData Implements IProfileReportService.GetProfileReportData

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetProfileReportDataRequest, ProfileReportData)(proxy, request, AddressOf proxy.GetProfileReportData)

    End Function

    Public Sub CreateProfileReport(ByVal request As CreateProfileReportRequest) Implements IProfileReportService.CreateProfileReport

        Throw New InvalidOperationException("You cannot create a profile report via the web service.")

    End Sub

    Public Function GetContributionsReport(ByVal request As GetContributionsReportRequest) As ContributionsReportData Implements IProfileReportService.GetContributionsReport

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetContributionsReportRequest, ContributionsReportData)(proxy, request, AddressOf proxy.GetContributionsReport)

    End Function

    Public Function GetProfilePrintVersion(ByVal request As GetProfilePrintVersionRequest) As ProfilePrintVersionData Implements IProfileReportService.GetProfilePrintVersion

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetProfilePrintVersionRequest, ProfilePrintVersionData)(proxy, request, AddressOf proxy.GetProfilePrintVersion)

    End Function

    Public Function GetProfileVersionComparisonReport(ByVal request As GetProfileVersionComparisonReportRequest) As ProfileVersionComparisonReportData Implements IProfileReportService.GetProfileVersionComparisonReport

        Throw New InvalidOperationException("You cannot get a profile version comparison report via the web service.")

    End Function

	Public Function GetProfileVersionBespokeReport(ByVal request As GetProfileVersionBespokeReportRequest) As ProfileVersionBespokeReportData Implements IProfileReportService.GetProfileVersionBespokeReport
		Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
		Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetProfileVersionBespokeReportRequest, ProfileVersionBespokeReportData)(proxy, request, AddressOf proxy.GetProfileVersionBespokeReport)
	End Function

	Public Function GetSummaryPrioritisationReport(ByVal request As GetSummaryPrioritisationReportRequest) As SummaryPrioritisationReportData Implements IProfileReportService.GetSummaryPrioritisationReport

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetSummaryPrioritisationReportRequest, SummaryPrioritisationReportData)(proxy, request, AddressOf proxy.GetSummaryPrioritisationReport)

    End Function

    Public Function GetSummaryProfileReport(ByVal request As GetSummaryProfileReportRequest) As SummaryProfileReportData Implements IProfileReportService.GetSummaryProfileReport

        Dim proxy As IProfileReportService = ProxyFactory.GetProxy(Of IProfileReportService)("ProfileReportService")
        Return ProxyFactory.CallProxyMethod(Of IProfileReportService, GetSummaryProfileReportRequest, SummaryProfileReportData)(proxy, request, AddressOf proxy.GetSummaryProfileReport)

    End Function

    Public Function GetProfileRankingReport() As Contracts.DataContracts.ProfileRankingReportData Implements IProfileReportService.GetProfileRankingReport

        Throw New InvalidOperationException("You cannot get the profile ranking report via the web service.")

    End Function

    Public Function GetProfileRankingReport(ByVal request As GetProfileRankingReportRequest) As ProfileRankingReportData Implements IProfileReportService.GetProfileRankingReport
        Throw New InvalidOperationException("You cannot get the profile ranking report via the web service.")
    End Function

    Public Function GetProfileRankingRFIReport() As Contracts.DataContracts.ProfileRankingReportData Implements IProfileReportService.GetProfileRankingRFIReport

        Throw New InvalidOperationException("You cannot get the profile ranking report via the web service.")

    End Function

    Public Function GetProfileRankingRFIReport(ByVal request As GetProfileRankingRFIReportRequest) As ProfileRankingReportData Implements IProfileReportService.GetProfileRankingRFIReport
        Throw New InvalidOperationException("You cannot get the profile ranking report via the web service.")
    End Function

    Public Function GetProfileDiseaseReviewsReport(ByVal request As DiseaseReviewsData) As DiseaseReviewsData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileDiseaseReviewsReport

        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")

    End Function
End Class
