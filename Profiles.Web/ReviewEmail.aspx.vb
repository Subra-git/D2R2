Imports System.EnterpriseServices
Imports Profiles.Business.EmailBusiness
Imports Profiles.Contracts
Imports Profiles.Infrastructure
Imports StructureMap
Imports VLA.Profiles.CSharpActions

Partial Class ReviewEmail
    Inherits System.Web.UI.Page

    Private globalSettings As IGlobalSettings

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ProfilesLibrary.GlobalSettings.ShowReviewEmailPage Then
            Throw New System.Security.SecurityException("You do not have permission to view the show review email page. ")
        End If

        grdEmail.DataBind()

		RefreshPage()

    End Sub

    Protected Sub btnSendReviewEmails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendReviewEmails.Click

        ObjectFactory.GetInstance(Of IEmailBusiness).SendReviewEmails()

        lblMessage.Text = "Emails sent..."
        lblMessage.Visible = True

    End Sub

    Protected Sub dsContributionsList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsEmailList.SelectObject

        e.BusinessObject = ObjectFactory.GetInstance(Of IEmailBusiness).GetUsersDueReviewEmail()

    End Sub

    Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdEmail.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub

	Private Sub RefreshPage()
        grdEmail.DataBind()
        bottomPaginator.TotalPages = grdEmail.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub

End Class
