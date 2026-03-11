Imports ProfilesLibrary
Imports Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls.ProfileControls
Imports System.ComponentModel

Partial Class EditProfileQuestions
	Inherits System.Web.UI.Page

	Private mProfileVersionInfo As ProfileVersionInfo
	Private mQuestionPanelList As New Generic.List(Of CollapsiblePanel)
	Private mQuestionControlList As New Generic.List(Of IProfileQuestion)
	Private mCurrentNoteListByVersion As NoteList = Nothing
	Protected WithEvents ctlSectionLinksMaster As Global.Profiles.Web.ProfileSectionLinks

	Private Property CurrentProfileSectionId() As Guid
		Get
			If Not Session("CurrentProfileSectionId") Is Nothing Then
				Return DirectCast(Session("CurrentProfileSectionId"), Guid)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			Session("CurrentProfileSectionId") = value
		End Set
	End Property

	Private Property HiddenProfileVersionId() As Guid
		Get
			If Not hidProfileVersionId.Value = String.Empty Then
				Return New Guid(hidProfileVersionId.Value)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			hidProfileVersionId.Value = value.ToString()
		End Set
	End Property

	Private Property HiddenProfileSectionId() As Guid
		Get
			If Not hidProfileSectionId.Value = String.Empty Then
				Return New Guid(hidProfileSectionId.Value)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			hidProfileSectionId.Value = value.ToString()
		End Set
	End Property

	Private Property CurrentNoteListByVersion() As NoteList
		Get
			If CurrentNoteTypeId.Equals(Guid.Empty) Then
				Return Nothing
			End If
			If mCurrentNoteListByVersion Is Nothing Then
				mCurrentNoteListByVersion = NoteList.GetNoteListByVersion(mProfileVersionInfo.Id, CurrentNoteTypeId)

			End If
			Return DirectCast(mCurrentNoteListByVersion, NoteList)
		End Get
		Set(ByVal value As NoteList)
			mCurrentNoteListByVersion = value
		End Set
	End Property

	Private Property CurrentNoteTypeId() As Guid
		Get
			If Not Session("CurrentNoteTypeId") Is Nothing Then
				Return DirectCast(Session("CurrentNoteTypeId"), Guid)
			Else
				Return Guid.Empty
			End If
		End Get
		Set(ByVal value As Guid)
			Session("CurrentNoteTypeId") = value
		End Set
	End Property

#Region "Questions tab"

	Private Property CurrentProfileVersionSection() As ProfileVersionSection
		Get
			If Session("CurrentProfileVersionSection") IsNot Nothing Then
				Return DirectCast(Session("CurrentProfileVersionSection"), ProfileVersionSection)
			Else
				Throw New InvalidOperationException("The current profile version section information is unavailable. The session may have timed out.")
			End If
		End Get
		Set(ByVal value As ProfileVersionSection)
			Session("CurrentProfileVersionSection") = value
		End Set
	End Property

	Private Sub BuildQuestionUI()

		plhQuestion.Controls.Clear()
		Dim sectionNumber As String = CurrentProfileVersionSection.SectionNumber.ToString() & "."

		Dim questionControl As IProfileQuestion
		Dim clearTrigger As New AsyncPostBackTrigger()
		clearTrigger.ControlID = btnClearSection.ID

		For Each question As QuestionBase In CurrentProfileVersionSection.Questions
			Dim questionUpdatePanel As New Panel
			plhQuestion.Controls.Add(questionUpdatePanel)

			questionUpdatePanel.ID = "udp" & question.ShortName.Replace(" ", String.Empty)

			Dim questionPanel As New CollapsiblePanel
			questionUpdatePanel.Controls.Add(questionPanel)
			questionUpdatePanel.Attributes.Add("class", "QuestionUpdatePanel govuk-accordion__controls")
			'AddExpandCollapseTriggers(questionUpdatePanel)
			questionPanel.ID = "pnl" & question.ShortName.Replace(" ", String.Empty)

			'set panel title and anchor
			questionPanel.Title = sectionNumber & question.QuestionNumber.ToString() & " " & question.Name
			questionPanel.AnchorName = question.ShortName.Replace(" ", String.Empty)
			questionPanel.HasNoteLink = NoteList.CanEditNoteList(mProfileVersionInfo.Id, CurrentProfileSectionId)
			questionPanel.Question = question
			questionPanel.HasHelpLink = True
			questionPanel.Visible = True
			'if we are loading the page for the first time, set the valid icons for each question
			If Not Page.IsPostBack Then
				questionPanel.IsValid = (question.Validate().Count = 0)
				HideAndClearIrrelevantQuestion(questionUpdatePanel.ClientID, question, questionPanel)
			End If

			AddHandler questionPanel.ShowNote, AddressOf questionPanel_ShowNote
			mQuestionPanelList.Add(questionPanel)

			If TypeOf question Is PerSpeciesQuestion Then
				questionControl = New PerSpeciesProfileQuestion
			ElseIf TypeOf question Is RepeatingQuestion Then
				questionControl = New RepeatingProfileQuestion
			Else
				questionControl = New StandardProfileQuestion
			End If

			questionPanel.AddInnerControl(questionControl)
			questionPanel.AddNotePopupTrigger(updAddNote)

			mQuestionControlList.Add(questionControl)
			questionControl.Question = question
		Next

	End Sub

	Private Sub questionPanel_ShowNote(ByVal sender As Object, ByVal e As NoteEventArgs)

		ddlNoteAction.SelectedIndex = 0
		popupQuestionReferencePicker.ClearSelectedOptions()
		ddlNoteType.SelectedIndex = 0
		ddlNotes.Items.Clear()
		ddlNotes.Items.Add(New ListItem("Please select...", String.Empty))
		ddlNotes.SelectedIndex = 0
		popupQuestionReferencePicker.ExcludeItemId = e.ExcludedId

		PopupHideControls()

		lblTitle.Text = "Add/Select a reference to question " + CurrentProfileVersionSection.SectionNumber.ToString + "." + CurrentProfileVersionSection.Questions.GetById(e.ExcludedId).QuestionNumber.ToString

		'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AddReferencePopupChangeFocus", "setTimeout(function () { document.getElementById('" + ddlNoteAction.ClientID + "').focus() }, 100);", True)
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "ShowReferencePopupAndFocus", "setTimeout(showReferencePopup('" + ddlNoteAction.ClientID + "', this), 100);", True)

	End Sub

	Private Sub RefreshQuestionControlValues()

		Dim currentQuestionControl As Integer

		For Each question As QuestionBase In CurrentProfileVersionSection.Questions
			mQuestionPanelList(currentQuestionControl).Question = question
			mQuestionControlList(currentQuestionControl).Question = question
			mQuestionControlList(currentQuestionControl).CloseSubPanel()
			currentQuestionControl += 1
		Next

		SetQuestionValidIcons()

	End Sub

	Private Sub HideAndClearIrrelevantQuestion(ByVal questionUpdatePanelId As String, ByVal question As QuestionBase, ByVal questionPanel As CollapsiblePanel)
		'Hide irrelevant but valid questions
		Dim str As String = "document.getElementById('" + questionUpdatePanelId + "').style.display = "

		Dim perSpeciesRelevant As Boolean = False
		If TypeOf question Is PerSpeciesQuestion Then
			Dim speciesList As QuestionSpeciesList = DirectCast(question, PerSpeciesQuestion).SpeciesList
			For Each species As QuestionSpecies In speciesList
				If species.IsRelevant Then
					perSpeciesRelevant = True
				Else
					species.Clear()
				End If
			Next
		End If

		If Not question.IsRelevant OrElse (TypeOf question Is PerSpeciesQuestion And Not perSpeciesRelevant) Then
			str += "'none';"
			If Page.IsPostBack Then
				CurrentProfileVersionSection.Questions.GetById(question.Id).Clear()
				mQuestionPanelList.FirstOrDefault(Function(q) q.Question.QuestionNumber = question.QuestionNumber).Question = question
				mQuestionControlList.FirstOrDefault(Function(q) q.Question.QuestionNumber = question.QuestionNumber).Question = question
				mQuestionControlList.FirstOrDefault(Function(q) q.Question.QuestionNumber = question.QuestionNumber).CloseSubPanel()
				SetQuestionValidIcons()
			End If
		Else
			str += "'';"
		End If

		ScriptManager.RegisterStartupScript(Me, Me.GetType(), "q" + question.QuestionNumber.ToString(), str, True)
	End Sub

	Private Sub PersistSectionInfoToProfileVersion(ByVal HideQuestions As Boolean)

		'Persist the information on the question tab
		For Each questionUpdateControl As Control In plhQuestion.Controls
			Dim questionUpdatePanel As Panel = DirectCast(questionUpdateControl, Panel)
			Dim questionPanel As CollapsiblePanel = DirectCast(questionUpdatePanel.Controls(0), CollapsiblePanel)
			Dim questionControl As IProfileQuestion = DirectCast(questionPanel.PanelControls(0), IProfileQuestion)
			'Hide panel if irrelevant and valid
			If HideQuestions Then
				HideAndClearIrrelevantQuestion(questionUpdatePanel.ClientID, questionControl.Question, questionPanel)
			End If
			questionControl.Save()
		Next

	End Sub

	Private Function PersistSectionInfoToDatabase() As Boolean

		If ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId) Then

			PersistSectionInfoToProfileVersion(True)

			Try
				CurrentProfileVersionSection.Save()
				SetQuestionValidIcons()
				lblErrorDesc.Text = "Profile section save succeeded"
			Catch ex As Csla.DataPortalException
				lblErrorDesc.Text = "Profile section save failed: " + ex.BusinessException.Message
				CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
				RefreshQuestionControlValues()
				Return False
			End Try

		End If

		Return True

	End Function

#End Region

	Protected Sub ctlSectionLinks_Save(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinksMaster.Save
		If Not PersistSectionInfoToDatabase() Then
			e.Cancel = True
		End If
	End Sub

	Protected Sub mSavePrompt_NavigateAway(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs)
		' if navigating away from profile then save changes to profile object only
		'save changes back to profile objects
		PersistSectionInfoToProfileVersion(False)
		e.Cancel = CurrentProfileVersionSection.IsDirty
	End Sub

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
		Dim master = CType(Page.Master, NestedProfileQuestions)
		ctlSectionLinksMaster = master.GetCtlSectionLinks

		AddHandler savePrompt.AttemptNavigateAwayEvent, AddressOf mSavePrompt_NavigateAway

		'set the page to expire immediately, so that if the user presses the back button a new request
		'will be sent to the server
		SetPageExpireImmediately(Response)

		If Not Page.IsPostBack Then

			If Not CommonUI.IsValidGuid(Request.QueryString("ProfileVersionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
			mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
			Session("EditProfileVersionInfo") = mProfileVersionInfo
			HiddenProfileVersionId = profileVersionId 'store the profile version id in a hidden field to help track back button
			'master.ProfileTitle = mProfileVersionInfo.ToString()

			Dim profileSectionId As Guid = Guid.Empty
			If Request.QueryString("ProfileSectionId") Is Nothing Then
				profileSectionId = ProfileSectionMetadataList.GetProfileSectionMetadataList()(0).Id
			Else
				If Not CommonUI.IsValidGuid(Request.QueryString("ProfileSectionId")) Then
					Throw New InvalidOperationException("There was an invalid or missing profile section id passed to the page.")
				End If
				profileSectionId = New Guid(Request.QueryString("ProfileSectionId"))
			End If

			CurrentProfileSectionId = profileSectionId
			HiddenProfileSectionId = profileSectionId 'store the profile section id in a hidden field to help track back button

			CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)

			InitalizeSectionPanel()

			DisplayTopRightButtons()

		Else

			mProfileVersionInfo = Session("EditProfileVersionInfo")
		End If

		If Not CurrentProfileSectionId.Equals(Guid.Empty) Then
			tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
			tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)
			tabStrip.Tabs.Item(4).Visible = ProfileVersionSection.CanGetRevisionInformation(mProfileVersionInfo)
			tabStrip.Tabs.Item(5).Visible = ProfileContributionInfoList.CanGetProfileContributionInfoList(mProfileVersionInfo.Id)
			BuildQuestionUI()
		End If

		master.UpdateTitle(mProfileVersionInfo.FullTitlePlainText)
		master.SubTitle = mProfileVersionInfo.VersionToString()

		For Each question As QuestionBase In CurrentProfileVersionSection.Questions
			popupQuestionReferencePicker.AddOptionItem(question.Id, CurrentProfileVersionSection.SectionNumber.ToString + "." + question.QuestionNumber.ToString() + ": " + question.Name, CurrentProfileVersionSection.SectionNumber.ToString + "." + question.QuestionNumber.ToString)
		Next

		popupQuestionReferencePicker.DialoguePicker = True

		Dim profilesTemplateMaster = CType(Page.Master.Master, ProfilesTemplate)
		Breadcrumb.UpdateBreadcrumb(profilesTemplateMaster, mProfileVersionInfo.FullTitle, 4)

	End Sub

	Protected Overrides Sub OnError(ByVal e As System.EventArgs)

		Dim handledError As Exception = Server.GetLastError().GetBaseException()

		'if a Failed to load viewstate error occurs, we assume it is because the user has clicked the back button
		'and posted back data. The Page_Init will have already run and created the dynamic form controls, but
		'it will have done it based on the session data, which could be out of synch with the page and therefore
		'cause this error. In this case, avoid the problem by redirecting to a non-postback version of the page
		If TypeOf handledError Is HttpException AndAlso handledError.Message.StartsWith("Failed to load viewstate") Then
			Server.ClearError()
			Server.Transfer(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}",
			Request.QueryString("ProfileVersionId"), Request.QueryString("ProfileSectionId")), False)
		End If

		MyBase.OnError(e)

	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		Dim master = CType(Page.Master, NestedProfileQuestions)
		Dim mainmaster = CType(Me.Master.Master, ProfilesTemplate)
		ctlSectionLinksMaster = master.GetCtlSectionLinks

		'if we are not in an asynchronous (AJAX) postback, then test if the profile version and section id values
		'in session match the values in the hidden form fields. If they don't, then the user has clicked the back
		'button and mistakenly sent postback data for a second time to the server. In this case, avoid the
		'problem of reacting to stale data by redirecting to a non-postback version of the page
		If Not mainmaster.ScriptManager.IsInAsyncPostBack AndAlso
		(CurrentProfileSectionId <> HiddenProfileSectionId OrElse
		mProfileVersionInfo.Id <> HiddenProfileVersionId) Then

			Server.Transfer(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}",
			HiddenProfileVersionId.ToString(), HiddenProfileSectionId.ToString()), False)

		End If

		lblErrorDesc.Text = String.Empty
		updError.Update()

		If Page.IsPostBack Then
			PersistSectionInfoToProfileVersion(True)

			HandleCustomPostBackFromTabManager()
		End If

		SectionPagination.TargetUrl = "EditProfileQuestions.aspx?ProfileVersionId=" & mProfileVersionInfo.Id.ToString & "&ProfileSectionId={0}"
		SectionPagination.SetupPaginationLinks(ProfileVersionSectionList.GetProfileVersionSectionList(mProfileVersionInfo.Id), CurrentProfileSectionId)
	End Sub

	Private Sub HandleCustomPostBackFromTabManager()
		If Not String.IsNullOrEmpty(Request.Form("__EVENTTARGET")) Then
			Dim eventSource As String = Request.Form("__EVENTTARGET")
			If eventSource = "tabStrip" Then
				Dim t As TabItem = New TabItem
				Dim o As String = Request.Form("__EVENTARGUMENT")
				t.Text = o
				Dim ev As TabClickEventArgs = New TabClickEventArgs(t)
				tabStrip_TabClick(Me, ev)
			ElseIf eventSource = "DataReplicationFieldOnBlur" Then
				CurrentProfileVersionSection.ReplicateData()
				RefreshQuestionControlValues()
			End If
		End If
	End Sub

	Private Sub SetQuestionValidIcons()

		For Each questionPanel As CollapsiblePanel In mQuestionPanelList
			questionPanel.IsValid = (questionPanel.Question.Validate().Count = 0)
		Next

	End Sub

	Private Sub DisplayTopRightButtons()

		Dim canEditProfileVersionSection As Boolean = ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)

		btnValidateSection.Visible = canEditProfileVersionSection
		btnSave.Visible = canEditProfileVersionSection
		btnClearSection.Visible = ProfileVersionSection.CanClearProfileVersionSection(mProfileVersionInfo.Id)
		btnPrintSection.Visible = mProfileVersionInfo.CanGetPrintVersion()
		btnPrintSection.Attributes.Add("onclick", String.Format("window.open('ShowProfilePrintVersion.aspx?ProfileVersionId={0}&ProfileSectionId={1}');return false;", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))

		btnValidateSection2.Visible = canEditProfileVersionSection
		btnSave2.Visible = canEditProfileVersionSection

	End Sub

	Private Sub InitalizeSectionPanel()

		plhQuestion.Visible = True

	End Sub

	Protected Sub tabStrip_TabClick(ByVal sender As Object, ByVal e As TabClickEventArgs) Handles tabStrip.TabClick

		Page.Validate()

		If Page.IsValid Then
			If PersistSectionInfoToDatabase() Then

				Select Case e.Tab.Text
					Case "References"
						Response.Redirect(String.Format("~/EditProfileReferences.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
					Case "Further information"
						Response.Redirect(String.Format("~/EditProfileFurtherInformation.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
					Case "Review comments"
						Response.Redirect(String.Format("~/EditProfileReviewComments.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
					Case "All Revision dates"
						Response.Redirect(String.Format("~/EditProfileAllRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
					Case "Contributions"
						Response.Redirect(String.Format("~/EditProfileContributions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
					Case Else
						Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
				End Select
			End If
		End If

	End Sub

	Protected Sub btnClearSection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearSection.Click

		CurrentProfileVersionSection.Clear()
		Try
			CurrentProfileVersionSection.Save()
			lblErrorDesc.Text = "Clear section succeeded"
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Clear section failed: " & ex.BusinessException.Message
			CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
			RefreshQuestionControlValues()
			Return
		End Try

		RefreshQuestionControlValues()

		Dim scientificReferences As NoteList = NoteList.GetNoteListBySection(mProfileVersionInfo.Id, CurrentProfileSectionId, NoteType.ScientificPaperReference)
		scientificReferences.RemoveQuestionReferenceByProfileSectionId(CurrentProfileSectionId)
		Try
			scientificReferences.Save()
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Clear section failed while trying to clear the scientific paper references: " & ex.BusinessException.Message
			Return
		End Try

		Dim legislativeReferences As NoteList = NoteList.GetNoteListBySection(mProfileVersionInfo.Id, CurrentProfileSectionId, NoteType.LegislativeReference)
		legislativeReferences.RemoveQuestionReferenceByProfileSectionId(CurrentProfileSectionId)
		Try
			legislativeReferences.Save()
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Clear section failed while trying to clear the legislative references: " & ex.BusinessException.Message
			Return
		End Try

		Dim furtherInfoList As NoteList = NoteList.GetNoteListBySection(mProfileVersionInfo.Id, CurrentProfileSectionId, NoteType.SourceOfFurtherInformation)
		furtherInfoList.RemoveQuestionReferenceByProfileSectionId(CurrentProfileSectionId)
		Try
			furtherInfoList.Save()
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Clear section failed while trying to clear the sources of further information: " & ex.BusinessException.Message
			Return
		End Try

		Try
			DeleteAllReviewCommentsCommand.DeleteAllReviewComments(mProfileVersionInfo.Id, CurrentProfileSectionId)
		Catch ex As Csla.DataPortalException
			lblErrorDesc.Text = "Clear section failed while trying to clear the review comments: " & ex.BusinessException.Message
			Return
		End Try

	End Sub

	Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click, btnSave2.Click
		PersistSectionInfoToDatabase()
		ctlInvalidReasonList.InvalidReasons = Nothing
	End Sub

	Protected Sub btnValidateSection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnValidateSection.Click, btnValidateSection2.Click
		Dim invalidReasonList As New Generic.List(Of InvalidReason)
		Dim validationErrorText As String = String.Empty

		'save changes before performing validation
		PersistSectionInfoToDatabase()

		invalidReasonList = CurrentProfileVersionSection.Validate()
		ctlInvalidReasonList.InvalidReasons = invalidReasonList
		ctlInvalidReasonList.DisplayQuestionAsLink = True
	End Sub

	Protected Sub lnkExpandAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExpandAll.Click
		ExpandCollapseAll(False)
		expandAllChevron.Attributes.Add("class", "govuk-accordion-nav__chevron govuk-accordion-nav__chevron")
		expandAllTitle.InnerText = "Hide all sections"
	End Sub

	Protected Sub lnkCollapseAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCollapseAll.Click
		ExpandCollapseAll(True)
		expandAllChevron.Attributes.Add("class", "govuk-accordion-nav__chevron govuk-accordion-nav__chevron--down")
		expandAllTitle.InnerText = "Show all sections"
	End Sub

	Private Sub ExpandCollapseAll(ByVal isCollapsed As Boolean)

		Dim questionUpdatePanel As Panel
		For Each currentControl As Control In plhQuestion.Controls

			questionUpdatePanel = DirectCast(currentControl, Panel)
			Dim questionPanel As CollapsiblePanel =
				DirectCast(questionUpdatePanel.Controls(0), CollapsiblePanel)

			questionPanel.IsCollapsed = isCollapsed
		Next

	End Sub


	Protected Sub dsNoteTypeInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsNoteTypeInfoList.SelectObject
		e.BusinessObject = NoteTypeInfoList.GetNoteTypeInfoList()
	End Sub

	Protected Sub dsAvailableNoteList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsAvailableNoteList.SelectObject

		If ddlNoteType.SelectedIndex > 0 Then
			e.BusinessObject = CurrentNoteListByVersion
		Else
			e.BusinessObject = Nothing
		End If

	End Sub

	Protected Sub ddlNoteType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNoteType.SelectedIndexChanged

		popupQuestionReferencePicker.ClearSelectedOptions()
		ddlNotes.Items.Clear()
		ddlNotes.Items.Add(New ListItem("Please select...", String.Empty))

		txtNote.Visible = False

		If ddlNoteType.SelectedIndex > 0 Then
			CurrentNoteTypeId = New Guid(ddlNoteType.SelectedValue)
			CurrentNoteListByVersion = Nothing
			txtNote.Visible = Not ddlNoteAction.SelectedValue = "2"
			ddlNotes.DataBind()
		End If
		lblCurrentNote.Text = String.Empty

	End Sub

	Private Sub PopupHideControls()
		ddlNotes.Visible = False
		rfvNote.Enabled = False
		lblNote.Visible = False
		lblNoteType.Visible = False
		ddlNoteType.Visible = False
		rfvNoteType.Enabled = False
		txtNote.Visible = False
		txtNote.Text = String.Empty
		rfvNoteAction.Enabled = True
		rfvNoteText.Enabled = False
		rfvNoteAction.Enabled = True
		lblCurrentNote.Visible = False
		lblCurrentNote.Text = String.Empty
	End Sub

	Protected Sub ddlNoteAction_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNoteAction.SelectedIndexChanged

		If ddlNoteAction.SelectedValue = String.Empty Then  'Please select
			PopupHideControls()
		ElseIf ddlNoteAction.SelectedValue = "1" Then   'Add a reference
			ddlNotes.Visible = False
			rfvNote.Enabled = False
			lblNote.Visible = False
			lblNoteType.Visible = True
			ddlNoteType.Visible = True
			rfvNoteType.Enabled = True
			rfvNoteText.Enabled = True
			lblCurrentNote.Visible = False
			lblCurrentNote.Text = String.Empty
			txtNote.Visible = ddlNoteType.SelectedValue <> ""
		ElseIf ddlNoteAction.SelectedValue = "2" Then   'Select a reference
			ddlNotes.Visible = True
			rfvNote.Enabled = True
			lblNote.Visible = True
			lblNoteType.Visible = True
			ddlNoteType.Visible = True
			rfvNoteType.Enabled = True
			rfvNoteText.Enabled = False
			lblCurrentNote.Visible = True
			lblCurrentNote.Text = String.Empty
			txtNote.Visible = False
		End If
	End Sub

	Protected Sub ddlNotes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNotes.SelectedIndexChanged

		popupQuestionReferencePicker.ClearSelectedOptions()

		If ddlNotes.SelectedIndex > 0 AndAlso Not CurrentNoteTypeId.Equals(Guid.Empty) Then
			Dim currentNote As Note = CurrentNoteListByVersion.GetById(New Guid(ddlNotes.SelectedValue))
			For Each ref As QuestionReference In currentNote.ReferenceList
				If ref.ProfileSectionId = CurrentProfileSectionId Then
					popupQuestionReferencePicker.AddSelectedItem(ref.ProfileQuestionId)
				End If
			Next
			popupQuestionReferencePicker.UpdateSelectedOptions()
			lblCurrentNote.Text = currentNote.NoteText
		End If

	End Sub

	Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
		rfvNoteType.Enabled = False
		rfvNote.Enabled = False
		rfvNoteAction.Enabled = False
		rfvNoteText.Enabled = False
		RegisterClosePopupScript()
	End Sub

	Protected Sub btnSaveNote_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveNote.Click

		If ddlNoteAction.SelectedIndex > 0 AndAlso ddlNoteType.SelectedIndex > 0 Then

			Try

				Dim currentNote As Note

				If ddlNoteAction.SelectedValue = "1" Then   'adding a new reference
					currentNote = CurrentNoteListByVersion.AddNew()
					currentNote.NoteText = txtNote.Text
				ElseIf ddlNoteAction.SelectedValue = "2" Then ' selecting an existing reference
					currentNote = CurrentNoteListByVersion.GetById(New Guid(ddlNotes.SelectedValue))
				Else
					Throw New Exception("There are no other note action values")
				End If

				For Each questionId As Guid In popupQuestionReferencePicker.SelectedOptions
					currentNote.ReferenceList.AddQuestionReference(CurrentProfileSectionId, questionId)
				Next

				For Each questionId As Guid In popupQuestionReferencePicker.NotSelectedOptions
					currentNote.ReferenceList.RemoveQuestionReference(CurrentProfileSectionId, questionId)
				Next

				currentNote.ReferenceList.AddQuestionReference(CurrentProfileSectionId, popupQuestionReferencePicker.ExcludeItemId)

				CurrentNoteListByVersion.Save()
				lblErrorDesc.Text = "Reference was saved successfully"
				updError.Update()
				RegisterClosePopupScript()

			Catch ex As Csla.DataPortalException
				lblPopupError.Text = "Saving reference was unsuccessful: " + ex.BusinessException.Message

			End Try
		End If

	End Sub

	Protected Sub btnHiddenRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHiddenRefresh.Click

		'Changed from PersistSectionInfoToProfileVersion(True) 
		'to stop delay in showing/hiding irrelevant questions in other sections
		'Contains PersistSectionInfoToProfileVersion(True)
		PersistSectionInfoToDatabase()

		'To stop the message displaying as it does not when sections are changed
		lblErrorDesc.Text = ""

	End Sub

	Private Sub EditProfileQuestions_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
		RegisterTinyMce($"#{txtNote.ClientID}", TinyMCEHelper.TinyMCEEditorType.FullEditor)
	End Sub

	Private Sub SectionPagination_NavigatePrevious(sender As Object, e As CancelEventArgs) Handles SectionPagination.NavigatePrevious

		If Not PersistSectionInfoToDatabase() Then
			e.Cancel = True
		End If

	End Sub

	Private Sub SectionPagination_NavigateNext(sender As Object, e As CancelEventArgs) Handles SectionPagination.NavigateNext

		If Not PersistSectionInfoToDatabase() Then
			e.Cancel = True
		End If

	End Sub

	Private Sub RegisterClosePopupScript()
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "HideReferencePopupAndFocus", "setTimeout(function() { hideReferencePopup(); }, 100);", True)
	End Sub

End Class
