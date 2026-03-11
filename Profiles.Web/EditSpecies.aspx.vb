Imports System.ComponentModel
Imports Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls.ProfileControls
Imports ProfilesLibrary

Partial Class EditSpecies
    Inherits System.Web.UI.Page

    Private WithEvents mProfileMaster As ProfilesTemplate
    Private mQuestionPanelList As New List(Of CollapsiblePanel)
    Private mQuestionControlList As New List(Of IProfileQuestion)
    Private mPreviousLocation As String
    Protected WithEvents ctlSectionLinksMaster As Global.Profiles.Web.ProfileSectionLinks

    Private Property CurrentSpeciesData() As SpeciesSectionList
        Get
            If Session("CurrentSpeciesData") IsNot Nothing Then
                Return DirectCast(Session("CurrentSpeciesData"), SpeciesSectionList)
            Else
                Throw New InvalidOperationException("The current species data information is unavailable. The session may have timed out.")
            End If
        End Get
        Set(ByVal value As SpeciesSectionList)
            Session("CurrentSpeciesData") = value
        End Set
    End Property

    Private Property CurrentSpeciesSectionId() As Guid
        Get
            If Session("CurrentSpeciesSectionId") IsNot Nothing Then
                Return DirectCast(Session("CurrentSpeciesSectionId"), Guid)
            Else
                Return CurrentSpeciesData(0).SectionId
            End If
        End Get
        Set(ByVal value As Guid)
            Session("CurrentSpeciesSectionId") = value
        End Set
    End Property

    Private Sub BuildQuestionUI()

        plhQuestion.Controls.Clear()
        Dim currentSection As SectionBase = CurrentSpeciesData.GetById(CurrentSpeciesSectionId)
        Dim sectionNumber As String = currentSection.SectionNumber.ToString() & "."

        Dim questionControl As IProfileQuestion

        For Each question As QuestionBase In currentSection.Questions

            Dim questionUpdatePanel As New UpdatePanel

            plhQuestion.Controls.Add(questionUpdatePanel)
            questionUpdatePanel.UpdateMode = UpdatePanelUpdateMode.Conditional
            questionUpdatePanel.ChildrenAsTriggers = True
            AddExpandCollapseTriggers(questionUpdatePanel)
            questionUpdatePanel.ID = "udp" & question.ShortName.Replace(" ", String.Empty)

            Dim questionPanel As New CollapsiblePanel
            questionUpdatePanel.ContentTemplateContainer.Controls.Add(questionPanel)
            questionPanel.ID = "pnl" & question.ShortName.Replace(" ", String.Empty)
            questionPanel.TabIndex = 1

            'set panel title and anchor
            questionPanel.Title = sectionNumber & question.QuestionNumber.ToString() & " " & question.Name

            questionPanel.AnchorName = question.ShortName.Replace(" ", String.Empty)
            questionPanel.Question = question
            questionPanel.HasHelpLink = False
            questionPanel.HasValidIcon = False
            questionPanel.HasNoteLink = False
            questionPanel.Visible = True

            mQuestionPanelList.Add(questionPanel)

            questionControl = New StandardProfileQuestion

            questionPanel.AddInnerControl(questionControl)

            mQuestionControlList.Add(questionControl)
            questionControl.Question = question

        Next

    End Sub

    Private Sub AddExpandCollapseTriggers(ByVal questionUpdatePanel As UpdatePanel)

        Dim lnkExpandAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        lnkExpandAllTrigger.ControlID = "lnkExpandAll"
        lnkExpandAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(lnkExpandAllTrigger)

        Dim lnkCollapseAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        lnkCollapseAllTrigger.ControlID = "lnkCollapseAll"
        lnkCollapseAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(lnkCollapseAllTrigger)

    End Sub

    Protected Sub lnkExpandAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExpandAll.Click
        ExpandCollapseAll(False)
    End Sub

    Protected Sub lnkCollapseAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCollapseAll.Click
        ExpandCollapseAll(True)
    End Sub

    Private Sub ExpandCollapseAll(ByVal isCollapsed As Boolean)

        Dim questionUpdatePanel As UpdatePanel
        For Each currentControl As Control In plhQuestion.Controls

            questionUpdatePanel = DirectCast(currentControl, UpdatePanel)
            Dim questionPanel As CollapsiblePanel =
                DirectCast(questionUpdatePanel.ContentTemplateContainer.Controls(0), CollapsiblePanel)

            questionPanel.IsCollapsed = isCollapsed
        Next

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        'Dim master As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Me.Master)
        Dim master = CType(Page.Master, NestedProfileQuestions)
        mProfileMaster = CType(master.Master, ProfilesTemplate)

        ctlSectionLinksMaster = master.GetCtlSectionLinks

        If Not IsPostBack Then

            If Not CommonUI.IsValidGuid(Request.QueryString("SpeciesId")) Then
                Throw New InvalidOperationException("There was an invalid or missing species id passed to the page.")
            End If

            Dim speciesId As Guid = New Guid(Request.QueryString("SpeciesId"))

            If CommonUI.IsValidGuid(Request.QueryString("SpeciesSectionId")) Then
                CurrentSpeciesSectionId = New Guid(Request.QueryString("SpeciesSectionId"))
            Else
                Session.Remove("CurrentSpeciesSectionId")
                'Only call this if the page is loaded from another page, not itself (SpeciesSectionId won't exist on querystring)

                If Not String.IsNullOrEmpty(Session("SpeciesEditPreviousPage")) AndAlso Session("SpeciesEditPreviousPage") = "MaintainSpeciesData" Then
                    CurrentSpeciesData = SpeciesSectionList.GetSpeciesSectionList(speciesId)
                Else
                    CurrentSpeciesData = SpeciesSectionList.GetReadOnlySpeciesSectionList(speciesId)
                End If
            End If
        End If

        tabStrip.Tabs(0).Text = CurrentSpeciesData.GetById(CurrentSpeciesSectionId).SectionName

        BuildQuestionUI()

    End Sub

    Protected Sub ctlSectionLinks_Click(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinks.ChangeSection
        PersistSectionInfoToSpecies()
    End Sub

    Protected Sub ctlSectionLinks_NavigateHome(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinks.NavigateHome

        ' if navigating away from species then save changes to species object only
        'save changes back to profile objects
        PersistSectionInfoToSpecies()
        e.Cancel = CurrentSpeciesData.IsDirty

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click, btnSave2.Click
        PersistSectionInfoToSpecies()
        If ValidSpecies() Then
            Try
                CurrentSpeciesData.Save()
                Response.Redirect(mPreviousLocation)
            Catch ex As Csla.DataPortalException
                lblErrorDesc.Text = "Species data save failed: " + ex.BusinessException.Message
            End Try
        End If
    End Sub

    Private Function ValidSpecies() As Boolean
        Dim invalidReasonList As New Generic.List(Of InvalidReason)
        Dim validationErrorText As String = String.Empty
        invalidReasonList = CurrentSpeciesData.Validate()
        ctlInvalidReasonList.InvalidReasons = invalidReasonList
        ctlInvalidReasonList.DisplayQuestionAsLink = False
        Return (invalidReasonList.Count = 0)
    End Function

    Private Sub PersistSectionInfoToSpecies()

        'Persist the information to the business layer
        For Each questionUpdateControl As Control In plhQuestion.Controls
            Dim questionUpdatePanel As UpdatePanel = DirectCast(questionUpdateControl, UpdatePanel)
            Dim questionPanel As CollapsiblePanel = DirectCast(questionUpdatePanel.ContentTemplateContainer.Controls(0), CollapsiblePanel)
            Dim questionControl As IProfileQuestion = DirectCast(questionPanel.PanelControls(0), IProfileQuestion)
            questionControl.Save()
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not SpeciesSectionList.CanEditSpeciesSectionList(CurrentSpeciesData) Then
            btnSave.Visible = False
            btnSave2.Visible = False
        End If

        If CurrentSpeciesData IsNot Nothing Then
            If CurrentSpeciesData.IsReadOnly Then
                mProfileMaster.UpdateTitle("View species data - " & CurrentSpeciesData.SpeciesName.ToLower())
            Else
                mProfileMaster.UpdateTitle("Edit species data - " & CurrentSpeciesData.SpeciesName.ToLower())
            End If
        End If

        BuildBreadcrumbControl()
        SectionPagination.TargetUrl = "EditSpecies.aspx?SpeciesId=" & CurrentSpeciesData.SpeciesId.ToString & "&SpeciesSectionId={0}"
        SectionPagination.SetupPaginationLinks(CurrentSpeciesData, CurrentSpeciesSectionId)
    End Sub

    Private Sub BuildBreadcrumbControl()
        Dim parentPageTitle As String

        If Not String.IsNullOrEmpty(Session("SpeciesEditPreviousPage")) AndAlso Session("SpeciesEditPreviousPage") = "MaintainSpeciesData" Then
            mPreviousLocation = "MaintainSpeciesData.aspx"
            parentPageTitle = "Maintain species data"
        Else
            mPreviousLocation = "ViewSpeciesData.aspx"
            parentPageTitle = "View species data"
        End If

        Breadcrumb.UpdateBreadcrumb(mProfileMaster, mProfileMaster.PageTitle, 4, mPreviousLocation, parentPageTitle, True)
    End Sub

    Private Sub SectionPagination_NavigatePrevious(sender As Object, e As CancelEventArgs) Handles SectionPagination.NavigatePrevious
        PersistSectionInfoToSpecies()
    End Sub

    Private Sub SectionPagination_NavigateNext(sender As Object, e As CancelEventArgs) Handles SectionPagination.NavigateNext
        PersistSectionInfoToSpecies()
    End Sub
End Class
