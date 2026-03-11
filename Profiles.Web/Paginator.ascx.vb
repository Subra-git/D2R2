Public Class PageChangedEvent
	Inherits EventArgs

	Public ReadOnly Property Page As Integer
	Public ReadOnly Property PageSize As Integer

	Public Sub New(page As Integer, pageSize As Integer)
		Me.Page = page
		Me.PageSize = pageSize
	End Sub
End Class

Public Class Paginator
	Inherits System.Web.UI.UserControl

	Public Event PageChanged As EventHandler(Of PageChangedEvent)

	Public Property TotalPages() As Int32
		Get
			If ViewState("TotalPages") Is Nothing Then
				Return 0
			Else
				Return DirectCast(ViewState("TotalPages"), Int32)
			End If
		End Get
		Set(ByVal value As Int32)
			ViewState("TotalPages") = value
		End Set
	End Property

	Public Property CurrentPage() As Int32
		Get
			If ViewState("CurrentPage") Is Nothing Then
				Return 1
			Else
				Return DirectCast(ViewState("CurrentPage"), Int32)
			End If
		End Get
		Set(ByVal value As Int32)
			ViewState("CurrentPage") = value
		End Set
	End Property

	Public Property PageSize() As Int32
		Get
			If ViewState("PageSize") Is Nothing Then
				Return 10
			Else
				Return DirectCast(ViewState("PageSize"), Int32)
			End If
		End Get
		Set(ByVal value As Int32)
			ViewState("PageSize") = value
		End Set
	End Property
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
		End If
	End Sub

	Private Sub Changed()
		RaiseEvent PageChanged(Me, New PageChangedEvent(Me.CurrentPage, Me.PageSize))
	End Sub


	Protected Sub PagerNext_Click(sender As Object, e As EventArgs)
		If Me.CurrentPage < Me.TotalPages Then
			Me.CurrentPage = Me.CurrentPage + 1

			Changed()
		End If
	End Sub

	Protected Sub PagerNextNext_Click(sender As Object, e As EventArgs)
		If Me.CurrentPage < Me.TotalPages Then
			Me.CurrentPage = Me.CurrentPage + 2

			Changed()
		End If
	End Sub

	Protected Sub PagerPrevPrev_Click(sender As Object, e As EventArgs)
		If Me.CurrentPage > 1 Then
			Me.CurrentPage = Me.CurrentPage - 2

			Changed()
		End If
	End Sub

	Protected Sub PagerLast_Click(sender As Object, e As EventArgs)
		Me.CurrentPage = TotalPages

		Changed()
	End Sub

	Protected Sub PagerFirst_Click(sender As Object, e As EventArgs)
		Me.CurrentPage = 1

		Changed()
	End Sub

	Protected Sub PagerPrev_Click(sender As Object, e As EventArgs)
		If Me.CurrentPage > 1 Then
			Me.CurrentPage = Me.CurrentPage - 1

			Changed()
		End If
	End Sub
End Class