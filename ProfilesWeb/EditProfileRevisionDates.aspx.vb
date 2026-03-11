Imports ProfilesLibrary

Partial Class EditProfileRevisionDates
    Inherits System.Web.UI.Page

    Private mProfileVersionInfo As ProfileVersionInfo
    Private mCanEditProfileVersionSection As Boolean
    Private WithEvents mProfileMaster As ProfilesTemplate

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

    Protected Sub ctlSectionLinks_Save(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinks.Save

        If Not Page.IsValid Then
            e.Cancel = True
            Exit Sub
        End If

        If mCanEditProfileVersionSection Then
            If Not PersistSectionInfoToDatabase() Then
                e.Cancel = True
            End If
        End If

    End Sub

    Private Sub PersistSectionInfoToProfileVersion()

        If ProfileVersionSection.CanEditNextReviewDates(mProfileVersionInfo.Id) Then
            'Persist the revision dates information
            CurrentProfileVersionSection.NextPolicyReview = Csla.SmartDate.Parse(txtNextPolicyReview.Text)
            CurrentProfileVersionSection.NextVAReview = Csla.SmartDate.Parse(txtNextVAReview.Text)
            CurrentProfileVersionSection.NextAuthorReview = Csla.SmartDate.Parse(txtNextAuthorReview.Text)
        End If

        If Not ddlPolicyReviewFreq.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.PolicyReviewFrequency = New Guid(ddlPolicyReviewFreq.SelectedValue)
        Else
            CurrentProfileVersionSection.PolicyReviewFrequency = Guid.Empty
        End If

        If Not ddlVAReviewFreq.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.VAReviewFrequency = New Guid(ddlVAReviewFreq.SelectedValue)
        Else
            CurrentProfileVersionSection.VAReviewFrequency = Guid.Empty
        End If

        If Not ddlAuthorReviewFreq.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.AuthorReviewFrequency = New Guid(ddlAuthorReviewFreq.SelectedValue)
        Else
            CurrentProfileVersionSection.AuthorReviewFrequency = Guid.Empty
        End If

        If Not ddlPolicyReviewStatus.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.PolicyReviewStatusId = New Guid(ddlPolicyReviewStatus.SelectedValue)
        Else
            CurrentProfileVersionSection.PolicyReviewStatusId = Guid.Empty
        End If

        If Not ddlVAReviewStatus.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.VAReviewStatusId = New Guid(ddlVAReviewStatus.SelectedValue)
        Else
            CurrentProfileVersionSection.VAReviewStatusId = Guid.Empty
        End If

        If Not ddlAuthorReviewStatus.SelectedValue.ToString() = String.Empty Then
            CurrentProfileVersionSection.AuthorReviewStatusId = New Guid(ddlAuthorReviewStatus.SelectedValue)
        Else
            CurrentProfileVersionSection.AuthorReviewStatusId = (Guid.Empty)
        End If

    End Sub

    Private Function PersistSectionInfoToDatabase() As Boolean

        PersistSectionInfoToProfileVersion()

        Try
            CurrentProfileVersionSection.Save()
            lblErrorDesc.Text = "Profile section save succeeded"
        Catch ex As Csla.DataPortalException
            lblErrorDesc.Text = "Profile section save failed: " + ex.BusinessException.Message
            CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
            SetUIValues()
            Return False
        End Try

        Return True

    End Function

#Region "Revision Dates"

    Protected Sub dsRevisionDates_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsRevisionDates.SelectObject

        e.BusinessObject = SectionReviewFrequencyList.GetList()

    End Sub

#End Region

#Region "Review Status"

    Protected Sub dsRevisionStatus_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsRevisionStatus.SelectObject

        e.BusinessObject = ReviewStatusTypeList.GetReviewStatusTypeList

    End Sub

#End Region

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        SetPageExpireImmediately(Response)

        Dim master As ProfilesTemplate = DirectCast(Me.Master, ProfilesTemplate)
        mProfileMaster = master

        If Not Page.IsPostBack Then

            If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
            End If

            Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
            mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
            Session("EditProfileVersionInfo") = mProfileVersionInfo
            mCanEditProfileVersionSection = ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)

            master.ProfileTitle = mProfileVersionInfo.ToString()

            If Not IsValidGuid(Request.QueryString("ProfileSectionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile section id passed to the page.")
            End If

            If Request.QueryString("ProfileSectionId") Is Nothing Then

                CurrentProfileSectionId = Guid.Empty
                CurrentProfileVersionSection = Nothing

            Else

                CurrentProfileSectionId = New Guid(Request.QueryString("ProfileSectionId"))
                CurrentProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
                tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.SectionShortName
                InitalizeSectionPanel(master)
            End If

            DisplayTopRightButtons()

        Else
            mProfileVersionInfo = Session("EditProfileVersionInfo")
            mCanEditProfileVersionSection = ProfileVersionSection.CanEditProfileVersionSection(mProfileVersionInfo.Id, CurrentProfileSectionId)
        End If

        tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
        tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)

    End Sub

    Private Sub DisplayTopRightButtons()

        btnSave.Visible = mCanEditProfileVersionSection
        btnSave2.Visible = mCanEditProfileVersionSection

    End Sub

    Private Sub InitalizeSectionPanel(ByVal master As ProfilesTemplate)

        Dim profileSection As ProfileSectionMetadata = ProfileSectionMetadataList.GetProfileSectionMetadataList().GetById(CurrentProfileSectionId)

        master.PageTitle = profileSection.SectionNumber.ToString() & " " & profileSection.Name

        SetUIValues()

    End Sub

    Private Sub DisplayReadOnlyReviewFrequencies(ByVal isVisible As Boolean)
        lblVAReviewFreq.Visible = isVisible
        lblPolicyReviewFreq.Visible = isVisible
        lblAuthorReviewFreq.Visible = isVisible
        lblItemVAReviewFreq.Visible = isVisible
        lblItemPolicyReviewFreq.Visible = isVisible
        lblItemAuthorReviewFreq.Visible = isVisible
    End Sub

    Private Sub DisplayEditableReviewFrequencies(ByVal isVisible As Boolean)
        lblVAReviewFreq.Visible = isVisible
        lblPolicyReviewFreq.Visible = isVisible
        lblAuthorReviewFreq.Visible = isVisible
        ddlVAReviewFreq.Visible = isVisible
        ddlPolicyReviewFreq.Visible = isVisible
        ddlAuthorReviewFreq.Visible = isVisible
    End Sub

    Private Sub DisplayReadOnlyReviewDates(ByVal isVisible As Boolean)
        lblNextVAReview.Visible = isVisible
        lblNextPolicyReview.Visible = isVisible
        lblNextAuthorReview.Visible = isVisible
        lblItemNextVAReview.Visible = isVisible
        lblItemNextPolicyReview.Visible = isVisible
        lblItemNextAuthorReview.Visible = isVisible
        ImgCalNextVAReview.Visible = False
        ImgCalNextPolReview.Visible = False
        ImgCalNextAuthorReview.Visible = False
    End Sub

    Private Sub DisplayEditableReviewDates(ByVal isVisible As Boolean)
        lblNextVAReview.Visible = isVisible
        lblNextPolicyReview.Visible = isVisible
        lblNextAuthorReview.Visible = isVisible
        txtNextVAReview.Visible = isVisible
        txtNextPolicyReview.Visible = isVisible
        txtNextAuthorReview.Visible = isVisible
        ImgCalNextVAReview.Visible = isVisible
        ImgCalNextPolReview.Visible = isVisible
        ImgCalNextAuthorReview.Visible = isVisible
    End Sub

    Private Sub DisplayReadOnlyReviewStatuses(ByVal isVisible As Boolean)
        lblVAReviewStatus.Visible = isVisible
        lblPolicyReviewStatus.Visible = isVisible
        lblAuthorReviewStatus.Visible = isVisible
        lblItemVAReviewStatus.Visible = isVisible
        lblItemPolicyReviewStatus.Visible = isVisible
        lblItemAuthorReviewStatus.Visible = isVisible
    End Sub

    Private Sub DisplayEditableReviewStatuses(ByVal isVisible As Boolean)
        lblVAReviewStatus.Visible = isVisible
        lblPolicyReviewStatus.Visible = isVisible
        lblAuthorReviewStatus.Visible = isVisible
        ddlVAReviewStatus.Visible = isVisible
        ddlPolicyReviewStatus.Visible = isVisible
        ddlAuthorReviewStatus.Visible = isVisible
    End Sub

    Private Sub DisplayReviewDetail(ByVal isVisible As Boolean)
        DisplayReadOnlyReviewFrequencies(isVisible)
        DisplayEditableReviewFrequencies(isVisible)
        DisplayReadOnlyReviewDates(isVisible)
        DisplayEditableReviewDates(isVisible)
        DisplayReadOnlyReviewStatuses(isVisible)
        DisplayEditableReviewStatuses(isVisible)
    End Sub

    Private Sub SetUIValues()

        Dim canGetNextReviewDates As Boolean = ProfileVersionSection.CanGetNextReviewDates(CurrentProfileVersionSection.ProfileVersionId)
        Dim canEditNextReviewDates As Boolean = ProfileVersionSection.CanEditNextReviewDates(CurrentProfileVersionSection.ProfileVersionId)

        'hide everything to begin with
        DisplayReviewDetail(False)

        'If the user does not have edit rights, show the values read-only
        If Not mCanEditProfileVersionSection Then

            'set the values of the read-only UI controls to the values in the business layer
            If canGetNextReviewDates Then
                lblItemNextVAReview.Text = CurrentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy") & "&nbsp;"
                lblItemNextPolicyReview.Text = CurrentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy") & "&nbsp;"
                lblItemNextAuthorReview.Text = CurrentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy") & "&nbsp;"
            End If

            Dim listSectionReviewFrequency As SectionReviewFrequencyList = SectionReviewFrequencyList.GetList()

            For Each ReviewFrequencyItem As SectionReviewFrequencyList.NameValuePair In listSectionReviewFrequency
                If Not CurrentProfileVersionSection.VAReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CurrentProfileVersionSection.VAReviewFrequency Then
                    lblItemVAReviewFreq.Text = ReviewFrequencyItem.Value
                End If

                If Not CurrentProfileVersionSection.PolicyReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CurrentProfileVersionSection.PolicyReviewFrequency Then
                    lblItemPolicyReviewFreq.Text = ReviewFrequencyItem.Value
                End If

                If Not CurrentProfileVersionSection.AuthorReviewFrequency = Guid.Empty AndAlso ReviewFrequencyItem.Key = CurrentProfileVersionSection.AuthorReviewFrequency Then
                    lblItemAuthorReviewFreq.Text = ReviewFrequencyItem.Value
                End If
            Next
                
            Dim listSectionReviewStatusType As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList
            If canGetNextReviewDates Then

                For Each reviewStatusTypeItem As ReviewStatusType In listSectionReviewStatusType
                    If Not CurrentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.VAReviewStatusId Then
                        lblItemVAReviewStatus.Text = reviewStatusTypeItem.Name
                    End If

                    If Not CurrentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.PolicyReviewStatusId Then
                        lblItemPolicyReviewStatus.Text = reviewStatusTypeItem.Name
                    End If

                    If Not CurrentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.AuthorReviewStatusId Then
                        lblItemAuthorReviewStatus.Text = reviewStatusTypeItem.Name
                    End If
                Next

            End If

            'Add a whitespace to the end of the label text to ensure it renders correctly in standards compliant browsers.
            lblItemVAReviewFreq.Text += "&nbsp;"
            lblItemPolicyReviewFreq.Text += "&nbsp;"
            lblItemAuthorReviewFreq.Text += "&nbsp;"
            lblItemVAReviewStatus.Text += "&nbsp;"
            lblItemPolicyReviewStatus.Text += "&nbsp;"
            lblItemAuthorReviewStatus.Text += "&nbsp;"

            'show the read-only UI
            DisplayReadOnlyReviewFrequencies(True)
            DisplayReadOnlyReviewDates(canGetNextReviewDates)
            DisplayReadOnlyReviewStatuses(canGetNextReviewDates)

        Else

            'set the values of the editable UI controls to the values in the business layer
            If canGetNextReviewDates Then

                If canEditNextReviewDates Then
                    txtNextVAReview.Text = CurrentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
                    txtNextPolicyReview.Text = CurrentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
                    txtNextAuthorReview.Text = CurrentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")
                Else
                    lblItemNextVAReview.Text = CurrentProfileVersionSection.NextVAReview.ToString("d MMMM yyyy")
                    lblItemNextPolicyReview.Text = CurrentProfileVersionSection.NextPolicyReview.ToString("d MMMM yyyy")
                    lblItemNextAuthorReview.Text = CurrentProfileVersionSection.NextAuthorReview.ToString("d MMMM yyyy")
                End If

                Dim listSectionReviewStatusType As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList
                For Each reviewStatusTypeItem As ReviewStatusType In listSectionReviewStatusType
                    If Not CurrentProfileVersionSection.VAReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.VAReviewStatusId Then
                        lblItemVAReviewStatus.Text = reviewStatusTypeItem.Name
                    End If

                    If Not CurrentProfileVersionSection.PolicyReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.PolicyReviewStatusId Then
                        lblItemPolicyReviewStatus.Text = reviewStatusTypeItem.Name
                    End If

                    If Not CurrentProfileVersionSection.AuthorReviewStatusId = Guid.Empty AndAlso reviewStatusTypeItem.Id = CurrentProfileVersionSection.AuthorReviewStatusId Then
                        lblItemAuthorReviewStatus.Text = reviewStatusTypeItem.Name
                    End If
                Next

            End If

            If Not CurrentProfileVersionSection.VAReviewFrequency = Guid.Empty Then
                ddlVAReviewFreq.SelectedValue = CurrentProfileVersionSection.VAReviewFrequency.ToString()
            End If

            If Not CurrentProfileVersionSection.PolicyReviewFrequency = Guid.Empty Then
                ddlPolicyReviewFreq.SelectedValue = CurrentProfileVersionSection.PolicyReviewFrequency.ToString()
            End If

            If Not CurrentProfileVersionSection.AuthorReviewFrequency = Guid.Empty Then
                ddlAuthorReviewFreq.SelectedValue = CurrentProfileVersionSection.AuthorReviewFrequency.ToString()
            End If

            If Not CurrentProfileVersionSection.VAReviewStatusId = Guid.Empty Then
                ddlVAReviewStatus.SelectedValue = CurrentProfileVersionSection.VAReviewStatusId.ToString()
            End If

            If Not CurrentProfileVersionSection.PolicyReviewStatusId = Guid.Empty Then
                ddlPolicyReviewStatus.SelectedValue = CurrentProfileVersionSection.PolicyReviewStatusId.ToString()
            End If

            If Not CurrentProfileVersionSection.AuthorReviewStatusId = Guid.Empty Then
                ddlAuthorReviewStatus.SelectedValue = CurrentProfileVersionSection.AuthorReviewStatusId.ToString()
            End If

            'show the editable UI
            DisplayEditableReviewFrequencies(True)

            If canEditNextReviewDates Then
                DisplayEditableReviewDates(True)
            Else
                DisplayReadOnlyReviewDates(True)
            End If

            DisplayEditableReviewStatuses(True)

        End If

    End Sub

    Protected Sub tabStrip_TabClick(ByVal sender As Object, ByVal e As ProfilesWeb.Controls.TabClickEventArgs) Handles tabStrip.TabClick

        Page.Validate()

        If Not Page.IsValid Then
            Exit Sub
        End If

        If mCanEditProfileVersionSection Then
            If Not PersistSectionInfoToDatabase() Then
                Exit Sub
            End If
        End If

        Select Case e.Tab.Text
            Case "References"
                Response.Redirect(String.Format("~/EditProfileReferences.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Further information"
                Response.Redirect(String.Format("~/EditProfileFurtherInformation.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Review comments"
                Response.Redirect(String.Format("~/EditProfileReviewComments.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Revision dates"
                Response.Redirect(String.Format("~/EditProfileRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "All Revision dates"
                Response.Redirect(String.Format("~/EditProfileAllRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Contributions"
                Response.Redirect(String.Format("~/EditProfileContributions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case Else
                Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
        End Select

    End Sub

    Protected Sub ctlSectionLinks_NavigateHome(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ctlSectionLinks.NavigateHome

        ' if navigating away from profile then save changes to profile object
        If mCanEditProfileVersionSection Then
            PersistSectionInfoToProfileVersion()
            e.Cancel = CurrentProfileVersionSection.IsDirty
        End If

    End Sub

    Protected Sub mProfileMaster_NavigateHome(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles mProfileMaster.NavigateHome

        ' if navigating away from profile then save changes to profile object   
        If mCanEditProfileVersionSection Then
            PersistSectionInfoToProfileVersion()
            e.Cancel = CurrentProfileVersionSection.IsDirty
        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click, btnSave2.Click
        If mCanEditProfileVersionSection Then
            PersistSectionInfoToDatabase()
        End If
    End Sub

End Class
