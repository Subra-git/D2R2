Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend MustInherit Class AnswerComparisonTable
    Inherits Table

    Public Shared Function GetAnswerTable(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase) As AnswerComparisonTable
        If TypeOf questionLeft Is PerSpeciesQuestion Then
            Return New PerSpeciesAnswerComparisonTable(questionLeft, questionRight, headingLevel, base)
        ElseIf TypeOf questionLeft Is RepeatingQuestion Then
            Return New RepeatingAnswerComparisonTable(questionLeft, questionRight, headingLevel, base)
        Else
            Return New StandardAnswerComparisonTable(questionLeft, questionRight, headingLevel, base)
        End If
    End Function

    Protected Friend Sub New(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)
        SetUpPage()
        AddAnswerRows(questionLeft, questionRight, headingLevel, base)
    End Sub

    Protected Friend Sub New(ByVal groupLeft As FieldGroupFieldValue, ByVal groupRight As FieldGroupFieldValue, ByVal headingLevel As Integer, ByVal base As PdfBase)
        SetUpPage()
    End Sub

    Protected Sub SetUpPage()
        Me.HorizontalAlignment = HorizontalAlignment.Center
        Me.PreferredWidth = 700
        Me.ForceWidth = True
    End Sub

    Protected Shared Function GetCommonSpeciesList(ByVal speciesListLeft As QuestionSpeciesList, ByVal speciesListRight As QuestionSpeciesList) As Dictionary(Of Guid, Guid)

        Dim commonSpeciesList As New Dictionary(Of Guid, Guid)

        If speciesListLeft IsNot Nothing And speciesListRight IsNot Nothing Then

            For Each currentSpeciesLeft As QuestionSpecies In speciesListLeft
                For Each currentSpeciesRight As QuestionSpecies In speciesListRight

                    If currentSpeciesRight.Id = currentSpeciesLeft.Id Then
                        commonSpeciesList.Add(currentSpeciesRight.Id, currentSpeciesRight.Id)
                    End If
                Next
            Next
        End If

        Return commonSpeciesList
    End Function

    Protected Shared Function FieldValueListsEqual(ByVal leftFieldValueList As FieldValueList, ByVal rightFieldValueList As FieldValueList) As Boolean

        If leftFieldValueList Is Nothing AndAlso rightFieldValueList Is Nothing Then
            Return True
        End If

        If leftFieldValueList Is Nothing Then
            Return False
        End If

        If rightFieldValueList Is Nothing Then
            Return False
        End If

        Return leftFieldValueList.ValuesEqual(rightFieldValueList)

    End Function

    Protected MustOverride Sub AddAnswerRows(ByVal questionLeft As QuestionBase, ByVal questionRight As QuestionBase, ByVal headingLevel As Integer, ByVal base As PdfBase)


End Class
