Imports ProfilesLibrary
Imports Telerik.WebControls
Imports System.Collections.Generic

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

        If Page.IsPostBack Then
            If CurrentSpeciesDataChange IsNot Nothing Then
                '  InitializeChangeEntryListUI()
            End If
        Else
            CurrentSpeciesDataChange = Nothing
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not SpeciesDataAuditTrailInfoList.CanGetList Then
            Throw New System.Security.SecurityException("You do not have permission to view the 'Maintain species' page")
        End If

        If Not Page.IsPostBack Then

            'Populate initial species tree
            Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
            AddTreeNodes(speciesList, tvwSpecies.Nodes)
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
                speciesNode.Text = speciesNode.Text + " (inactive)"
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
        If Not CurrentSpeciesDataChange Is Nothing Then
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
        txtNewName.Text = change.OldName
        txtOldParent.Text = ddlNewParent.SelectedItem.Text

        If change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Add Then
            txtNewName.Text = String.Empty
            txtOldParent.Text = change.OldParent
            ddlNewParent.SelectedIndex = 0
        ElseIf change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Delete Then
            txtNewName.Text = "- to be deleted -"
        ElseIf change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Inactivate Then
            txtNewName.Text = "- to be inactivated -"
        End If


        If change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Inactivate OrElse change.Action = Profiles.Contracts.DataContracts.ChangeActionType.Delete Then
            ddlNewParent.SelectedIndex = 0
            ddlNewParent.Enabled = False
            valNewParent.Enabled = False
            txtNewName.Enabled = False
            btnSave.Text = change.Action.ToString()
        Else
            txtNewName.Enabled = True
            ddlNewParent.Enabled = True
            valNewParent.Enabled = True
            btnSave.Text = "Save"
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

    Private Function IsNodeSelected() As Boolean

        If tvwSpecies.SelectedNode Is Nothing Then
            Return False
        End If

        Return IsValidGuid(tvwSpecies.SelectedNode.Value)

    End Function

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False
        Try
            Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(Profiles.Contracts.DataContracts.ChangeActionType.Add)
            SwitchToSpeciesChangeView(change)

        Catch ex As Csla.DataPortalException
            lblSelectNode.Text = ex.BusinessException.Message
            lblSelectNode.Visible = True
        End Try

    End Sub


    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False

        If IsNodeSelected() Then
            Try

                Dim valueId As Guid = New Guid(tvwSpecies.SelectedNode.Value)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, Profiles.Contracts.DataContracts.ChangeActionType.Delete)
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

        If IsNodeSelected() Then

            Try

                Dim valueId As Guid = New Guid(tvwSpecies.SelectedNode.Value)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, Profiles.Contracts.DataContracts.ChangeActionType.Edit)

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
        If IsNodeSelected() Then
            Session("SpeciesEditPreviousPage") = "MaintainSpeciesData"
            Response.Redirect("EditSpecies.aspx?SpeciesId=" & tvwSpecies.SelectedNode.Value)
        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to edit"
        End If
    End Sub


    Protected Sub btnInactivate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInactivate.Click

        lblSelectNode.Text = String.Empty
        pnlAmendSpeciesData.Visible = False

        If IsNodeSelected() Then

            Try

                Dim valueId As Guid = New Guid(tvwSpecies.SelectedNode.Value)
                Dim change As SpeciesDataChange = SpeciesDataChange.NewSpeciesDataChange(valueId, Profiles.Contracts.DataContracts.ChangeActionType.Inactivate)
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

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If Page.IsValid Then

            Try
                CurrentSpeciesDataChange.Reason = txtReasonForChange.Text

                If CurrentSpeciesDataChange.Action = Profiles.Contracts.DataContracts.ChangeActionType.Add OrElse CurrentSpeciesDataChange.Action = Profiles.Contracts.DataContracts.ChangeActionType.Edit Then
                    CurrentSpeciesDataChange.NewName = txtNewName.Text.Trim()
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

        If IsNodeSelected() Then
            If Not tvwSpecies.SelectedNode.Prev() Is Nothing Then
                Dim valueId As Guid = New Guid(tvwSpecies.SelectedNode.Value)
                ProfilesLibrary.ChangeSpeciesPositionCommand.Execute(valueId, True)
                RedrawTree(valueId)
            End If
        End If

    End Sub

    Protected Sub btnMoveSpeciesDown_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnMoveSpeciesDown.Click

        If IsNodeSelected() Then
            If Not tvwSpecies.SelectedNode.Next Is Nothing Then
                Dim valueId As Guid = New Guid(tvwSpecies.SelectedNode.Value)
                ProfilesLibrary.ChangeSpeciesPositionCommand.Execute(valueId, False)
                RedrawTree(valueId)
            End If
        End If

    End Sub

    Private Sub RedrawTree(ByVal speciesId As Guid)

        Dim dictionaryIsExpanded As New Dictionary(Of Guid, Boolean)
        For Each node As Telerik.WebControls.RadTreeNode In tvwSpecies.GetAllNodes()
            dictionaryIsExpanded.Add(New Guid(node.Value), node.Expanded)
        Next

        tvwSpecies.Nodes.Clear()

        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        AddTreeNodes(speciesList, tvwSpecies.Nodes)

        For Each node As Telerik.WebControls.RadTreeNode In tvwSpecies.GetAllNodes()
            If dictionaryIsExpanded.ContainsKey(New Guid(node.Value)) Then
                node.Expanded = dictionaryIsExpanded(New Guid(node.Value))
            End If
        Next

        Dim selectedNode As Telerik.WebControls.RadTreeNode = tvwSpecies.FindNodeByValue(speciesId.ToString())
        If Not selectedNode Is Nothing Then
            selectedNode.Selected = True
        End If

    End Sub

End Class


