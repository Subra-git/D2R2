Imports ProfilesLibrary
Imports Profiles.Contracts

Partial Class ShowProfileGuidanceReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim type As ProfileGuidanceReportType

        Dim queryStringValue As String = Request.QueryString("type")

        If (String.IsNullOrEmpty(queryStringValue)) Then
            ' Default to all
            type = ProfileGuidanceReportType.All
        Else
            ' No enum.TryParse, so have to do it this way
            Try
                type = DirectCast([Enum].Parse(GetType(ProfileGuidanceReportType), queryStringValue, True), ProfileGuidanceReportType)
            Catch ex As ArgumentException
                Throw New InvalidOperationException( _
                    String.Format( _
                        "Could not convert report type '{0}' to ProfileGuidanceReportType.", _
                        queryStringValue), _
                        ex)
            End Try
        End If

        Dim pdfData As Byte() = ProfileQuestionMetadataList.GetProfileGuidanceReport(type)
        If pdfData Is Nothing Then
            Throw New InvalidOperationException( _
                String.Format( _
                    "Could not find a PDF for profile guidance for type '{0}'.", _
                    type))
        End If

        Dim filename As String

        Select Case type
            Case ProfileGuidanceReportType.All
                filename = "Profile Guidance"
            Case ProfileGuidanceReportType.SummaryProfile
                filename = "Summary Profile Guidance"
            Case ProfileGuidanceReportType.SummaryPrioritisationReport
                filename = "Summary Prioritisation Report Guidance"
            Case ProfileGuidanceReportType.QAGuidanceReport
                filename = "Q&A Guidance Report"
            Case Else
                filename = "Guidance"
        End Select


        With Response
            .Clear()
            .Charset = String.Empty
            .ContentType = "application/pdf"
            .AddHeader("Content-Disposition", String.Format("inline; filename=""{0}.pdf""", filename))
            .ContentEncoding = System.Text.Encoding.Default
        End With

        Response.BinaryWrite(pdfData)
    End Sub
End Class
