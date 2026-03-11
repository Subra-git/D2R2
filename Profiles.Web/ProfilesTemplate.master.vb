Imports System.ComponentModel
Imports Profiles.WebControls
Imports ProfilesLibrary

Partial Class ProfilesTemplate
	Inherits System.Web.UI.MasterPage

	Private HtmlTitle As String = ""

	Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
		MyBase.OnPreRender(e)


	End Sub

	Private Sub RegisterTinyMce()
		Dim scripts As New List(Of String)({
										   "scripts/tinymce/tinymce.min.js",
										   "Javascript/tinymce-init/misc-tinymce-functions.js",
										   "Javascript/tinymce-init/tinymce-helper.js",
										   "Javascript/tinymce-init/longtext-tinymce-service.js"
										   })

		For Each script As String In scripts
			If (Not Page.ClientScript.IsClientScriptIncludeRegistered(script)) _
								Then Page.ClientScript.RegisterClientScriptInclude(Me.GetType, script, script)
		Next
	End Sub

	Private Function SetPageTitleText(ByVal html As String, ByVal title As String) As String
		If String.IsNullOrEmpty(html) Then
			Return title
		Else
			Return html
		End If
	End Function

	Protected Overridable Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		RegisterTinyMce()

		If lblPageTitle.Text.Length = 0 Then
			lblPageTitle.Text = Me.SetPageTitleText(Me.HtmlTitle, Page.Title)
		End If

		Dim principal As ProfilesPrincipal = DirectCast(Csla.ApplicationContext.User, ProfilesLibrary.ProfilesPrincipal)
		If principal IsNot Nothing Then
			Dim identity As ProfilesIdentity = DirectCast(principal.Identity, ProfilesIdentity)
			lblUsername.Text = identity.FullName
			lblUsername.Attributes("title") = identity.GlobalUserRole
			lnkLogout.Visible = LogoutCommand.CanExecuteCommand()
		End If

		If ConfigurationManager.AppSettings("ShowVersion") = "1" Then
			lblVersionName.Visible = True
			lblVersionName.Text = ConfigurationManager.AppSettings("VersionName")
		Else
			lblVersionName.Visible = False
		End If

	End Sub

	Public Property ScriptManager() As ScriptManager
		Get
			Return scrManager
		End Get
		Set(ByVal value As ScriptManager)
			scrManager = CType(value, AjaxControlToolkit.ToolkitScriptManager)
		End Set
	End Property

	Public Property PageTitle() As String
		Get
			Return lblPageTitle.Text
		End Get
		Set(ByVal value As String)
			lblPageTitle.Text = value
			HtmlTitle = value
		End Set
	End Property

	Public Sub UpdateTitle(ByVal title As String)
		Page.Title = title.StripHtmlTags()
		lblPageTitle.Text = title
		HtmlTitle = title
	End Sub

	Public Sub HideMasterPageLabel()
		lblPageTitle.Visible = False
	End Sub


	Protected Sub scrManager_AsyncPostBackError(ByVal sender As Object, ByVal e As System.Web.UI.AsyncPostBackErrorEventArgs) Handles scrManager.AsyncPostBackError
		Response.Redirect(CommonUI.HandleError())
	End Sub

	Protected Sub LnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click
		LogoutCommand.Execute()
		FormsAuthentication.SignOut()
		Response.Redirect("~/Home.aspx")
	End Sub

	Protected Sub keepSessionAlive(sender As Object, e As EventArgs)
		'Required to keep the session alive.
	End Sub

End Class
