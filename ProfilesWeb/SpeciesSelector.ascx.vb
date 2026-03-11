Imports System.Collections.Generic
Imports ProfilesLibrary
Imports Telerik.WebControls

Partial Class SpeciesSelector
    Inherits System.Web.UI.UserControl

    Private mProfiledSpecies As List(Of Guid)

    'At the moment, this control will only work if there is only 1 placed on a page. 

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not Page.IsPostBack Then

            Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
            'AddTreeNodes draws the species tree for the current or new profile
            AddTreeNodes(speciesList, tvwSpecies.Nodes)

        End If

    End Sub

    Private Sub AddTreeNodes(ByVal speciesList As SpeciesInfoList, ByVal speciesNodeList As RadTreeNodeCollection)
        'Recursive function that draws the species tree for the current or new profile
        Dim i As Integer = 0
        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim speciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            speciesNodeList.Add(speciesNode)

            If Not speciesChild.IsActive Then
                speciesNode.Category = "Inactive"
                speciesNode.Text = speciesNode.Text + " (inactive)"
                speciesNodeList.RemoveAt(i)
                i = i - 1
            End If
            i = i + 1
            'Recursively call AddTreeNodes function for any child nodes
            AddTreeNodes(speciesChild.ChildList, speciesNode.Nodes)

            speciesNode.Expanded = True
        Next

    End Sub

    Public Function GetSelectedSpecies(ByVal includeDescendents As Boolean) As List(Of Guid)

        Dim speciesList As New List(Of Guid)

        For Each currentNode As RadTreeNode In tvwSpecies.GetAllNodes()
            If currentNode.Checked Then
                If includeDescendents Then
                    AddNodeAndDescendents(currentNode, speciesList)
                Else
                    speciesList.Add(New Guid(currentNode.Value))
                End If
            End If
        Next

        Return speciesList

    End Function

    Private Sub AddNodeAndDescendents(ByVal node As RadTreeNode, ByVal speciesList As List(Of Guid))

        speciesList.Add(New Guid(node.Value))
        For Each currentNode As RadTreeNode In node.Nodes
            AddNodeAndDescendents(currentNode, speciesList)
        Next

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim speciesList As New List(Of String)

        For Each currentNode As RadTreeNode In tvwSpecies.GetAllNodes()
            If currentNode.Checked Then
                speciesList.Add(currentNode.Text)
            End If
        Next

        If speciesList.Count > 0 Then
            speciesList.Sort()
            lblAffectedSpecies.Text = String.Join(", ", speciesList.ToArray())
        Else
            lblAffectedSpecies.Text = "Any species"
        End If

    End Sub

    Public Sub SetAffectedSpeciesForDisease(ByVal profiledSpecies As List(Of Guid))

        mProfiledSpecies = profiledSpecies
        tvwSpecies.Nodes.Clear()
        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        'AddTreeNodes draws the species tree for the current or new profile
        AddTreeNodesForDisease(speciesList, tvwSpecies.Nodes, False)

    End Sub

    Private Sub AddTreeNodesForDisease( _
        ByVal speciesList As SpeciesInfoList, _
        ByVal profiledSpeciesNodeList As RadTreeNodeCollection, _
        ByVal profiledParentChecked As Boolean _
    )
        Dim i As Integer = 0
        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim profiledSpeciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            profiledSpeciesNodeList.Add(profiledSpeciesNode)

            If Not speciesChild.IsActive Then
                profiledSpeciesNode.Category = "Inactive"
                profiledSpeciesNode.Text = profiledSpeciesNode.Text + " (inactive)"
                profiledSpeciesNodeList.RemoveAt(i)
                i = i - 1
            End If
            i = i + 1

            If profiledParentChecked Then
                If speciesChild.IsActive AndAlso profiledParentChecked Then
                    profiledSpeciesNode.Checked = True
                End If
                'profiledSpeciesNode.Enabled = False
            Else

                'Compare species GUID to Affected species GUID to determine which species on the tree are affected and therefore should be checked
                profiledSpeciesNode.Checked = mProfiledSpecies.Contains(speciesChild.Id)

                If profiledSpeciesNode.Checked Then
                    profiledSpeciesNode.Enabled = True
                Else
                    'profiledSpeciesNode.Enabled = speciesChild.IsActive
                End If
            End If

            'Recursively call AddTreeNodes function for any child nodes
            AddTreeNodesForDisease( _
                speciesChild.ChildList, _
                profiledSpeciesNode.Nodes, _
                profiledSpeciesNode.Checked _
            )

            profiledSpeciesNode.Expanded = True
        Next

    End Sub

    Public Sub ReBindAddTreeNodes(ByVal speciesList As SpeciesInfoList)
        Dim i As Integer = 0
        tvwSpecies.Nodes.Clear()
        lblAffectedSpecies.Text = "Any species"
        Dim speciesNodeList As RadTreeNodeCollection
        speciesNodeList = tvwSpecies.Nodes
        'Recursive function that draws the species tree for the current or new profile

        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim speciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            speciesNodeList.Add(speciesNode)

            If Not speciesChild.IsActive Then
                speciesNode.Category = "Inactive"
                speciesNode.Text = speciesNode.Text + " (inactive)"
                speciesNodeList.RemoveAt(i)
                i = i - 1
            End If
            i = i + 1

            'Recursively call AddTreeNodes function for any child nodes
            AddTreeNodes(speciesChild.ChildList, speciesNode.Nodes)

            speciesNode.Expanded = True
        Next

    End Sub

    Public Sub GetLabelSelectedValues()

        Dim speciesList As New List(Of String)

        For Each currentNode As RadTreeNode In tvwSpecies.GetAllNodes()
            If currentNode.Checked Then
                speciesList.Add(currentNode.Text)
            End If
        Next

        If speciesList.Count > 0 Then
            speciesList.Sort()
            lblAffectedSpecies.Text = String.Join(", ", speciesList.ToArray())
        Else
            lblAffectedSpecies.Text = "Any species"
        End If

    End Sub

End Class
