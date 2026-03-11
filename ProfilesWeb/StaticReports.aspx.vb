Imports ProfilesLibrary

Partial Class StaticReports
    Inherits System.Web.UI.Page

    Private mPublicColNum As Integer = 2 'The column index of the public column

    Private Property CurrentStaticReportList() As StaticReportList
        Get
            If Session("StaticReportList") Is Nothing Then
                Return Nothing
            End If

            Return DirectCast(Session("StaticReportList"), StaticReportList)
        End Get
        Set(ByVal value As StaticReportList)
            Session("StaticReportList") = value
        End Set
    End Property

    Private Property StaticReportId() As Guid
        Get
            If Session("StaticReportId") Is Nothing Then
                Return Guid.Empty
            End If

            Return DirectCast(Session("StaticReportId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("StaticReportId") = value
        End Set
    End Property

    Private Property IsUserManual() As Boolean
        Get
            If Session("IsUserManual") Is Nothing Then
                Return False
            End If

            Return DirectCast(Session("IsUserManual"), Boolean)
        End Get
        Set(ByVal value As Boolean)
            Session("IsUserManual") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Request.QueryString("StaticReportId") Is Nothing OrElse Not IsValidGuid(Request.QueryString("StaticReportId")) Then
                IsUserManual = (Request.QueryString("UserManual") = "1")
                CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)
                StaticReportId = Guid.Empty
                grdReports.DefaultSortExpression = "Title"
                If IsUserManual Then
                    Page.Title = "User manuals"
                    litUserManuals.Visible = True
                    litStaticReports.Visible = False
                    lblUpload.Text = "Upload a user manual"
                    lblFile.Text = "User manual:"
                    cbPublic.Checked = False
                    cbPublic.Visible = False
                    grdReports.EmptyDataText = "There are no user manuals to display."
                End If
            Else
                RefreshGridInHistoryMode()
            End If

            grdReports.DataBind()
        End If

        btnAdd.Visible = StaticReportId.Equals(Guid.Empty) AndAlso UploadStaticReportCommand.CanUploadStaticReport()

    End Sub

    Protected Sub RefreshGridInHistoryMode()
        StaticReportId = New Guid(Request.QueryString("StaticReportId"))
        CurrentStaticReportList = StaticReportList.GetStaticReportHistoryList(StaticReportId)
        If CurrentStaticReportList.Count > 0 Then
            Page.Title = "History for " & CurrentStaticReportList(0).Title
            IsUserManual = CurrentStaticReportList(0).IsUserManual
        End If
        If IsUserManual Then
            litUserManuals.Visible = True
            litStaticReports.Visible = False
            grdReports.EmptyDataText = "There are no user manuals to display."
        End If
        grdReports.DefaultSortExpression = "VersionSortValue DESC"
    End Sub

    Protected Sub dsStaticReportList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsStaticReportList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentStaticReportList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of StaticReport)(CurrentStaticReportList)
            sortedProfileVersionList.ApplySort(e.SortProperty, e.SortDirection)
            e.BusinessObject = sortedProfileVersionList
        End If

    End Sub

    Protected Sub grdReports_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdReports.RowCommand

        'if history button selected, update history grid label and load report history
        Select Case e.CommandName.ToLower

            'if delete command then remove report from list and save changes
            Case "delete"
                Dim staticReportVersionId As Guid = New Guid(e.CommandArgument.ToString())
                Dim deleteReport As StaticReport = CurrentStaticReportList.GetById(staticReportVersionId)
                Dim fileType As String = "report"
                If IsUserManual Then
                    fileType = "user manual"
                End If

                Try
                    CurrentStaticReportList.Remove(deleteReport)
                    CurrentStaticReportList.Save()
                    lblReportMessage.Text = String.Format("The {0} version was successfully deleted", fileType)
                Catch ex As Csla.DataPortalException
                    lblReportMessage.Text = String.Format("The {0} version could not be deleted: {1}", fileType, ex.BusinessException.Message)
                End Try

                CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)

                grdReports.DataBind()

            Case "changeaccess"
                Dim staticReportVersionId As Guid = New Guid(e.CommandArgument.ToString())

                SetStaticReportPublicAccessCommand.SetStaticReportPublicAccess(staticReportVersionId)
                RefreshGridInHistoryMode()
                grdReports.DataBind()

        End Select

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlReportUpload.Visible = True
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlReportUpload.Visible = False
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim fileType As String = "report"
        If IsUserManual Then
            fileType = "user manual"
        End If

        Try
            If filReport.PostedFile IsNot Nothing AndAlso filReport.PostedFile.ContentType <> "application/pdf" Then
                Throw New ApplicationException(String.Format("The uploaded {0} must be a Pdf", fileType))
            End If
            If filReport.FileName.Length < 5 Then
                Throw New ApplicationException("The filename was less than 5 characters long")
            End If
            If cbPublic.Checked Then
                UploadStaticReportCommand.UploadStaticReport(filReport.FileName.Substring(0, filReport.FileName.Length - 4), filReport.FileBytes, IsUserManual, True)
            Else
                UploadStaticReportCommand.UploadStaticReport(filReport.FileName.Substring(0, filReport.FileName.Length - 4), filReport.FileBytes, IsUserManual, False)
            End If
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("The {0} was uploaded successfully", fileType)
            lblReportMessage.Visible = True
            cbPublic.Checked = False
        Catch ex As Csla.DataPortalException
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("Failed to upload the {0}: {1}", fileType, ex.BusinessException.Message)
            lblReportMessage.Visible = True
        Catch aex As ApplicationException
            pnlReportUpload.Visible = False
            lblReportMessage.Text = String.Format("Failed to upload the {0}: {1}", fileType, aex.Message)
            lblReportMessage.Visible = True
        End Try

        CurrentStaticReportList = StaticReportList.GetCurrentStaticReportList(IsUserManual)
        grdReports.DataBind()

    End Sub

    Protected Sub grdReports_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdReports.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim lnkViewStaticReportVersion As HyperLink = DirectCast(e.Row.Cells(0).FindControl("lnkViewStaticReportVersion"), HyperLink)
            Dim lnkHistory As HyperLink = DirectCast(e.Row.Cells(0).FindControl("lnkHistory"), HyperLink)
            Dim lnkDelete As LinkButton = DirectCast(e.Row.Cells(0).FindControl("lnkDelete"), LinkButton)
            Dim lnkChangeAccess As LinkButton = DirectCast(e.Row.Cells(0).FindControl("lnkChangeAccess"), LinkButton)
            Dim cbeDelete As AjaxControlToolkit.ConfirmButtonExtender = DirectCast(e.Row.Cells(0).FindControl("cbeDelete"), AjaxControlToolkit.ConfirmButtonExtender)
            Dim staticReportInfo As StaticReport = DirectCast(e.Row.DataItem, StaticReport)

            'use javascript rather than target="_blank", because it gives a better user experience if the SSO session has timed out
            'when the user clicks the link
            lnkViewStaticReportVersion.Attributes.Add("onclick", String.Format("window.open('ShowStaticReport.aspx?StaticReportVersionId={0}');return false;", staticReportInfo.Id.ToString()))

            lnkHistory.NavigateUrl = String.Format("StaticReports.aspx?StaticReportId={0}", staticReportInfo.StaticReportId.ToString())
            lnkHistory.Visible = StaticReportId.Equals(Guid.Empty)
            lnkDelete.Visible = StaticReportId.Equals(Guid.Empty) AndAlso staticReportInfo.CanDelete
            lnkChangeAccess.Visible = Not StaticReportId.Equals(Guid.Empty) AndAlso staticReportInfo.CanMakePublic
            If IsUserManual Then
                cbeDelete.ConfirmText = "Are you sure you want to delete this user manual?"
                lnkHistory.NavigateUrl += "&UserManual=1"
            End If
        End If

    End Sub

    Protected Sub grdReports_DataBound(ByVal sender As Object, ByVal e As EventArgs) Handles grdReports.DataBound

        If IsUserManual Then
            DirectCast(sender, GridView).Columns(mPublicColNum).Visible = False
        End If

    End Sub

End Class
