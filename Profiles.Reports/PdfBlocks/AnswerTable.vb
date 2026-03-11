Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend MustInherit Class AnswerTable
    Inherits Table

    Public Shared Function GetAnswerTable(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase) As AnswerTable
        If TypeOf question Is PerSpeciesQuestion Then
            Return New PerSpeciesAnswerTable(question, headingLevel, base)
        ElseIf TypeOf question Is RepeatingQuestion Then
            Return New RepeatingAnswerTable(question, headingLevel, base)
        Else
            Return New StandardAnswerTable(question, headingLevel, base)
        End If
    End Function

    Protected Friend Sub New(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

        SetUpTable()
        AddAnswerRows(question, headingLevel, base)

    End Sub

    Protected Friend Sub New(ByVal fieldGroup As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)
        SetUpTable()
        AddAnswerRows(fieldGroup, headingLevel, base)
    End Sub

    Protected MustOverride Sub AddAnswerRows(ByVal question As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)

    Protected Overridable Sub AddAnswerRows(ByVal fieldGroup As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)
        '
    End Sub

    Private Sub SetUpTable()
        Me.HorizontalAlignment = HorizontalAlignment.Center
        Me.PreferredWidth = 500
        Me.ForceWidth = True
    End Sub

End Class
