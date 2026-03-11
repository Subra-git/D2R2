Public Class ConfirmDialog
	Inherits System.Web.UI.UserControl

	Public Event OkClick As EventHandler(Of EventArgs)
	Public _okText As String
	Public _contentText As String
	Public _headerText As String
	Public _openButtonId As String
	Public _okButtonClass As String
	Public _clientHook As String

	Public Property ClientHook() As String
		Get
			Return _clientHook
		End Get
		Set(value As String)
			_clientHook = value
		End Set
	End Property

	Public Property OkText() As String
		Get
			Return If(String.IsNullOrEmpty(_okText), "OK", _okText)
		End Get
		Set(value As String)
			_okText = value
		End Set
	End Property

	Public Property OkButtonClass() As String
		Get
			Return _okButtonClass
		End Get
		Set(value As String)
			_okButtonClass = value
		End Set
	End Property

	Public Property ContentText() As String
		Get
			Return If(String.IsNullOrEmpty(_contentText), "Are you sure you want to perform this action?", _contentText)
		End Get
		Set(value As String)
			_contentText = value
		End Set
	End Property

	Public Property HeaderText() As String
		Get
			Return If(String.IsNullOrEmpty(_headerText), "Are you sure you want to perform this action?", _headerText)
		End Get
		Set(value As String)
			_headerText = value
		End Set
	End Property

	Public Property OpenButtonId() As String
		Get
			Return _openButtonId
		End Get
		Set(value As String)
			_openButtonId = value
		End Set
	End Property

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not Page.IsPostBack Then
			ok.Text = OkText

			ok.CssClass &= " " + Me.OkButtonClass
		End If

		ScriptManager.RegisterStartupScript(Me, Me.GetType(),
										$"confirmModal{Me.ClientID}",
										$"<script>{If(ClientHook Is Nothing, $"apha.modal.{Me.ClientID}", ClientHook)} = apha.modal.initConfirmFor('#{confirmModal.ClientID}');</script>",
										False)
	End Sub

	Protected Sub ok_Click(sender As Object, e As EventArgs)
		RaiseEvent OkClick(sender, e)
	End Sub
End Class