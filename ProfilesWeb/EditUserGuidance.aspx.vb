Imports ProfilesLibrary
Imports Profiles.Contracts

Partial Class EditUserGuidance
    Inherits System.Web.UI.Page

    Private Property CurrentQuestionList() As ProfileQuestionInfoList
        Get
            Return DirectCast(Session("ProfileQuestionInfoList"), ProfileQuestionInfoList)
        End Get
        Set(ByVal value As ProfileQuestionInfoList)
            Session("ProfileQuestionInfoList") = value
        End Set
    End Property

#Region "Dropdown list for selecting a section"

    Protected Sub dsProfileSectionInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileSectionInfoList.SelectObject

        e.BusinessObject = ProfileSectionMetadataList.GetProfileSectionMetadataList()

    End Sub

    Protected Sub ddlProfileSection_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProfileSection.SelectedIndexChanged

        'changing the section implicitly cancels the edit
        If CurrentQuestion IsNot Nothing Then
            CurrentQuestion.CancelEdit()
            CurrentQuestion = Nothing
            pnlUserGuidance.Visible = False
        End If

        'if we have selected a section (rather than "Please select...") then load the questions for that section
        If ddlProfileSection.SelectedValue = "none" Then
            CurrentQuestionList = Nothing
        Else            
            'CurrentQuestionList = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper().GetById(New Guid(ddlProfileSection.SelectedValue)).QuestionMetadataList
            CurrentQuestionList = ProfileQuestionInfoList.GetList(New Guid(ddlProfileSection.SelectedValue))
        End If

        'rebind the grid
        grdQuestionList.DataBind()

    End Sub

#End Region

    Private Property CurrentQuestion() As ProfileQuestion
        Get
            Return DirectCast(Session("ProfileQuestion"), ProfileQuestion)
        End Get
        Set(ByVal value As ProfileQuestion)
            Session("ProfileQuestion") = value
        End Set
    End Property

    Protected Sub dsProfileQuestionInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileQuestionInfoList.SelectObject

        If ddlProfileSection.SelectedIndex = 0 Then
            grdQuestionList.Visible = False
        Else
            e.BusinessObject = CurrentQuestionList
            grdQuestionList.Visible = True
        End If

    End Sub

    Protected Sub grdQuestionList_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdQuestionList.RowCommand

        If e.CommandName = "EditQuestion" Then
            grdQuestionList.DataBind()
            ' Switch to edit view
            CurrentQuestion = ProfileQuestion.GetProfileQuestion(New Guid(e.CommandArgument.ToString()))
            lblQuestionName.Text = "Edit question " & CurrentQuestion.QuestionNumber.ToString()
            txtEditName.Text = CurrentQuestion.Name
            txtEditNonTechnicalName.Text = CurrentQuestion.NonTechnicalName
            txtUserGuidance.Text = CurrentQuestion.UserGuidance
            CType(Page.Master, ProfilesTemplate).ScriptManager.SetFocus(txtUserGuidance)
            pnlUserGuidance.Visible = True
        End If

    End Sub


    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        CurrentQuestion.UserGuidance = txtUserGuidance.Text
        CurrentQuestion.Name = txtEditName.Text
        CurrentQuestion.NonTechnicalName = txtEditNonTechnicalName.Text
        CurrentQuestion.ApplyEdit()
        Try
            CurrentQuestion.Save()
            lblErrorUserGuidance.Text = "User guidance save succeeded"
        Catch ex As Csla.DataPortalException
            lblErrorUserGuidance.Text = "User guidance save failed: " + ex.BusinessException.Message
        End Try
        CurrentQuestion = Nothing
        pnlUserGuidance.Visible = False
        'Force refresh of gridview
        Cache.Remove("ProfileQuestionList|" & ddlProfileSection.SelectedValue)
        CurrentQuestionList = ProfileQuestionInfoList.GetList(New Guid(ddlProfileSection.SelectedValue))
        grdQuestionList.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        CurrentQuestion.CancelEdit()
        CurrentQuestion = Nothing
        pnlUserGuidance.Visible = False

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not ProfileQuestion.CanEditObject Then
            Throw New System.Security.SecurityException("You do not have permission to view the edit user guidance page")
        End If

        Dim guidanceReportUrl As String = "window.open('ShowProfileGuidanceReport.aspx?type={0}&time={1}');return false;"

        btnUserGuidanceReport.Attributes.Add( _
            "onclick", _
            String.Format(guidanceReportUrl, ProfileGuidanceReportType.All, Guid.NewGuid()))

        btnSummaryProfileGuidanceReport.Attributes.Add( _
            "onclick", _
            String.Format(guidanceReportUrl, ProfileGuidanceReportType.SummaryProfile, Guid.NewGuid()))

        btnSummaryPrioritisationGuidanceReport.Attributes.Add( _
            "onclick", _
            String.Format(guidanceReportUrl, ProfileGuidanceReportType.SummaryPrioritisationReport, Guid.NewGuid()))

        btnQAGuidanceReport.Attributes.Add( _
            "onclick", _
            String.Format(guidanceReportUrl, ProfileGuidanceReportType.QAGuidanceReport, Guid.NewGuid()))
    End Sub
End Class
