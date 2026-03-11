
Imports Profiles.WebControls.Profiles.WebControls

Public Class PaginatorPageSize
	Inherits System.Web.UI.UserControl

	Public Event PageSizeChanged As EventHandler(Of PageSizeChangedEvent)
	Public Property PageSize As Integer
	Private Property Paginator As Paginator
	Private Property Grid As GridViewExternalPaging

	Public Property PaginatorId As String
	Public Property GridId As String

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Me.Grid = CType(Me.Parent.FindControl(GridId), GridViewExternalPaging)
		Me.Paginator = CType(Me.Parent.FindControl(PaginatorId), Paginator)

		PageSizeList.Visible = Grid.Rows.Count > 0
		If Not IsPostBack Then

		End If
	End Sub

	Protected Sub pre_render(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
		PageSizeList.Visible = Grid.Rows.Count > 0
	End Sub

	Protected Sub ddlPagSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles PageSizeList.PageSizeChanged
		Me.PageSize = PageSizeList.PageSize

		Paginator.PageSize = Me.PageSize
		Paginator.CurrentPage = 1

		Grid.PageIndex = Paginator.CurrentPage - 1
		Grid.AllowPaging = Paginator.PageSize > 0
		Grid.PageSize = If(Paginator.PageSize > 0, Paginator.PageSize, Grid.PageSize)

		RaiseEvent PageSizeChanged(Me, New PageSizeChangedEvent(Me.PageSize))
	End Sub

End Class