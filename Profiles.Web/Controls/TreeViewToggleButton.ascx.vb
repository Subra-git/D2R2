Public Class TreeViewToggleButton
    Inherits System.Web.UI.UserControl

    Public Property IsExpanded As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hiddenField As HtmlInputHidden = CType(FindControl("toggleStateHidden"), HtmlInputHidden)
        Dim treeButton As HtmlButton = CType(FindControl("treeButton"), HtmlButton)

        If Not IsPostBack Then
            treeButton.Attributes("id") = Me.ClientID
            toggleStateHidden.Attributes("id") = Me.ClientID & "_toggleStateHidden"

            treeButton.Attributes("aria-expanded") = IsExpanded.ToString().ToLower()
            hiddenField.Value = IsExpanded.ToString().ToLower()
        End If

    End Sub

End Class