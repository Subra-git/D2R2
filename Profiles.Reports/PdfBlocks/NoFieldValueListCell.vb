Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports ProfilesLibrary

Friend Class NoFieldValueListCell
    Inherits Cell

    Public Sub New()
        Me.New("- This question is not relevant -")
    End Sub

    Public Sub New(ByVal message As String)
        Me.New(message, 0, False)
    End Sub

    Public Sub New(ByVal message As String, ByVal width As Double, ByVal isFixed As Boolean)
        Dim fieldLabelParagraph As New TextParagraph
        fieldLabelParagraph.HorizontalAlignment = HorizontalAlignment.Center
        Dim fieldLabelFragment As New Fragment(message.StripHtmlTags)
        fieldLabelFragment.Italic = True
        fieldLabelParagraph.Fragments.Add(fieldLabelFragment)
        Me.Paragraphs.Add(fieldLabelParagraph)
        fieldLabelParagraph.Padding.Top = 5
        fieldLabelParagraph.Padding.Bottom = 5

        If isFixed Then
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

    End Sub



End Class
