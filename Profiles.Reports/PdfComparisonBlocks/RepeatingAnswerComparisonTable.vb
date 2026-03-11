Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class RepeatingAnswerComparisonTable
    Inherits AnswerComparisonTable

    Protected Friend Sub New(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        MyBase.New(questionLeft, questionRight, headingLevel, base)
    End Sub

    Protected Overrides Sub AddAnswerRows(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        Dim spacerRow As Row
        Dim repeatingQuestionLeft As RepeatingQuestion = DirectCast(questionLeft, RepeatingQuestion)
        Dim repeatingQuestionRight As RepeatingQuestion = DirectCast(questionRight, RepeatingQuestion)
        Dim leftFieldValueList As FieldValueList
        Dim rightFieldValueList As FieldValueList

        Dim maximumRowCount As Integer = repeatingQuestionLeft.RowList.Count
        If repeatingQuestionRight.RowList.Count > maximumRowCount Then
            maximumRowCount = repeatingQuestionRight.RowList.Count
        End If

        For currentRowIndex As Integer = 0 To maximumRowCount - 1

            spacerRow = Me.Rows.Add()
            spacerRow.MinHeight = 5

            leftFieldValueList = GetRowFieldValues(repeatingQuestionLeft, currentRowIndex)
            rightFieldValueList = GetRowFieldValues(repeatingQuestionRight, currentRowIndex)

            If Not FieldValueListsEqual(leftFieldValueList, rightFieldValueList) Then
                Me.Rows.Add(New HeadingRow(questionLeft.Name & " " & (currentRowIndex + 1).ToString(), headingLevel, 350, 2))
                Me.Rows.Add(New FieldValueListComparisonRow(leftFieldValueList, rightFieldValueList, base, headingLevel))
            End If
        Next

    End Sub

    Private Function GetRowFieldValues(ByVal question As RepeatingQuestion, ByVal rowIndex As Integer) As FieldValueList

        If question.RowList.Count > rowIndex Then
            Return question.RowList(rowIndex).FieldValues
        Else
            Return Nothing
        End If

    End Function

End Class

