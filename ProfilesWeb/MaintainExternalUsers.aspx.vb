Imports ProfilesLibrary

Partial Class MaintainExternalUsers
    Inherits System.Web.UI.Page

    Private Property CurrentSsoUserMaintenance() As SsoUserMaintenance
        Get
            Return DirectCast(Session("SsoUserMaintenance"), SsoUserMaintenance)
        End Get
        Set(ByVal value As SsoUserMaintenance)
            Session("SsoUserMaintenance") = value
        End Set
    End Property

    Private Property CurrentUserId() As Guid
        Get
            Return DirectCast(Session("UserId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("UserId") = value
        End Set
    End Property

    Private ReadOnly Property CurrentSsoUser() As SsoUser
        Get
            If CurrentUserId.Equals(Guid.Empty) Then
                Return Nothing
            Else
                Return CurrentSsoUserMaintenance.SsoUserList.GetById(CurrentUserId)
            End If
        End Get
    End Property

    Private Property CurrentProfileId() As Guid
        Get
            Return DirectCast(Session("ProfileId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("ProfileId") = value
        End Set
    End Property

    Private ReadOnly Property CurrentSsoUserProfile() As SsoUserProfile
        Get
            If CurrentProfileId.Equals(Guid.Empty) OrElse CurrentUserId.Equals(Guid.Empty) Then
                Return Nothing
            Else
                Return CurrentSsoUser.SsoUserProfileList.GetById(CurrentProfileId)
            End If
        End Get
    End Property

    Private Property IsAddProfile() As Boolean
        Get
            Return DirectCast(Session("IsAddProfile"), Boolean)
        End Get
        Set(ByVal value As Boolean)
            Session("IsAddProfile") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not SsoUserMaintenance.CanGetSsoUserMaintenance() Then
            Throw New System.Security.SecurityException("You do not have permission to view the Maintain external users page")
        End If

        If Not Page.IsPostBack Then
            IsAddProfile = False
            CurrentProfileId = Guid.Empty
            CurrentUserId = Guid.Empty
            CurrentSsoUserMaintenance = SsoUserMaintenance.GetSsoUserMaintenance()
            pnlUsersTitle.Text = "External users"
            btnProfilesOK.Enabled = False
        End If

        BuildCheckBoxes()
    End Sub

    Protected Sub dsProfileUserRoleList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileUserRoleList.SelectObject

        e.BusinessObject = CommonUI.GetProfileUserRoleList()

    End Sub

    Protected Sub dsExternalUserList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsExternalUserList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentSsoUserMaintenance.SsoUserList
        Else
            Dim sortedSsoUserList As New Csla.SortedBindingList(Of SsoUser)(CurrentSsoUserMaintenance.SsoUserList)
            Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
            Dim sortProperty As String = sortExpressionParts(0).Trim
            Dim direction As SortDirection = SortDirection.Ascending
            If sortExpressionParts.Length > 1 Then
                direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
            End If
            sortedSsoUserList.ApplySort(sortProperty, direction)

            e.BusinessObject = sortedSsoUserList
        End If

    End Sub

    Protected Sub dsProfileList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileList.SelectObject

        Dim currentProfileList As SsoUserProfileList = CurrentSsoUser.SsoUserProfileList

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = currentProfileList
        Else
            Dim sortedProfileList As New Csla.SortedBindingList(Of SsoUserProfile)(currentProfileList)
            Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
            Dim sortProperty As String = sortExpressionParts(0).Trim
            Dim direction As SortDirection = SortDirection.Ascending
            If sortExpressionParts.Length > 1 Then
                direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
            End If
            sortedProfileList.ApplySort(sortProperty, direction)

            e.BusinessObject = sortedProfileList
        End If

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub grdExternalUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdExternalUsers.RowCommand

        If e.CommandName = "EditExternalUser" Then

            CurrentUserId = New Guid(e.CommandArgument.ToString())

            CurrentSsoUserMaintenance.CancelEdit()
            CurrentSsoUserMaintenance.BeginEdit()
            pnlAddProfile.Visible = True

            lblProfileTitle.Text = "Profiles for " & CurrentSsoUser.UserName
            pnlProfiles.Visible = True

            grdProfileList.DataBind()
            PopulateProfileDropDownList()
            ShowPendingChangesMessage()

        End If

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub grdProfileList_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdProfileList.RowCommand

        If e.CommandName = "EditProfile" Then

            CurrentProfileId = New Guid(e.CommandArgument.ToString())
            ShowSectionPanel(CurrentSsoUserProfile.Title)

        ElseIf e.CommandName = "DeleteProfile" Then

            Dim id As Guid = New Guid(e.CommandArgument.ToString())
            CurrentSsoUser.SsoUserProfileList.Remove(id)
            grdProfileList.DataBind()
            HideSectionPanel()
            ShowPendingChangesMessage()

        End If

    End Sub

    Protected Sub grdExternalUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExternalUsers.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim currentUser As SsoUser = DirectCast(e.Row.DataItem, SsoUser)
            Dim lnkEdit As LinkButton = e.Row.Cells(3).Controls(0)
            lnkEdit.CommandArgument = currentUser.Id.ToString()

        End If

    End Sub

    Protected Sub grdProfileList_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdProfileList.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim currentProfile As SsoUserProfile = DirectCast(e.Row.DataItem, SsoUserProfile)
            Dim lnkEdit As LinkButton = e.Row.Cells(1).Controls(0)
            lnkEdit.CommandArgument = currentProfile.Id.ToString()
            Dim lnkDelete As LinkButton = e.Row.Cells(2).Controls(0)
            lnkDelete.CommandArgument = currentProfile.Id.ToString()

        End If

    End Sub

    Private Sub PopulateProfileDropDownList()
        ddlProfileList.Items.Clear()
        ddlProfileList.DataSource = CurrentSsoUser.AvailableProfiles()
        ddlProfileList.DataTextField = "Title"
        ddlProfileList.DataValueField = "Id"
        ddlProfileList.AppendDataBoundItems = True
        ddlProfileList.Items.Add(New ListItem("Please select...", Guid.Empty.ToString()))
        ddlProfileList.DataBind()
    End Sub

    Private Sub PopulateRoleDropDownList()
        ddlRole.Items.Clear()
        ddlRole.AppendDataBoundItems = True
        ddlRole.Items.Add(New ListItem("Please select...", String.Empty))
        ddlRole.DataBind()
    End Sub

    Private Sub HideProfilePanel()
        pnlProfiles.Visible = False
        HideSectionPanel()
    End Sub

    Private Sub ShowSectionPanel(ByVal title As String)

        lblSectionTitle.Text = "Profile section permissions for " & title
        pnlSections.Visible = True
        pnlAddProfile.Visible = True

        PopulateRoleDropDownList()

        If CurrentSsoUserProfile Is Nothing OrElse IsAddProfile Then
            DisplayPermissionsPanel(Guid.Empty)
        Else
            DisplayPermissionsPanel(CurrentSsoUserProfile.RoleId)
            If Not CurrentSsoUserProfile.RoleId.Equals(Guid.Empty) Then
                Dim roleId As Guid = CurrentSsoUserProfile.RoleId
                ddlRole.SelectedValue = roleId.ToString()
            End If
        End If

    End Sub

    Private Sub HideSectionPanel()
        pnlSections.Visible = False
        HidePermissionsPanel()
    End Sub

    Private Sub DisplayPermissionsPanel(ByVal roleId As Guid)
        Dim userRole As ProfileUserRole = ProfileUserRoleList.GetProfileUserRole(roleId)
        If userRole IsNot Nothing AndAlso userRole.IsContributor Then
            ShowPermissionsPanel()
            BuildCheckBoxes()
        Else
            HidePermissionsPanel()
        End If
    End Sub

    Private Sub HidePermissionsPanel()
        pnlSectionPermissions.Visible = False
        pnlCheckUncheckAll.Visible = False
        valSectionPermissions.Enabled = False
        chkSubscribeEmail.Visible = False
    End Sub

    Private Sub ShowPermissionsPanel()
        pnlSectionPermissions.Visible = True
        pnlCheckUncheckAll.Visible = True
        valSectionPermissions.Enabled = True
        chkSubscribeEmail.Visible = True

        If Not CurrentSsoUserProfile Is Nothing Then
            chkSubscribeEmail.Checked = CurrentSsoUserProfile.ReviewEmail
        End If

    End Sub

    Private Sub ShowPendingChangesMessage()
        If CurrentSsoUserMaintenance.IsDirty Then
            lblErrorMessage.Text = "You have pending changes. To save these changes, click the OK button."
            pnlErrorMessage.Visible = True
            btnProfilesOK.Enabled = True
        Else
            pnlErrorMessage.Visible = False
            btnProfilesOK.Enabled = False
        End If
    End Sub

    Protected Sub ddlRole_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRole.SelectedIndexChanged

        If Page.IsValid Then

            Dim ddlist As DropDownList = DirectCast(sender, DropDownList)

            chkSubscribeEmail.Checked = False

            If ddlist.SelectedIndex > 0 Then
                Dim roleId As Guid = New Guid(ddlist.SelectedValue)
                DisplayPermissionsPanel(roleId)
            Else
                HidePermissionsPanel()
            End If

            ShowPendingChangesMessage()

        End If

    End Sub

    Protected Sub btnAddProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddProfile.Click

        If ddlProfileList.SelectedIndex > 0 Then

            CurrentProfileId = New Guid(ddlProfileList.SelectedValue)
            Dim currentProfileInfo As SsoProfileInfo = CurrentSsoUserMaintenance.SsoProfileList.GetById(CurrentProfileId)
            IsAddProfile = True
            ShowSectionPanel(currentProfileInfo.Title)

        End If

    End Sub

    Protected Sub btnSectionCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSectionCancel.Click
        pnlAddProfile.Visible = True
        IsAddProfile = False
        CurrentProfileId = Guid.Empty
        ddlProfileList.SelectedIndex = 0
        HideSectionPanel()
        ShowPendingChangesMessage()
    End Sub

    Protected Sub btnSectionOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSectionOK.Click

        If Page.IsValid Then

            If IsAddProfile Then

                Dim currentProfileInfo As SsoProfileInfo = CurrentSsoUserMaintenance.SsoProfileList.GetById(CurrentProfileId)
                CurrentSsoUser.SsoUserProfileList.AddNew(CurrentProfileId)

                If CurrentSsoUserProfile IsNot Nothing Then
                    CurrentSsoUserProfile.Title = currentProfileInfo.Title
                    grdProfileList.DataBind()
                    PopulateProfileDropDownList()
                    IsAddProfile = False
                End If

            End If

            PersistSsoUserProfile()
            HideSectionPanel()
            ShowPendingChangesMessage()
        End If

    End Sub

    Protected Sub btnProfilesCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProfilesCancel.Click
        IsAddProfile = False
        CurrentSsoUserMaintenance.CancelEdit()
        HideProfilePanel()
        ShowPendingChangesMessage()
    End Sub

    Protected Sub btnProfilesOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProfilesOK.Click

        If Page.IsValid Then
            Try
                IsAddProfile = False
                PersistSsoUserProfile()
                CurrentSsoUserMaintenance.ApplyEdit()
                CurrentSsoUserMaintenance.Save()
                lblErrorMessage.Text = "The changes to the external user were saved successfully. "
                pnlErrorMessage.Visible = True
            Catch ex As Csla.DataPortalException
                lblErrorMessage.Text = "Failed to save your changes: " & ex.BusinessException.Message
                pnlErrorMessage.Visible = True
            End Try
            CurrentSsoUserMaintenance = SsoUserMaintenance.GetSsoUserMaintenance()
            CurrentProfileId = Guid.Empty
            CurrentUserId = Guid.Empty
            HideProfilePanel()
        End If

    End Sub

    Private Sub PersistSsoUserProfile()

        If CurrentSsoUserProfile IsNot Nothing Then

            Dim role As ProfileUserRole = ProfileUserRoleList.GetProfileUserRole(New Guid(ddlRole.SelectedValue))
            CurrentSsoUserProfile.RoleId = role.Id
            CurrentSsoUserProfile.ReviewEmail = chkSubscribeEmail.Checked
            If role.IsContributor Then
                Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
                Dim permissionsTable As Table = DirectCast(pnlSectionPermissions.FindControl("permissionTable"), Table)

                For Each sectionItem As ProfileSectionMetadata In sectionList
                    Dim chkbox As CheckBox = DirectCast(permissionsTable.FindControl("chkbox_" + sectionItem.Id.ToString.Replace("-", "_")), CheckBox)
                    If chkbox.Checked Then
                        CurrentSsoUserProfile.AddSectionPermission(sectionItem.Id)
                    Else
                        CurrentSsoUserProfile.RemoveSectionPermission(sectionItem.Id)
                    End If
                Next
            End If

        End If

    End Sub

    Protected Sub SectionValidation(ByVal source As Object, ByVal args As ServerValidateEventArgs)

        If ddlRole.SelectedIndex > 0 Then

            Dim role As ProfileUserRole = ProfileUserRoleList.GetProfileUserRole(New Guid(ddlRole.SelectedValue))

            If role.IsContributor Then
                Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
                Dim permissionsTable As Table = DirectCast(pnlSectionPermissions.FindControl("permissionTable"), Table)

                For Each sectionItem As ProfileSectionMetadata In sectionList

                    Dim chkbox As CheckBox = DirectCast(permissionsTable.FindControl("chkbox_" + sectionItem.Id.ToString.Replace("-", "_")), CheckBox)
                    If chkbox.Checked Then
                        args.IsValid = True
                        Exit Sub
                    End If
                Next
                args.IsValid = False
            Else
                args.IsValid = True
            End If
        End If

    End Sub

    Protected Sub RoleDropDownValidation(ByVal source As Object, ByVal args As ServerValidateEventArgs)

        If ddlRole.SelectedIndex > 0 Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If

    End Sub

    Private Sub BuildCheckBoxes()

        Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        pnlSectionPermissions.Controls.Clear()

        Dim permissionTable As Table = New Table()
        permissionTable.ID = "permissionTable"
        permissionTable.Attributes.Add("width", "95%")

        pnlSectionPermissions.Controls.Add(permissionTable)

        Dim sectionCount As Integer = sectionList.Count
        Dim rowCount As Integer = Math.Ceiling(sectionCount / 3)     '3 columns in table

        Dim index As Integer = 0
        For currentRow As Integer = 1 To rowCount
            Dim permissionRow As New TableRow()
            permissionTable.Rows.Add(permissionRow)
            For currentCell As Integer = 1 To 3
                Dim newCell As TableCell = New TableCell()
                newCell.Attributes.Add("width", "33.3%")
                Dim chkbox As New CheckBox()
                chkbox.Text = sectionList(index).FormattedShortName
                chkbox.ID = "chkbox_" + sectionList(index).Id.ToString.Replace("-", "_")

                If Not CurrentSsoUserProfile Is Nothing Then
                    'editing
                    chkbox.Checked = CurrentSsoUserProfile.HasSectionPermission(sectionList(index).Id)
                Else
                    'adding 
                    chkbox.Checked = False
                End If

                newCell.Controls.Add(chkbox)
                permissionRow.Cells.Add(newCell)
                index = index + 1
                If index > sectionCount - 1 Then
                    Exit For
                End If
            Next
        Next

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

  
End Class
