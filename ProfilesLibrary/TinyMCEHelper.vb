Imports System.Runtime.CompilerServices
Imports System.Web.UI

Public Module TinyMCEHelper

	Public Enum TinyMCEEditorType
		[Default] = 0
		FullEditor = 1
		LinkOnlyEditor = 2
		ItalicLinkEditor = 3
		SingleLineEditor = 4
	End Enum


	''' <summary>
	''' This Method registers the StartUpScript for the Tiny MCE input boxes for all oif the types of TinyMCE's that are used within
	''' this application.
	''' </summary>
	''' <param name="val">Client ID of InputBox</param>
	''' <param name="code">Editor Type, eg 1 for Multiline with bullet, hyperlink and Italic</param>
	''' <param name="this">Instance of Me</param>
	Public Sub RegisterTinyMCE(ByVal val As String, ByVal code As TinyMCEEditorType, ByVal this As Control, Optional ByVal height As String = "20", Optional ByVal styling As String = Nothing, Optional ByVal ariaLabel As String = "Rich Text Area. Press ALT-0 for help.")
		Dim scriptStart As String = String.Empty

		Select Case code
			Case TinyMCEEditorType.FullEditor 'Multiline with bullet, hyperlink and italic               
				scriptStart = $"<script>(new TinyMCEHelper().multiLineEditorInit('{val}', '{height}', '{styling}','{ariaLabel}'))</script>"
			Case TinyMCEEditorType.LinkOnlyEditor 'Link only Editor
				scriptStart = $"<script>(new TinyMCEHelper().linkOnlyEditorInit('{val}', '{height}', '{styling}','{ariaLabel}'))</script>"
			Case TinyMCEEditorType.ItalicLinkEditor
				scriptStart = $"<script>(new TinyMCEHelper().multiLineEditorInit('{val}', '{height}', '{styling}','{ariaLabel}'))</script>"
			Case TinyMCEEditorType.SingleLineEditor
				scriptStart = $"<script>(new TinyMCEHelper().inlineEditorWithoutDivInit('{val}', '{height}', '{styling}','{ariaLabel}'))</script>"
			Case Else 'Default MultiLineEditor
				scriptStart = $"<script>(new TinyMCEHelper().multiLineEditorInit('{val}', '{height}','{ariaLabel}'))</script>"
		End Select

		ScriptManager.RegisterStartupScript(this, this.GetType, $"tinyMCEScript_{val}", scriptStart, False)
	End Sub

	<Extension()>
	Public Sub RegisterTinyMce(ByVal this As System.Web.UI.Control, ByVal val As String, ByVal code As TinyMCEEditorType, Optional ByVal height As String = "20", Optional ByVal ariaLabel As String = "Rich Text Area. Press ALT-0 for help.")
		RegisterTinyMCE(val, code, this, height, ariaLabel:=ariaLabel)
	End Sub

	Public Sub RegisterSingleLineTinyMCE(ByVal val As String, ByVal this As Object)
		Dim scriptStart As String = $"<script>new TinyMCEHelper().inlineEditorInit('#divProfileTitle', '{val}', 'ProfileTitle')</script>"
		ScriptManager.RegisterStartupScript(CType(this, Page), this.GetType, $"tinyMCEScript_{val}", scriptStart, False)
	End Sub
End Module
