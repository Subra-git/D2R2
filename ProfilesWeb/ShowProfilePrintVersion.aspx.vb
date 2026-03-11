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
        Else

            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", profileVersion.ToString()))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(pdfData)
        End If
    End Sub
End Class
