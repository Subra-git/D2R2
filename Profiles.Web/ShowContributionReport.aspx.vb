Imports ProfilesLibrary

Partial Class ShowContributionReport
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("ProfileId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the profile id of a profile.")
        End If

        If Not IsValidGuid(Request.QueryString("ProfileId")) Then
            Throw New InvalidOperationException("This page requires the profile id of a profile.")
        End If

        Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))

        Dim currentProfile As ProfilesLibrary.Profile
        currentProfile = ProfilesLibrary.Profile.GetProfile(profileId)

		Dim pdfData As Byte() = currentProfile.GetContributionsReport()

		If pdfData Is Nothing Then
			Throw New InvalidOperationException("Could not find a PDF for the specified profile.")
		End If

		Response.DownloadPdfBytes(pdfData, $"{currentProfile}_Contributions")
	End Sub
End Class
