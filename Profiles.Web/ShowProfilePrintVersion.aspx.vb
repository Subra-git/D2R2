Imports ProfilesLibrary

Partial Class ShowProfilePrintVersion
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("ProfileVersionId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the profile version id of a profile version.")
        End If

		If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
			Throw New InvalidOperationException("This page requires the profile version id of a profile version.")
		End If

		Dim reportType = Request.QueryString("ProfileVersionId")

		Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

		Dim profileSectionId As Guid

        If Request.QueryString("ProfileSectionId") IsNot Nothing Then
            If Not IsValidGuid(Request.QueryString("ProfileSectionId")) Then
                Throw New InvalidOperationException("This page requires the profile section id of a profile section.")
            End If
            profileSectionId = New Guid(Request.QueryString("ProfileSectionId"))
        End If

        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		Dim pdfData As Byte() = profileVersion.GetPrintVersion(profileSectionId)

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile version.")
		End If

		Dim reportName = $"{profileVersion.FullTitlePlainText}({profileVersion.Status})_{profileVersion.Version}_Print full profile"

		Response.DownloadPdfBytes(pdfData, reportName)
	End Sub
End Class
