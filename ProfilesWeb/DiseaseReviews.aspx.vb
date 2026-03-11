Imports ProfilesLibrary
Imports Profiles.Contracts
Imports Profiles.Contracts.DataContracts

Partial Class DiseaseReviews
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim pdfData As Byte() = SectionDiseaseReviewsMetadataList.GetProfileGuidanceReport()

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        'Dim diseaseReviewsList As DiseaseReviewsFilterInfoList = DiseaseReviewsFilterInfoList.GetList(txtDescription.Text, txtToData.Text, txtFromDate.Text, rdbtnSelect.SelectedItem.Value)

        Dim CurrentDiseaseReviewsValues As New DataContracts.DiesaseReviewsData()

        CurrentDiseaseReviewsValues.Description = txtDescription.Text
        CurrentDiseaseReviewsValues.ToDate = txtToData.Text
        CurrentDiseaseReviewsValues.Fromdate = txtFromDate.Text
        CurrentDiseaseReviewsValues.ProfileSelected = rdbtnSelect.SelectedItem.Value
        CurrentDiseaseReviewsValues.AuthorName = txtAuthor.Text

        Dim pdfData As Byte() = GetProfileDiseaseReviewsReportCommand.GetProfileRankingReport(CurrentDiseaseReviewsValues)

        If pdfData Is Nothing Then
            Throw New InvalidOperationException("Could not find a PDF for the specified profile.")
        Else

            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", "DiseaseReviewsReport_" & DateTime.Now.ToString()))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(pdfData)
        End If

    End Sub
End Class
