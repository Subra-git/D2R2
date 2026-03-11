Imports ProfilesLibrary
Imports Telerik.WebControls
Imports System.Collections.Generic

Partial Class ViewSpeciesData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            'Populate initial species tree
            Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
            AddTreeNodes(speciesList, tvwSpecies.Nodes)

        End If

    End Sub

    Private Sub AddTreeNodes(ByVal speciesList As SpeciesInfoList, ByVal speciesNodeList As RadTreeNodeCollection)
        'Recursive function that draws the species tree
        Dim i As Integer = 0
        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim speciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            speciesNodeList.Add(speciesNode)

            'Handle inactive species
            If Not speciesChild.IsActive Then
                speciesNode.Category = "Inactive"
                speciesNode.Text = speciesNode.Text + " (inactive)"
                speciesNodeList.RemoveAt(i)
                i = i - 1
            End If
            i = i + 1

            AddTreeNodes(speciesChild.ChildList, speciesNode.Nodes)
            speciesNode.Expanded = True
        Next

    End Sub

    Private Function IsNodeSelected() As Boolean

        If tvwSpecies.SelectedNode Is Nothing Then
            Return False
        End If

        Return IsValidGuid(tvwSpecies.SelectedNode.Value)

    End Function

    Protected Sub btnViewData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnViewData.Click
        lblSelectNode.Text = String.Empty
        If IsNodeSelected() Then
            Session("SpeciesEditPreviousPage") = "ViewSpeciesData"
            Response.Redirect("EditSpecies.aspx?SpeciesId=" & tvwSpecies.SelectedNode.Value)
        Else
            lblSelectNode.Visible = True
            lblSelectNode.Text = "Please select a species to view"
        End If
    End Sub

End Class


