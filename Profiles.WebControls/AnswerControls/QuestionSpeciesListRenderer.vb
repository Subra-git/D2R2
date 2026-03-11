Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class QuestionSpeciesListRenderer
        Implements IRenderer

        Private mQuestionSpecies As QuestionSpeciesList

        Public Sub New(ByVal questionSpecies As QuestionSpeciesList)
            mQuestionSpecies = questionSpecies
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            For Each currentSpecies As QuestionSpecies In mQuestionSpecies
                writer.RenderBeginTag(HtmlTextWriterTag.Fieldset)
                writer.AddStyleAttribute(HtmlTextWriterStyle.Color, "black")
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "bolder")
                writer.RenderBeginTag(HtmlTextWriterTag.Legend)
                writer.Write(currentSpecies.Name)
                writer.RenderEndTag() '/legend

                If currentSpecies.IsRelevant Then
                    Dim fieldList As New FieldValueListRenderer(currentSpecies.FieldValues)
                    fieldList.Render(writer)
                Else
                    writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "center")
                    writer.RenderBeginTag(HtmlTextWriterTag.Div)
                    writer.Write("- This question is not relevant -")
                    writer.RenderEndTag() '/div
                End If

                writer.RenderEndTag() ' /fieldset
                writer.RenderBeginTag(HtmlTextWriterTag.Br)
                writer.RenderEndTag() '/br
            Next

        End Sub

    End Class

End Namespace

