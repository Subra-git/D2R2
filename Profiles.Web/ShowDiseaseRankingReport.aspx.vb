Imports ProfilesLibrary
Imports Profiles.Contracts
Imports System.Web

Partial Class ShowDiseaseRankingReport
    Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim reportRequest As DataContracts.GetProfileRankingReportRequest

		Select Case Request.QueryString("Filter")
			Case "All"
				reportRequest = New DataContracts.GetProfileRankingReportRequest(DataContracts.GetProfileRankingReportRequest.RankingReportType.All, Request.QueryString("FilterValue").ToString())
			Case "Fish"
				reportRequest = New DataContracts.GetProfileRankingReportRequest(DataContracts.GetProfileRankingReportRequest.RankingReportType.Fish, "")
			Case "Terrestrial"
				reportRequest = New DataContracts.GetProfileRankingReportRequest(DataContracts.GetProfileRankingReportRequest.RankingReportType.Terrestrial, "")
			Case Else
				Throw New Exception("Invalid filter.")
		End Select

		Dim pdfData As Byte() = GetProfileRankingReportCommand.GetProfileRankingReport(reportRequest)

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile.")
		End If

		Response.DownloadPdfBytes(pdfData, $"DiseaseRankingReport_{ ProfilesLibrary.StringExtensions.StripHtmlTags(reportRequest.NameOfFilter)}")
	End Sub
End Class
