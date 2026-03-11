Imports ProfilesLibrary

Partial Class EditProfileReferences
    Inherits System.Web.UI.Page

    Private mProfileVersionInfo As ProfileVersionInfo
    Private mCurrentProfileSectionMetadata As ProfileSectionMetadata

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

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        SetPageExpireImmediately(Response)

        Dim master As ProfilesTemplate = DirectCast(Me.Master, ProfilesTemplate)

        If Not Page.IsPostBack Then

            If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
            End If

            Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
            mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
            Session("EditProfileVersionInfo") = mProfileVersionInfo
            Page.Title = "View/Edit Profile"
            master.ProfileTitle = mProfileVersionInfo.ToString()

            If Not IsValidGuid(Request.QueryString("ProfileSectionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile section id passed to the page.")
            End If

            If Request.QueryString("ProfileSectionId") Is Nothing Then
                CurrentProfileSectionId = Guid.Empty
            Else
                CurrentProfileSectionId = New Guid(Request.QueryString("ProfileSectionId"))
                Dim profileMetadataList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
                mCurrentProfileSectionMetadata = profileMetadataList.GetById(CurrentProfileSectionId)
                tabStrip.Tabs.Item(0).Text = mCurrentProfileSectionMetadata.ShortName
                InitalizeSectionPanel(master)
            End If

            DisplayAddNotesButton()

        Else
            Dim profileMetadataList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
            mCurrentProfileSectionMetadata = profileMetadataList.GetById(CurrentProfileSectionId)
            mProfileVersionInfo = Session("EditProfileVersionInfo")
        End If

        tabStrip.Tabs.Item(0).Text = mCurrentProfileSectionMetadata.FormattedShortName
        tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(4).Visible = ProfileContributionInfoList.CanGetProfileContributionInfoList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(5).Visible = ProfileVersionSection.CanGetRevisionInformation(mProfileVersionInfo)

    End Sub

    Private Sub DisplayAddNotesButton()

        Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
        If NoteList.CanEditNoteList(profileVersionId, CurrentProfileSectionId) Then
            ctlEditNoteUILegRef.AddUIVisible = True
            ctlEditNoteUISciRef.AddUIVisible = True
        Else
            ctlEditNoteUILegRef.AddUIVisible = False
            ctlEditNoteUISciRef.AddUIVisible = False
        End If

    End Sub

    Private Sub InitalizeSectionPanel(ByVal master As ProfilesTemplate)

        Dim profileSection As ProfileSectionMetadata = ProfileSectionMetadataList.GetProfileSectionMetadataList().GetById(CurrentProfileSectionId)
        master.PageTitle = profileSection.SectionNumber.ToString() & " " & profileSection.Name

    End Sub

    Protected Sub tabStrip_TabClick(ByVal sender As Object, ByVal e As ProfilesWeb.Controls.TabClickEventArgs) Handles tabStrip.TabClick

        Select Case e.Tab.Text
            Case "References"
                Response.Redirect(String.Format("~/EditProfileReferences.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Further information"
                Response.Redirect(String.Format("~/EditProfileFurtherInformation.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Review comments"
                Response.Redirect(String.Format("~/EditProfileReviewComments.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Revision dates"
                Response.Redirect(String.Format("~/EditProfileRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Contributions"
                Response.Redirect(String.Format("~/EditProfileContributions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "All Revision dates"
                Response.Redirect(String.Format("~/EditProfileAllRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case Else
                Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
        End Select

    End Sub

    Public Sub SciRef_Error(ByVal sender As Object, ByVal e As EventArgs) Handles ctlEditNoteUISciRef.errorEvent
        Dim lblNoteError As Label = DirectCast(panReferences.FindControl("lblNoteError"), Label)
        lblNoteError.Text = (DirectCast(e, EditNoteUI.EditNoteEventArgs)).ErrorMessage
    End Sub

    Public Sub LegRef_Error(ByVal sender As Object, ByVal e As EventArgs) Handles ctlEditNoteUILegRef.errorEvent
        Dim lblNoteError As Label = DirectCast(panReferences.FindControl("lblNoteError"), Label)
        lblNoteError.Text = (DirectCast(e, EditNoteUI.EditNoteEventArgs)).ErrorMessage
    End Sub


End Class
