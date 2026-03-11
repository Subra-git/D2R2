Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class StandardAnswerTable
    Inherits AnswerTable

    Protected Friend Sub New(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(question, headingLevel, base)
    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim spacerRow As Row

        spacerRow = Me.Rows.Add()
        spacerRow.MinHeight = 5

        If Not question.IsRelevant Then
            Me.Rows.Add(New NoFieldValueListRow())
        Else
            Me.Rows.Add(New FieldValueListRow(DirectCast(question, StandardQuestion).FieldValues, headingLevel, base))
        End If

    End Sub

End Class