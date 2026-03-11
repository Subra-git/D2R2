Imports ProfilesLibrary

Partial Class EditProfileReviewComments
    Inherits System.Web.UI.Page

    Private mProfileVersionInfo As ProfileVersionInfo
    Private mCanAddReviewComments As Boolean

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


#Region "Review comments"

    Private Property CurrentReviewCommentList() As ReviewCommentList
        Get
            Return DirectCast(Session("ReviewCommentList"), ReviewCommentList)
        End Get
        Set(ByVal value As ReviewCommentList)
            Session("ReviewCommentList") = value
        End Set
    End Property

    Private Property CurrentReviewComment() As ReviewComment
        Get
            Return DirectCast(Session("ReviewComment"), ReviewComment)
        End Get
        Set(ByVal value As ReviewComment)
            Session("ReviewComment") = value
        End Set
    End Property

    Protected Sub dsReviewCommentList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsReviewCommentList.SelectObject

        If Not CurrentProfileSectionId.Equals(Guid.Empty) Then

            If String.IsNullOrEmpty(e.SortExpression) Then
                e.BusinessObject = CurrentReviewCommentList
            Else
                Dim sortedProfileVersionList As New Csla.SortedBindingList(Of ReviewComment)(CurrentReviewCommentList)
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

    Public Function IndentSubject(ByVal level As Integer) As String

        If level = 1 Then
            Return String.Empty
        End If

        Return New System.Text.StringBuilder().Insert(0, "&nbsp;", (level - 1) * 5).ToString()

    End Function

    Public Function FormatSubject(ByVal subject As String) As String

        If subject.Length > 50 Then
            subject = subject.Substring(0, 50) & "..."
        End If

        Return Server.HtmlEncode(subject)

    End Function

    Protected Sub btnNewReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewReviewComment.Click

        ' Add a new source of further information
        ' cancel any pending edit that the user might have "cancelled" using the back button
        CurrentReviewCommentList.CancelEdit()
        CurrentReviewCommentList.BeginEdit()
        SwitchToReviewCommentEditView(CurrentReviewCommentList.AddNew())

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    Protected Sub grdReviewComments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdReviewComments.RowCommand

        If e.CommandName = "ViewReviewComment" Then
            ' Switch to readonly view
            ' cancel any pending edit that the user might have "cancelled" using the back button
            CurrentReviewCommentList.CancelEdit()
            CurrentReviewCommentList.BeginEdit()
            grdReviewComments.DataBind()
            SwitchToReviewCommentReadOnlyView(CurrentReviewCommentList.GetById(New Guid(e.CommandArgument.ToString())))
        End If

    End Sub

    Private Sub SwitchToReviewCommentReadOnlyView(ByVal readOnlyReviewComment As ReviewComment)

        CurrentReviewComment = readOnlyReviewComment
        litCommentSubject.Text = String.Format("<p style=""border-style:solid;border-width:1px;background-color:white;width:95%;"">{0}</p>", Server.HtmlEncode(readOnlyReviewComment.CommentSubject))
        litCommentReference.Text = String.Format("<p style=""border-style:solid;border-width:1px;background-color:white;width:95%;"">{0}</p>", Server.HtmlEncode(readOnlyReviewComment.CommentReference))
        litComment.Text = String.Format("<p style=""border-style:solid;border-width:1px;background-color:white;width:95%;height:135px;overflow-y:scroll;font-size:80%"">{0}</p>", Server.HtmlEncode(readOnlyReviewComment.CommentText).Replace(ControlChars.NewLine, "<br/>"))

        btnReplyReviewComment.Visible = ReviewCommentList.CanAddReviewComment(mProfileVersionInfo.Id)
        btnEditReviewComment.Visible = CurrentReviewComment.CanEditReviewComment()
        btnDeleteReviewComment.Visible = readOnlyReviewComment.CanDeleteReviewComment()

        pnlViewReviewComment.Visible = True
        pnlReviewComment.Visible = False
        spellUserGuidance.Visible = False

    End Sub

    Protected Sub btnReplyReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReplyReviewComment.Click
        ' Switch to edit view
        ' cancel any pending edit that the user might have "cancelled" using the back button
        CurrentReviewCommentList.CancelEdit()
        CurrentReviewCommentList.BeginEdit()
        grdReviewComments.DataBind()
        SwitchToReviewCommentEditView(CurrentReviewCommentList.AddReply(CurrentReviewComment.Id))
    End Sub

    Protected Sub btnEditReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditReviewComment.Click
        ' Switch to edit view
        ' cancel any pending edit that the user might have "cancelled" using the back button
        CurrentReviewCommentList.CancelEdit()
        CurrentReviewCommentList.BeginEdit()
        grdReviewComments.DataBind()
        SwitchToReviewCommentEditView(CurrentReviewComment)
    End Sub

    Protected Sub btnDeleteReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteReviewComment.Click

        grdReviewComments.DataBind()
        CurrentReviewCommentList.CancelEdit()
        CurrentReviewCommentList.BeginEdit()
        pnlViewReviewComment.Visible = False
        CurrentReviewCommentList.Remove(CurrentReviewComment)
        CurrentReviewCommentList.ApplyEdit()
        Try
            CurrentReviewCommentList.Save()
            lblErrorReviewComments.Text = "Review comment deletion succeeded"
        Catch ex As Csla.DataPortalException
            lblErrorReviewComments.Text = "Review comment deletion failed: " + ex.BusinessException.Message
        End Try
        CurrentReviewCommentList = ReviewCommentList.GetReviewCommentList(mProfileVersionInfo.Id, CurrentProfileSectionId)
        grdReviewComments.DataBind()

    End Sub

    Protected Sub btnCloseReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseReviewComment.Click
        CurrentReviewCommentList.CancelEdit()
        CurrentReviewComment = Nothing
        pnlViewReviewComment.Visible = False
        grdReviewComments.DataBind()
    End Sub

    Private Sub SwitchToReviewCommentEditView(ByVal editReviewComment As ReviewComment)

        If editReviewComment.IsNew Then
            lblPanelHeader.Text = "Add review comment"
        Else
            lblPanelHeader.Text = "Edit review comment"
        End If

        ' save the review comment to be edited in a member variable
        CurrentReviewComment = editReviewComment

        txtCommentSubject.Text = editReviewComment.CommentSubject
        txtCommentReference.Text = editReviewComment.CommentReference
        txtComment.Text = editReviewComment.CommentText

        pnlViewReviewComment.Visible = False
        pnlReviewComment.Visible = True
        spellUserGuidance.Visible = True

    End Sub

    Protected Sub btnSaveReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveReviewComment.Click

        CurrentReviewComment.CommentSubject = txtCommentSubject.Text
        CurrentReviewComment.CommentReference = txtCommentReference.Text
        CurrentReviewComment.CommentText = txtComment.Text
        CurrentReviewCommentList.ApplyEdit()

        Try
            CurrentReviewCommentList.Save()
            lblErrorReviewComments.Text = "Review comment save succeeded"
        Catch ex As Csla.DataPortalException
            lblErrorReviewComments.Text = "Review comment save failed: " + ex.BusinessException.Message
        End Try

        CurrentReviewComment = Nothing
        pnlReviewComment.Visible = False

        ' get the dataset data from the database and save it in session
        CurrentReviewCommentList = ReviewCommentList.GetReviewCommentList(mProfileVersionInfo.Id, CurrentProfileSectionId)
        grdReviewComments.DataBind()

    End Sub

    Protected Sub btnCancelReviewComment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelReviewComment.Click

        CurrentReviewCommentList.CancelEdit()
        CurrentReviewComment = Nothing
        pnlReviewComment.Visible = False
        grdReviewComments.DataBind()

    End Sub

    Protected Sub grdReviewComments_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdReviewComments.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim currentComment As ReviewComment = DirectCast(e.Row.DataItem, ReviewComment)
            For Each cell As TableCell In e.Row.Cells
                For Each cellControl As Control In cell.Controls
                    Dim buttonField As LinkButton = TryCast(cellControl, LinkButton)
                    If buttonField IsNot Nothing Then
                        If buttonField.CommandName = "ViewReviewComment" Then
                            buttonField.CommandArgument = currentComment.Id.ToString()
                            Exit For
                        End If
                    End If
                Next
            Next
        End If

    End Sub

#End Region

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
                InitalizeSectionPanel(master)
            End If

            mCanAddReviewComments = ReviewCommentList.CanAddReviewComment(profileVersionId)
            DisplayAddNotesButton()
        Else
            mProfileVersionInfo = Session("EditProfileVersionInfo")
            mCanAddReviewComments = ReviewCommentList.CanAddReviewComment(mProfileVersionInfo.Id)
        End If

        tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
        tabStrip.Tabs.Item(4).Visible = ProfileContributionInfoList.CanGetProfileContributionInfoList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(5).Visible = ProfileVersionSection.CanGetRevisionInformation(mProfileVersionInfo)

    End Sub


    Private Sub DisplayAddNotesButton()

        If mCanAddReviewComments Then
            lblAddReviewComments.Visible = True
            btnNewReviewComment.Visible = True
            btnReplyReviewComment.Visible = True
        Else
            lblAddReviewComments.Visible = False
            btnNewReviewComment.Visible = False
            btnReplyReviewComment.Visible = False
        End If

    End Sub

    Private Sub InitalizeSectionPanel(ByVal master As ProfilesTemplate)

        Dim profileSection As ProfileSectionMetadata = ProfileSectionMetadataList.GetProfileSectionMetadataList().GetById(CurrentProfileSectionId)

        master.PageTitle = profileSection.SectionNumber.ToString() & " " & profileSection.Name

        CurrentReviewCommentList = ReviewCommentList.GetReviewCommentList(mProfileVersionInfo.Id, CurrentProfileSectionId)
        grdReviewComments.DataBind()

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

End Class
