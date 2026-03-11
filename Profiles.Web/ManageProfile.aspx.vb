Imports ProfilesLibrary
Imports System.Collections.Generic

Partial Class ManageProfile
    Inherits System.Web.UI.Page

    Private Property CurrentProfile() As ProfilesLibrary.Profile
        Get
            Return DirectCast(Session("CurrentProfile"), ProfilesLibrary.Profile)
        End Get
        Set(ByVal value As ProfilesLibrary.Profile)
            Session("CurrentProfile") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ProfilesLibrary.Profile.CanEditProfile() Then
            Throw New System.Security.SecurityException("You do not have permission to access the Manage profile page")
        End If

        lblError.Text = String.Empty

        If Not Page.IsPostBack Then

            If Not IsValidGuid(Request.QueryString("ProfileId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
            End If
            Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))

            CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
            RefreshDisplay(CurrentProfile)

            If CurrentProfile.ProfileStatusId = Guid.Empty Then
                ddlProfileStatus.SelectedValue = String.Empty
            Else
                ddlProfileStatus.SelectedValue = CurrentProfile.ProfileStatusId.ToString()
            End If

        End If

    End Sub

    Private Sub RefreshDisplay(ByVal profileData As ProfilesLibrary.Profile)
        Dim title = "Manage profile: " & profileData.ToString()

        Page.Title = title.StripHtmlTags()

        Dim masterProfilesTemplate = CType(Page.Master, ProfilesTemplate)
        masterProfilesTemplate.UpdateTitle(title)

        lblProfileTitle.Text = profileData.Title
        lblScenarioTitle.Text = profileData.ScenarioTitle

        DisplayVersionLabel(profileData.CurrentPublishedVersion, lblProfilePublishedVersion)
        DisplayVersionLabel(profileData.CurrentPublicVersion, lblProfilePublicVersion)
        DisplayVersionLabel(profileData.CurrentDraftVersion, lblProfileDraftVersion)

        lnkProfileProperties.NavigateUrl = "~/ProfileProperties.aspx?ProfileId=" & profileData.Id.ToString()
        lnkProfileProperties.Visible = ProfilesLibrary.Profile.CanEditProfile() AndAlso
            (profileData.IsWhatIfScenario OrElse profileData.CurrentDraftVersion IsNot Nothing)

        lnkMaintainContributors.NavigateUrl = "~/MaintainContributors.aspx?ProfileId=" & profileData.Id.ToString()
        lnkMaintainContributors.Visible = ProfileContributorList.CanGetContributorList()

        lnkViewContributorsReport.NavigateUrl = "~/ShowContributionReport.aspx?ProfileId=" + profileData.Id.ToString()
        lnkViewContributorsReport.Visible = ProfilesLibrary.Profile.CanGetContributionsReport()

		lnkNewDraftVersion.Text = String.Format("Create new draft version {0}.{1}",
				profileData.LatestVersion.VersionMajor.ToString(),
				(profileData.LatestVersion.VersionMinor + 1).ToString())

		lnkNewDraftVersion.Visible = profileData.CanCreateNewDraft()

        lnkDelete.Visible = profileData.CanDeleteLatestDraft()

        lnkClone.NavigateUrl = "~/ProfileProperties.aspx?CloneProfileVersionId=" & profileData.LatestVersion.Id.ToString()
        lnkClone.Visible = ProfilesLibrary.Profile.CanCreateProfile() AndAlso Not profileData.IsWhatIfScenario

        lnkCloneScenario.NavigateUrl = "~/ProfileProperties.aspx?Scenario=1&CloneProfileVersionId=" & profileData.LatestVersion.Id.ToString()
        lnkCloneScenario.Visible = ProfilesLibrary.Profile.CanCreateProfile()
        lnkPublish.Visible = profileData.CanPublish()
        lnkPublishPublic.Visible = profileData.CanPublishPublic()
        If Not SetProfileVersionPublicAccessCommand.CanChangePublicAccess(profileData.Id) OrElse
        profileData.CurrentPublishedVersion.Equals(profileData.CurrentPublicVersion) Then
            lnkAllowPublicAccess.Visible = False
            'If profileData.IsWhatIfScenario Then
            '    lnkPublishPublic.Visible = False
            'End If
        End If
    End Sub

    Private Sub DisplayVersionLabel(ByVal versionInfo As ProfileVersionInfo, ByVal versionLabel As Label)

        If versionInfo IsNot Nothing Then
            versionLabel.Text = versionInfo.Version
        Else
            versionLabel.Text = "- none -"
        End If

    End Sub

    Protected Sub lnkChangePublicAccess_Command(ByVal sender As Object, ByVal e As CommandEventArgs) Handles lnkAllowPublicAccess.Command
        SetProfileVersionPublicAccessCommand.SetProfileVersionPublic(CurrentProfile.CurrentPublishedVersion.Id)
        Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
        CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
        RefreshDisplay(CurrentProfile)
    End Sub

    Protected Sub lnkDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDelete.Click

        Dim profileData As ProfilesLibrary.Profile = CurrentProfile
        If profileData Is Nothing Then
            lblError.Text = "Profile version deletion failed: You may have used the back button or your session timed out"
            Exit Sub
        End If

        Try
            profileData.DeleteLatestDraft()
            CurrentProfile = Nothing
            Response.Redirect("~/Home.aspx")
        Catch ex As Csla.DataPortalException
            lblError.Text = ex.BusinessException.Message
            Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
            CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
            RefreshDisplay(CurrentProfile)
        End Try

    End Sub

    Protected Sub lnkPublish_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkPublish.Click, lnkPublishPublic.Click

        Dim profileData As ProfilesLibrary.Profile = CurrentProfile
        If profileData Is Nothing Then
            lblError.Text = "Profile publication failed: You may have used the back button or your session timed out"
            Exit Sub
        End If

        Try
            Dim invalidReasonList As List(Of InvalidReason) = New List(Of InvalidReason)(profileData.Validate())

            If invalidReasonList.Count > 0 Then
                ctlInvalidReasonList.InvalidReasons = invalidReasonList
            Else
                Dim newPublishedVersion As Guid
                If DirectCast(sender, LinkButton).ID = "lnkPublishPublic" Then
                    newPublishedVersion = profileData.Publish(True)
                Else
                    newPublishedVersion = profileData.Publish(False)
                End If
                CurrentProfile = Nothing
                Session("PublishFlag") = 1
                Response.Redirect("~/ProfileReports.aspx?ProfileVersionId=" & newPublishedVersion.ToString())
            End If
        Catch ex As Csla.DataPortalException
            lblError.Text = ex.BusinessException.Message
            Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
            CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
            RefreshDisplay(CurrentProfile)
        End Try
    End Sub

	Protected Sub lnkNewDraftVersion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkNewDraftVersion.Click

		Dim profileData As ProfilesLibrary.Profile = CurrentProfile
		If profileData Is Nothing Then
			lblError.Text = "Profile version creation failed: You may have used the back button or your session timed out"
			Exit Sub
		End If

		Try
			Dim newVersionId As Guid = profileData.CreateNewDraft()
			CurrentProfile = Nothing
			Response.Redirect("EditProfileQuestions.aspx?ProfileVersionId=" + newVersionId.ToString)
		Catch ex As Csla.DataPortalException
			lblError.Text = ex.BusinessException.Message
			Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
			CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
			RefreshDisplay(CurrentProfile)
		End Try

	End Sub

	Protected Sub dsProfileStatusTypes_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileStatusTypes.SelectObject

        e.BusinessObject = ProfileStatusTypeInfoList.GetProfileStatusTypeInfoList()

    End Sub

    Protected Sub ddlProfileStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProfileStatus.SelectedIndexChanged

        Try
            Dim profileStatusId As Guid = Guid.Empty
            If Not String.IsNullOrEmpty(ddlProfileStatus.SelectedValue) Then
                profileStatusId = New Guid(ddlProfileStatus.SelectedValue)
            End If
            ProfileStatusCommand.SetProfileStatus(CurrentProfile.Id, profileStatusId)
            lblError.Text = "Successfully updated the profile status. "
        Catch ex As Csla.DataPortalException
            lblError.Text = ex.BusinessException.Message
            Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
            CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
            RefreshDisplay(CurrentProfile)
        End Try

    End Sub
End Class
