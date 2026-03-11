Imports ProfilesLibrary

Partial Class EditNoteUI
	Inherits System.Web.UI.UserControl

	Private mNoteTypeInfo As NoteTypeInfo
	Private mAvailableNoteList As List(Of Note) = Nothing

	Public Event errorEvent As System.EventHandler

	Public Class EditNoteEventArgs
		Inherits EventArgs

		Private mErrorMessage As String

		Public Sub New(ByVal errorMessage As String)
			MyBase.New()
			mErrorMessage = errorMessage
		End Sub

		Public ReadOnly Property ErrorMessage() As String
			Get
				Return mErrorMessage
			End Get
		End Property
	End Class

	Public Property NoteType() As NoteType
		Get
			If ViewState("NoteType") Is Nothing Then
				Return ProfilesLibrary.NoteType.ScientificPaperReference
			Else
				Return DirectCast(ViewState("NoteType"), NoteType)
			End If
		End Get
		Set(ByVal value As NoteType)
			ViewState("NoteType") = value
		End Set
	End Property

	Public WriteOnly Property AddUIVisible() As Boolean
		Set(ByVal value As Boolean)
			lblAddNote.Visible = value
			btnNewNote.Visible = value
		End Set
	End Property

	Private Property CurrentProfileSectionId() As Guid
		Get
			If Session("CurrentProfileSectionId") IsNot Nothing Then
				Return DirectCast(Session("CurrentProfileSectionId"), Guid)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			Session("CurrentProfileSectionId") = value
		End Set
	End Property

	Private Property EditProfileVersionInfo() As ProfileVersionInfo
		Get
			If Request.QueryString("ProfileVersionId") Is Nothing Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			If Session("EditProfileVersionInfo") Is Nothing Then
				Session("EditProfileVersionInfo") = ProfileVersionInfo.GetProfileVersionInfo(New Guid(Request.QueryString("ProfileVersionId")))
			End If

			Return DirectCast(Session("EditProfileVersionInfo"), ProfileVersionInfo)
		End Get
		Set(ByVal value As ProfileVersionInfo)
			Session("ProfileVersionInfo") = value
		End Set
	End Property

	Private Property CurrentNoteListBySection() As NoteList
		Get
			If Session(mNoteTypeInfo.Name & "ListBySection") Is Nothing Then
				Session(mNoteTypeInfo.Name & "ListBySection") = NoteList.GetNoteListBySection(EditProfileVersionInfo.Id, CurrentProfileSectionId, NoteType)
			End If

			Return DirectCast(Session(mNoteTypeInfo.Name & "ListBySection"), NoteList)
		End Get
		Set(ByVal value As NoteList)
			Session(mNoteTypeInfo.Name & "ListBySection") = value
		End Set
	End Property

	Private Property CurrentNoteListByVersion() As NoteList
		Get
			If Session(mNoteTypeInfo.Name & "ListByVersion") Is Nothing Then
				Session(mNoteTypeInfo.Name & "ListByVersion") = NoteList.GetNoteListByVersion(EditProfileVersionInfo.Id, NoteType)
			End If

			Return DirectCast(Session(mNoteTypeInfo.Name & "ListByVersion"), NoteList)
		End Get
		Set(ByVal value As NoteList)
			Session(mNoteTypeInfo.Name & "ListByVersion") = value
		End Set
	End Property

	Private Property AvailableNoteList() As List(Of Note)
		Get
			If mAvailableNoteList Is Nothing Then
				mAvailableNoteList = GetAvailableNoteList(CurrentNoteListBySection, CurrentNoteListByVersion)
			End If

			Return mAvailableNoteList
		End Get
		Set(ByVal value As List(Of Note))
			mAvailableNoteList = Nothing
		End Set
	End Property

	Private Function GetAvailableNoteList(ByVal noteListBySection As NoteList, ByVal noteListByVersion As NoteList) As List(Of Note)
		Dim availableNoteList As New List(Of Note)

		For Each versionNote As Note In noteListByVersion
			If noteListBySection.GetById(versionNote.Id) Is Nothing Then
				availableNoteList.Add(versionNote)
			End If
		Next

		Return availableNoteList

	End Function

	Private Property CurrentNote() As Note
		Get
			Return DirectCast(Session(mNoteTypeInfo.Name), Note)
		End Get
		Set(ByVal value As Note)
			Session(mNoteTypeInfo.Name) = value
		End Set
	End Property

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
		mNoteTypeInfo = NoteTypeInfoList.GetNoteTypeInfoByNoteType(NoteType)
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		mAvailableNoteList = Nothing

		If Not Page.IsPostBack Then
			CurrentNote = Nothing
			CurrentNoteListByVersion = Nothing
			CurrentNoteListBySection = Nothing
		End If

		LoadAddText()

		grdNotes.EmptyDataText = $"There are no {mNoteTypeInfo.PluralName.ToLower} to display."
		grdNotes.Attributes.Add("aria-label", $"This table displays {mNoteTypeInfo.PluralName.ToLower} for this disease profile, click the {mNoteTypeInfo.PluralName.ToLower} link header to sort the {mNoteTypeInfo.PluralName.ToLower} alphabetically, click the Question reference link header to sort the {mNoteTypeInfo.PluralName.ToLower} by question")
		Dim divAddEditNoteTitle As HtmlGenericControl = DirectCast(pnlNote.FindControl("divAddEditNoteTitle"), HtmlGenericControl)
		divAddEditNoteTitle.InnerText = $"Add/edit {mNoteTypeInfo.Name.ToLower}:"

		If Not Page.IsPostBack Then
			RefreshPage()
		End If

		LoadCheckBoxes()

	End Sub

	Private Sub LoadAddText()

		lblAddNote.Text = $"Add a new {mNoteTypeInfo.Name.ToLower}:"

		If Me.AvailableNoteList.Count > 0 AndAlso NoteList.CanEditNoteList(EditProfileVersionInfo.Id, CurrentProfileSectionId) Then
			lblSelectNote.Text = $"Select a {mNoteTypeInfo.Name.ToLower} from the master list:"
			btnSelectNote.Visible = True
		Else
			btnSelectNote.Visible = False
		End If

		btnSaveNote.Visible = True
	End Sub

	Protected Sub dsNoteListBySection_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsNoteListBySection.SelectObject

		If Not CurrentProfileSectionId.Equals(Guid.Empty) Then

			If String.IsNullOrEmpty(e.SortExpression) Then
				e.BusinessObject = CurrentNoteListBySection
			Else
				Dim sortedProfileVersionList As New Csla.SortedBindingList(Of Note)(CurrentNoteListBySection)
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

	Protected Sub dsAvailableNoteList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsAvailableNoteList.SelectObject

		If (Not EditProfileVersionInfo.Id.Equals(Guid.Empty)) AndAlso (String.IsNullOrEmpty(e.SortExpression)) Then
			e.BusinessObject = AvailableNoteList
		End If

	End Sub


	Protected Sub btnNewNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewNote.Click

		' Add a new note
		' cancel any pending edit that the user might have "cancelled" using the back button
		CurrentNoteListByVersion.CancelEdit()
		CurrentNoteListByVersion.BeginEdit()
		SwitchToNoteEditView(Nothing, False)
		LoadCheckBoxes()
	End Sub

	Protected Sub btnSelectNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSelectNote.Click

		' Add a new note
		' cancel any pending edit that the user might have "cancelled" using the back button
		CurrentNoteListByVersion.CancelEdit()
		CurrentNoteListByVersion.BeginEdit()
		SwitchToNoteEditView(Nothing, True)
		LoadCheckBoxes()
		ddlNotes.Focus()
	End Sub

	<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")>
	Protected Sub grdNotes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdNotes.RowCommand

		If e.CommandName = "EditNote" Then
			' Switch to edit view
			' cancel any pending edit that the user might have "cancelled" using the back button
			CurrentNoteListByVersion.CancelEdit()
			CurrentNoteListByVersion.BeginEdit()
			grdNotes.DataBind()
			SwitchToNoteEditView(CurrentNoteListByVersion.GetById(New Guid(e.CommandArgument.ToString())), False)
			LoadCheckBoxes()
		ElseIf e.CommandName = "DeleteNote" Then
			grdNotes.DataBind()
			CurrentNoteListByVersion.CancelEdit()
			CurrentNoteListByVersion.BeginEdit()
			Dim deletedNote As Note = CurrentNoteListByVersion.GetById(New Guid(e.CommandArgument.ToString()))
			deletedNote.ReferenceList.RemoveQuestionReferenceByProfileSectionId(CurrentProfileSectionId)
			CurrentNoteListByVersion.ApplyEdit()

			If deletedNote.Equals(CurrentNote) Then
				CurrentNote = Nothing
				pnlNote.Visible = False
			End If

			Try
				CurrentNoteListByVersion.Save()
				Dim currentEditNoteEventArgs As New EditNoteEventArgs(mNoteTypeInfo.Name & " deletion succeeded")
				RaiseEvent errorEvent(Me, currentEditNoteEventArgs)
			Catch ex As Csla.DataPortalException
				Dim currentEditNoteEventArgs As New EditNoteEventArgs(mNoteTypeInfo.Name & " deletion failed: " & ex.BusinessException.Message)
				RaiseEvent errorEvent(Me, currentEditNoteEventArgs)
			End Try

			CurrentNoteListByVersion = NoteList.GetNoteListByVersion(EditProfileVersionInfo.Id, NoteType)
			CurrentNoteListBySection = NoteList.GetNoteListBySection(EditProfileVersionInfo.Id, CurrentProfileSectionId, NoteType)
			AvailableNoteList = Nothing
			ReBind()
		End If

	End Sub

	Private Sub SwitchToNoteEditView(ByVal note As Note, ByVal isSelecting As Boolean)

		CurrentNote = note
		Dim divAddEditNoteTitle As HtmlGenericControl = DirectCast(pnlNote.FindControl("divAddEditNoteTitle"), HtmlGenericControl)

		If note Is Nothing Then

			If isSelecting Then
				' selecting existing from master list
				lblAddEditNoteTitle.Visible = False
				ddlNotes.Visible = True
				txtNote.Enabled = False
				txtNote.Visible = False
				txtNoteSpan.Visible = False
				rfvNote.Enabled = True
				rfvNote.ControlToValidate = "ddlNotes"
				rfvNote.ErrorMessage = "Please select a reference"
				divAddEditNoteTitle.InnerText = $"Select a {mNoteTypeInfo.Name.ToLower}:"
				updShowNoteText.Visible = True

			Else
				' creating a new reference
				lblAddEditNoteTitle.Text = $"Add a {mNoteTypeInfo.Name.ToLower}:"
				lblAddEditNoteTitle.Visible = True
				txtNote.Visible = True
				txtNote.Enabled = True
				txtNote.Text = String.Empty
				txtNoteSpan.Visible = False
				ddlNotes.Visible = False
				lblNote.Visible = False
				rfvNote.Enabled = True
				rfvNote.ControlToValidate = "txtNote"
				rfvNote.ErrorMessage = "Please enter a reference"
				CurrentNote = CurrentNoteListByVersion.AddNew()
				divAddEditNoteTitle.Visible = False
				updShowNoteText.Visible = False
				TinyMCEHelper.RegisterTinyMCE($"#{txtNote.ClientID}", TinyMCEHelper.TinyMCEEditorType.FullEditor, Me)
			End If
		Else
			' editing references on an existing note
			lblNote.Visible = False
			ddlNotes.Visible = False
			txtNote.Visible = False
			txtNote.Text = CurrentNote.NoteText
			txtNoteSpan.InnerHtml = CurrentNote.NoteText.StripPTags
			txtNoteSpan.Visible = True
			rfvNote.Enabled = False
			txtNote.Enabled = False
			divAddEditNoteTitle.InnerText = $"View a {mNoteTypeInfo.Name.ToLower}:"
			updShowNoteText.Visible = False
		End If

		pnlNote.Visible = True
	End Sub

	Protected Sub btnSaveNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveNote.Click

		Try
			If CurrentNote Is Nothing Then
				If ddlNotes.SelectedIndex > 0 Then
					Dim noteId As Guid = New Guid(ddlNotes.SelectedValue)
					CurrentNote = CurrentNoteListByVersion.GetById(noteId)
				End If
			Else
				If CurrentNote.IsNew Then
					CurrentNote.NoteText = txtNote.Text
				End If
			End If

			Dim questionList As QuestionMetadataListWrapper = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper().GetById(CurrentProfileSectionId).QuestionMetadataList()
			Dim questionReferencesTable As Table = DirectCast(pnlQuestionReferences.FindControl("tblQuestionReferences"), Table)

			If Not ValidateQuestionReferenceList(questionList, questionReferencesTable) Then
				RaiseEvent errorEvent(Me, New EditNoteEventArgs("At least one question must be selected"))
				Exit Sub
			End If

			UpdateQuestionReferenceList(questionList, questionReferencesTable)
			CurrentNoteListByVersion.ApplyEdit()
			CurrentNoteListByVersion.Save()
			Dim currentEditNoteEventArgs As New EditNoteEventArgs(mNoteTypeInfo.Name & " save succeeded")
			RaiseEvent errorEvent(Me, currentEditNoteEventArgs)

		Catch ex As Csla.DataPortalException
			Dim currentEditNoteEventArgs As New EditNoteEventArgs(mNoteTypeInfo.Name & " save failed: " & ex.BusinessException.Message)
			RaiseEvent errorEvent(Me, currentEditNoteEventArgs)
		End Try

		CurrentNote = Nothing
		pnlNote.Visible = False

		' get the dataset data from the database and save it in session
		CurrentNoteListBySection = NoteList.GetNoteListBySection(EditProfileVersionInfo.Id, CurrentProfileSectionId, NoteType)
		CurrentNoteListByVersion = NoteList.GetNoteListByVersion(EditProfileVersionInfo.Id, NoteType)
		AvailableNoteList = Nothing
		ReBind()
		RefreshPage()
	End Sub

	Public Sub ReBind()

		ddlNotes.Items.Clear()
		ddlNotes.Items.Add(New ListItem("Please select...", String.Empty))
		ddlNotes.DataBind()
		grdNotes.DataBind()
		LoadAddText()

	End Sub

	Private Function ValidateQuestionReferenceList(ByVal questionList As QuestionMetadataListWrapper, ByVal questionReferencesTable As Table) As Boolean
		Dim success As Boolean = False

		For Each question As QuestionMetadataWrapper In questionList
			Dim chkbox As CheckBox = DirectCast(questionReferencesTable.FindControl("chkbox_" & question.Id.ToString.Replace("-", "_") & "_" & NoteType.ToString), CheckBox)

			If chkbox.Checked Then
				success = True
			End If
		Next
		Return success
	End Function

	Private Sub UpdateQuestionReferenceList(ByVal questionList As QuestionMetadataListWrapper, ByVal questionReferencesTable As Table)
		For Each question As QuestionMetadataWrapper In questionList
			Dim chkbox As CheckBox = DirectCast(questionReferencesTable.FindControl("chkbox_" & question.Id.ToString.Replace("-", "_") & "_" & NoteType.ToString), CheckBox)

			If chkbox.Checked Then
				CurrentNote.ReferenceList.AddQuestionReference(CurrentProfileSectionId, question.Id)
			Else  'not checked
				CurrentNote.ReferenceList.RemoveQuestionReference(CurrentProfileSectionId, question.Id)
			End If
		Next
	End Sub

	Protected Sub btnCancelNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelNote.Click

		CurrentNoteListByVersion.CancelEdit()
		CurrentNote = Nothing
		pnlNote.Visible = False
		grdNotes.DataBind()

	End Sub

	Protected Sub grdNotes_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNotes.RowCreated

		If e.Row.RowType = DataControlRowType.Header AndAlso e.Row.Cells(0).Controls.Count > 0 AndAlso TypeOf e.Row.Cells(0).Controls(0) Is LinkButton Then
			DirectCast(e.Row.Cells(0).Controls(0), LinkButton).Text = mNoteTypeInfo.Name
		End If

	End Sub

	Protected Sub grdNotes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNotes.RowDataBound

		Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
		Dim canEditNotes As Boolean = NoteList.CanEditNoteList(profileVersionId, CurrentProfileSectionId)

		If e.Row.RowType = DataControlRowType.DataRow Then
			Dim currentNote As Note = DirectCast(e.Row.DataItem, Note)

			For Each cell As TableCell In e.Row.Cells
				For Each cellControl As Control In cell.Controls
					Dim buttonField As LinkButton = TryCast(cellControl, LinkButton)

					If buttonField Is Nothing Then Return

					If (buttonField.CommandName = "EditNote" OrElse buttonField.CommandName = "DeleteNote") Then
						buttonField.CommandArgument = currentNote.Id.ToString()
						buttonField.Visible = canEditNotes
					End If

					If buttonField.CommandName = "DeleteNote" Then
						buttonField.OnClientClick = $"apha.confirmPrompt('Are you sure you want to delete the association to this {If(mNoteTypeInfo Is Nothing, "", mNoteTypeInfo.Name.ToLower)}?', this); return false;"
					End If
				Next
			Next
		End If

	End Sub

	Private Sub LoadCheckBoxes()

		pnlQuestionReferences.Controls.Clear()

		Dim questionReferencesTable As Table = New Table()
		questionReferencesTable.ID = "tblQuestionReferences"

		pnlQuestionReferences.Controls.Add(questionReferencesTable)

		Dim profileSectionMetadataList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
		Dim currentSectionMetadata As ProfileSectionMetadata = profileSectionMetadataList.GetById(CurrentProfileSectionId)

		Dim questionInfoList As ProfileQuestionInfoList = ProfileQuestionInfoList.GetList(CurrentProfileSectionId)

		For Each question As ProfileQuestionInfo In questionInfoList

			Dim questionRow As New TableRow()
			questionReferencesTable.Rows.Add(questionRow)

			Dim newCell As TableCell = New TableCell()
			newCell.Attributes.Add("width", "95%")

			Dim div As HtmlGenericControl = New HtmlGenericControl("div")
			div.Attributes.Add("class", "govuk-checkboxes--small apha-font-size-19")

			Dim chkbox As New CheckBox()
			chkbox.Text = currentSectionMetadata.SectionNumber.ToString & "." & question.QuestionNumber.ToString & ":" & " " & question.Name
			chkbox.ID = "chkbox_" & question.Id.ToString.Replace("-", "_") & "_" & NoteType.ToString
			chkbox.CssClass = "govuk-checkboxes__item"
			chkbox.InputAttributes("class") = "govuk-checkboxes__input"
			chkbox.LabelAttributes("class") = "govuk-label govuk-checkboxes__label"

			If CurrentNote IsNot Nothing Then
				If CurrentNote.ReferenceList.GetById(CurrentProfileSectionId, question.Id) IsNot Nothing Then
					chkbox.Checked = True
				Else
					chkbox.Checked = False
				End If
			End If

			div.Controls.Add(chkbox)
			newCell.Controls.Add(div)
			questionRow.Cells.Add(newCell)
		Next

	End Sub

	Protected Sub btnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckAll.Click
		CheckUncheckAll(True)
		btnCheckAll.Focus()
	End Sub

	Protected Sub btnUncheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUncheckAll.Click
		CheckUncheckAll(False)
		btnUncheckAll.Focus()
	End Sub

	Private Sub CheckUncheckAll(ByVal check As Boolean)
		Dim questionList As QuestionMetadataListWrapper = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper().GetById(CurrentProfileSectionId).QuestionMetadataList
		Dim questionReferencesTable As Table = DirectCast(pnlQuestionReferences.FindControl("tblQuestionReferences"), Table)

		For Each question As QuestionMetadataWrapper In questionList
			Dim chkbox As CheckBox = DirectCast(questionReferencesTable.FindControl("chkbox_" & question.Id.ToString.Replace("-", "_") & "_" & NoteType.ToString), CheckBox)
			chkbox.Checked = check
		Next
	End Sub

	Protected Sub DdlNotes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNotes.SelectedIndexChanged

		If ddlNotes.SelectedIndex > 0 Then
			Dim selectedNote As Note = CurrentNoteListByVersion.GetById(New Guid(ddlNotes.SelectedValue))
			txtCurrentNoteSpan.InnerHtml = selectedNote.NoteText.StripPTags
			lblNote.Attributes.Add(HtmlTextWriterAttribute.For.ToString, ddlNotes.ClientID)
			lblNote.Visible = True
		Else
			lblNote.Visible = False
			lblNote.Attributes.Remove(HtmlTextWriterAttribute.For.ToString)
		End If

	End Sub

	Private Sub EditNoteUI_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
		TinyMCEHelper.RegisterTinyMCE($"#{txtNote.ClientID}", TinyMCEHelper.TinyMCEEditorType.FullEditor, Me)
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
