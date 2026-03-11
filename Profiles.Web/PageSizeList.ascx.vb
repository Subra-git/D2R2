Public Class PageSizeChangedEvent
	Inherits EventArgs

    Public Property PageSize As Integer

    Public Sub New(pageSize As Integer)
        Me.PageSize = pageSize
    End Sub
End Class

Public Class PageSizeList
	Inherits System.Web.UI.UserControl

	Public Event PageSizeChanged As EventHandler(Of PageSizeChangedEvent)
	Public Property PageSize As Integer



	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			If Debugger.IsAttached Then
				ddlPagSize.Items.Add(New ListItem() With {.Text = "2", .Value = "2"})
			End If

			ddlPagSize.Items.Add(New ListItem() With {.Text = "10", .Value = "10"})
			ddlPagSize.Items.Add(New ListItem() With {.Text = "15", .Value = "15"})
			ddlPagSize.Items.Add(New ListItem() With {.Text = "20", .Value = "20"})
			ddlPagSize.Items.Add(New ListItem() With {.Text = "30", .Value = "30"})
			ddlPagSize.Items.Add(New ListItem() With {.Text = "All", .Value = "All"})

			PageSize = CType(ddlPagSize.Items(0).Value, Integer)

			RaiseEvent PageSizeChanged(Me, New PageSizeChangedEvent(Me.PageSize))
		End If
	End Sub

	Protected Sub ddlPagSize_SelectedIndexChanged(sender As Object, e As EventArgs)

		Me.PageSize = GetCurrentPageSize()

		RaiseEvent PageSizeChanged(Me, New PageSizeChangedEvent(Me.PageSize))
	End Sub

	Private Function GetCurrentPageSize() As Integer
		Return If(Me.ddlPagSize.SelectedValue = "All", 0, CType(Me.ddlPagSize.SelectedValue, Int32))
	End Function
End Class