Imports ProfilesLibrary
Imports Profiles.Contracts
Imports System.Web

Partial Class ShowDiseaseRankingRFIReport
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim reportRequest As DataContracts.GetProfileRankingRFIReportRequest

        Select Case Request.QueryString("Filter")
            Case "All"
                reportRequest = New DataContracts.GetProfileRankingRFIReportRequest(DataContracts.GetProfileRankingRFIReportRequest.RankingReportType.All, Request.QueryString("FilterValue").ToString())
            Case "Fish"
                reportRequest = New DataContracts.GetProfileRankingRFIReportRequest(DataContracts.GetProfileRankingRFIReportRequest.RankingReportType.Fish, "")
            Case "Terrestrial"
                reportRequest = New DataContracts.GetProfileRankingRFIReportRequest(DataContracts.GetProfileRankingRFIReportRequest.RankingReportType.Terrestrial, "")
            Case Else
                Throw New Exception("Invalid filter.")
        End Select

        Dim pdfData As Byte() = GetProfileRankingRFIReportCommand.GetProfileRankingRFIReport(reportRequest)

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile.")
		End If

		Response.DownloadPdfBytes(pdfData, "DiseaseRankingReport")
	End Sub
End Class
