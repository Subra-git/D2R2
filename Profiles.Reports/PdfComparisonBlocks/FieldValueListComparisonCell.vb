Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class FieldValueListComparisonCell
    Inherits Cell

    Private mBase As PdfBase

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList, ByVal base As PdfBase, ByVal width As Double, ByVal isFixed As Boolean, ByVal headingLevel As Integer)

        mBase = base

        Me.ColSpan = 2
        If isFixed Then
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

        If fieldValuesLeft IsNot Nothing Then
            If fieldValuesRight IsNot Nothing Then
                'both something
                BuildComparisonCell(fieldValuesLeft, fieldValuesRight, width, headingLevel)
            Else
                'left something, right nothing
                BuildComparisonCell(fieldValuesLeft, True, width, headingLevel)
            End If
        Else
            If fieldValuesRight IsNot Nothing Then
                'left nothing, right something
                BuildComparisonCell(fieldValuesRight, False, width, headingLevel)
            End If
        End If

    End Sub

    Private Sub BuildComparisonCell(ByVal fieldValues As FieldValueList, ByVal isLeft As Boolean, ByVal width As Double, ByVal headingLevel As Integer)
        Dim requiresNewTable As Boolean = True
        Dim fieldValueTable As New Table
        Dim fieldIndex As Integer = 0

        For Each currentFieldValue As FieldValueBase In fieldValues
            If TypeOf (currentFieldValue) Is FieldGroupFieldValue Then
                Dim group As FieldGroupFieldValue = DirectCast(currentFieldValue, FieldGroupFieldValue)

                Dim speciesTable As PerSpeciesAnswerComparisonTable
                If isLeft Then
                    speciesTable = New PerSpeciesAnswerComparisonTable(group, Nothing, headingLevel + 1, mBase)
                Else
                    speciesTable = New PerSpeciesAnswerComparisonTable(Nothing, group, headingLevel + 1, mBase)
                End If
                Me.Paragraphs.Add(speciesTable)
            Else
                If requiresNewTable Then
                    fieldValueTable = New Table()
                    Me.Paragraphs.Add(fieldValueTable)
                    requiresNewTable = False
                End If

                If isLeft Then
                    fieldValueTable.Rows.Add(BuildFieldValueRow(currentFieldValue, Nothing, width, headingLevel))
                Else
                    fieldValueTable.Rows.Add(BuildFieldValueRow(Nothing, currentFieldValue, width, headingLevel))
                End If
            End If
        Next
    End Sub

    Private Sub BuildComparisonCell(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList, ByVal width As Double, ByVal headingLevel As Integer)
        Dim requiresNewTable As Boolean = True
        Dim fieldValueTable As New Table
        Dim fieldIndex As Integer = 0

        For Each currentFieldValue As FieldValueBase In fieldValuesLeft

            If TypeOf (currentFieldValue) Is FieldGroupFieldValue Then
                Dim groupLeft As FieldGroupFieldValue = DirectCast(currentFieldValue, FieldGroupFieldValue)
                Dim groupRight As FieldGroupFieldValue = DirectCast(fieldValuesRight(fieldIndex), FieldGroupFieldValue)

                Dim speciesTable As PerSpeciesAnswerComparisonTable = New PerSpeciesAnswerComparisonTable(groupLeft, groupRight, 3, mBase)
                Me.Paragraphs.Add(speciesTable)
                requiresNewTable = True
            Else
                If requiresNewTable Then
                    fieldValueTable = New Table()
                    Me.Paragraphs.Add(fieldValueTable)
                    requiresNewTable = False
                End If
                fieldValueTable.Rows.Add(BuildFieldValueRow(currentFieldValue, fieldValuesRight(fieldIndex), width, headingLevel))
            End If
            fieldIndex = fieldIndex + 1
        Next
    End Sub

    Private Function BuildFieldValueRow(ByVal fieldValueLeft As FieldValueBase, ByVal fieldValueRight As FieldValueBase, ByVal width As Double, ByVal headingLevel As Integer) As Row

        Dim fieldValueRow As New Row

        fieldValueRow.Cells.Add(New FieldValueCell(fieldValueLeft, width / 2, headingLevel, True, mBase))
        fieldValueRow.Cells.Add(New FieldValueCell(fieldValueRight, width / 2, headingLevel, True, mBase))

        Return fieldValueRow

    End Function

End Class
