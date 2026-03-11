Imports ProfilesLibrary

Partial Class ShowStaticReport
    Inherits System.Web.UI.Page

    Private Property CurrentStaticReportList() As StaticReportList
        Get
            If Session("StaticReportList") Is Nothing Then
                Return Nothing
            End If

            Return DirectCast(Session("StaticReportList"), StaticReportList)
        End Get
        Set(ByVal value As StaticReportList)
            Session("StaticReportList") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("StaticReportVersionId") Is Nothing Then
            Throw New InvalidOperationException("This page requires the static report version id of a static report.")
        End If

        If Not IsValidGuid(Request.QueryString("StaticReportVersionId")) Then
            Throw New InvalidOperationException("This page requires the static report version id of a static report.")
        End If

        Dim staticReportVersionId As Guid = New Guid(Request.QueryString("StaticReportVersionId"))

        Dim data As StaticReportData = StaticReportData.GetStaticReportData(staticReportVersionId)
        If data.PdfData Is Nothing Then
            Throw New InvalidOperationException("Could not find a PDF for the specified static report version.")
        Else

            With Response
                .Clear()
                .Charset = String.Empty
                .ContentType = "application/pdf"
                .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", data.Title))
                .ContentEncoding = System.Text.Encoding.Default
            End With

            Response.BinaryWrite(data.PdfData)
        End If

    End Sub

End Class
