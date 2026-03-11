Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary
Imports System.IO
Imports System.Xml

Friend Class TextDataParagraph
    Inherits XhtmlParagraph

    Private Sub New()
        '
    End Sub

    Public Sub New(ByVal data As String)

        Dim greyPen As New Pens.Pen(New Colors.GrayColor(210))
        Me.Border = New Border()
        Me.Border.Bottom = greyPen
        Me.Border.Top = greyPen
        Me.Border.Left = greyPen
        Me.Border.Right = greyPen

        Dim xhtmlValue As String
        Dim cssString As String = "<style>* {font-family:Arial,Helvetica;}</style>"

        If data.Length > 0 Then
            xhtmlValue = data.StripParagraphTags.Trim()
            xhtmlValue = xhtmlValue.Replace("</a><em>", "</a>&nbsp;<em>")
            xhtmlValue = xhtmlValue.Replace("</a> <em>", "</a>&nbsp;<em>")
            xhtmlValue = xhtmlValue.Replace(vbCrLf, "<br/>")
            xhtmlValue = xhtmlValue.SanitizeHtml
            xhtmlValue = xhtmlValue.Replace(vbCrLf, "")
            xhtmlValue = xhtmlValue.Replace("<br>", "<br/>")

            'xhtmlValue = xhtmlValue.Replace("<br>", "&nbsp;")
        Else
            xhtmlValue = "<html style='font-family:Arial,Helvetica;font-style:italic;color:#C8C8C8'>- No data has been entered - </html>"
        End If

        Me.Text = cssString & xhtmlValue

    End Sub

End Class
