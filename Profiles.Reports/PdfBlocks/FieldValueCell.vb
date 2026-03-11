Imports ProfilesLibrary
Imports TallComponents.PDF.Layout
Imports TallComponents.PDF.Layout.Paragraphs
Imports TallComponents.PDF.Layout.Colors

Friend Class FieldValueCell
    Inherits Cell

    Private mBase As PdfBase

    Public Sub New()
        '
    End Sub

    Public Sub New(ByVal fieldValue As FieldValueBase, ByVal width As Double, ByVal headingLevel As Integer, ByVal isFixed As Boolean, ByVal base As PdfBase)

        mBase = base

        If fieldValue IsNot Nothing Then
            If fieldValue.Name.Length > 0 Then
                Me.Paragraphs.Add(BuildFieldValueLabel(fieldValue.Name))
            End If
            Me.Paragraphs.Add(BuildFieldValue(fieldValue, headingLevel))
        End If

        If isFixed Then
            Me.Fixed = True
            Me.PreferredWidth = width
        End If

    End Sub

    Private Function BuildFieldValueLabel(ByVal label As String) As Paragraph

        Dim fieldLabelParagraph As New TextParagraph
        fieldLabelParagraph.Fragments.Add(New Fragment(label.StripHtmlTags))
        fieldLabelParagraph.Padding.Top = 5
        fieldLabelParagraph.Padding.Bottom = 5
        fieldLabelParagraph.KeepWithNext = True

        Return fieldLabelParagraph

    End Function

    Private Function BuildFieldValue(ByVal value As FieldValueBase, ByVal headingLevel As Integer) As Paragraph

        Dim fieldValueParagraph As Paragraph

        If TypeOf value Is BooleanFieldValue OrElse _
            TypeOf value Is ListFieldValue OrElse _
            TypeOf value Is MultiValueListFieldValue Then
            fieldValueParagraph = ListDataParagraph.GetListDataParagraph(value, mBase)
        ElseIf TypeOf value Is FieldGroupFieldValue Then
            Dim fieldGroupValue As FieldGroupFieldValue = DirectCast(value, FieldGroupFieldValue)
            fieldValueParagraph = New PerSpeciesAnswerTable(fieldGroupValue, headingLevel + 1, mBase)
        Else
            fieldValueParagraph = New TextDataParagraph(value.ToString())
        End If

        fieldValueParagraph.Padding.Left = 5
        fieldValueParagraph.Padding.Right = 5
        fieldValueParagraph.Padding.Top = 5
        fieldValueParagraph.Padding.Bottom = 5

        Return fieldValueParagraph

    End Function

End Class
