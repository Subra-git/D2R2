Imports Profiles.Infrastructure
Imports Profiles.WebControls
Imports Profiles.WebControls.Profiles.WebControls
Imports ProfilesLibrary

Partial Class EditProfileContributions
    Inherits System.Web.UI.Page

    Private mProfileVersionInfo As ProfileVersionInfo

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
    Private Property CurrentContributionList() As ProfileContributionInfoList
        Get
            Return DirectCast(Session("ContributionList"), ProfileContributionInfoList)
        End Get

        Set(ByVal value As ProfileContributionInfoList)
            Session("ContributionList") = value
        End Set
    End Property


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        SetPageExpireImmediately(Response)

        'Dim master As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Me.Master)
        Dim master = CType(Page.Master.Master, ProfilesTemplate)
        If Not Page.IsPostBack Then

            If Not CommonUI.IsValidGuid(Request.QueryString("ProfileVersionId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
            End If

            Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
            mProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
            Session("EditProfileVersionInfo") = mProfileVersionInfo

            master.UpdateTitle(mProfileVersionInfo.Title.ToString().StripPTags)

            Dim nestedMaster = CType(Page.Master, NestedProfileQuestions)
            nestedMaster.SubTitle = mProfileVersionInfo.VersionToString()

            If Not CommonUI.IsValidGuid(Request.QueryString("ProfileSectionId")) Then
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

        Else
            mProfileVersionInfo = Session("EditProfileVersionInfo")
        End If

        tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
        tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(4).Visible = ProfileVersionSection.CanGetRevisionInformation(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(5).Visible = ProfileContributionInfoList.CanGetProfileContributionInfoList(mProfileVersionInfo.Id)

        Dim profilesTemplateMaster = CType(Page.Master.Master, ProfilesTemplate)
        Breadcrumb.UpdateBreadcrumb(profilesTemplateMaster, mProfileVersionInfo.FullTitle, 4)

    End Sub

    Protected Sub dsContributionsList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsContributionsList.SelectObject

        If Not CurrentProfileSectionId.Equals(Guid.Empty) Then

            If String.IsNullOrEmpty(e.SortExpression) Then
                e.BusinessObject = CurrentContributionList
            Else
                Dim sortedContributionList As New Csla.SortedBindingList(Of ProfileContributionInfo)(CurrentContributionList)
                Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
                Dim sortProperty As String = sortExpressionParts(0).Trim
                Dim direction As SortDirection = SortDirection.Ascending
                If sortExpressionParts.Length > 1 Then
                    direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
                End If
                sortedContributionList.ApplySort(sortProperty, direction)

                e.BusinessObject = sortedContributionList
            End If

        End If

    End Sub


    Private Sub InitalizeSectionPanel(ByVal master As ProfilesTemplate)

        CurrentContributionList = ProfileContributionInfoList.GetProfileContributionInfoList(mProfileVersionInfo.Id, CurrentProfileSectionId)
        grdContributions.DataBind()

    End Sub

    Protected Sub tabStrip_TabClick(ByVal sender As Object, ByVal e As TabClickEventArgs) Handles tabStrip.TabClick

        Select Case e.Tab.Text
            Case "References"
                Response.Redirect(String.Format("~/EditProfileReferences.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Further information"
                Response.Redirect(String.Format("~/EditProfileFurtherInformation.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Review comments"
                Response.Redirect(String.Format("~/EditProfileReviewComments.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "Contributions"
                Response.Redirect(String.Format("~/EditProfileContributions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case "All Revision dates"
                Response.Redirect(String.Format("~/EditProfileAllRevisionDates.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
            Case Else
                Response.Redirect(String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}&ProfileSectionId={1}", mProfileVersionInfo.Id.ToString(), CurrentProfileSectionId.ToString()))
        End Select

    End Sub

    Private Sub EditProfileContributions_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Page.IsPostBack Then
            HandleCustomPostBackFromTabManager()
        End If

        SectionPagination.TargetUrl = "EditProfileContributions.aspx?ProfileVersionId=" & mProfileVersionInfo.Id.ToString & "&ProfileSectionId={0}"
        SectionPagination.SetupPaginationLinks(ProfileVersionSectionList.GetProfileVersionSectionList(mProfileVersionInfo.Id), CurrentProfileSectionId)

		RefreshPage()

    End Sub

    Private Sub HandleCustomPostBackFromTabManager()
        If Not String.IsNullOrEmpty(Request.Form("__EVENTTARGET")) Then
            If Request.Form("__EVENTTARGET") = "tabStrip" Then
                Dim t As TabItem = New TabItem
                Dim o As String = Request.Form("__EVENTARGUMENT")
                t.Text = o
                Dim ev As TabClickEventArgs = New TabClickEventArgs(t)
                tabStrip_TabClick(Me, ev)
            End If
        End If
    End Sub

    Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdContributions.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

    Private Sub RefreshPage()
        grdContributions.DataBind()
        bottomPaginator.TotalPages = grdContributions.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub

    Private Sub StaticReports_Init(sender As Object, e As EventArgs) Handles Me.Init

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub
End Class
