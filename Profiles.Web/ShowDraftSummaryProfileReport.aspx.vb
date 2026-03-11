Imports ProfilesLibrary

Partial Class ShowDraftSummaryProfileReport
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("ProfileVersionId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the profile version id of a profile version.")
        End If

        If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
            Throw New InvalidOperationException("This page requires the profile version id of a profile version.")
        End If

        Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

        're-calculate the prioritisation scores for this profile version
        'PrioritiseProfileCommand.PrioritiseProfile(profileVersionId)

        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		Dim pdfData As Byte() = profileVersion.GetSummaryProfileReport()

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile version.")
		End If

		Dim reportName = $"{profileVersion.FullTitlePlainText}({profileVersion.Status})_{profileVersion.Version}_Summary profile report"

		Response.DownloadPdfBytes(pdfData, reportName)
	End Sub
End Class
