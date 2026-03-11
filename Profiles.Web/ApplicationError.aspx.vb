Imports ProfilesLibrary

Partial Class ApplicationError
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

            lblErrorLogged.Visible = Request.QueryString("errorlogged") = "false"

            If Session("lastException") IsNot Nothing Then
                Dim handledError As Exception = Session("lastException")
                If Not handledError Is Nothing Then
                    lblErrorDetails.Text = Server.HtmlEncode(handledError.Message)

                    If Session("lastUrl") IsNot Nothing Then
                        lblErrorLocation.Text = Server.HtmlEncode(Session("lastUrl"))
                    End If

                    lblErrorType.Text = handledError.GetType.FullName
                    lblUser.Text = identity.DisplayName
                    lblTime.Text = CStr(Now())
                End If
                Session.Remove("lastException")
                Session.Remove("lastUrl")
            End If
        End If

    End Sub
End Class
