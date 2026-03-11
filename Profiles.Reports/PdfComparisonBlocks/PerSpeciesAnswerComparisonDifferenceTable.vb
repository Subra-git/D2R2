Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class PerSpeciesAnswerComparisonDifferenceTable
    Inherits AnswerComparisonDifferenceTable


    Protected Friend Sub New(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(questionLeft, questionRight, headingLevel, base)
    End Sub

    Protected Friend Sub New(ByVal groupLeft As FieldGroupFieldValue, ByVal groupRight As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)

        MyBase.New(groupLeft, groupRight, headingLevel, base)
        AddAnswerRows(groupLeft, groupRight, headingLevel, base)

    End Sub

    Protected Overloads Sub AddAnswerRows(ByVal groupLeft As FieldGroupFieldValue, ByVal groupRight As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)

        If groupLeft Is Nothing Then
            AddRows(Nothing, groupRight.QuesSpecies, headingLevel, base)
        Else
            If groupRight Is Nothing Then
                AddRows(groupLeft.QuesSpecies, Nothing, headingLevel, base)
            Else
                AddRows(groupLeft.QuesSpecies, groupRight.QuesSpecies, headingLevel, base)
            End If
        End If

    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim speciesListLeft As QuestionSpeciesList = (DirectCast(questionLeft, PerSpeciesQuestion)).SpeciesList
        Dim speciesListRight As QuestionSpeciesList = (DirectCast(questionRight, PerSpeciesQuestion)).SpeciesList

        AddRows(speciesListLeft, speciesListRight, headingLevel, base)

    End Sub

    Private Sub AddRows(ByVal speciesListLeft As QuestionSpeciesList, ByVal speciesListRight As QuestionSpeciesList, ByVal headingLevel As Integer, ByVal base As PdfBase)
        Dim spacerRow As Row

        Dim commonSpeciesList As Dictionary(Of Guid, Guid) = AnswerComparisonDifferenceTable.GetCommonSpeciesList(speciesListLeft, speciesListRight)

        For Each currentSpeciesId As Guid In commonSpeciesList.Keys

            spacerRow = Me.Rows.Add()
            spacerRow.MinHeight = 5

            If Not speciesListLeft.GetById(currentSpeciesId).ValuesEqual(speciesListRight.GetById(currentSpeciesId)) Then

                Me.Rows.Add(New HeadingRow(speciesListLeft.GetById(currentSpeciesId).Name, headingLevel, 350, 3))
                Me.Rows.Add(New FieldValueListComparisonDifferenceRow(speciesListLeft.GetById(currentSpeciesId).FieldValues, speciesListRight.GetById(currentSpeciesId).FieldValues, base, headingLevel))

            End If
        Next

        If speciesListLeft IsNot Nothing Then
            For Each currentSpeciesLeft As QuestionSpecies In speciesListLeft
                If Not commonSpeciesList.ContainsKey(currentSpeciesLeft.Id) Then
                    spacerRow = Me.Rows.Add()
                    spacerRow.MinHeight = 5
                    If currentSpeciesLeft.FieldValues.Count > 0 Then
                        Me.Rows.Add(New HeadingRow(currentSpeciesLeft.Name, headingLevel, 350, 3))
                        Me.Rows.Add(New FieldValueListComparisonRow(currentSpeciesLeft.FieldValues, Nothing, base, headingLevel))
                    End If
                End If
            Next
        End If

        If speciesListRight IsNot Nothing Then
            For Each currentSpeciesRight As QuestionSpecies In speciesListRight
                If Not commonSpeciesList.ContainsKey(currentSpeciesRight.Id) Then
                    spacerRow = Me.Rows.Add()
                    spacerRow.MinHeight = 5
                    If currentSpeciesRight.FieldValues.Count > 0 Then
                        Me.Rows.Add(New HeadingRow(currentSpeciesRight.Name, headingLevel, 350, 3))
                        Me.Rows.Add(New FieldValueListComparisonRow(Nothing, currentSpeciesRight.FieldValues, base, headingLevel))
                    End If
                End If
            Next
        End If
    End Sub

End Class
