Imports ProfilesLibrary
Imports Profiles.Contracts

Partial Class DiseaseReviews
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim pdfData As Byte() = SectionDiseaseReviewsMetadataList.GetProfileGuidanceReport()
        Dim users As IEnumerable(Of ListItem) = GlobalUserList.GetProfileEditorList().Select(Function (x) New ListItem(x.FullName, x.Id.ToString()))
        dropDownListAuthors.Items.AddRange(users.ToArray())

		 Me.RegisterTinyMce($"#{txtDescription.ClientID}", TinyMCEEditorType.SingleLineEditor)
    End Sub

	Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
		Dim CurrentDiseaseReviewsValues As New DataContracts.DiseaseReviewsData()

		CurrentDiseaseReviewsValues.Description = txtDescription.Text
		CurrentDiseaseReviewsValues.ToDate = Date.Parse(txtToDate.Text)
		CurrentDiseaseReviewsValues.Fromdate = Date.Parse(txtFromDate.Text)
		CurrentDiseaseReviewsValues.AuthorName = dropDownListAuthors.SelectedItem.Text
		CurrentDiseaseReviewsValues.AuthorId = New Guid(dropDownListAuthors.SelectedItem.Value)

		Dim pdfData As Byte() = GetProfileDiseaseReviewsReportCommand.GetProfileRankingReport(CurrentDiseaseReviewsValues)

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile.")
		End If

		Response.DownloadPdfBytes(pdfData, "DiseaseReviewsReport")
	End Sub
End Class
