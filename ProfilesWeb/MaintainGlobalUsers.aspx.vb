Imports ProfilesLibrary

Partial Class MaintainGlobalUsers
    Inherits System.Web.UI.Page

    Private Property CurrentGlobalUserList() As GlobalUserList
        Get
            If Session("GlobalUserList") Is Nothing Then
                Return GlobalUserList.GetProfileEditorList()
            Else
                Return DirectCast(Session("GlobalUserList"), GlobalUserList)
            End If
        End Get
        Set(ByVal value As GlobalUserList)
            Session("GlobalUserList") = value
        End Set
    End Property

    Private Property CurrentGlobalUser() As GlobalUser
        Get
            Return DirectCast(Session("GlobalUser"), GlobalUser)
        End Get
        Set(ByVal value As GlobalUser)
            Session("GlobalUser") = value
        End Set
    End Property

    Protected Sub dsGlobalUserList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsGlobalUserList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentGlobalUserList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of GlobalUser)(CurrentGlobalUserList)
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
        ' Add a new global user
        ' cancel any pending edit that the user might have "cancelled" using the back button

        lblErrorMsg.Text = String.Empty
        lblErrorMsg.Visible = False

        CurrentGlobalUserList.CancelEdit()
        CurrentGlobalUserList.BeginEdit()
        SwitchToGlobalUserAddView()

    End Sub

    Protected Sub btnLookup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLookup.Click

        If Page.IsValid Then

            Dim command As VerifyDatabaseUserCommand = VerifyDatabaseUserCommand.Execute(txtUserName.Text)
            If command.IsUserManagement Then
                lblErrorMsg.Text = "This user cannot be made a global user"
                lblErrorMsg.Visible = True
                Return
            ElseIf Not command.IsValidUser Then
                CurrentGlobalUser = CurrentGlobalUserList.AddNew()

                lblErrorMsg.Text = "The user is not currently in the profiles system"
                lblErrorMsg.Visible = True
            ElseIf command.IsSsoUser Then
                lblErrorMsg.Text = "SSO users cannot be given global access rights"
                lblErrorMsg.Visible = True
                Return
            Else
                Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
                Dim currentUser As GlobalUser = CurrentGlobalUserList.AddNew(command.UserId)
                lblPanelTitle.Text = "Edit profile editor"
                txtUserName.Text = currentUser.UserName
                txtFullName.Text = currentUser.FullName
                txtOrganisation.Text = currentUser.Organisation
                ddlRole.Text = MapUserRoleToDropdownList(currentUser.UserRole)
                ddlRole.Enabled = (Not currentUser.Id = identity.UserId) 'cannot change your own role
                CurrentGlobalUser = currentUser

            End If


            txtUserName.Enabled = False
            btnLookup.Visible = False
            DisplayPanelControls(True)


        End If
    End Sub

    Private Function MapUserRoleToDropdownList(ByVal userRole As GlobalUserRole) As String

        If userRole = GlobalUserRole.None Then
            Return String.Empty
        End If

        Return userRole.ToString()

    End Function

    Private Function MapDropdownListToUserRole(ByVal role As String) As GlobalUserRole

        If role = "ProfileEditor" Then
            Return GlobalUserRole.ProfileEditor
        End If
        If role = "PolicyProfileUser" Then
            Return GlobalUserRole.PolicyProfileUser
        End If
        Return GlobalUserRole.None

    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub grdGlobalUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdGlobalUsers.RowCommand

        lblErrorMsg.Text = String.Empty

        If e.CommandName = "EditGlobalUser" Then

            ' Switch to edit view
            ' cancel any pending edit that the user might have "cancelled" using the back button
            CurrentGlobalUserList.CancelEdit()
            grdGlobalUsers.DataBind()
            CurrentGlobalUserList.BeginEdit()
            SwitchToGlobalUserEditView(CurrentGlobalUserList.GetById(New Guid(e.CommandArgument.ToString())))
        ElseIf e.CommandName = "DeleteGlobalUser" Then
            grdGlobalUsers.DataBind()
            CurrentGlobalUserList.CancelEdit()
            CurrentGlobalUserList.BeginEdit()
            Dim deletedGlobalUser As GlobalUser = CurrentGlobalUserList.GetById(New Guid(e.CommandArgument.ToString()))
            If deletedGlobalUser.Equals(CurrentGlobalUser) Then
                CurrentGlobalUser = Nothing
                pnlGlobalUser.Visible = False
            End If
            CurrentGlobalUserList.Remove(deletedGlobalUser)
            CurrentGlobalUserList.ApplyEdit()
            Try
                CurrentGlobalUserList.Save()
                lblErrorMsg.Text = "The user's global role was successfully revoked"
                lblErrorMsg.Visible = True
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Failed to revoke the user's global role: " & ex.BusinessException.Message
                lblErrorMsg.Visible = True
                CurrentGlobalUserList = GlobalUserList.GetProfileEditorList()
            End Try
            grdGlobalUsers.DataBind()
        End If


    End Sub

    Private Sub SwitchToGlobalUserAddView()

        lblPanelTitle.Text = "Add global user"
        btnLookup.Visible = True
        txtUserName.Enabled = True

        txtUserName.Text = String.Empty
        txtFullName.Text = String.Empty
        txtOrganisation.Text = String.Empty
        ddlRole.Text = String.Empty
        ddlRole.Enabled = True

        DisplayPanelControls(False)

        If Not pnlGlobalUser.Visible Then
            pnlGlobalUser.Visible = True
        End If

    End Sub

    Private Sub DisplayPanelControls(ByVal displayControls As Boolean)


        txtFullName.Enabled = displayControls
        txtFullName.Visible = displayControls
        txtOrganisation.Enabled = displayControls
        txtOrganisation.Visible = displayControls
        ddlRole.Visible = displayControls
        btnSave.Enabled = displayControls
        lblOrganisation.Visible = displayControls
        lblFullName.Visible = displayControls
        lblRole.Visible = displayControls

    End Sub

    Private Sub SwitchToGlobalUserEditView(ByVal currentUser As GlobalUser)

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        lblPanelTitle.Text = "Edit profile editor"
        btnLookup.Visible = False
        txtUserName.Enabled = False

        CurrentGlobalUser = currentUser
        txtUserName.Text = currentUser.UserName
        txtFullName.Text = currentUser.FullName
        txtOrganisation.Text = currentUser.Organisation
        ddlRole.Text = MapUserRoleToDropdownList(currentUser.UserRole)
        ddlRole.Enabled = (Not currentUser.Id = identity.UserId) 'cannot change your own role

        DisplayPanelControls(True)
        If Not pnlGlobalUser.Visible Then
            pnlGlobalUser.Visible = True
        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        If Page.IsValid Then

            Try
                CurrentGlobalUser.UserName = txtUserName.Text
                CurrentGlobalUser.FullName = txtFullName.Text
                CurrentGlobalUser.Organisation = txtOrganisation.Text
                CurrentGlobalUser.UserRole = MapDropdownListToUserRole(ddlRole.Text)
                CurrentGlobalUserList.ApplyEdit()
                CurrentGlobalUserList.Save()
                lblErrorMsg.Text = "Your changes were successfully saved"
                lblErrorMsg.Visible = True
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Failed to save your changes: " & ex.BusinessException.Message
                lblErrorMsg.Visible = True
            End Try
            CurrentGlobalUser = Nothing
            pnlGlobalUser.Visible = False

            ' get the dataset data from the database and save it in session
            CurrentGlobalUserList = GlobalUserList.GetProfileEditorList()
            grdGlobalUsers.DataBind()

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        CurrentGlobalUserList.CancelEdit()
        CurrentGlobalUser = Nothing
        pnlGlobalUser.Visible = False
        grdGlobalUsers.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not GlobalUserList.CanGetGlobalUserList Then
            Throw New System.Security.SecurityException("You do not have permission to view the Maintain global users page")
        End If

        If Not Page.IsPostBack Then

            valUserNameFormat.ValidationExpression = RegexPatterns.Username
            CurrentGlobalUserList = GlobalUserList.GetProfileEditorList()

        End If

    End Sub


    Protected Sub grdGlobalUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdGlobalUsers.RowDataBound

        'This code checks to see if the current row represents the profile editor who the current user is logged on as. 
        'If they are the current user, then their 'delete' link is hidden 
        '(because a profile editor deleting themselves would cause the session to retain the login, but in theory they are not longer a valid profile editor...)
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Dim currentUser As GlobalUser = DirectCast(e.Row.DataItem, GlobalUser)
            If identity.UserId = currentUser.Id Then
                e.Row.Cells(5).Controls(1).Visible = False
            End If

            Dim lnkEdit As LinkButton = e.Row.Cells(4).Controls(0)
            lnkEdit.CommandArgument = currentUser.Id.ToString()

            'This sets the CommandArgument for the Delete linkbutton. 
            'Without this CommandArgument the Delete link doesn't know what to delete
            Dim lnkDelete As LinkButton = e.Row.Cells(5).Controls(1)
            lnkDelete.CommandArgument = currentUser.Id.ToString()

        End If

    End Sub

End Class
