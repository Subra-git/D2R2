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
        Else

            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", "DiseaseRankingReport_" & DateTime.Now.ToString()))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(pdfData)
        End If

    End Sub
End Class
