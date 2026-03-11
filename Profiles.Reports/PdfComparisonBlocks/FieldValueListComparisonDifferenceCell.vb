Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors
Imports Profiles.DiffMatchPatch
Imports Profiles.DiffMatchPatch.Interfaces

Friend Class FieldValueListComparisonDifferenceCell
    Inherits Cell

    Private mBase As PdfBase

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList, ByVal base As PdfBase, ByVal width As Double, ByVal isFixed As Boolean, ByVal headingLevel As Integer)

        mBase = base

        Me.ColSpan = 1
        If isFixed Then
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

        If fieldValuesLeft IsNot Nothing Then
            If fieldValuesRight IsNot Nothing Then
                'both something
                BuildComparisonDifferenceCell(fieldValuesLeft, fieldValuesRight, width, headingLevel)
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

    Private Function BuildFieldValueDifferenceRow(ByVal fieldValueLeft As FieldValueBase, ByVal fieldValueRight As FieldValueBase, ByVal width As Double, ByVal headingLevel As Integer) As Row

        Dim fieldValueRow As New Row

        Dim LeftProfileResult As String = fieldValueLeft.ToString().StripHtmlTags
        Dim RightProfileResult As String = fieldValueRight.ToString().StripHtmlTags

        Dim diffMatchPatchServiceObj As IdiffMatchPatchService = New DiffMatchPatchService()
        Dim diffsRaw As List(Of Diff) = diffMatchPatchServiceObj.getDifferences(LeftProfileResult, RightProfileResult)
        Dim dffMatchService As IdiffMatchPatchService = New DiffMatchPatchService()
        diffMatchPatchServiceObj.diffCleanUp(diffsRaw)

        Dim diffCell As New FieldValueCell()
        diffCell.Border = New Border()
        Dim boderpen As New Pens.Pen()
        boderpen.Color = New GrayColor(220)

        diffCell.Border.Bottom = boderpen
        diffCell.Border.Top = boderpen
        diffCell.Border.Left = boderpen
        diffCell.Border.Right = boderpen

        diffCell.PreferredWidth = width

        Dim diffPara As New TextParagraph
        diffPara.HorizontalAlignment = HorizontalAlignment.Left
        diffPara.Fragments.AddRange(formatText(diffsRaw))

        diffCell.Paragraphs.Add(diffPara)
        fieldValueRow.Cells.Add(diffCell)

        Return fieldValueRow

    End Function

    Private Function formatText(differences As List(Of Diff)) As FragmentCollection

        Dim formatedDiffs As New FragmentCollection

        For Each item As Diff In differences
            Dim diffFrag As New Fragment(item.text)

            If item.operation.Equals(Operation.DELETE) Then
                diffFrag.TextColor = Color.Parse("Red")
                diffFrag.StrikeOut = True
            End If

            If item.operation.Equals(Operation.INSERT) Then
                diffFrag.TextColor = Color.Parse("Green")
                diffFrag.Bold = True
            End If

            formatedDiffs.Add(diffFrag)
        Next

        Return formatedDiffs

    End Function


    Private Sub BuildComparisonDifferenceCell(fieldValuesLeft As FieldValueList, fieldValuesRight As FieldValueList, width As Double, headingLevel As Integer)

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

                Dim myTypeFullName As String = currentFieldValue.GetType().FullName
                Dim CurrentFieldValTable As Table = New Table()
                Dim KnownTypeNames() As String = {"ProfilesLibrary.LongTextFieldValue",
                              "ProfilesLibrary.ProfileVersionDataFieldValue",
                              "ProfilesLibrary.DateFieldValue",
                              "ProfilesLibrary.BooleanFieldValue",
                              "ProfilesLibrary.DecimalFieldValue"}


                If KnownTypeNames.Contains(myTypeFullName) Then
                    BuildCurrentFieldValTable(fieldValuesRight, width, headingLevel, fieldIndex, currentFieldValue, CurrentFieldValTable)
                Else
                    fieldValueTable.Rows.Add(BuildFieldValueRow(currentFieldValue, fieldValuesRight(fieldIndex), 700, headingLevel))
                End If
            End If

            fieldIndex += 1
        Next

    End Sub


    Private Sub BuildCurrentFieldValTable(fieldValuesRight As FieldValueList, width As Double, headingLevel As Integer, fieldIndex As Integer, currentFieldValue As FieldValueBase, fieldValueTable As Table)
        Me.Paragraphs.Add(fieldValueTable)
        Dim fieldValueHeaderRow As New Row
        Dim fieldValueHeaderCell As New Cell
        Dim fieldValueHeaderPar As New TextParagraph
        Dim fieldValueHeaderFrag As New Fragment(currentFieldValue.Name.StripHtmlTags)
        fieldValueHeaderPar.Fragments.Add(fieldValueHeaderFrag)
        fieldValueHeaderCell.Paragraphs.Add(fieldValueHeaderPar)
        fieldValueHeaderRow.Cells.Add(fieldValueHeaderCell)
        fieldValueTable.Rows.Add(fieldValueHeaderRow)
        fieldValueTable.Rows.Add(BuildFieldValueDifferenceRow(currentFieldValue, fieldValuesRight(fieldIndex), width, headingLevel))
    End Sub

End Class
