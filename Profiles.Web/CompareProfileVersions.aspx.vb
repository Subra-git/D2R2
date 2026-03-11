Imports ProfilesLibrary
Imports Telerik.Web.UI
Imports System.Collections.Generic
Imports System

Partial Class CompareProfileVersions
    Inherits System.Web.UI.Page

    Private Property ProfileList() As ProfileInfoList
        Get
            Return DirectCast(Session("ProfileList"), ProfileInfoList)
        End Get
        Set(ByVal value As ProfileInfoList)
            Session("ProfileList") = value
        End Set
    End Property

    Private Property IsTreeExpanded As Boolean
        Get
            If ViewState("IsTreeExpanded") Is Nothing Then
                ViewState("IsTreeExpanded") = False
            End If
            Return CBool(ViewState("IsTreeExpanded"))
        End Get
        Set(value As Boolean)
            ViewState("IsTreeExpanded") = value
        End Set
    End Property


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not GetProfileVersionComparisonReportCommand.CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to compare profile versions")
        End If

        If Not Page.IsPostBack Then
            ProfileList = ProfileInfoList.GetProfileInfoList(False, False, String.Empty, False, Nothing)
            AddTreeNodes(tvwProfileVersions.Nodes)
            UpdateToggleState()
        End If

    End Sub

    Private Sub AddTreeNodes(ByVal nodeList As RadTreeNodeCollection)

        For Each currentProfileInfo As ProfileInfo In ProfileList

            Dim profileInfoNode As New RadTreeNode(currentProfileInfo.Title, currentProfileInfo.Id.ToString())
            profileInfoNode.Checkable = False
            nodeList.Add(profileInfoNode)

            For Each currentProfileScenarioInfo As ProfileScenarioInfo In currentProfileInfo.GetScenarios()

                Dim scenarioInfoNode As New RadTreeNode(currentProfileScenarioInfo.ScenarioTitle, currentProfileScenarioInfo.Id.ToString()) With {
                    .Checkable = False,
                    .Expanded = true
                }

                profileInfoNode.Nodes.Add(scenarioInfoNode)

                For Each currentVersion As ProfileVersionSummaryInfo In currentProfileScenarioInfo.GetAllVersions()
                    Dim node As RadTreeNode = New RadTreeNode(currentVersion.ToString(), currentVersion.Id.ToString())

                    scenarioInfoNode.Nodes.Add(node)
                Next
   
            Next
        Next
    End Sub

    Protected Sub btnToggleAll_Click(sender As Object, e As EventArgs)
        If IsTreeExpanded Then
            CollapseAllNodes(tvwProfileVersions.Nodes)
        Else
            ExpandAllNodes(tvwProfileVersions.Nodes)
        End If
        
        IsTreeExpanded = Not IsTreeExpanded
        UpdateToggleState()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "RestoreFocus", "document.getElementById('" & btnToggleAllButton.ClientID & "').focus();", True)
    End Sub

    Private Sub UpdateToggleState()
        btnToggleAllButton.Attributes("aria-expanded") = IsTreeExpanded.ToString().ToLower()
        toggleText.InnerText = If(IsTreeExpanded, "Close all", "Open all")
        treeStatus.InnerText = If(IsTreeExpanded, "Close all branches of tree view component", "Open all branches of tree view component")
    End Sub

    Private Sub ExpandAllNodes(nodes As RadTreeNodeCollection)
        For Each node As RadTreeNode In nodes
            node.Expanded = True
            If node.Nodes.Count > 0 Then
                ExpandAllNodes(node.Nodes)
            End If
        Next
    End Sub

    Private Sub CollapseAllNodes(nodes As RadTreeNodeCollection)
        For Each node As RadTreeNode In nodes
            node.Expanded = False
            node.Selected = False
            If node.Nodes.Count > 0 Then
                CollapseAllNodes(node.Nodes)
            End If
        Next
    End Sub

    Protected Sub CompareCustomValidator(source As Object, args As ServerValidateEventArgs)
     
        Dim checkedNodes As New List(Of RadTreeNode)
        For Each node As RadTreeNode In tvwProfileVersions.GetAllNodes()
            If node.Checked Then
                checkedNodes.Add(node)
            End If
        Next

        args.IsValid = (checkedNodes.Count = 2)
    End Sub

    Protected Sub btnCompare_Click(sender As Object, e As EventArgs)
        Page.Validate()
        If Page.IsValid Then
            Dim firstId As String = FirstCheckedNodeId.Value
            Dim secondId As String = SecondCheckedNodeId.Value
        
            Dim url As String = String.Format("ShowProfileVersionComparisonReport.aspx?ProfileVersionLeftId={0}&ProfileVersionRightId={1}", firstId, secondId)
        
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "OpenWindow",  String.Format("window.open('{0}');", url), True)
        End If
          ComparePanel.Update()
    End Sub

    Protected Sub RemoveSelectionButton_Click(sender As Object, e As EventArgs)
        IsTreeExpanded = False
        UpdateToggleState()
        tvwProfileVersions.Nodes.Clear()
        AddTreeNodes(tvwProfileVersions.Nodes)
        FirstCheckedNodeId.Value = "0"
        SecondCheckedNodeId.Value = "0"
        SelectionPanel.Update()
        TreePanel.Update()
        ComparePanel.Update()
    End Sub
End Class


