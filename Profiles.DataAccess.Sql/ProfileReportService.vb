Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports Profiles.Reports
Imports System.Data.SqlClient
Imports Profiles.DataAccess.Sql.Data
Imports Profiles.Contracts

Public Class ProfileReportService
    Implements IProfileReportService

    Public Function GetProfileVersionReports(ByVal request As GetProfileVersionReportsRequest) As List(Of ProfileVersionReport) Implements IProfileReportService.GetProfileVersionReports

        Dim profileReports As New List(Of ProfileVersionReport)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionReportByProfileVersionId"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@IsAuthenticated", request.IsAuthenticated)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        profileReports.Add(New ProfileVersionReport( _
                                           reader.GetGuid(0), _
                                            reader.GetString(1), _
                                            reader.GetString(2), _
                                            reader.GetBoolean(3), _
                                            reader.GetInt32(4)))
                    End While
                End Using
            End Using
        End Using

        Return profileReports

    End Function

    Public Function GetProfileReportData(ByVal request As GetProfileReportDataRequest) As ProfileReportData Implements IProfileReportService.GetProfileReportData

        Dim reportData As Byte() = Nothing

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionReportData"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                getCommand.Parameters.AddWithValue("@ProfileReportId", request.ProfileReportId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        reportData = CType(reader.GetValue(0), Byte())
                    End While
                End Using
            End Using
        End Using

        Return New ProfileReportData(reportData)

    End Function

    Public Sub CreateProfileReport(ByVal request As CreateProfileReportRequest) Implements IProfileReportService.CreateProfileReport

        Dim reportData As Byte() = CreateProfilePdf(request.ProfileVersionId, request.ReportName)

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using insertCommand As SqlCommand = connection.CreateCommand
                insertCommand.CommandType = CommandType.StoredProcedure
                insertCommand.CommandText = "spiProfileVersionReportData"
                insertCommand.Parameters.AddWithValue("@ProfileVersionId", request.ProfileVersionId)
                insertCommand.Parameters.AddWithValue("@ProfileReportId", request.ProfileReportId)
                insertCommand.Parameters.AddWithValue("@PdfData", reportData)
                insertCommand.ExecuteNonQuery()
            End Using
        End Using

    End Sub

    Private Function CreateProfilePdf(ByVal profileVersionId As System.Guid, ByVal reportName As String) As Byte()

        Select Case reportName
            Case "FullProfileGUID"
                Return New FullProfilePdf(profileVersionId).PdfData
            Case "SummaryProfileGUID"
                Return New SummaryProfilePdf(profileVersionId).PdfData
            Case "QABriefGUID"
                Return New QABriefPdf(profileVersionId).PdfData
            Case "SummaryPrioritisationGUID"
                Return New SummaryPrioritisationPdf(profileVersionId).PdfData
            Case Else
                Throw New NotSupportedException(String.Format("The report type '{0}' is not supported", reportName))
        End Select

    End Function

    Public Function GetContributionsReport(ByVal request As GetContributionsReportRequest) As ContributionsReportData Implements IProfileReportService.GetContributionsReport

        Return New ContributionsReportData(New ContributionReportPdf(request.ProfileId).PdfData)

    End Function

    Public Function GetProfilePrintVersion(ByVal request As GetProfilePrintVersionRequest) As ProfilePrintVersionData Implements IProfileReportService.GetProfilePrintVersion

        Return New ProfilePrintVersionData(New FullProfilePdf(request.ProfileVersionId, request.ProfileSectionId).PdfData)

    End Function

    Public Function GetSummaryPrioritisationReport(ByVal request As GetSummaryPrioritisationReportRequest) As SummaryPrioritisationReportData Implements IProfileReportService.GetSummaryPrioritisationReport

        Return New SummaryPrioritisationReportData(New SummaryPrioritisationPdf(request.ProfileVersionId).PdfData)

    End Function

    Public Function GetSummaryProfileReport(ByVal request As GetSummaryProfileReportRequest) As SummaryProfileReportData Implements IProfileReportService.GetSummaryProfileReport

        Return New SummaryProfileReportData(New SummaryProfilePdf(request.ProfileVersionId).PdfData)

    End Function

    Public Function GetProfileVersionComparisonReport(ByVal request As GetProfileVersionComparisonReportRequest) As ProfileVersionComparisonReportData Implements IProfileReportService.GetProfileVersionComparisonReport

        Return New ProfileVersionComparisonReportData(New ProfileVersionComparisonReportPdf(request.ProfileVersionLeftId, request.ProfileVersionRightId).PdfData)

    End Function

    Public Function GetProfileVersionBespokeReport(ByVal request As GetProfileVersionBespokeReportRequest) As ProfileVersionBespokeReportData Implements IProfileReportService.GetProfileVersionBespokeReport

		Return New ProfileVersionBespokeReportData(
			New ProfileVersionBespokeReportPdf(request.ProfileVersionId,
											   request.ProfileVersionSelectedSections,
											   request.ProfileVersionSelectedQuestions,
											   request.ProfileVersionSelectedGuidance,
											   request.TemplateTitle).PdfData)

	End Function

    Public Function GetProfileRankingReport() As ProfileRankingReportData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileRankingReport

        Return GetProfileRankingReport(New GetProfileRankingReportRequest())

    End Function

    Public Function GetProfileRankingReport(ByVal request As GetProfileRankingReportRequest) As ProfileRankingReportData Implements IProfileReportService.GetProfileRankingReport
        Dim report As New ProfileRankingReportPdf()
        Select Case request.ReportType
            Case GetProfileRankingReportRequest.RankingReportType.All
                report.ReportType = ProfileRankingReportPdf.ProfileRankingReportType.All
                report.NameOfFilter = request.NameOfFilter
            Case GetProfileRankingReportRequest.RankingReportType.Fish
                report.ReportType = ProfileRankingReportPdf.ProfileRankingReportType.Fish
            Case GetProfileRankingReportRequest.RankingReportType.Terrestrial
                report.ReportType = ProfileRankingReportPdf.ProfileRankingReportType.Terrestrial
        End Select
        Return New ProfileRankingReportData(report.PdfData)
    End Function

    Public Function GetProfileRankingRFIReport() As ProfileRankingReportData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileRankingRFIReport

        Return GetProfileRankingRFIReport(New GetProfileRankingRFIReportRequest())

    End Function

    Public Function GetProfileRankingRFIReport(ByVal request As GetProfileRankingRFIReportRequest) As ProfileRankingReportData Implements IProfileReportService.GetProfileRankingRFIReport
        Dim report As New ProfileRankingReportRFIPdf()
        Select Case request.ReportType
            Case GetProfileRankingRFIReportRequest.RankingReportType.All
                report.ReportType = ProfileRankingReportRFIPdf.ProfileRankingReportType.All
                report.NameOfFilter = request.NameOfFilter
            Case GetProfileRankingRFIReportRequest.RankingReportType.Fish
                report.ReportType = ProfileRankingReportRFIPdf.ProfileRankingReportType.Fish
            Case GetProfileRankingRFIReportRequest.RankingReportType.Terrestrial
                report.ReportType = ProfileRankingReportRFIPdf.ProfileRankingReportType.Terrestrial
        End Select
        Return New ProfileRankingReportData(report.PdfData)
    End Function

    Public Function GetProfileDiseaseReviewsReport(ByVal request As DiseaseReviewsData) As DiseaseReviewsData Implements Contracts.ServiceContracts.IProfileReportService.GetProfileDiseaseReviewsReport

        Return GetProfileDiseaseReviewsReportData(request)

    End Function

    Public Function GetProfileDiseaseReviewsReportData(ByVal request As DiseaseReviewsData) As DiseaseReviewsData
        Dim report As New DiseaseReviewsReportPdf()
        report.mDescription = request.Description
        report.mToDate = request.ToDate
        report.mFromdate = request.Fromdate
        report.AuthorName = request.AuthorName
        report.AuthorId = request.AuthorId

        Return New DiseaseReviewsData(report.PdfData, report.mDescription, report.mToDate, report.mFromdate, report.AuthorName, report.AuthorId)
    End Function

End Class
