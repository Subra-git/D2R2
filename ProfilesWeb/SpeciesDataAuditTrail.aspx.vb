Imports ProfilesLibrary

Partial Class SpeciesDataAuditTrail
    Inherits System.Web.UI.Page

    Private ReadOnly Property CurrentSpeciesDataAuditTrailInfoList() As SpeciesDataAuditTrailInfoList
        Get
            Return SpeciesDataAuditTrailInfoList.GetSpeciesDataAuditTrailInfoList()
        End Get
    End Property


    Private Property CurrentSpeciesDataAuditTrailInfo() As SpeciesDataAuditTrailInfo
        Get
            Return DirectCast(Session("CurrentAudit"), SpeciesDataAuditTrailInfo)
        End Get
        Set(ByVal value As SpeciesDataAuditTrailInfo)
            Session("CurrentAudit") = value
        End Set
    End Property

    Protected Sub dsSpeciesDataAuditTrailInfoList_SelectObject(ByVal sender As Object, ByVal e As Csla.Web.SelectObjectArgs) Handles dsSpeciesDataAuditTrailInfoList.SelectObject

        If String.IsNullOrEmpty(e.SortExpression) Then
            e.BusinessObject = CurrentSpeciesDataAuditTrailInfoList
        Else
            Dim sortedProfileVersionList As New Csla.SortedBindingList(Of SpeciesDataAuditTrailInfo)(CurrentSpeciesDataAuditTrailInfoList)
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

        If Not SpeciesDataAuditTrailInfoList.CanGetList Then
            Throw New System.Security.SecurityException("You do not have permission to view the species table audit trail page")
        End If


        If Not Page.IsPostBack Then
            grdAuditTrail.DataBind()

        End If

    End Sub

    Protected Sub grdAuditTrail_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdAuditTrail.RowCommand
        If e.CommandName = "ViewDetails" Then

            Dim currentSpeciesAuditId As New Guid(CStr(e.CommandArgument))

            CurrentSpeciesDataAuditTrailInfo = CurrentSpeciesDataAuditTrailInfoList.GetItemById(currentSpeciesAuditId)

            FillPanel(CurrentSpeciesDataAuditTrailInfo)
        End If
    End Sub

    Private Sub FillPanel(ByVal currentDataAudit As SpeciesDataAuditTrailInfo)

        Dim CurrentSpeciesAudit As SpeciesDataAuditTrailInfo
        CurrentSpeciesAudit = currentDataAudit
        lblPanelTitle.Text = "Details of change to "
        If CurrentSpeciesAudit.NewName.StartsWith("- to be") Then
            lblPanelTitle.Text += CurrentSpeciesAudit.OldName
        Else
            lblPanelTitle.Text += CurrentSpeciesAudit.NewName
        End If
        txtOldName.Text = CurrentSpeciesAudit.OldName
        txtNewName.Text = CurrentSpeciesAudit.NewName
        txtOldParent.Text = CurrentSpeciesAudit.OldParent
        txtNewParent.Text = CurrentSpeciesAudit.NewParent
        txtUser.Text = CurrentSpeciesAudit.User
        txtDateOfChange.Text = CurrentSpeciesAudit.LogDate
        txtReasonForChange.Text = CurrentSpeciesAudit.Reason

        If Not pnlAuditDetails.Visible Then
            pnlAuditDetails.Visible = True
        End If
    End Sub

End Class
