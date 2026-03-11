Imports Profiles.WebControls

Public Class TreeSelection
    Inherits System.Web.UI.UserControl

    Public Event SelectionRemoved As EventHandler

    Private _useServerClick As Boolean = False
    Private _removeSelectionVisible As Boolean = True

    <System.ComponentModel.Browsable(True)> _
    <System.ComponentModel.Description("Determines whether to use server-side click handling")> _
    Public Property UseServerClick() As Boolean
        Get
            Return _useServerClick
        End Get
        Set(value As Boolean)
            _useServerClick = value
            SetupButtonBehavior()
        End Set
    End Property

    <System.ComponentModel.Browsable(True)>
    <System.ComponentModel.Description("Determines whether to show remove selection button")>
    Public Property RemoveSelectionVisible() As Boolean
        Get
            Return _removeSelectionVisible
        End Get
        Set(value As Boolean)
            _removeSelectionVisible = value
            SetupButtonVisibility()
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SetupButtonBehavior()
        SetupButtonVisibility()
    End Sub

    Private Sub SetupButtonBehavior()
        If _useServerClick Then
            AddHandler removeSelectionButton.ServerClick, AddressOf removeSelectionButton_Click
        Else
            RemoveHandler removeSelectionButton.ServerClick, AddressOf removeSelectionButton_Click
        End If
    End Sub

    Private Sub SetupButtonVisibility()
        removeSelectionButton.Visible = _removeSelectionVisible
    End Sub

    Protected Sub removeSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles removeSelectionButton.ServerClick
        ClearSelection()
        ' Raise the event when the button is clicked
        RaiseEvent SelectionRemoved(Me, EventArgs.Empty)
    End Sub

    Public Sub UpdateSelection(ByVal selectedText As String)
        selectedTextValue.InnerHtml = selectedText
        selectedTextContainer.Style("display") = "block"
        removeSelectionButton.Attributes("aria-label") = String.Format("Remove {0} selection", selectedText)
    End Sub

    Public Sub ClearSelection()
        selectedTextValue.InnerHtml = String.Empty
        selectedTextContainer.Style("display") = "none"

        CommonTree.MakeAnnouncement(Me.Page)

        removeSelectionButton.Attributes("aria-label") = "Remove selection"
    End Sub


End Class