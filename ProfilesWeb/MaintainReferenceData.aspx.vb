Imports ProfilesLibrary

Partial Class MaintainReferenceData
    Inherits System.Web.UI.Page

    Private Property CurrentReferenceTableId() As Guid
        Get
            If Session("CurrentReferenceTableId") Is Nothing Then
                Return Guid.Empty
            End If
            Return DirectCast(Session("CurrentReferenceTableId"), Guid)
        End Get
        Set(ByVal value As Guid)
            Session("CurrentReferenceTableId") = value
        End Set
    End Property

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Property CurrentReferenceValueInfoList() As ReferenceValueInfoList
        Get
            If Session("RefValueInfoList") Is Nothing Then
                Return ReferenceValueInfoList.GetList(CurrentReferenceTableId)
            Else
                Return DirectCast(Session("RefValueInfoList"), ReferenceValueInfoList)
            End If
        End Get
        Set(ByVal value As ReferenceValueInfoList)
            Session("RefValueInfoList") = value
        End Set
    End Property

    Private Property CurrentReferenceValueChange() As ReferenceValueChange
        Get
            Return DirectCast(Session("CurrentReferenceValueChange"), ReferenceValueChange)
        End Get
        Set(ByVal value As ReferenceValueChange)
            Session("CurrentReferenceValueChange") = value
        End Set
    End Property


    Protected Sub dsReferenceTableInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsReferenceTableInfoList.SelectObject
        e.BusinessObject = CommonUI.GetReferenceTableInfoList()
    End Sub

    Protected Sub dsReferenceValueInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsReferenceValueInfoList.SelectObject

        If Not CurrentReferenceTableId = Guid.Empty Then

            If String.IsNullOrEmpty(e.SortExpression) Then
                e.BusinessObject = CurrentReferenceValueInfoList
            Else
                Dim sortedProfileVersionList As New Csla.SortedBindingList(Of ReferenceValueInfo)(CurrentReferenceValueInfoList)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not ReferenceTableInfoList.CanGetList Then
            Throw New System.Security.SecurityException("You do not have permission to view the maintain reference data page")
        End If

        If Not Page.IsPostBack Then
            If Request.QueryString("ReferenceTableId") Is Nothing Then
                CurrentReferenceTableId = Guid.Empty
                grdReferenceValueList.DataBind()
            Else

                If Not IsValidGuid(Request.QueryString("ReferenceTableId")) Then
                    Throw New InvalidOperationException("There was an invalid or missing reference table id passed to the page.")
                End If

                Dim referenceTableId As New Guid(Request.QueryString("ReferenceTableId"))
                ddlReferenceTable.SelectedValue = referenceTableId.ToString()
                ShowGrid(referenceTableId)

            End If
        End If

    End Sub

    Protected Sub ddlReferenceTable_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlReferenceTable.SelectedIndexChanged

        If ddlReferenceTable.SelectedIndex = 0 Then
            HideGrid()
        Else
            ShowGrid(New Guid(ddlReferenceTable.SelectedValue))
        End If

    End Sub

    Private Sub ShowGrid(ByVal referenceTableId As Guid)

        CurrentReferenceTableId = referenceTableId

        pnlAmendReferenceValue.Visible = False
        ResetPanelControls()

        grdReferenceValueList.Visible = True

        grdReferenceValueList.DataBind()

        btnAddReferenceValue.Visible = True
        btnViewAuditTrail.Visible = True

        btnViewAuditTrail.PostBackUrl = "ReferenceTableAuditTrail.aspx?ReferenceTableId=" & referenceTableId.ToString()

    End Sub

    Private Sub HideGrid()

        pnlAmendReferenceValue.Visible = False
        ResetPanelControls()

        grdReferenceValueList.Visible = False

        btnAddReferenceValue.Visible = False
        btnViewAuditTrail.Visible = False

        CurrentReferenceTableId = Guid.Empty

    End Sub

    Protected Sub grdReferenceValueList_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdReferenceValueList.RowCommand

        If Not e.CommandName = "Page" AndAlso Not e.CommandName = "Sort" Then

            Dim action As Profiles.Contracts.DataContracts.ChangeActionType
            Select Case e.CommandName
                Case "EditReferenceData"
                    action = Profiles.Contracts.DataContracts.ChangeActionType.Edit
                Case "DeleteReferenceData"
                    action = Profiles.Contracts.DataContracts.ChangeActionType.Delete
                Case "InactivateReferenceData"
                    action = Profiles.Contracts.DataContracts.ChangeActionType.Inactivate
                Case Else
                    Return
            End Select

            Dim valueId As New Guid(CStr(e.CommandArgument))
            Dim change As ReferenceValueChange = ReferenceValueChange.NewReferenceValueChange(valueId, New Guid(ddlReferenceTable.SelectedItem.Value), action)
            SwitchToReferenceChangeEditView(change)

        End If

    End Sub

    Private Sub SwitchToReferenceChangeEditView(ByVal change As ReferenceValueChange)

        ResetPanelControls()

        CurrentReferenceValueChange = change

        txtOldValue.Text = change.OldValue
        txtNewValue.Text = change.NewValue
        txtNewValue.Enabled = change.CanEditNewValue()
        lblWarning.Visible = change.IsInUse()

        lblPanelTitle.Text = ddlReferenceTable.SelectedItem.Text & " : " & change.Action.ToString() & " reference data value"

        If change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Inactivate OrElse change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Delete Then
            btnSave.Text = change.Action.ToString()
        Else
            btnSave.Text = "Save"
        End If

        If Not pnlAmendReferenceValue.Visible Then
            pnlAmendReferenceValue.Visible = True
        End If

    End Sub

    Private Sub ResetPanelControls()

        txtNewValue.Text = String.Empty
        txtOldValue.Text = String.Empty
        txtReasonForChange.Text = String.Empty

    End Sub

    Protected Sub btnAddReferenceValue_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim change As ReferenceValueChange = ReferenceValueChange.NewReferenceValueChange(New Guid(ddlReferenceTable.SelectedItem.Value))


        SwitchToReferenceChangeEditView(change)

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        ResetPanelControls()

        CurrentReferenceValueChange.CancelEdit()
        pnlAmendReferenceValue.Visible = False
        grdReferenceValueList.DataBind()

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        If Page.IsValid Then

            Try
                If CurrentReferenceValueChange.CanEditNewValue Then
                    CurrentReferenceValueChange.NewValue = txtNewValue.Text
                End If

                CurrentReferenceValueChange.ReasonForChange = txtReasonForChange.Text

                CurrentReferenceValueChange.ApplyEdit()
                CurrentReferenceValueChange.Save()

                lblErrorMsg.Text = "Reference value change successfully saved"
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = "Reference value change failed:" & ex.BusinessException.Message
                CurrentReferenceValueInfoList = Nothing
            End Try

            CurrentReferenceValueChange = Nothing
            pnlAmendReferenceValue.Visible = False

            grdReferenceValueList.DataBind()

        End If
    End Sub
End Class
