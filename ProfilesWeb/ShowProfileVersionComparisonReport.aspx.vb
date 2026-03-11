Imports ProfilesLibrary

Partial Class ShowProfileVersionComparisonReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("ProfileVersionLeftId") Is Nothing Then
            Throw New InvalidOperationException("This page requires two profile version Ids")
        End If

        If Not IsValidGuid(Request.QueryString("ProfileVersionRightId")) Then
            Throw New InvalidOperationException("This page requires two profile version Ids")
        End If

        Dim profileVersionLeftId As Guid = New Guid(Request.QueryString("ProfileVersionLeftId"))
        Dim profileVersionRightId As Guid = New Guid(Request.QueryString("ProfileVersionRightId"))

        Dim pdfData As Byte() = GetProfileVersionComparisonReportCommand.GetProfileVersionComparisonReport(profileVersionLeftId, profileVersionRightId)
        If pdfData Is Nothing Then
            Throw New InvalidOperationException("Could not find a PDF for the specified profile versions.")
        Else
            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", "ComparisonReport"))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(pdfData)
        End If
    End Sub
End Class
