Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class TextFieldValueRenderer
        Implements IRenderer

        Private mFieldValue As FieldValueBase

        Public Sub New(ByVal fieldValue As FieldValueBase)
            mFieldValue = fieldValue
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            writer.AddStyleAttribute(HtmlTextWriterStyle.BorderStyle, "solid")
            writer.AddStyleAttribute(HtmlTextWriterStyle.BorderWidth, "1px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.BorderColor, "#999999")
            writer.AddStyleAttribute(HtmlTextWriterStyle.BackgroundColor, "white")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")

            writer.RenderBeginTag(HtmlTextWriterTag.P)
            writer.Write(System.Web.HttpUtility.HtmlEncode(mFieldValue.ToString()).Replace(vbCrLf, "<br />"))
            writer.Write("&nbsp;")
            writer.RenderEndTag() '/P

        End Sub

    End Class

End Namespace

