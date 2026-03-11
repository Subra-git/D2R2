Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class LinkFragment
    Inherits Fragment

    Public Sub New(ByVal text As String, ByVal linkUrl As String)
        MyBase.New()
        Me.Underline = True
        Me.TextColor = New Colors.RgbColor(0, 0, 255)
        Me.Text = text
        Me.Actions.Add(New Actions.UriAction(linkUrl))
    End Sub

End Class
