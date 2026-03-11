Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class FieldValueListCell
    Inherits Cell

    Private mBase As PdfBase

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValues As FieldValueList, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Me.New(fieldValues, base, headingLevel, 500, True)

    End Sub

    Public Sub New(ByVal fieldValues As FieldValueList, ByVal base As PdfBase, ByVal headingLevel As Integer, ByVal width As Double, ByVal isFixed As Boolean)

        mBase = base

        Dim valueListTable As New Table()

        Me.Paragraphs.Add(valueListTable)

        For Each currentFieldValue As FieldValueBase In fieldValues
            Dim valueRow As New Row()
            valueListTable.Rows.Add(valueRow)

            Dim valueCell As New FieldValueCell(currentFieldValue, width, headingLevel, isFixed, base)
            valueRow.Cells.Add(valueCell)
        Next

        If isFixed Then
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

    End Sub

End Class
