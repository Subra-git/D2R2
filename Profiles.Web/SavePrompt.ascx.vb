Imports System.ComponentModel

Public Class SavePrompt
	Inherits System.Web.UI.UserControl

	Public Event AttemptNavigateAwayEvent As CancelEventHandler

	Protected Overridable Sub AttemptNavigateAway(ByVal e As CancelEventArgs)
		RaiseEvent AttemptNavigateAwayEvent(Me, e)
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsPostBack Then
			Return
		End If

		Dim eventTarget As String = Request.Form("__EVENTTARGET")
		Dim eventArgument As String = Request.Form("__EVENTARGUMENT")

		If eventTarget <> "btnConfirmHook" Then
			Return
		End If

		Dim args As New CancelEventArgs(False)

		AttemptNavigateAway(args)

		If Not args.Cancel Then
			Response.Redirect($"{eventArgument}")
		End If

		Dim script As String = $"<script>
									{$"setTimeout(() => {$"apha.savePrompt.confirmPrompt('{eventArgument}')"}, 300)"}
								</script>"

		If (Not Page.ClientScript.IsStartupScriptRegistered("SaveScript")) Then
			Page.ClientScript.RegisterStartupScript(Me.GetType(), "SaveScript", script)
		End If
	End Sub

End Class