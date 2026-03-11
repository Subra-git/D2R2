Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class StandardAnswerComparisonTable
    Inherits AnswerComparisonTable

    Protected Friend Sub New(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(questionLeft, questionRight, headingLevel, base)
    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim spacerRow As Row

        spacerRow = Me.Rows.Add()
        spacerRow.MinHeight = 5

        If Not questionLeft.ValuesEqual(questionRight) Then
            Me.Rows.Add(New FieldValueListComparisonRow( _
                        DirectCast(questionLeft, StandardQuestion).FieldValues, _
                        DirectCast(questionRight, StandardQuestion).FieldValues, _
                        base, headingLevel))
        End If

    End Sub

End Class