Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class NoFieldValueListRow
    Inherits Row

    Public Sub New()
        Me.New("- This question is not relevant -")
    End Sub

    Public Sub New(ByVal message As String)

        Me.Cells.Add(New NoFieldValueListCell(message))

    End Sub

End Class
