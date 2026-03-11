Imports System.Text
Imports System.Web.UI
Imports Microsoft.VisualBasic
Imports ProfilesLibrary

Namespace Profiles.WebControls.AnswerControls

    Public Class QuestionRenderer
        Implements IRenderer

        Private mTitle As String
        Private mQuestion As QuestionBase
        Private mShowHelpLinks As Boolean

        Public Sub New(ByVal title As String, ByVal question As QuestionBase, ByVal showHelpLinks As Boolean)
            mTitle = title
            mQuestion = question
            mShowHelpLinks = showHelpLinks
        End Sub

        Public Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter) Implements IRenderer.Render

            writer.AddAttribute(HtmlTextWriterAttribute.Border, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Width, "100%")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellspacing, "0")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "left")
            writer.RenderBeginTag(HtmlTextWriterTag.Th)
            writer.Write("&nbsp;" & mTitle)
            writer.RenderEndTag() '/th
            writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingRight, "5px")
            writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "right")
            writer.RenderBeginTag(HtmlTextWriterTag.Th)

            If mShowHelpLinks Then
                Me.RenderHelpLink(writer)
            End If

            writer.RenderEndTag() '/th

            writer.RenderEndTag() '/tr
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
            writer.AddAttribute(HtmlTextWriterAttribute.Colspan, "2")
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginTop, "0")
            writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingTop, "0")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "lightgreenborder")
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginTop, "0")
            writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingTop, "10px")
            If mQuestion.IsRelevant Then
                writer.RenderBeginTag(HtmlTextWriterTag.Div)

                Dim innerRenderer As IRenderer

                If TypeOf mQuestion Is StandardQuestion Then
                    innerRenderer = New FieldValueListRenderer(DirectCast(mQuestion, StandardQuestion).FieldValues)
                ElseIf TypeOf mQuestion Is PerSpeciesQuestion Then
                    Dim speciesQuestion As PerSpeciesQuestion = DirectCast(mQuestion, PerSpeciesQuestion)
                    innerRenderer = New QuestionSpeciesListRenderer(speciesQuestion.SpeciesList)
                Else
                    Dim rowQuestion As RepeatingQuestion = DirectCast(mQuestion, RepeatingQuestion)
                    innerRenderer = New QuestionRowListRenderer(rowQuestion.Name, rowQuestion.RowList)
                End If

                innerRenderer.Render(writer)
            Else
                writer.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "center")
                writer.RenderBeginTag(HtmlTextWriterTag.Div)
                writer.Write("- This question is not relevant -")
            End If

            writer.RenderEndTag() '/div
            writer.RenderEndTag() '/td
            writer.RenderEndTag() '/tr

            writer.RenderEndTag() '/table

        End Sub

        Private Sub RenderHelpLink(ByVal writer As HtmlTextWriter)

            Dim sbJscript As New StringBuilder()
            sbJscript.Append("var w = 175; var h = 125; var wleft = (screen.width - w) / 2;")
            sbJscript.Append("var wtop = (screen.height - h) / 2;")
            sbJscript.Append("var winHelp = window.open ('" & String.Format("UserGuidance.aspx?ProfileQuestionId={0}", mQuestion.Id.ToString()) & "','helpPopup',")
            sbJscript.Append("'status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=1,width=400,height=250,left=' + wleft + ', top=' + wtop);")
            sbJscript.Append("winHelp.focus();return false;")

            writer.AddAttribute(HtmlTextWriterAttribute.Target, "blank")
            writer.AddAttribute(HtmlTextWriterAttribute.Href, String.Format("UserGuidance.aspx?ProfileQuestionId={0}", mQuestion.Id.ToString()))
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, "window.open(" & String.Format("'UserGuidance.aspx?ProfileQuestionId={0}", mQuestion.Id.ToString()) & "','mywindow','menubar=0,toolbox=0,location=0');return false;")
            writer.RenderBeginTag(HtmlTextWriterTag.A)
            writer.Write("Help")
            writer.RenderEndTag()

        End Sub

    End Class

End Namespace

