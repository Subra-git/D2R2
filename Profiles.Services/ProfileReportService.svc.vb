Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary
Imports Profiles.Contracts.DataContracts

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ProfileReportService
    Implements IProfileReportService

    Public Function GetProfileVersionReports(ByVal request As DataContracts.GetProfileVersionReportsRequest) As List(Of DataContracts.ProfileVersionReport) Implements IProfileReportService.GetProfileVersionReports

        Dim profileReports As New List(Of DataContracts.ProfileVersionReport)
        Dim reportInfoList As ProfileVersionReportInfoList = ProfileVersionReportInfoList.GetList(request.ProfileVersionId)
        For Each report As ProfileVersionReportInfo In reportInfoList
            profileReports.Add(New DataContracts.ProfileVersionReport( _
                                     report.Id, _
                                     report.ReportName, _
                                     report.DisplayName, _
                                     report.HasPdfData, _
                                     report.FileSize))
        Next

        Return profileReports

    End Function

    Public Function GetProfileReportData(ByVal request As DataContracts.GetProfileReportDataRequest) As DataContracts.ProfileReportData Implements IProfileReportService.GetProfileReportData

        Dim reportInfoList As ProfileVersionReportInfoList = ProfileVersionReportInfoList.GetList(request.ProfileVersionId)
        Return New DataContracts.ProfileReportData(reportInfoList.GetById(request.ProfileReportId).GetProfileReport())

    End Function

    Public Sub CreateProfileReport(ByVal request As DataContracts.CreateProfileReportRequest) Implements IProfileReportService.CreateProfileReport

        Throw New InvalidOperationException("You cannot create a profile report via the web service.")

    End Sub

    Public Function GetContributionsReport(ByVal request As DataContracts.GetContributionsReportRequest) As DataContracts.ContributionsReportData Implements IProfileReportService.GetContributionsReport

        Dim profileInfo As Profile = Profile.GetProfile(request.ProfileId)
        Return New DataContracts.ContributionsReportData(profileInfo.GetContributionsReport())

    End Function

    Public Function GetProfilePrintVersion(ByVal request As DataContracts.GetProfilePrintVersionRequest) As DataContracts.ProfilePrintVersionData Implements IProfileReportService.GetProfilePrintVersion

        Dim versionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(request.ProfileVersionId)
        If request.ProfileSectionId.Equals(Guid.Empty) Then
            Return New DataContracts.ProfilePrintVersionData(versionInfo.GetPrintVersion())
        Else
            Return New DataContracts.ProfilePrintVersionData(versionInfo.GetPrintVersion(request.ProfileSectionId))
        End If

    End Function

    Public Function GetProfileVersionComparisonReport(ByVal request As DataContracts.GetProfileVersionComparisonReportRequest) As DataContracts.ProfileVersionComparisonReportData Implements IProfileReportService.GetProfileVersionComparisonReport

        Throw New InvalidOperationException("You cannot get a profile version comparison report via the web service.")

    End Function

	Public Function GetProfileVersionBespokeReport(ByVal request As DataContracts.GetProfileVersionBespokeReportRequest) As DataContracts.ProfileVersionBespokeReportData Implements IProfileReportService.GetProfileVersionBespokeReport
		Dim versionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(request.ProfileVersionId)

		Dim result = New DataContracts.ProfileVersionBespokeReportData(versionInfo.GetProfileVersionBespokeReport(request.ProfileVersionId,
																											request.ProfileVersionSelectedSections,
																											request.ProfileVersionSelectedQuestions,
																											request.ProfileVersionSelectedGuidance,
																											request.TemplateTitle))

		Return result
	End Function

	Public Function GetSummaryPrioritisationReport(ByVal request As DataContracts.GetSummaryPrioritisationReportRequest) As DataContracts.SummaryPrioritisationReportData Implements IProfileReportService.GetSummaryPrioritisationReport

        Dim versionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(request.ProfileVersionId)
        Return New DataContracts.SummaryPrioritisationReportData(versionInfo.GetSummaryPrioritisationReport())

    End Function

    Public Function GetSummaryProfileReport(ByVal request As DataContracts.GetSummaryProfileReportRequest) As DataContracts.SummaryProfileReportData Implements IProfileReportService.GetSummaryProfileReport

        Dim versionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(request.ProfileVersionId)
        Return New DataContracts.SummaryProfileReportData(versionInfo.GetSummaryProfileReport())

    End Function

    Public Function GetProfileRankingReport() As Contracts.DataContracts.ProfileRankingReportData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileRankingReport

        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")

    End Function

    Public Function GetProfileRankingReport(ByVal request As DataContracts.GetProfileRankingReportRequest) As Contracts.DataContracts.ProfileRankingReportData Implements IProfileReportService.GetProfileRankingReport
        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")
    End Function

    Public Function GetProfileRankingRFIReport() As Contracts.DataContracts.ProfileRankingReportData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileRankingRFIReport

        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")

    End Function

    Public Function GetProfileRankingRFIReport(ByVal request As DataContracts.GetProfileRankingRFIReportRequest) As Contracts.DataContracts.ProfileRankingReportData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileRankingRFIReport
        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")
    End Function

    Public Function GetProfileDiseaseReviewsReport(ByVal request As DiseaseReviewsData) As DiseaseReviewsData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileDiseaseReviewsReport

        Throw New InvalidOperationException("You cannot get a profile ranking report via the web service.")

    End Function

End Class
