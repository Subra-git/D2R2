Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class QuestionRowListRenderer
        Implements IRenderer

        Private mTitle As String
        Private mQuestionRows As QuestionRowList

        Public Sub New(ByVal title As String, ByVal questionRows As QuestionRowList)
            mTitle = title
            mQuestionRows = questionRows
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            For currentRow As Integer = 1 To mQuestionRows.Count
                writer.RenderBeginTag(HtmlTextWriterTag.Fieldset)
                writer.AddStyleAttribute(HtmlTextWriterStyle.Color, "black")
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontWeight, "bolder")
                writer.RenderBeginTag(HtmlTextWriterTag.Legend)
                writer.Write(mTitle & " " & currentRow.ToString())
                writer.RenderEndTag() '/legend
                Dim fieldList As New FieldValueListRenderer(mQuestionRows(currentRow - 1).FieldValues)
                fieldList.Render(writer)
                writer.RenderEndTag() ' /fieldset
                writer.RenderBeginTag(HtmlTextWriterTag.Br)
                writer.RenderEndTag() '/br
            Next

        End Sub

    End Class

End Namespace


