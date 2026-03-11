Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors


Friend Class FieldValueListComparisonDifferenceRow
    Inherits Row

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList, ByVal base As PdfBase, ByVal headingLevel As Integer)


        If Not HasFieldGroup(fieldValuesLeft, fieldValuesRight) Then

            AddFieldValueListCell(fieldValuesLeft, fieldValuesRight, base, headingLevel)
        Else
            AddFieldValueListCell(fieldValuesLeft, fieldValuesRight, base, headingLevel)
        End If


    End Sub

    Private Function HasFieldGroup(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList) As Boolean
        Dim foundFieldGroup As Boolean = False

        If fieldValuesLeft IsNot Nothing Then
            foundFieldGroup = fieldValuesLeft.HasFieldGroup
        Else
            If fieldValuesRight IsNot Nothing Then
                foundFieldGroup = fieldValuesRight.HasFieldGroup
            End If
        End If
        Return foundFieldGroup
    End Function

    Private Sub AddFieldValueListCell(ByVal fieldValues As FieldValueList, ByVal base As PdfBase, ByVal headingLevel As Integer)

        If fieldValues Is Nothing Then
            Me.Cells.Add(New NoFieldValueListCell(String.Empty, 350, True))
        Else
            Me.Cells.Add(New FieldValueListCell(fieldValues, base, headingLevel, 350, True))
        End If

    End Sub

    Private Sub AddFieldValueListCell(ByVal fieldValuesLeft As FieldValueList, ByVal fieldValuesRight As FieldValueList, ByVal base As PdfBase, ByVal headingLevel As Integer)

        Me.Cells.Add(New FieldValueListComparisonDifferenceCell(fieldValuesLeft, fieldValuesRight, base, 700, True, headingLevel))

    End Sub

End Class
