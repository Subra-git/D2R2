Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary

Namespace Profiles.WebControls

    Public Class InvalidReasonList
        Inherits WebControl
        Implements INamingContainer

        Public Property InvalidReasons() As Generic.List(Of InvalidReason)
            Private Get
                If (ViewState("InvalidReasons") IsNot Nothing) Then
                    Return CType(ViewState("InvalidReasons"), Generic.List(Of InvalidReason))
                End If
                Return Nothing
            End Get
            Set(ByVal value As Generic.List(Of InvalidReason))
                ViewState("InvalidReasons") = value
            End Set
        End Property

        Public Property DisplayQuestionAsLink() As Boolean
            Get
                If (ViewState("DisplayQuestionAsLink") IsNot Nothing) Then
                    Return CType(ViewState("DisplayQuestionAsLink"), Boolean)
                End If
                Return False
            End Get
            Set(ByVal value As Boolean)
                ViewState("DisplayQuestionAsLink") = value
            End Set
        End Property

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            If InvalidReasons Is Nothing Then
                Exit Sub
            End If

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "me-1")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-error-summary")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute("role", "alert")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Cellspacing, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Border, "0")
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-error-summary__title")
            writer.RenderBeginTag(HtmlTextWriterTag.H3)

            writer.Write("There " & IIf(InvalidReasons.Count = 1, "is ", "are ").ToString() & InvalidReasons.Count & " validation " & IIf(InvalidReasons.Count = 1, "error", "errors").ToString())

            If InvalidReasons.Count > 0 Then
                writer.RenderBeginTag(HtmlTextWriterTag.Br)
                writer.RenderEndTag() '</br>
            End If

            writer.RenderEndTag() '</h3>

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-error-summary__body")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-list govuk-error-summary__list")
            writer.RenderBeginTag(HtmlTextWriterTag.Ul)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-error-message")

            For Each reason As InvalidReason In InvalidReasons

                writer.RenderBeginTag(HtmlTextWriterTag.Li)
                writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-error-message")

                If DisplayQuestionAsLink AndAlso reason.QuestionShortName IsNot Nothing Then
                    writer.Write("<a href=""#" & reason.QuestionShortName.Replace(" ", String.Empty) & """>" & reason.SectionNumber.ToString() & "." & reason.QuestionNumber.ToString() & " " & reason.Description.StripHtmlTags() & " </a>")

                Else
                    writer.Write(reason.SectionNumber.ToString() & "." & reason.QuestionNumber.ToString() & " " & reason.Description)
                End If

                writer.RenderEndTag() '</li>
            Next
            writer.RenderEndTag() '/<ul>

            writer.RenderEndTag() '</div>

            writer.RenderEndTag() '</div>

        End Sub

    End Class

End Namespace

