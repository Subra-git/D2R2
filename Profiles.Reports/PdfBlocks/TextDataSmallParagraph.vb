Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary

Friend Class TextDataSmallParagraph
    Inherits XhtmlParagraph

    Protected mInvisiblePen As New Pens.Pen(New Colors.GrayColor(255), 0)

    Private Sub New()
        '
    End Sub

    Public Sub New(ByVal data As String)

        Dim greyPen As New Pens.Pen(New Colors.GrayColor(210))
        Me.Border = New Border()
        Me.Border.Bottom = mInvisiblePen
        Me.Border.Top = mInvisiblePen
        Me.Border.Left = mInvisiblePen
        Me.Border.Right = mInvisiblePen

        Dim xhtmlValue As String

        '' TallPDF cannot handle "<br>" tags.
        data = data.Replace("<br>", "&nbsp;")

        If data.Length > 0 Then
            xhtmlValue = data.StripParagraphTags.Trim()
            xhtmlValue = xhtmlValue.Replace(vbCrLf, "<br/>")
            xhtmlValue = xhtmlValue.SanitizeHtml
            xhtmlValue = xhtmlValue.Replace(vbCrLf, "")
            xhtmlValue = xhtmlValue.Replace("<br>", "<br/>")
            xhtmlValue = "<html style='font-family:Arial,Helvetica;font-size:10px'>" & xhtmlValue & "</html>"
        Else
            xhtmlValue = "<html style='font-family:Arial,Helvetica;font-style:italic;color:#C8C8C8'>- No data has been entered - </html>"
        End If
        Me.Text = xhtmlValue

    End Sub

End Class
