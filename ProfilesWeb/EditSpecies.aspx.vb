Imports System.Collections.Generic
Imports Profiles.WebControls
Imports ProfilesLibrary

Partial Class EditSpecies
    Inherits System.Web.UI.Page

    Private mQuestionPanelList As New List(Of ProfilesWeb.Controls.CollapsiblePanel)
    Private mQuestionControlList As New List(Of IProfileQuestion)
    Private mPreviousLocation As String

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

            Dim questionPanel As New ProfilesWeb.Controls.CollapsiblePanel
            questionUpdatePanel.ContentTemplateContainer.Controls.Add(questionPanel)
            questionPanel.ID = "pnl" & question.ShortName.Replace(" ", String.Empty)

            'set panel title and anchor
            questionPanel.Title = sectionNumber & question.QuestionNumber.ToString() & " " & question.Name
            questionPanel.AnchorName = question.ShortName.Replace(" ", String.Empty)
            questionPanel.Question = question
            questionPanel.HasHelpLink = False
            questionPanel.HasValidIcon = False
            questionPanel.HasNoteLink = False
            questionPanel.Visible = True

            mQuestionPanelList.Add(questionPanel)

            questionControl = New ProfilesWeb.Controls.StandardProfileQuestion

            questionPanel.AddInnerControl(questionControl)

            mQuestionControlList.Add(questionControl)
            questionControl.Question = question

        Next

    End Sub

    Private Sub AddExpandCollapseTriggers(ByVal questionUpdatePanel As UpdatePanel)

        Dim imgExpandAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        imgExpandAllTrigger.ControlID = "imgExpandAll"
        imgExpandAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(imgExpandAllTrigger)

        Dim lnkExpandAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        lnkExpandAllTrigger.ControlID = "lnkExpandAll"
        lnkExpandAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(lnkExpandAllTrigger)

        Dim imgCollapseAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        imgCollapseAllTrigger.ControlID = "imgCollapseAll"
        imgCollapseAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(imgCollapseAllTrigger)

        Dim lnkCollapseAllTrigger As AsyncPostBackTrigger = New AsyncPostBackTrigger()
        lnkCollapseAllTrigger.ControlID = "lnkCollapseAll"
        lnkCollapseAllTrigger.EventName = "Click"
        questionUpdatePanel.Triggers.Add(lnkCollapseAllTrigger)

    End Sub

    Protected Sub imgExpandAll_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgExpandAll.Click
        ExpandCollapseAll(False)
    End Sub

    Protected Sub lnkExpandAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExpandAll.Click
        ExpandCollapseAll(False)
    End Sub

    Protected Sub imgCollapseAll_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgCollapseAll.Click
        ExpandCollapseAll(True)
    End Sub

    Protected Sub lnkCollapseAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCollapseAll.Click
        ExpandCollapseAll(True)
    End Sub

    Private Sub ExpandCollapseAll(ByVal isCollapsed As Boolean)

        Dim questionUpdatePanel As UpdatePanel
        For Each currentControl As Control In plhQuestion.Controls

            questionUpdatePanel = DirectCast(currentControl, UpdatePanel)
            Dim questionPanel As ProfilesWeb.Controls.CollapsiblePanel = _
                DirectCast(questionUpdatePanel.ContentTemplateContainer.Controls(0), ProfilesWeb.Controls.CollapsiblePanel)

            questionPanel.IsCollapsed = isCollapsed
        Next

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            If Not IsValidGuid(Request.QueryString("SpeciesId")) Then
                Throw New InvalidOperationException("There was an invalid or missing species id passed to the page.")
            End If

            Dim speciesId As Guid = New Guid(Request.QueryString("SpeciesId"))

            If IsValidGuid(Request.QueryString("SpeciesSectionId")) Then
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

            Me.Master.PageTitle = "View data for " & CurrentSpeciesData.SpeciesName.ToLower()
        End If

        tabStrip.Tabs(0).Text = CurrentSpeciesData.GetById(CurrentSpeciesSectionId).SectionName

        If CurrentSpeciesData IsNot Nothing Then
            If CurrentSpeciesData.IsReadOnly Then
                Me.Master.UpdateTitle("View species data")
            End If
        End If

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
            Dim questionPanel As ProfilesWeb.Controls.CollapsiblePanel = DirectCast(questionUpdatePanel.ContentTemplateContainer.Controls(0), ProfilesWeb.Controls.CollapsiblePanel)
            Dim questionControl As IProfileQuestion = DirectCast(questionPanel.PanelControls(0), IProfileQuestion)
            questionControl.Save()
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Session("SpeciesEditPreviousPage")) AndAlso Session("SpeciesEditPreviousPage") = "MaintainSpeciesData" Then
            lnkSpeciesReference.Text = "Maintain species data"
            mPreviousLocation = "MaintainSpeciesData.aspx"
        Else
            lnkSpeciesReference.Text = "View species data"
            mPreviousLocation = "ViewSpeciesData.aspx"
        End If

        If Not SpeciesSectionList.CanEditSpeciesSectionList(CurrentSpeciesData) Then
            btnSave.Visible = False
        End If

    End Sub

    Protected Sub lnkSpeciesReference_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSpeciesReference.Click
        PersistSectionInfoToSpecies()
        If CurrentSpeciesData.IsDirty Then
            Dim script As String = "<script language=""JavaScript"">"
            script &= "if(confirm('Changes made to the species will not be saved. Do you wish to continue?')){location.href = '" & mPreviousLocation & "'};"
            script &= "</script>"
            If (Not Page.ClientScript.IsStartupScriptRegistered("SaveScript")) Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "SaveScript", script)
            End If
        Else
            Response.Redirect("~/" & mPreviousLocation)
        End If
    End Sub
End Class
