Imports ProfilesLibrary

Partial Class ReferenceTableAuditTrail
    Inherits System.Web.UI.Page

    Private ReadOnly Property CurrentReferenceDataAuditList() As ReferenceDataAuditTrailInfoList
        Get
            If Request.QueryString("ReferenceTableId") Is Nothing Then
                Throw New InvalidOperationException("There was an invalid or missing reference table id passed to the page.")
            End If

            If Not IsValidGuid(Request.QueryString("ReferenceTableId")) Then
                Throw New InvalidOperationException("There was an invalid or missing reference table id passed to the page.")
            End If

            Return ReferenceDataAuditTrailInfoList.GetReferenceTableAuditInfoList(New Guid(Request.QueryString("ReferenceTableId")))

        End Get
    End Property

    Protected Sub dsReferenceDataAuditTrailInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsReferenceDataAuditTrailInfoList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentReferenceDataAuditList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of ReferenceDataAuditTrailInfo)(CurrentReferenceDataAuditList)
            Dim sortExpressionParts As String() = e.SortExpression.Split(" ")
            Dim sortProperty As String = sortExpressionParts(0).Trim
            Dim direction As SortDirection = SortDirection.Ascending
            If sortExpressionParts.Length > 1 Then
                direction = IIf(sortExpressionParts(1).Trim = "ASC", SortDirection.Ascending, SortDirection.Descending)
            End If
            sortedProfileVersionList.ApplySort(sortProperty, direction)

            e.BusinessObject = sortedProfileVersionList
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ReferenceDataAuditTrailInfoList.CanGetList Then
            Throw New System.Security.SecurityException("You do not have permission to view the reference table audit trail page")
        End If

        If Request.QueryString("ReferenceTableId") Is Nothing Then
            Throw New InvalidOperationException("There was an invalid or missing reference table id passed to the page.")
        End If

        If Not IsValidGuid(Request.QueryString("ReferenceTableId")) Then
            Throw New InvalidOperationException("There was an invalid or missing reference table id passed to the page.")
        End If


        If Not Page.IsPostBack Then
            grdAuditTrail.DataBind()

            Dim command As GetReferenceTableNameCommand = GetReferenceTableNameCommand.Execute(New Guid(Request.QueryString("ReferenceTableId")))
            Page.Title = "Audit trail for reference table : " & command.ReferenceTableName

            lnkReferenceTable.NavigateUrl = "MaintainReferenceData.aspx?ReferenceTableId=" & Request.QueryString("ReferenceTableId").ToString()
            Dim tbNameBold = $"<strong>{command.ReferenceTableName}</strong>"
            lblPanelTitle.Text = tbNameBold & " : Reference data change"

			RefreshPage()
		End If

    End Sub

    Protected Sub grdAuditTrail_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdAuditTrail.RowCommand
        If e.CommandName = "ViewDetails" Then
            FillPanel(CurrentReferenceDataAuditList.GetById(New Guid(e.CommandArgument.ToString())))
        End If
    End Sub

    Private Sub FillPanel(ByVal currentDataAudit As ReferenceDataAuditTrailInfo)

        Dim CurrentReferenceDataAudit As ReferenceDataAuditTrailInfo
        CurrentReferenceDataAudit = currentDataAudit

        txtOldValue.Text = currentDataAudit.OldValue
        txtOldValueSpan.InnerHtml = currentDataAudit.OldValue
        txtNewValue.Text = currentDataAudit.NewValue
        txtNewValueSpan.InnerHtml = currentDataAudit.NewValue
        txtUser.Text = currentDataAudit.User
        txtUserSpan.InnerHtml = currentDataAudit.User
        txtReasonForChange.Text = currentDataAudit.ReasonForChange
        txtReasonForChangeSpan.InnerHtml = currentDataAudit.ReasonForChange
        txtDateOfChange.Text = currentDataAudit.DateOfChange.ToString()
        txtDateOfChangeSpan.InnerHtml = currentDataAudit.DateOfChange.ToString()

        If Not pnlAuditDetails.Visible Then
            pnlAuditDetails.Visible = True
        End If

    End Sub

    Protected Sub grdAuditTrail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdAuditTrail.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim currentAuditInfo As ReferenceDataAuditTrailInfo = DirectCast(e.Row.DataItem, ReferenceDataAuditTrailInfo)
            For Each cell As TableCell In e.Row.Cells
                For Each cellControl As Control In cell.Controls
                    Dim buttonField As LinkButton = TryCast(cellControl, LinkButton)
                    If buttonField IsNot Nothing Then
                        buttonField.CommandArgument = currentAuditInfo.Id.ToString()
                    End If
                Next
            Next
        End If

    End Sub
    Private Sub bottomPaginator_PageChanged(sender As Object, e As PageChangedEvent) Handles bottomPaginator.PageChanged

        grdAuditTrail.PageIndex = bottomPaginator.CurrentPage - 1
        RefreshPage()

    End Sub

	Private Sub PaginatorPageSize_PageSizeChanged(sender As Object, e As PageSizeChangedEvent) Handles PaginatorPageSize.PageSizeChanged
		RefreshPage()
	End Sub

	Private Sub RefreshPage()
        grdAuditTrail.DataBind()
        bottomPaginator.TotalPages = grdAuditTrail.PageCount
        bottomPaginator.Visible = bottomPaginator.TotalPages > 1
    End Sub



End Class
