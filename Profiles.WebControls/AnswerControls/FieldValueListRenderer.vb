Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class FieldValueListRenderer
        Implements IRenderer

        Private mFieldValues As FieldValueList

        Public Sub New(ByVal fieldValues As FieldValueList)
            mFieldValues = fieldValues
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

            For Each value As FieldValueBase In mFieldValues

                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                writer.RenderBeginTag(HtmlTextWriterTag.Strong)
                writer.Write(value.Name)
                If TypeOf value Is MultiValueListFieldValue Then
                    If value.Name.Length = 0 Then
                        writer.Write("Please select all that apply")
                    Else
                        writer.Write(" (please select all that apply)")
                    End If
                End If
                writer.RenderEndTag() '/Strong

                Dim innerRenderer As IRenderer

                If TypeOf value Is BooleanFieldValue OrElse _
                        TypeOf value Is ListFieldValue OrElse _
                        TypeOf value Is MultiValueListFieldValue Then
                    innerRenderer = ListFieldValueRenderer.GetListFieldValueRenderer(value)
                ElseIf TypeOf value Is FieldGroupFieldValue Then
                    Dim groupValue As FieldGroupFieldValue = DirectCast(value, FieldGroupFieldValue)
                    innerRenderer = New QuestionSpeciesListRenderer(groupValue.QuesSpecies)
                Else
                    innerRenderer = New TextFieldValueRenderer(value)
                End If

                innerRenderer.Render(writer)

                writer.RenderEndTag() '/Td
                writer.RenderEndTag() '/Tr

            Next

            writer.RenderEndTag() '/Tbody
            writer.RenderEndTag() '/Table

        End Sub

    End Class

End Namespace
