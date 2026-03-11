Imports Profiles.WebControls
Imports ProfilesLibrary

Partial Class StaticReports
    Inherits System.Web.UI.Page

    Private mPublicColNum As Integer = 2 'The column index of the public column

    Private Property CurrentStaticReportList() As StaticReportList
        Get
            If Session("StaticReportList") Is Nothing Then
                Return Nothing
            End If

            Return DirectCast(Session("StaticReportList"), StaticReportList)
        End Get
        Set(ByVal value As StaticReportList)
            Session("StaticReportList") = value
        End Set
    End Property

    Private Property StaticReportId() As Guid
        Get
            If Session("StaticReportId") Is Nothing Then
                Return Guid.Empty
            End If

            Return DirectCast(Session("StaticReportId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("StaticReportId") = value
        End Set
    End Property

    Private Property IsUserManual() As Boolean
        Get
            If Session("IsUserManual") Is Nothing Then
                Return False
            End If

            Return DirectCast(Session("IsUserManual"), Boolean)
        End Get
        Set(ByVal value As Boolean)
            Session("IsUserManual") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString("StaticReportId") Is Nothing OrElse Not ProfilesLibrary.IsValidGuid(Request.QueryString("StaticReportId")) Then
                IsUserManual = (Request.QueryString("UserManual") = "1")
                CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)
                StaticReportId = Guid.Empty
                grdReports.DefaultSortExpression = "Title"
                If IsUserManual Then
                    Page.Title = "Help Using D2R2"
                    litUserManuals.Visible = True
                    litHelpReportHistory.Visible = False
                    litStaticReports.Visible = False
                    litGeneralReportHistory.Visible = False
                    lblUpload.Text = "Upload a user manual"
                    lblFile.Text = "User manual:"
                    cbPublic.Checked = False
                    cbPublic.Visible = False
                    grdReports.EmptyDataText = "There are no user manuals to display."
                End If
                UpdateBreadCrumbs()
            Else
                RefreshGridInHistoryMode()
                AddBreadCrumbNode()
            End If

			RefreshPage()
        End If

        btnAdd.Visible = StaticReportId.Equals(Guid.Empty) AndAlso UploadStaticReportCommand.CanUploadStaticReport()

        StaticReportsMenuStateChange()

    End Sub

    Protected Sub RefreshGridInHistoryMode()
        StaticReportId = New Guid(Request.QueryString("StaticReportId"))
        CurrentStaticReportList = StaticReportList.GetStaticReportHistoryList(StaticReportId)
        If CurrentStaticReportList.Count > 0 Then
            Page.Title = "History for " & CurrentStaticReportList(0).Title
            IsUserManual = CurrentStaticReportList(0).IsUserManual
        End If
        If IsUserManual Then
            litUserManuals.Visible = False
            litHelpReportHistory.Visible = True
            litStaticReports.Visible = False
            litGeneralReportHistory.Visible = False
            grdReports.EmptyDataText = "There are no user manuals to display."
        Else
            litUserManuals.Visible = False
            litHelpReportHistory.Visible = False
            litStaticReports.Visible = False
            litGeneralReportHistory.Visible = True
            grdReports.EmptyDataText = "There are no user manuals to display."
        End If
        grdReports.DefaultSortExpression = "VersionSortValue DESC"
    End Sub

    Protected Sub dsStaticReportList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsStaticReportList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentStaticReportList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of StaticReport)(CurrentStaticReportList)
            sortedProfileVersionList.ApplySort(e.SortProperty, e.SortDirection)
            e.BusinessObject = sortedProfileVersionList
        End If

    End Sub

    Protected Sub grdReports_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdReports.RowCommand

        'if history button selected, update history grid label and load report history
        Select Case e.CommandName.ToLower

            'if delete command then remove report from list and save changes
            Case "delete"
                Dim staticReportVersionId As Guid = New Guid(e.CommandArgument.ToString())
                Dim deleteReport As StaticReport = CurrentStaticReportList.GetById(staticReportVersionId)
                Dim fileType As String = "report"
                If IsUserManual Then
                    fileType = "user manual"
                End If

                Try
                    CurrentStaticReportList.Remove(deleteReport)
                    CurrentStaticReportList.Save()
                    lblReportMessage.Text = String.Format("The {0} version was successfully deleted", fileType)
                Catch ex As Csla.DataPortalException
                    lblReportMessage.Text = String.Format("The {0} version could not be deleted: {1}", fileType, ex.BusinessException.Message)
                End Try

                CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)

                grdReports.DataBind()

            Case "changeaccess"
                Dim staticReportVersionId As Guid = New Guid(e.CommandArgument.ToString())

                SetStaticReportPublicAccessCommand.SetStaticReportPublicAccess(staticReportVersionId)
                RefreshGridInHistoryMode()
                grdReports.DataBind()

        End Select

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlReportUpload.Visible = True
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlReportUpload.Visible = False
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim fileType As String = "report"
        If IsUserManual Then
            fileType = "user manual"
        End If

        Try
            If filReport.PostedFile IsNot Nothing AndAlso filReport.PostedFile.ContentType <> "application/pdf" Then
                Throw New ApplicationException(String.Format("The uploaded {0} must be a Pdf", fileType))
            End If
            If filReport.FileName.Length < 5 Then
                Throw New ApplicationException("The filename was less than 5 characters long")
            End If
            If cbPublic.Checked Then
                UploadStaticReportCommand.UploadStaticReport(filReport.FileName.Substring(0, filReport.FileName.Length - 4), filReport.FileBytes, IsUserManual, True)
            Else
                UploadStaticReportCommand.UploadStaticReport(filReport.FileName.Substring(0, filReport.FileName.Length - 4), filReport.FileBytes, IsUserManual, False)
            End If
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("The {0} was uploaded successfully", fileType)
            lblReportMessage.Visible = True
            cbPublic.Checked = False
        Catch ex As Csla.DataPortalException
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("Failed to upload the {0}: {1}", fileType, ex.BusinessException.Message)
            lblReportMessage.Visible = True
        Catch aex As ApplicationException
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("Failed to upload the {0}: {1}", fileType, aex.Message)
            lblReportMessage.Visible = True
        End Try

        CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)
        grdReports.DataBind()

    End Sub

    Protected Sub grdReports_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdReports.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim lnkViewStaticReportVersion As HyperLink = DirectCast(e.Row.Cells(0).FindControl("lnkViewStaticReportVersion"), HyperLink)
            Dim lnkHistory As HyperLink = DirectCast(e.Row.Cells(0).FindControl("lnkHistory"), HyperLink)
			Dim lnkDeleteReport As LinkButton = DirectCast(e.Row.Cells(0).FindControl("lnkDeleteReport"), LinkButton)
			Dim lnkDeleteManual As LinkButton = DirectCast(e.Row.Cells(0).FindControl("lnkDeleteManual"), LinkButton)
			Dim lnkChangeAccess As LinkButton = DirectCast(e.Row.Cells(0).FindControl("lnkChangeAccess"), LinkButton)
			Dim staticReportInfo As StaticReport = DirectCast(e.Row.DataItem, StaticReport)

			'use javascript rather than target="_blank", because it gives a better user experience if the SSO session has timed out
			'when the user clicks the link
			lnkViewStaticReportVersion.Attributes.Add("onclick", String.Format("window.open('ShowStaticReport.aspx?StaticReportVersionId={0}');return false;", staticReportInfo.Id.ToString()))

            lnkHistory.NavigateUrl = String.Format("StaticReports.aspx?StaticReportId={0}", staticReportInfo.StaticReportId.ToString())
            lnkHistory.Visible = StaticReportId.Equals(Guid.Empty)
			lnkDeleteReport.Visible = StaticReportId.Equals(Guid.Empty) AndAlso staticReportInfo.CanDelete AndAlso Not IsUserManual
			lnkDeleteManual.Visible = StaticReportId.Equals(Guid.Empty) AndAlso staticReportInfo.CanDelete AndAlso IsUserManual

			lnkChangeAccess.Visible = Not StaticReportId.Equals(Guid.Empty) AndAlso staticReportInfo.CanMakePublic

			If IsUserManual Then
				lnkHistory.NavigateUrl += "&UserManual=1"
			End If
		End If

    End Sub

    Protected Sub grdReports_DataBound(ByVal sender As Object, ByVal e As EventArgs) Handles grdReports.DataBound

        If IsUserManual Then
            DirectCast(sender, GridView).Columns(mPublicColNum).Visible = False
        End If

    End Sub

    Protected Sub UpdateBreadCrumbs()

        Dim master = CType(Page.Master, ProfilesTemplate)

        Breadcrumb.UpdateBreadcrumb(master, Page.Title, 2)

    End Sub

    Protected Sub AddBreadCrumbNode()

        Dim master = CType(Page.Master, ProfilesTemplate)
        Dim userManualId = Request.QueryString("UserManual")
        Dim parentLocation = $"~/StaticReports.aspx?UserManual={userManualId}"
        Dim profileTitle As String
        If userManualId = "1" Then
            profileTitle = "Help using D2R2"
        Else
            profileTitle = "General reports"
        End If

        Breadcrumb.UpdateBreadcrumb(master, Page.Title, 2, parentLocation, profileTitle)

    End Sub

    Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdReports.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

    Private Sub RefreshPage()
        grdReports.DataBind()
        bottomPaginator.TotalPages = grdReports.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub

    Private Sub StaticReports_Init(sender As Object, e As EventArgs) Handles Me.Init

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub

    Private Sub StaticReportsMenuStateChange()
        If IsUserManual Then
            Dim master = CType(Page.Master, ProfilesTemplate)
            Dim menuControl As NavigationLinks = CType(master.FindControl("navLinks"), NavigationLinks)
            If menuControl IsNot Nothing Then
                Dim menuItem As HtmlAnchor = CType(menuControl.FindControl("litStaticReports"), HtmlAnchor)
                Dim scriptStaticReport As String
                scriptStaticReport = "setTimeout(function() {document.getElementById('" & menuItem.ClientID & "').className = 'govuk-link govuk-link--no-visited-state govuk-link--no-underline';}, 1000);"
                ScriptManager.RegisterStartupScript(Me, Page.GetType(), "litStaticReportsMenuStateChange", scriptStaticReport, True)
            End If
        End If
    End Sub

End Class
