Imports ProfilesLibrary
Imports Telerik.WebControls
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not GetProfileVersionComparisonReportCommand.CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to compare profile versions")
        End If

        If Not Page.IsPostBack Then
            ProfileList = ProfileInfoList.GetProfileInfoList()
            AddTreeNodes(tvwProfileVersions.Nodes)
            btnCompare.Attributes.Add("onClick", "javascript:ShowComparisonPdf(); return false;")
        End If

    End Sub

    Private Sub AddTreeNodes(ByVal nodeList As RadTreeNodeCollection)

        For Each currentProfileInfo As ProfileInfo In ProfileList

            Dim profileInfoNode As New RadTreeNode(currentProfileInfo.Title, currentProfileInfo.Id.ToString())
            profileInfoNode.Checkable = False
            nodeList.Add(profileInfoNode)

            For Each currentProfileScenarioInfo As ProfileScenarioInfo In currentProfileInfo.GetScenarios()

                Dim scenarioInfoNode As New RadTreeNode(currentProfileScenarioInfo.ScenarioTitle, currentProfileScenarioInfo.Id.ToString())
                scenarioInfoNode.Checkable = False
                profileInfoNode.Nodes.Add(scenarioInfoNode)

                For Each currentVersion As ProfileVersionSummaryInfo In currentProfileScenarioInfo.GetAllVersions()
                    scenarioInfoNode.Nodes.Add(New RadTreeNode(currentVersion.ToString(), currentVersion.Id.ToString()))
                Next
   
            Next
        Next
    End Sub

End Class


