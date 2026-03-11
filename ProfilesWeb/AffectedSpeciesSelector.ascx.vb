Imports ProfilesLibrary
Imports Telerik.WebControls
Imports System.Collections.Generic

Partial Class AffectedSpeciesSelector
    Inherits System.Web.UI.UserControl

    Private mProfiledSpecies As List(Of Guid)
    Private mOtherAffectedSpecies As List(Of Guid)

    Public Property Enabled() As Boolean
        Get
            Return tvwProfiledSpecies.Enabled
        End Get
        Set(ByVal value As Boolean)
            tvwProfiledSpecies.Enabled = False
            tvwOtherAffectedSpecies.Enabled = False
        End Set
    End Property

    Public Property WarningEnabled() As Boolean
        Get
            Return litWarning.Visible
        End Get
        Set(ByVal value As Boolean)
            litWarning.Visible = False
        End Set
    End Property

    Public Sub SetAffectedSpecies(ByVal profiledSpecies As List(Of Guid), ByVal otherAffectedSpecies As List(Of Guid))

        mProfiledSpecies = profiledSpecies
        mOtherAffectedSpecies = otherAffectedSpecies
        tvwProfiledSpecies.Nodes.Clear()
        tvwOtherAffectedSpecies.Nodes.Clear()
        Dim speciesList As SpeciesInfoList = SpeciesInfoList.GetList()
        'AddTreeNodes draws the species tree for the current or new profile
        AddTreeNodes(speciesList, tvwProfiledSpecies.Nodes, tvwOtherAffectedSpecies.Nodes, False, False)

    End Sub

    Public Function GetProfiledSpecies() As List(Of Guid)

        mProfiledSpecies = New List(Of Guid)
        UpdateSpecies(AffectedSpeciesType.Profiled, tvwProfiledSpecies.Nodes, False)
        Return mProfiledSpecies

    End Function

    Public Function GetOtherAffectedSpecies() As List(Of Guid)

        mOtherAffectedSpecies = New List(Of Guid)
        UpdateSpecies(AffectedSpeciesType.Other, tvwOtherAffectedSpecies.Nodes, False)
        Return mOtherAffectedSpecies

    End Function

    'Recursive function that draws the species tree for the current or new profile
    Private Sub AddTreeNodes( _
        ByVal speciesList As SpeciesInfoList, _
        ByVal profiledSpeciesNodeList As RadTreeNodeCollection, _
        ByVal otherAffectedSpeciesNodeList As RadTreeNodeCollection, _
        ByVal profiledParentChecked As Boolean, _
        ByVal otherParentChecked As Boolean _
    )

        For Each speciesChild As SpeciesInfo In speciesList
            'Cycle through the species list
            Dim profiledSpeciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            profiledSpeciesNodeList.Add(profiledSpeciesNode)

            Dim otherAffectedSpeciesNode As New RadTreeNode(speciesChild.Description, speciesChild.Id.ToString())
            otherAffectedSpeciesNodeList.Add(otherAffectedSpeciesNode)

            If Not speciesChild.IsActive Then
                profiledSpeciesNode.Category = "Inactive"
                profiledSpeciesNode.Text = profiledSpeciesNode.Text + " (inactive)"
                otherAffectedSpeciesNode.Category = "Inactive"
                otherAffectedSpeciesNode.Text = otherAffectedSpeciesNode.Text + " (inactive)"
            End If

            If profiledParentChecked OrElse otherParentChecked Then
                If speciesChild.IsActive AndAlso profiledParentChecked Then
                    profiledSpeciesNode.Checked = True
                End If
                If speciesChild.IsActive AndAlso otherParentChecked Then
                    otherAffectedSpeciesNode.Checked = True
                End If
                profiledSpeciesNode.Enabled = False
                otherAffectedSpeciesNode.Enabled = False
            Else

                'Compare species GUID to Affected species GUID to determine which species on the tree are affected and therefore should be checked
                profiledSpeciesNode.Checked = mProfiledSpecies.Contains(speciesChild.Id)
                otherAffectedSpeciesNode.Checked = mOtherAffectedSpecies.Contains(speciesChild.Id)

                If profiledSpeciesNode.Checked Then
                    profiledSpeciesNode.Enabled = True
                    otherAffectedSpeciesNode.Enabled = False
                ElseIf otherAffectedSpeciesNode.Checked Then
                    profiledSpeciesNode.Enabled = False
                    otherAffectedSpeciesNode.Enabled = True
                Else
                    profiledSpeciesNode.Enabled = speciesChild.IsActive
                    otherAffectedSpeciesNode.Enabled = speciesChild.IsActive
                End If
            End If

            'Recursively call AddTreeNodes function for any child nodes
            AddTreeNodes( _
                speciesChild.ChildList, _
                profiledSpeciesNode.Nodes, _
                otherAffectedSpeciesNode.Nodes, _
                profiledSpeciesNode.Checked, _
                otherAffectedSpeciesNode.Checked _
            )

            profiledSpeciesNode.Expanded = True
            otherAffectedSpeciesNode.Expanded = True
        Next

    End Sub

    Private Sub UpdateSpecies(ByVal speciesType As AffectedSpeciesType, ByVal speciesNodeList As RadTreeNodeCollection, ByVal isAncestorChecked As Boolean)
        'UpdateProfiledSpecies caters for the additions and removals from the tree & affected species list caused by the checking and unchecking of nodes

        For Each treeNode As RadTreeNode In speciesNodeList

            Dim treeNodeValueAsGuid As New Guid(treeNode.Value)
            If treeNode.Checked And Not isAncestorChecked Then
                If speciesType = AffectedSpeciesType.Profiled Then
                    mProfiledSpecies.Add(treeNodeValueAsGuid)
                ElseIf speciesType = AffectedSpeciesType.Other Then
                    mOtherAffectedSpecies.Add(treeNodeValueAsGuid)
                End If

                UpdateSpecies(speciesType, treeNode.Nodes, True)
            Else
                UpdateSpecies(speciesType, treeNode.Nodes, isAncestorChecked)
            End If
        Next

    End Sub

    Protected Sub valProfiledSpecies_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles valProfiledSpecies.ServerValidate
        args.IsValid = (tvwProfiledSpecies.CheckedNodes.Count > 0)
    End Sub

End Class
