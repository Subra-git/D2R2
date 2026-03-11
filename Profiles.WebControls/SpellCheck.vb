Imports Microsoft.VisualBasic

Namespace Profiles.WebControls

    Public Class SpellCheck
        Inherits Telerik.WebControls.RadSpell

        Private Sub SpellCheck_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Me.Language = "en-US"
            Me.WordIgnoreOptions = Telerik.WebControls.WordIgnoreOptions.WordsWithNumbers
            Me.Skin = "Custom"
            Me.ButtonType = Telerik.WebControls.ButtonType.LinkButton
            Me.DialogParametersMode = Telerik.WebControls.Spell.DialogParametersMode.Javascript
            Me.CustomDictionarySourceTypeName = GetType(CustomWordSource).AssemblyQualifiedName
        End Sub
    End Class

End Namespace
