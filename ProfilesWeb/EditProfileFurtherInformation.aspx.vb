Imports ProfilesLibrary

Partial Class EditProfileFurtherInformation
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


#Region "Sources of further information"

    'Private Property CurrentFurtherInformationList() As NoteList
    '    Get
    '        Return DirectCast(Session("FurtherInformationList"), NoteList)
    '    End Get
    '    Set(ByVal value As NoteList)
    '        Session("FurtherInformationList") = value
    '    End Set
    'End Property

    'Private Property CurrentFurtherInformation() As Note
    '    Get
    '        Return DirectCast(Session("FurtherInformation"), Note)
    '    End Get
    '    Set(ByVal value As Note)
    '        Session("FurtherInformation") = value
    '    End Set
    'End Property

    'Protected Sub dsFurtherInformationList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsFurtherInformationList.SelectObject

    '    If Not CurrentProfileSectionId.Equals(Guid.Empty) Then

    '        If String.IsNullOrEmpty(e.SortExpression) Then
    '            e.BusinessObject = CurrentFurtherInformationList
    '        Else
    '            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of Note)(CurrentFurtherInformationList)
    '            Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
    '            Dim sortProperty As String = sortExpressionParts(0).Trim
    '            Dim direction As SortDirection = SortDirection.Ascending
    '            If sortExpressionParts.Length > 1 Then
    '                direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
    '            End If
    '            sortedProfileVersionList.ApplySort(sortProperty, direction)

    '            e.BusinessObject = sortedProfileVersionList
    '        End If

    '    End If

    'End Sub

    'Protected Sub btnNewFurtherInformation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewFurtherInformation.Click

    '    ' Add a new source of further information
    '    ' cancel any pending edit that the user might have "cancelled" using the back button
    '    CurrentFurtherInformationList.CancelEdit()
    '    CurrentFurtherInformationList.BeginEdit()
    '    SwitchToFurtherInformationEditView(CurrentFurtherInformationList.AddNew())

    'End Sub

    '<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011:ConsiderPassingBaseTypesAsParameters")> _
    'Protected Sub grdFurtherInformation_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdFurtherInformation.RowCommand

    '    If e.CommandName = "EditFurtherInformation" Then
    '        ' Switch to edit view
    '        ' cancel any pending edit that the user might have "cancelled" using the back button
    '        CurrentFurtherInformationList.CancelEdit()
    '        CurrentFurtherInformationList.BeginEdit()
    '        grdFurtherInformation.DataBind()
    '        SwitchToFurtherInformationEditView(CurrentFurtherInformationList.GetById(New Guid(e.CommandArgument.ToString())))
    '    ElseIf e.CommandName = "DeleteFurtherInformation" Then
    '        grdFurtherInformation.DataBind()
    '        CurrentFurtherInformationList.CancelEdit()
    '        CurrentFurtherInformationList.BeginEdit()
    '        Dim deletedFurtherInformation As Note = CurrentFurtherInformationList.GetById(New Guid(e.CommandArgument.ToString()))
    '        If deletedFurtherInformation.Equals(CurrentFurtherInformation) Then
    '            CurrentFurtherInformation = Nothing
    '            pnlFurtherInformation.Visible = False
    '        End If
    '        CurrentFurtherInformationList.Remove(deletedFurtherInformation)
    '        CurrentFurtherInformationList.ApplyEdit()
    '        Try
    '            CurrentFurtherInformationList.Save()
    '            lblErrorFurtherInfo.Text = "Further information deletion succeeded"
    '        Catch ex As Csla.DataPortalException
    '            lblErrorFurtherInfo.Text = "Further information deletion failed: " + ex.BusinessException.Message
    '        End Try
    '        CurrentFurtherInformationList = NoteList.GetNoteList(mProfileVersionInfo.Id, CurrentProfileSectionId, NoteType.SourceOfFurtherInformation)
    '        grdFurtherInformation.DataBind()
    '    End If

    'End Sub

    'Private Sub SwitchToFurtherInformationEditView(ByVal furtherInformation As Note)

    '    ' save the further information to be edited in a member variable, to be picked up by the
    '    ' data binding event of the data control
    '    CurrentFurtherInformation = furtherInformation
    '    txtFurtherInformation.Text = furtherInformation.NoteText
    '    txtQuestionReference.Text = furtherInformation.QuestionReference
    '    pnlFurtherInformation.Visible = True

    'End Sub

    'Protected Sub btnSaveFurtherInformation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveFurtherInformation.Click

    '    CurrentFurtherInformation.NoteText = txtFurtherInformation.Text
    '    ' CurrentFurtherInformation.QuestionReference = txtQuestionReference.Text
    '    CurrentFurtherInformationList.ApplyEdit()

    '    Try
    '        CurrentFurtherInformationList.Save()
    '        lblErrorFurtherInfo.Text = "Further information save succeeded"
    '    Catch ex As Csla.DataPortalException
    '        lblErrorFurtherInfo.Text = "Further information save failed: " + ex.BusinessException.Message
    '    End Try
    '    CurrentFurtherInformation = Nothing
    '    pnlFurtherInformation.Visible = False

    '    ' get the dataset data from the database and save it in session
    '    CurrentFurtherInformationList = NoteList.GetNoteList(mProfileVersionInfo.Id, CurrentProfileSectionId, NoteType.SourceOfFurtherInformation)
    '    grdFurtherInformation.DataBind()
    'End Sub

    'Protected Sub btnCancelFurtherInformation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelFurtherInformation.Click

    '    CurrentFurtherInformationList.CancelEdit()
    '    CurrentFurtherInformation = Nothing
    '    pnlFurtherInformation.Visible = False
    '    grdFurtherInformation.DataBind()

    'End Sub


    'Protected Sub grdFurtherInformation_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdFurtherInformation.RowDataBound

    '    Dim profileVersionId As Guid = New Guid(Request.QueryString("ProfileVersionId"))
    '    Dim canEditFurtherInformation As Boolean = NoteList.CanEditNoteList(profileVersionId, CurrentProfileSectionId)

    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim currentNote As Note = DirectCast(e.Row.DataItem, Note)
    '        For Each cell As TableCell In e.Row.Cells
    '            For Each cellControl As Control In cell.Controls
    '                Dim buttonField As LinkButton = TryCast(cellControl, LinkButton)
    '                If buttonField IsNot Nothing Then
    '                    If buttonField.CommandName = "EditFurtherInformation" OrElse buttonField.CommandName = "DeleteFurtherInformation" Then
    '                        buttonField.CommandArgument = currentNote.Id.ToString()
    '                        buttonField.Visible = canEditFurtherInformation
    '                    End If
    '                End If
    '            Next
    '        Next
    '    End If

    'End Sub

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

            If NoteList.CanEditNoteList(profileVersionId, CurrentProfileSectionId) Then
                ctlEditNoteUI.AddUIVisible = True
            Else
                ctlEditNoteUI.AddUIVisible = False
            End If

        Else
            mProfileVersionInfo = Session("EditProfileVersionInfo")
        End If

        tabStrip.Tabs.Item(0).Text = CurrentProfileVersionSection.FormattedSectionShortName
        tabStrip.Tabs.Item(3).Visible = ReviewCommentList.CanGetReviewCommentList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(4).Visible = ProfileContributionInfoList.CanGetProfileContributionInfoList(mProfileVersionInfo.Id)
        tabStrip.Tabs.Item(5).Visible = ProfileVersionSection.CanGetRevisionInformation(mProfileVersionInfo)

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

    Public Sub Notes_Error(ByVal sender As Object, ByVal e As EventArgs) Handles ctlEditNoteUI.errorEvent
        Dim lblNoteError As Label = DirectCast(panFurtherInfo.FindControl("lblNoteError"), Label)
        lblNoteError.Text = (DirectCast(e, EditNoteUI.EditNoteEventArgs)).ErrorMessage
    End Sub


End Class
