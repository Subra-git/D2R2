Imports System.EnterpriseServices
Imports Profiles.Infrastructure
Imports ProfilesReviewEmailLibrary
Imports VLA.Profiles.CSharpActions

Partial Class ReviewEmail
    Inherits System.Web.UI.Page

    Private globalSettings As IGlobalSettings
    Private actions As IActions

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ProfilesLibrary.GlobalSettings.ShowReviewEmailPage Then
            Throw New System.Security.SecurityException("You do not have permission to view the show review email page. ")
        End If

        grdEmail.DataBind()

    End Sub

    Protected Sub btnSendReviewEmails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendReviewEmails.Click

        globalSettings = GlobalSettingsFactory.FromWebConfig()
        actions = VLA.Profiles.CSharpActions.Actions.GetAvailableActions()

        actions.SendReviewEmails(globalSettings.FromEmailAddress, globalSettings.FromEmailDisplayName)

        actions.Dispose()

        lblMessage.Text = "Emails sent..."
        lblMessage.Visible = True

    End Sub

    Protected Sub dsContributionsList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsEmailList.SelectObject

        actions = VLA.Profiles.CSharpActions.Actions.GetAvailableActions()

        e.BusinessObject = actions.UsersDueReviewEmail()

        actions.Dispose()

    End Sub

End Class
