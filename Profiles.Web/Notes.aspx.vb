Imports Profiles.WebControls
Imports ProfilesLibrary

Partial Class Notes
    Inherits System.Web.UI.Page

    Private Property CurrentProfileVersionId() As Guid
        Get
            Return DirectCast(Session("CurrentProfileVersionId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("CurrentProfileVersionId") = value
        End Set
    End Property

    Private Property CurrentNoteTypeInfoList() As NoteTypeInfoList
        Get
            If Session("NoteTypeInfoList") Is Nothing Then
                Session("NoteTypeInfoList") = NoteTypeInfoList.GetNoteTypeInfoList()
            End If
            Return DirectCast(Session("NoteTypeInfoList"), NoteTypeInfoList)
        End Get
        Set(ByVal value As NoteTypeInfoList)
            Session("NoteTypeInfoList") = value
        End Set
    End Property

    Private Property CurrentNoteListByVersion() As NoteList
        Get
            If Session("NoteListByVersion") Is Nothing Then
                If SelectedNoteTypeInfo IsNot Nothing Then
                    Session("NoteListByVersion") = NoteList.GetNoteListByVersion(CurrentProfileVersionId, SelectedNoteTypeInfo.Id)
                Else
                    Return Nothing
                End If
            End If
            Return DirectCast(Session("NoteListByVersion"), NoteList)
        End Get
        Set(ByVal value As NoteList)
            Session("NoteListByVersion") = value
        End Set
    End Property

    Private Property SelectedNoteTypeInfo() As NoteTypeInfo
        Get
            If Session("SelectedNoteTypeInfo") IsNot Nothing Then
                Return DirectCast(Session("SelectedNoteTypeInfo"), NoteTypeInfo)
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal value As NoteTypeInfo)
            Session("SelectedNoteTypeInfo") = value
        End Set
    End Property

    Private Property CurrentNote() As Note
        Get
            Return DirectCast(Session("CurrentNote"), Note)
        End Get
        Set(ByVal value As Note)
            Session("CurrentNote") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim master = CType(Page.Master.Master, ProfilesTemplate)

        'set the page to expire immediately, so that if the user presses the back button a new request
        'will be sent to the server
        CommonUI.SetPageExpireImmediately(Response)

		btnNewNote.OnClientClick = $"apha.editProfileQuestions.setFrameFocus('{txtNote.ClientID}')"

		If Not Page.IsPostBack Then

            'set all the session variables to nothing
            CurrentNoteTypeInfoList = Nothing
            SelectedNoteTypeInfo = Nothing
            CurrentProfileVersionId = Nothing
            CurrentNoteListByVersion = Nothing

            If Not CommonUI.IsValidGuid(Request.QueryString("ProfileVersionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
            End If

            CurrentProfileVersionId = New Guid(Request.QueryString("ProfileVersionId"))

            Dim profileVersionInfo As ProfileVersionInfo
            profileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(CurrentProfileVersionId)
            grdNotes.DataBind()
            Dim canAddNotes As Boolean = NoteList.CanAddNote(CurrentProfileVersionId)

            If canAddNotes Then
                pnlAddNote.Visible = True
            Else
                pnlAddNote.Visible = False
            End If

            UpdateBreadCrumbs(profileVersionInfo.FullTitle)

        End If
    End Sub

    Protected Sub dsNoteTypeInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsNoteTypeInfoList.SelectObject
        e.BusinessObject = CurrentNoteTypeInfoList
    End Sub

    Protected Sub ddlNoteType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNoteType.SelectedIndexChanged

        Dim selectedNoteTypeInfoId As Guid = Guid.Empty

        If ddlNoteType.SelectedIndex > 0 Then
            selectedNoteTypeInfoId = New Guid(ddlNoteType.SelectedValue)
            SelectedNoteTypeInfo = CurrentNoteTypeInfoList.GetById(selectedNoteTypeInfoId)
            divNoteHeaderText.InnerText = SelectedNoteTypeInfo.PluralName
            lblAddNote.Text = "Add a new " & SelectedNoteTypeInfo.Name.ToLower() & ":"
            pnlNotes.Visible = True
            divNoteHeader.Visible = True
            grdNotes.EmptyDataText = "There are no " & SelectedNoteTypeInfo.PluralName.ToLower & " to display."
        Else
            SelectedNoteTypeInfo = Nothing
            pnlNotes.Visible = False
            divNoteHeader.Visible = False
        End If

        CurrentNoteListByVersion = Nothing
        grdNotes.DataBind()

		RefreshPage()
	End Sub

    Protected Sub dsNoteList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsNoteList.SelectObject

        If (SelectedNoteTypeInfo IsNot Nothing) Then

            If String.IsNullOrEmpty(e.SortExpression) Then
                e.BusinessObject = CurrentNoteListByVersion
            Else
                Dim sortedProfileVersionList As New Csla.SortedBindingList(Of Note)(CurrentNoteListByVersion)
                Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
                Dim sortProperty As String = sortExpressionParts(0).Trim
                Dim direction As SortDirection = SortDirection.Ascending
                If sortExpressionParts.Length > 1 Then
                    direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
                End If
                sortedProfileVersionList.ApplySort(sortProperty, direction)

                e.BusinessObject = sortedProfileVersionList
            End If

        End If
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")>
    Protected Sub grdNotes_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) Handles grdNotes.RowCommand

        If e.CommandName = "EditNote" Then
            CurrentNoteListByVersion.CancelEdit()
            CurrentNoteListByVersion.BeginEdit()
            grdNotes.DataBind()
            CurrentNote = CurrentNoteListByVersion.GetById(New Guid(e.CommandArgument.ToString()))
            pnlNote.Visible = True
            txtNote.Text = CurrentNote.NoteText
            labelAddEditNoteTitle.Text = $"Add/edit {SelectedNoteTypeInfo.Name.ToLower()}"
			valCusNote.Enabled = False

		ElseIf e.CommandName = "DeleteNote" Then
            grdNotes.DataBind()
            CurrentNoteListByVersion.CancelEdit()
            CurrentNoteListByVersion.BeginEdit()
            Dim deletedNote As Note = CurrentNoteListByVersion.GetById(New Guid(e.CommandArgument.ToString()))
            If deletedNote.Equals(CurrentNote) Then
                CurrentNote = Nothing
                pnlNote.Visible = False
            End If
            CurrentNoteListByVersion.Remove(deletedNote)
            CurrentNoteListByVersion.ApplyEdit()
            Try
                CurrentNoteListByVersion.Save()
                litError.Text = "<br />" & SelectedNoteTypeInfo.Name & " deletion succeeded" & "<br /><br />"
            Catch ex As Csla.DataPortalException
                litError.Text = "<br />" & SelectedNoteTypeInfo.Name & " deletion failed: " & ex.BusinessException.Message & "<br /><br />"
            End Try
            CurrentNoteListByVersion = NoteList.GetNoteListByVersion(CurrentProfileVersionId, SelectedNoteTypeInfo.Id)
            grdNotes.DataBind()
        End If

    End Sub

    Protected Sub btnNewNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewNote.Click

        ' Add a new note
        ' cancel any pending edit that the user might have "cancelled" using the back button
        CurrentNoteListByVersion.CancelEdit()
        CurrentNoteListByVersion.BeginEdit()
        CurrentNote = CurrentNoteListByVersion.AddNew()
        txtNote.Text = String.Empty
        pnlNote.Visible = True
        labelAddEditNoteTitle.Text = $"Add/edit {SelectedNoteTypeInfo.Name.ToLower()}"
		valCusNote.Enabled = True
	End Sub

    Protected Sub btnCancelNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelNote.Click

        CurrentNoteListByVersion.CancelEdit()
        pnlNote.Visible = False
        grdNotes.DataBind()

    End Sub

    Protected Sub btnSaveNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveNote.Click

        If Page.IsValid Then

            Try
                CurrentNote.NoteText = txtNote.Text
                CurrentNoteListByVersion.ApplyEdit()
                CurrentNoteListByVersion.Save()
                litError.Text = "<br />" & SelectedNoteTypeInfo.Name & " save succeeded" & "<br /><br />"
            Catch ex As Csla.DataPortalException
                litError.Text = "<br />" & SelectedNoteTypeInfo.Name & " save failed: " & ex.BusinessException.Message & "<br /><br />"
            End Try
            pnlNote.Visible = False
            CurrentNote = Nothing

            ' get the dataset data from the database and save it in session
            CurrentNoteListByVersion = NoteList.GetNoteListByVersion(CurrentProfileVersionId, SelectedNoteTypeInfo.Id)
            grdNotes.DataBind()

        End If

    End Sub

    Protected Sub grdNotes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNotes.RowDataBound

        Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim currentNote As Note = DirectCast(e.Row.DataItem, Note)

            For Each cell As TableCell In e.Row.Cells
                For Each cellControl As Control In cell.Controls
                    Dim buttonField As LinkButton = TryCast(cellControl, LinkButton)

					If buttonField Is Nothing Then Return

					If (buttonField.CommandName = "EditNote" OrElse buttonField.CommandName = "DeleteNote") Then
						buttonField.CommandArgument = currentNote.Id.ToString()
						buttonField.Visible = currentNote.CanEditNoteText()
					End If

					If buttonField.CommandName = "DeleteNote" Then
						buttonField.OnClientClick = "apha.confirmPrompt('Are you sure you want to delete this " & SelectedNoteTypeInfo.Name.ToLower & "?', this); return false;"
					End If

					If buttonField.CommandName = "EditNote" Then
						buttonField.OnClientClick = $"apha.editProfileQuestions.setFrameFocus('{txtNote.ClientID}')"
					End If
				Next
            Next
        End If

    End Sub

    Protected Sub valCusNote_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles valCusNote.ServerValidate
        'this validation is for new references only

        Dim newNoteText As String = txtNote.Text

        For Each nt As Note In CurrentNoteListByVersion

            If nt.NoteText = newNoteText Then
                args.IsValid = False
                Return
            End If

        Next

        args.IsValid = True
    End Sub

    Private Sub EditNotes_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        RegisterTinyMce($"#{txtNote.ClientID}", TinyMCEHelper.TinyMCEEditorType.ItalicLinkEditor)
    End Sub

    Protected Sub UpdateBreadCrumbs(profileTitle As String)
        Dim profileVerId As String = Request.QueryString("ProfileVersionId")

        If String.IsNullOrEmpty(profileVerId) Then
            Return
        End If

        Dim master = CType(Page.Master.Master, ProfilesTemplate)
        Dim ParentNavigateUrl As String = "~/EditProfileQuestions.aspx?ProfileVersionId=" & profileVerId

        Breadcrumb.UpdateBreadcrumb(master, "Profile References", 4, ParentNavigateUrl, profileTitle, False)

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub

	Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdNotes.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

    Private Sub RefreshPage()
        grdNotes.DataBind()
        bottomPaginator.TotalPages = grdNotes.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub

End Class
