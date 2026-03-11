Imports ProfilesLibrary
Imports System.Collections.Generic
Imports Profiles.WebControls

Partial Class MaintainContributors
    Inherits System.Web.UI.Page

    Private Property CurrentProfileContributorList() As ProfileContributorList
        Get
            If Request.QueryString("ProfileId") Is Nothing Then
                Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
            End If

            If Not CommonUI.IsValidGuid(Request.QueryString("ProfileId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
            End If

            If Session("ProfileContributorList") Is Nothing Then
                Session("ProfileContributorList") = ProfileContributorList.GetProfileContributorList(New Guid(Request.QueryString("ProfileVersionId")))
            End If
            Return DirectCast(Session("ProfileContributorList"), ProfileContributorList)
        End Get
        Set(ByVal value As ProfileContributorList)
            Session("ProfileContributorList") = value
        End Set
    End Property

    Private Property CurrentProfileContributor() As ProfileContributor
        Get
            Return DirectCast(Session("ProfileContributor"), ProfileContributor)
        End Get
        Set(ByVal value As ProfileContributor)
            Session("ProfileContributor") = value
        End Set
    End Property
    Protected Sub dsProfileUserRoleList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileUserRoleList.SelectObject

        e.BusinessObject = CommonUI.GetProfileUserRoleList()

    End Sub

    Protected Sub dsProfileContributorList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileContributorList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentProfileContributorList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of ProfileContributor)(CurrentProfileContributorList)
            Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
            Dim sortProperty As String = sortExpressionParts(0).Trim
            Dim direction As SortDirection = SortDirection.Ascending
            If sortExpressionParts.Length > 1 Then
                direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
            End If
            sortedProfileVersionList.ApplySort(sortProperty, direction)

            e.BusinessObject = sortedProfileVersionList
        End If

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        ' Add a new profile Contributor
        ' cancel any pending edit that the user might have "cancelled" using the back butto
        lblErrorMsg.Text = String.Empty
        lblErrorMsg.Visible = False

        CurrentProfileContributorList.CancelEdit()
        CurrentProfileContributor = Nothing
        CurrentProfileContributorList.BeginEdit()
        SwitchToProfileContributorAddView()

    End Sub

    Protected Sub btnLookup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLookup.Click

        ddlRole.SelectedIndex = 0

        If Page.IsValid Then

            Dim command As VerifyDatabaseUserCommand = VerifyDatabaseUserCommand.Execute(txtUserName.Text)
            If command.IsUserManagement Then
                lblErrorMsg.Text = "This user cannot be made a contributor"
                lblErrorMsg.Visible = True
                Return
            ElseIf command.IsValidUser Then
                Dim currentContributor As ProfileContributor = CurrentProfileContributorList.AddNew(command.UserId)
                lblPanelTitle.Text = "Edit profile contributor"
                txtUserName.Text = currentContributor.UserName
                txtFullName.Text = currentContributor.FullName
                txtFullName.Enabled = Not currentContributor.IsSsoUser
                txtOrganisation.Text = currentContributor.Organisation
                txtOrganisation.Enabled = Not currentContributor.IsSsoUser
                If Not currentContributor.RoleId = Guid.Empty Then
                    ddlRole.SelectedValue = currentContributor.RoleId.ToString
                End If
                CurrentProfileContributor = currentContributor
                lblErrorMsg.Text = String.Empty
                lblErrorMsg.Visible = True
                SetPanelVisibility(CurrentProfileContributor.IsContributor)
                DisplayPanelControls(True, currentContributor.IsSsoUser)
                LoadCheckBoxes()
            ElseIf Not Regex.IsMatch(txtUserName.Text, RegexPatterns.Username) Then
                lblErrorMsg.Text = "This user is not currently in the profiles system"
                lblErrorMsg.Visible = True
                DisplayPanelControls(False, False)
                Return
            Else
                CurrentProfileContributor = CurrentProfileContributorList.AddNew(txtUserName.Text)
                lblErrorMsg.Text = "The user is not currently in the profiles system"
                lblErrorMsg.Visible = True
                SetPanelVisibility(CurrentProfileContributor.IsContributor)
                DisplayPanelControls(True, False)
            End If

            txtUserName.Enabled = False
            btnLookup.Visible = False


        End If
    End Sub

    Private Sub SetPanelVisibility(ByVal visible As Boolean)
        pnlSectionPermissions.Visible = visible
        pnlCheckUncheckAll.Visible = visible
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub grdProfileContributors_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdProfileContributors.RowCommand

        lblErrorMsg.Text = String.Empty

        If e.CommandName = "EditContributor" Then
            ' Switch to edit view
            ' cancel any pending edit that the user might have "cancelled" using the back button
            CurrentProfileContributorList.CancelEdit()
            grdProfileContributors.DataBind()
            CurrentProfileContributorList.BeginEdit()
            SwitchToProfileContributorEditView(CurrentProfileContributorList.GetById(New Guid(e.CommandArgument.ToString())))
        ElseIf e.CommandName = "DeleteContributor" Then
            grdProfileContributors.DataBind()
            CurrentProfileContributorList.CancelEdit()
            CurrentProfileContributorList.BeginEdit()
            Dim deletedProfileContributor As ProfileContributor = CurrentProfileContributorList.GetById(New Guid(e.CommandArgument.ToString()))
            CurrentProfileContributor = Nothing
            pnlProfileContributor.Visible = False
            CurrentProfileContributorList.Remove(deletedProfileContributor)
            CurrentProfileContributorList.ApplyEdit()
            Try
                CurrentProfileContributorList.Save()
                lblErrorMsg.Text = "The user was successfully removed from the list of contributors"
                lblErrorMsg.Visible = True
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Failed to remove the user from the list of contributors: " & ex.BusinessException.Message
                lblErrorMsg.Visible = True
            End Try
            Dim profileId As Guid = CurrentProfileContributorList.ProfileId
            CurrentProfileContributorList = ProfileContributorList.GetProfileContributorList(profileId)
            grdProfileContributors.DataBind()

        End If

    End Sub

    Private Sub SwitchToProfileContributorAddView()

        lblPanelTitle.Text = "Add profile contributor"
        btnLookup.Visible = True
        txtUserName.Enabled = True

        txtUserName.Text = String.Empty
        txtFullName.Text = String.Empty
        txtOrganisation.Text = String.Empty

        DisplayPanelControls(False, False)
        pnlSectionPermissions.Visible = False
        pnlCheckUncheckAll.Visible = False

        If Not pnlProfileContributor.Visible Then
            pnlProfileContributor.Visible = True
        End If

    End Sub

    Private Sub DisplayPanelControls(ByVal displayControls As Boolean, ByVal isSsoUser As Boolean)

        txtFullName.Enabled = displayControls AndAlso Not isSsoUser
        txtFullName.Visible = displayControls
        txtOrganisation.Enabled = displayControls AndAlso Not isSsoUser
        txtOrganisation.Visible = displayControls
        btnSave.Enabled = displayControls
        lblOrganisation.Visible = displayControls
        lblFullName.Visible = displayControls
        lblRole.Visible = displayControls
        ddlRole.Visible = displayControls

    End Sub

    Private Sub SwitchToProfileContributorEditView(ByVal currentContributor As ProfileContributor)

        ' save the further information to be edited in a member variable, to be picked up by the
        ' data binding event of the data control

        lblPanelTitle.Text = "Edit profile contributor"
        btnLookup.Visible = False
        txtUserName.Enabled = False

        CurrentProfileContributor = currentContributor
        txtUserName.Text = currentContributor.UserName
        txtFullName.Text = currentContributor.FullName
        txtOrganisation.Text = currentContributor.Organisation
        If Not currentContributor.RoleId = Guid.Empty Then
            ddlRole.SelectedValue = currentContributor.RoleId.ToString
        End If

        DisplayPanelControls(True, currentContributor.IsSsoUser)

        If Not pnlProfileContributor.Visible Then
            pnlProfileContributor.Visible = True
        End If

        If currentContributor.IsContributor Then
            pnlSectionPermissions.Visible = True
            pnlCheckUncheckAll.Visible = True
            LoadCheckBoxes()
        Else
            pnlSectionPermissions.Visible = False
            pnlCheckUncheckAll.Visible = False
        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        lblErrorMsg.Visible = False
        lblPermissionErrorMsg.Visible = False

        If Page.IsValid Then
            Try

                Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
                If Not CurrentProfileContributor.IsSsoUser Then
                    CurrentProfileContributor.FullName = txtFullName.Text
                    CurrentProfileContributor.Organisation = txtOrganisation.Text
                End If
                CurrentProfileContributor.RoleId = New Guid(ddlRole.SelectedValue)

                Dim role As ProfileUserRole = ProfileUserRoleList.GetProfileUserRole(New Guid(ddlRole.SelectedValue))

                If role.IsContributor Then
                    For Each sectionItem As ProfileSectionMetadata In sectionList
                        Dim permissionsTable As Table = DirectCast(pnlSectionPermissions.FindControl("permissionTable"), Table)
                        Dim chkbox As CheckBox = DirectCast(permissionsTable.FindControl("chkbox_" + sectionItem.Id.ToString.Replace("-", "_")), CheckBox)
                        If chkbox.Checked Then
                            CurrentProfileContributor.AddSectionPermission(sectionItem.Id)
                        Else
                            CurrentProfileContributor.RemoveSectionPermission(sectionItem.Id)
                        End If
                    Next
                    Dim checkFlag As Boolean = False
                    For Each sectionItem As ProfileSectionMetadata In sectionList
                        Dim permissionsTable As Table = DirectCast(pnlSectionPermissions.FindControl("permissionTable"), Table)
                        Dim chkbox As CheckBox = DirectCast(permissionsTable.FindControl("chkbox_" + sectionItem.Id.ToString.Replace("-", "_")), CheckBox)
                        If chkbox.Checked Then
                            checkFlag = True
                            Exit For
                        End If
                    Next

                    If Not checkFlag Then
                        lblPermissionErrorMsg.Text = "You must select at least one section"
                        lblPermissionErrorMsg.Visible = True
                        Exit Sub
                    End If
                End If

                CurrentProfileContributorList.ApplyEdit()
                CurrentProfileContributorList.Save()

                lblErrorMsg.Text = "Your changes were successfully saved"
                lblErrorMsg.Visible = True
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Failed to save your changes: " & ex.BusinessException.Message
                lblErrorMsg.Visible = True
            End Try
            CurrentProfileContributor = Nothing
            pnlProfileContributor.Visible = False

            Dim profileId As Guid = CurrentProfileContributorList.ProfileId

            ' get the dataset data from the database and save it in session
            CurrentProfileContributorList = ProfileContributorList.GetProfileContributorList(profileId)
            grdProfileContributors.DataBind()

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        lblErrorMsg.Visible = False

        CurrentProfileContributorList.CancelEdit()
        CurrentProfileContributor = Nothing
        pnlProfileContributor.Visible = False
        grdProfileContributors.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblPermissionErrorMsg.Visible = False
        If Not ProfileContributorList.CanGetContributorList Then
            Throw New System.Security.SecurityException("You do not have permission to view the Maintain contributors page")
        End If

        If Request.QueryString("ProfileId") Is Nothing Then
            Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
        End If

        If Not CommonUI.IsValidGuid(Request.QueryString("ProfileId")) Then
            Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
        End If

        If Not Page.IsPostBack Then

            Dim profileData As ProfilesLibrary.Profile = ProfilesLibrary.Profile.GetProfile(New Guid(Request.QueryString("ProfileId")))
            Dim masterProfilesTemplate = CType(Page.Master, ProfilesTemplate)
            masterProfilesTemplate.UpdateTitle("Maintain contributors for " & profileData.ToString())
            'Page.Title = "Maintain contributors for " & profileData.ToString().StripHtmlTags()
            lnkManageProfile.NavigateUrl = "ManageProfile.aspx?ProfileId=" & profileData.Id.ToString()
            CurrentProfileContributorList = ProfileContributorList.GetProfileContributorList(profileData.Id)

            ddlRole.DataBind()

			RefreshPage()
        End If

        LoadCheckBoxes()

    End Sub

    Private Sub LoadCheckBoxes()

        Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))

        pnlSectionPermissions.Controls.Clear()

        Dim permissionTable As Table = New Table()
        permissionTable.ID = "permissionTable"
        permissionTable.Attributes.Add("width", "95%")

        pnlSectionPermissions.Controls.Add(permissionTable)

        Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        Dim sectionCount As Integer = sectionList.Count
        Dim rowCount As Integer = Math.Ceiling(sectionCount / 3)     '3 columns in table

        Dim index As Integer = 0
        For currentRow As Integer = 1 To rowCount
            Dim permissionRow As New TableRow()
            permissionTable.Rows.Add(permissionRow)
            For currentCell As Integer = 1 To 3
                Dim newCell As TableCell = New TableCell()
                newCell.Attributes.Add("width", "33.3%")
                Dim div As HtmlGenericControl = New HtmlGenericControl("div")
                div.Attributes.Add("class", "govuk-checkboxes--small apha-font-size-19")
                Dim chkbox As New CheckBox()
                chkbox.Text = sectionList(index).FormattedShortName
                chkbox.ID = "chkbox_" + sectionList(index).Id.ToString.Replace("-", "_")
                chkbox.CssClass = "govuk-checkboxes__item"
                chkbox.InputAttributes("class") = "govuk-checkboxes__input"
                chkbox.LabelAttributes("class") = "govuk-label govuk-checkboxes__label"

                If Not CurrentProfileContributor Is Nothing Then
                    'editing
                    chkbox.Checked = CurrentProfileContributor.HasSectionPermission(sectionList(index).Id)
                Else
                    'adding 
                    chkbox.Checked = False
                End If
                div.Controls.Add(chkbox)
                newCell.Controls.Add(div)
                permissionRow.Cells.Add(newCell)
                index = index + 1
                If index > sectionCount - 1 Then
                    Exit For
                End If
            Next
        Next

    End Sub

    Protected Sub grdProfileContributors_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdProfileContributors.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim currentContributor As ProfileContributor = DirectCast(e.Row.DataItem, ProfileContributor)

            Dim lnkEdit As LinkButton = e.Row.Cells(4).Controls(0)
            lnkEdit.CommandArgument = currentContributor.Id.ToString()

            'This sets the CommandArgument for the Delete linkbutton. 
            'Without this CommandArgument the Delete link doesn't know what to delete
            Dim lnkDelete As LinkButton = e.Row.Cells(5).Controls(1)
            lnkDelete.CommandArgument = currentContributor.Id.ToString()
        End If

    End Sub

    Protected Sub ddlRole_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRole.SelectedIndexChanged

        Dim ddlist As DropDownList = DirectCast(sender, DropDownList)

        If ddlist.SelectedIndex <> 0 Then
            Dim roleId As Guid = New Guid(ddlist.SelectedValue)
            Dim userRole As ProfileUserRole = ProfileUserRoleList.GetProfileUserRole(roleId)
            If userRole.IsContributor Then
                pnlSectionPermissions.Visible = True
                pnlCheckUncheckAll.Visible = True
                LoadCheckBoxes()
            Else
                pnlSectionPermissions.Visible = False
                pnlCheckUncheckAll.Visible = False
            End If
        Else
            pnlSectionPermissions.Visible = False
            pnlCheckUncheckAll.Visible = False
        End If

    End Sub

    Protected Sub btnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckAll.Click

        CheckUncheckAll(True)

    End Sub

    Protected Sub btnUncheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUncheckAll.Click

        CheckUncheckAll(False)

    End Sub

    Private Sub CheckUncheckAll(ByVal check As Boolean)

        Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        For Each sectionItem As ProfileSectionMetadata In sectionList
            Dim permissionsTable As Table = DirectCast(pnlSectionPermissions.FindControl("permissionTable"), Table)
            Dim chkbox As CheckBox = DirectCast(permissionsTable.FindControl("chkbox_" + sectionItem.Id.ToString.Replace("-", "_")), CheckBox)
            chkbox.Checked = check
        Next

    End Sub

    Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdProfileContributors.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub

	Private Sub RefreshPage()
        grdProfileContributors.DataBind()
        bottomPaginator.TotalPages = grdProfileContributors.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub
End Class
