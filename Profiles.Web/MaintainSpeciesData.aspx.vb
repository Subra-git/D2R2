Imports ProfilesLibrary
Imports Telerik.Web.UI
Imports System.Collections.Generic
Imports Profiles.Contracts.DataContracts
Imports Profiles.WebControls

Partial Class MaintainSpeciesData
    Inherits System.Web.UI.Page

    Private Property CurrentSpeciesDataChange() As SpeciesDataChange
        Get
            Return DirectCast(Session("CurrentSpeciesDataChange"), SpeciesDataChange)
        End Get
        Set(ByVal value As SpeciesDataChange)
            Session("CurrentSpeciesDataChange") = value
        End Set
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        AddHandler treeSelection.SelectionRemoved, AddressOf TreeSelection_SelectionRemoved

        If Not Page.IsPostBack Then
            CurrentSpeciesDataChange = Nothing
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not SpeciesDataAuditTrailInfoList.CanGetList Then
            Throw New System.Security.SecurityException("You do not have permission to view the 'Maintain species' page")
        End If

        If Not Page.IsPostBack Then
            Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
            AddTreeNodes(speciesList, tvwSpecies.Nodes)
            hdnLastFocusedButton.Value = String.Empty
        End If
    End Sub

    Private Sub AddTreeNodes(ByVal speciesList As SpeciesInfoList, ByVal speciesNodeList As RadTreeNodeCollection)
        'Recursive function that draws the species tree

        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim speciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            speciesNodeList.Add(speciesNode)

            'Handle inactive species
            If Not speciesChild.IsActive Then
                speciesNode.Enabled = False
                'speciesNode.Category = "Inactive"
                speciesNode.Text = $"{speciesNode.Text} (inactive)"
               
            End If

            AddTreeNodes(speciesChild.ChildList, speciesNode.Nodes)

            speciesNode.Expanded = True
        Next

    End Sub

    Private Sub HidePanel()

        txtReasonForChange.Text = String.Empty
        pnlAmendSpeciesData.Visible = False
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        If CurrentSpeciesDataChange IsNot Nothing Then
            CurrentSpeciesDataChange.CancelEdit()
        End If
        CurrentSpeciesDataChange = Nothing
        HidePanel()
    End Sub

    Private Sub SwitchToSpeciesChangeView(ByVal change As SpeciesDataChange)

        CurrentSpeciesDataChange = change

        lblPanelTitle.Text = change.Action.ToString() & " species data value"
        BuildParentDropdown(change.SpeciesId)
        ddlNewParent.SelectedValue = change.ParentId.ToString()

        txtReasonForChange.Text = String.Empty
        txtOldName.Text = change.OldName
        txtOldNameSpan.InnerHtml = change.OldName
        txtNewName.Text = change.OldName
        txtOldParent.Text = change.OldParent
        txtOldParentSpan.InnerHtml = change.OldParent
        If change.Action = ChangeActionType.Add Then
            txtNewName.Text = String.Empty
            txtOldParent.Text = change.OldParent
            ddlNewParent.SelectedIndex = 0
        ElseIf change.Action = ChangeActionType.Edit Then
            txtNewName.Text = change.OldName
        ElseIf change.Action = ChangeActionType.Delete Then
            txtNewName.Text = "- to be deleted -"
        ElseIf change.Action = ChangeActionType.Inactivate Then
            txtNewName.Text = "- to be inactivated -"

        End If


        If change.Action = ChangeActionType.Inactivate OrElse change.Action = ChangeActionType.Delete Then
            ddlNewParent.SelectedIndex = 0
            ddlNewParent.Enabled = False
            valNewParent.Enabled = False
            txtNewName.Enabled = False
            btnSave.Text = change.Action.ToString()
        Else
            RegisterTinyMCE()
            txtNewName.Visible = True
            ddlNewParent.Enabled = True
            valNewParent.Enabled = True
            btnSave.Text = "Save"
            txtNewName.Visible = True
        End If

        If Not pnlAmendSpeciesData.Visible Then
            pnlAmendSpeciesData.Visible = True
        End If

    End Sub

    Private Sub BuildParentDropdown(ByVal speciesid As Guid)

        ddlNewParent.Items.Clear()
        Dim liSelect As ListItem = New ListItem("Please select...", "", True)
        Dim liRoot As ListItem = New ListItem("- root species -", Guid.Empty.ToString(), True)
        ddlNewParent.Items.Add(liSelect)
        ddlNewParent.Items.Add(liRoot)
        ddlNewParent.DataSource = SpeciesValidParentList.GetList(speciesid)
        ddlNewParent.DataBind()

    End Sub

    Private Function IsNodeSelected() As NodeSelectionResult

        Return CommonTree.IsNodeSelected(tvwSpecies)

    End Function

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False
        Try
            Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(ChangeActionType.Add)
            SwitchToSpeciesChangeView(change)

        Catch ex As Csla.DataPortalException
            lblSelectNode.Text = ex.BusinessException.Message
            lblSelectNode.Visible = True
        End Try

    End Sub


    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False

        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Try

                Dim valueId As Guid = New Guid(validationResult.SelectedNodeId)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, ChangeActionType.Delete)
                SwitchToSpeciesChangeView(change)

            Catch ex As Csla.DataPortalException
                lblSelectNode.Text = ex.BusinessException.Message
                lblSelectNode.Visible = True
            End Try

        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to delete"
        End If
    End Sub

    Protected Sub btnEditNameParent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditNameParent.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False

        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Try

                Dim valueId As Guid = New Guid(validationResult.SelectedNodeId)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, ChangeActionType.Edit)

                SwitchToSpeciesChangeView(change)

            Catch ex As Csla.DataPortalException
                lblSelectNode.Text = ex.BusinessException.Message
                lblSelectNode.Visible = True
            End Try

        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to edit"
        End If
    End Sub

    Protected Sub btnEditData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditData.Click
        lblSelectNode.Text = String.Empty
        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Session("SpeciesEditPreviousPage") = "MaintainSpeciesData"
            Response.Redirect("EditSpecies.aspx?SpeciesId=" & validationResult.SelectedNodeId)
        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to edit"
        End If
    End Sub


    Protected Sub btnInactivate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInactivate.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False

        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Try

                Dim valueId As Guid = New Guid(validationResult.SelectedNodeId)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, ChangeActionType.Inactivate)
                SwitchToSpeciesChangeView(change)

            Catch ex As Csla.DataPortalException
                lblSelectNode.Text = String.Empty
                lblSelectNode.Text = ex.BusinessException.Message
                lblSelectNode.Visible = True
            End Try

        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to inactivate"
        End If
    End Sub

    Protected Sub btnReorderList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReorderList.Click
        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            ToggleReorderMode(True)
            lblSelectNode.Visible = False
        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to edit"
        End If
    End Sub

    Protected Sub btnReorderDone_Click(sender As Object, e As EventArgs) Handles btnReorderDone.Click
        ToggleReorderMode(False)
    End Sub

    Private Sub ToggleReorderMode(showReorderControls As Boolean)
        btnMoveSpeciesUp.Visible = showReorderControls
        btnMoveSpeciesDown.Visible = showReorderControls
        btnReorderList.Visible = Not showReorderControls
        btnReorderDone.Visible = showReorderControls

        btnAdd.Visible = Not showReorderControls
        btnEditNameParent.Visible = Not showReorderControls
        btnEditData.Visible = Not showReorderControls
        btnDelete.Visible = Not showReorderControls
        btnInactivate.Visible = Not showReorderControls
        btnViewAuditTrail.Visible = Not showReorderControls

        treeSelection.RemoveSelectionVisible = Not showReorderControls
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        If txtNewName.Text.StripHtmlTags.Replace(vbLf, "").Length > 50 Then
            Dim err As New CustomValidator
            err.ValidationGroup = "valSumChangeValue"
            err.IsValid = False
            err.ErrorMessage = "The new species name must be no longer than 50 characters"
            Page.Validators.Add(err)
            RegisterTinyMCE()
            Return
        End If

        If Page.IsValid Then

            Try
                CurrentSpeciesDataChange.Reason = txtReasonForChange.Text

                If CurrentSpeciesDataChange.Action = ChangeActionType.Add OrElse CurrentSpeciesDataChange.Action = ChangeActionType.Edit Then
                    CurrentSpeciesDataChange.NewName = txtNewName.Text.Trim().StripPTags().StripBreakTags().Replace(vbLf, "")
                    CurrentSpeciesDataChange.ParentId = New Guid(ddlNewParent.SelectedValue)
                End If

                CurrentSpeciesDataChange.ApplyEdit()
                CurrentSpeciesDataChange.Save()

                lblErrorMsg.Text = "Your change to the species data was successfully saved"
            Catch aex As SpeciesDataNoChangeException
                lblErrorMsg.Text = aex.Message
            Catch ex As Csla.DataPortalException
                lblErrorMsg.Text = ex.BusinessException.Message
            End Try

            CurrentSpeciesDataChange = Nothing
            HidePanel()

            tvwSpecies.Nodes.Clear()
            Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
            AddTreeNodes(speciesList, tvwSpecies.Nodes)
        End If

    End Sub

    Protected Sub btnMoveSpeciesUp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMoveSpeciesUp.Click
        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Dim node As RadTreeNode = tvwSpecies.FindNodeByValue(validationResult.SelectedNodeId)
            If validationResult.IsValid AndAlso node.Prev() IsNot Nothing Then
                Dim valueId As Guid = New Guid(validationResult.SelectedNodeId)
                ProfilesLibrary.ChangeSpeciesPositionCommand.Execute(valueId, True)
                RedrawTree(valueId)
            End If
            treeSelection.RemoveSelectionVisible = False
        End If
    End Sub

    Protected Sub btnMoveSpeciesDown_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMoveSpeciesDown.Click
        Dim validationResult As NodeSelectionResult = IsNodeSelected()
        If validationResult.IsValid Then
            Dim node As RadTreeNode = tvwSpecies.FindNodeByValue(validationResult.SelectedNodeId)
            If validationResult.IsValid AndAlso node.Next() IsNot Nothing Then
                Dim valueId As Guid = New Guid(validationResult.SelectedNodeId)
                ProfilesLibrary.ChangeSpeciesPositionCommand.Execute(valueId, False)
                RedrawTree(valueId)
            End If
            treeSelection.RemoveSelectionVisible = False
        End If
    End Sub

    Private Sub RedrawTree(ByVal speciesId As Guid)

        tvwSpecies.EnableAriaSupport = True

        Dim dictionaryIsExpanded As New Dictionary(Of Guid, Boolean)
        For Each node As RadTreeNode In tvwSpecies.GetAllNodes()
            dictionaryIsExpanded.Add(New Guid(node.Value), node.Expanded)
        Next

        tvwSpecies.Nodes.Clear()

        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        AddTreeNodes(speciesList, tvwSpecies.Nodes)

        For Each node As RadTreeNode In tvwSpecies.GetAllNodes()
            If dictionaryIsExpanded.ContainsKey(New Guid(node.Value)) Then
                node.Expanded = dictionaryIsExpanded(New Guid(node.Value))
            End If
        Next

        Dim selectedNode As RadTreeNode = tvwSpecies.FindNodeByValue(speciesId.ToString())
        If selectedNode IsNot Nothing Then
            selectedNode.Selected = True
            selectedNode.Checked = True
        End If

    End Sub

    Private Sub RegisterTinyMCE()
        TinyMCEHelper.RegisterTinyMCE($"#{txtNewName.ClientID}", TinyMCEEditorType.SingleLineEditor, Me, , "body { font-size: 20px;}")

    End Sub
    Protected Sub DdlNewParent_SelectedIndexChanged(sender As Object, e As EventArgs)
        RegisterTinyMCE()
    End Sub

    Protected Sub TreeSelection_SelectionRemoved(ByVal sender As Object, ByVal e As EventArgs)
        ToggleReorderMode(False)
        lblSelectNode.Text = String.Empty
        treeSelection.ClearSelection()
        tvwSpecies.UncheckAllNodes()
        tvwSpecies.UnselectAllNodes()
    End Sub

End Class