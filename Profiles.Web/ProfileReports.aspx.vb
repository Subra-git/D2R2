Imports ProfilesLibrary

Partial Class ProfileReports
    Inherits System.Web.UI.Page

    Private mReportInfo As ProfileVersionReportInfo
    Private mReportInfoList As ProfileVersionReportInfoList
    Private mPageTitle As String

    Private Property CurrentProfileVersionInfo() As ProfileVersionInfo
        Get
            Return DirectCast(Session("CurrentProfileVersionInfo"), ProfileVersionInfo)
        End Get
        Set(ByVal value As ProfileVersionInfo)
            Session("CurrentProfileVersionInfo") = value
        End Set
    End Property

    Protected Sub dsProfileVersionReportInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsProfileVersionReportInfoList.SelectObject

        Dim profileVersionReportList As ProfileVersionReportInfoList = ProfileVersionReportInfoList.GetList(CurrentProfileVersionInfo.Id)

        Dim list As List(Of ProfileVersionReportInfo) = New List(Of ProfileVersionReportInfo)(profileVersionReportList)
        For Each profileVersionReport As ProfileVersionReportInfo In profileVersionReportList
            If (profileVersionReport.ReportName = "FullProfileGUID") Then
                list.Remove(profileVersionReport)
            End If
        Next

        If list Is Nothing Then
            e.BusinessObject = Nothing
        ElseIf String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = list
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of ProfileVersionReportInfo)(list)
            sortedProfileVersionList.ApplySort(e.SortProperty, e.SortDirection)
            e.BusinessObject = sortedProfileVersionList
        End If

    End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			If Request.QueryString("ProfileVersionId") Is Nothing Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If

			If Not IsValidGuid(Request.QueryString("ProfileVersionId")) Then
				Throw New InvalidOperationException("There was an invalid or missing profile version id passed to the page.")
			End If
		End If

		Dim profileInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(New Guid(Request.QueryString("ProfileVersionId")))

		mPageTitle = String.Format("Profile reports for {0} v{1}", profileInfo.FullTitlePlainText, profileInfo.Version)

		Page.Title = mPageTitle

		lnkBrowseProfile.NavigateUrl = String.Format("~/EditProfileQuestions.aspx?ProfileVersionId={0}", profileInfo.Id)

        BtnCreateBespokeReport.Attributes.Add("onclick", String.Format("window.open('CreateBespokeReport.aspx?ProfileVersionId={0}', '_self');return false;", profileInfo.Id.ToString()))

        CurrentProfileVersionInfo = profileInfo

		If Session("PublishFlag") = 1 Then
			Session.Remove("PublishFlag")
			mReportInfoList = ProfileVersionReportInfoList.GetList(CurrentProfileVersionInfo.Id)
			ltuRegenerate.ProgressMessage = "Creating reports - please wait"
			ltuRegenerate.StartTask(New LongTaskUI.LongRunningTaskDelegate(AddressOf CreateProfileReportsTask))
			lblMsg.Text = String.Empty
			grdProfileReportList.DataBind()
		End If

		Dim breadcrumbIndicator = Request.QueryString("breadcrumbs")

        If breadcrumbIndicator = "1" Then
            AddNewBreadcrumb(profileInfo.FullTitle)
        End If

        ShowHideIntroText()

    End Sub

    Protected Sub grdProfileReportList_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdProfileReportList.RowCommand

        If e.CommandName = "RegenerateReport" Then
            Dim profileVersionReportList As ProfileVersionReportInfoList = ProfileVersionReportInfoList.GetList(CurrentProfileVersionInfo.Id)
            mReportInfo = profileVersionReportList.GetById(New Guid(e.CommandArgument.ToString()))
            ltuRegenerate.ProgressMessage = "Regenerating report - please wait"
            ltuRegenerate.StartTask(New LongTaskUI.LongRunningTaskDelegate(AddressOf CreateProfileReportTask))
            lblMsg.Text = String.Empty
            grdProfileReportList.DataBind()
        End If

    End Sub

    Private Function CreateProfileReportTask() As String

        Try
            mReportInfo.CreateProfileReport()
        Catch ex As Exception
            Return String.Format("{0}: Report generation failed: {1}", mReportInfo.DisplayName, ex.Message)
        End Try
        Return String.Format("{0}: Report generation succeeded", mReportInfo.DisplayName)

    End Function

    Private Function CreateProfileReportsTask() As String

        Dim result As New StringBuilder
        For Each reportInfo As ProfileVersionReportInfo In mReportInfoList
            mReportInfo = reportInfo
            If result.Length > 0 Then
                result.Append("<br/>")
            End If
            result.Append(Server.HtmlEncode(CreateProfileReportTask()))
        Next
        Return result.ToString()

    End Function

    Protected Sub grdProfileReportList_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdProfileReportList.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim lnkEditProfileVersion As HyperLink = DirectCast(e.Row.Cells(0).FindControl("lnkEditProfileVersion"), HyperLink)
            Dim profileReportInfo As ProfileVersionReportInfo = DirectCast(e.Row.DataItem, ProfileVersionReportInfo)
            If profileReportInfo.HasPdfData Then
                'use javascript rather than target="_blank", because it gives a better user experience if the SSO session has timed out
                'when the user clicks the link
                lnkEditProfileVersion.Attributes.Add("onclick", String.Format("window.open('ShowPublishedProfile.aspx?ProfileVersionId={0}&ProfileReportId={1}');return false;", profileReportInfo.ProfileVersionId.ToString(), profileReportInfo.Id.ToString()))
            End If

            Dim lnkRegenerateReport As LinkButton = DirectCast(e.Row.Cells(1).FindControl("lnkRegenerateReport"), LinkButton)
            lnkRegenerateReport.Visible = ProfileVersionReportInfo.CanCreateProfileReport(profileReportInfo.ProfileVersionId)
        End If

    End Sub

    Protected Sub ltuRegenerate_TaskCompleted(ByVal sender As Object, ByVal e As TaskCompletedEventArgs) Handles ltuRegenerate.TaskCompleted
        lblMsg.Visible = True

        If e.Result.Length > 0 Then
            lblMsg.Text = "<div class=""ErrorLabel"">" & e.Result & "</div>"
        Else
            lblMsg.Text = "<div class=""ErrorLabel"">Report regeneration succeeded</div>"
        End If
        grdProfileReportList.DataBind()

    End Sub

    Protected Sub AddNewBreadcrumb(profileTitle As String)
        Dim profileVerId As String = Request.QueryString("ProfileVersionId")
        Dim master = CType(Page.Master, ProfilesTemplate)
        Dim parentNavigateUrl As String = $"~/EditProfileQuestions.aspx?ProfileVersionId={profileVerId}"

        If Not String.IsNullOrEmpty(profileVerId) Then
            WebControls.Breadcrumb.UpdateBreadcrumb(master, mPageTitle, 4, parentNavigateUrl, profileTitle, False)
        End If
    End Sub

    Protected Sub ShowHideIntroText()
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsProfileEditor Then
            introText.Visible = False
        End If

    End Sub

End Class
