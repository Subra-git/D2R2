Imports ProfilesLibrary

Partial Class ShowProfileReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("ProfileVersionId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the profile version id of a published profile version.")
        End If

        If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
            Throw New InvalidOperationException("This page requires the profile version id of a published profile version.")
        End If

        Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

        If Request.QueryString("ProfileReportId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the profile report id of a profile report.")
        End If

        If Not IsValidGuid(Request.QueryString("ProfileReportId")) Then
            Throw New InvalidOperationException("This page requires the profile report id of a profile report.")
        End If

        Dim profileReportId As Guid = New Guid(Request.QueryString("ProfileReportId"))

        Dim profileVersionReportList As ProfileVersionReportInfoList = ProfileVersionReportInfoList.GetList(profileVersionId)
        Dim reportInfo As ProfileVersionReportInfo = profileVersionReportList.GetById(profileReportId)

        If reportInfo Is Nothing OrElse (Not reportInfo.HasPdfData) Then
            Throw New InvalidOperationException("Could not find a PDF for the specified profile version.")
        End If

        Dim pdfData As Byte() = reportInfo.GetProfileReport()
        If pdfData Is Nothing Then
            Throw New InvalidOperationException("Could not find a PDF for the specified profile version.")
        Else

            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", reportInfo.ReportName))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(pdfData)
        End If
    End Sub

End Class
