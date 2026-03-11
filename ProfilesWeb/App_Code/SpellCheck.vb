Imports Microsoft.VisualBasic

Namespace ProfilesWeb.Controls

    Public Class SpellCheck
        Inherits Telerik.WebControls.RadSpell

        Private Sub SpellCheck_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Me.Language = "en-US"
            Me.WordIgnoreOptions = Telerik.WebControls.WordIgnoreOptions.WordsWithNumbers
            Me.Skin = "Custom"
            Me.ButtonType = Telerik.WebControls.ButtonType.PushButton
            Me.CustomDictionarySourceTypeName = "ProfilesWeb.Spell.CustomWordSource, App_Code"
            Me.DialogParametersMode = Telerik.WebControls.Spell.DialogParametersMode.Javascript        
        End Sub
    End Class

End Namespace
