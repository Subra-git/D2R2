Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class PerSpeciesAnswerTable
    Inherits AnswerTable

    Protected Friend Sub New(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(question, headingLevel, base)
    End Sub

    Protected Friend Sub New(ByVal fieldGroup As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)

        MyBase.New(fieldGroup, headingLevel, base)

    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim speciesQuestion As PerSpeciesQuestion = DirectCast(question, PerSpeciesQuestion)
        AddRows(speciesQuestion.SpeciesList, headingLevel, base)

    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal fieldGroup As ProfilesLibrary.FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)

        AddRows(fieldGroup.QuesSpecies, headingLevel, base)

    End Sub

    Private Sub AddRows(ByVal speciesList As QuestionSpeciesList, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim spacerRow As Row

        For Each species As QuestionSpecies In speciesList

            spacerRow = Me.Rows.Add()
            spacerRow.MinHeight = 5
            Me.Rows.Add(New HeadingRow(species.Name, headingLevel))

            If Not species.IsRelevant Then
                Me.Rows.Add(New NoFieldValueListRow())
                Continue For
            End If

            Me.Rows.Add(New FieldValueListRow(species.FieldValues, headingLevel, base))

        Next

    End Sub

End Class
