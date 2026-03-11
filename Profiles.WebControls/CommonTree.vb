Imports System.Web.UI
Imports Telerik.Web.UI

Public Module CommonTree

    Public Class NodeSelectionResult
        Public Property IsValid As Boolean
        Public Property SelectedNodeId As String

        Public Sub New(isValid As Boolean, id As String)
            Me.IsValid = isValid
            Me.SelectedNodeId = id
        End Sub
    End Class

    Public Function IsNodeSelected(ByVal tree As Global.Telerik.Web.UI.RadTreeView) As NodeSelectionResult
        Dim nodes As IList(Of RadTreeNode) = tree.GetAllNodes()
        Dim hasCheckedNode As Boolean = False
        Dim selectedId As String = String.Empty

        For Each node As RadTreeNode In nodes
            If node.Checked Then
                hasCheckedNode = True
                If Not IsValidGuid(node.Value) Then
                    Return New NodeSelectionResult(False, String.Empty)
                End If
                selectedId = node.Value
            End If
        Next

        Return New NodeSelectionResult(hasCheckedNode, selectedId)
    End Function

    Public Sub MakeAnnouncement(ByVal page As Page)
        Dim script As String = "apha.profiles.updateAnnouncement('Selection cleared');"

        If ScriptManager.GetCurrent(page) IsNot Nothing Then
            ScriptManager.RegisterStartupScript(page, page.GetType(), "ClearAnnouncement", script, True)
        Else
            page.ClientScript.RegisterStartupScript(page.GetType(), "ClearAnnouncement", script, True)
        End If
    End Sub
End Module
