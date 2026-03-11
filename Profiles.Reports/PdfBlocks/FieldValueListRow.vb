Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class FieldValueListRow
    Inherits Row

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValues As FieldValueList, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Me.Cells.Add(New FieldValueListCell(fieldValues, headingLevel, base))

    End Sub

End Class
