Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class RepeatingAnswerTable
    Inherits AnswerTable

    Protected Friend Sub New(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(question, headingLevel, base)
    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim spacerRow As Row
        Dim repeatQuestion As RepeatingQuestion = DirectCast(question, RepeatingQuestion)

        If Not question.IsRelevant Then
            Me.Rows.Add(New NoFieldValueListRow())
        ElseIf repeatQuestion.RowList.Count = 0 Then
            Me.Rows.Add(New NoFieldValueListRow("- No answers were provided for this question -"))
        Else

            For Each currentAnswerRow As QuestionRow In repeatQuestion.RowList
                spacerRow = Me.Rows.Add()
                spacerRow.MinHeight = 5
                Me.Rows.Add(New HeadingRow(question.Name & " " & (currentAnswerRow.SequenceNumber + 1).ToString(), headingLevel))
                Me.Rows.Add(New FieldValueListRow(currentAnswerRow.FieldValues, headingLevel, base))
            Next

        End If

    End Sub

End Class
