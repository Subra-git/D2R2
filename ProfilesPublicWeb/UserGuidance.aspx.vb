Imports ProfilesLibrary

Partial Class UserGuidance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim profileQuestionId As New Guid(Request.QueryString("ProfileQuestionId"))
            Dim question As ProfileQuestion = ProfileQuestion.GetProfileQuestion(profileQuestionId)
            lblQuestionName.Text = HttpUtility.HtmlEncode(question.Name)
            lblHelpText.Text = HttpUtility.HtmlEncode(question.UserGuidance).Replace(vbCrLf, "</p><p>")
        End If
    End Sub

End Class
