Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a long text field value to the user and enable them to edit it.
    ''' </summary>
    Public Class LongTextProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mTextField As TextBox
        Private mField As FieldMetadataWrapper
        Private mSpellCheck As SpellCheck

        ''' <summary>
        ''' The field within the profile that the control is mapped to
        ''' </summary>
        Public Property Field() As FieldMetadataWrapper Implements IProfileField.Field
            Get
                Return mField
            End Get
            Set(ByVal value As FieldMetadataWrapper)
                mField = value
            End Set
        End Property

        ''' <summary>
        ''' Sets the value displayed in the user interface to the value held in the business layer
        ''' </summary>
        Public Sub UpdateUIValue(ByVal value As FieldValueBase) Implements IProfileField.UpdateUIValue

            EnsureChildControls()
            If value IsNot Nothing Then
                mTextField.Text = value.ToString().SanitizeHtml()
            Else
                mTextField.Text = String.Empty
            End If

        End Sub

        ''' <summary>
        ''' Required for composite web controls (ie. controls that contain other controls)
        ''' </summary>
        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        ''' <summary>
        ''' Creates the controls that make up the interface. This is called by the ASP.NET infrastructure after the Field property is
        ''' set (so we know the characteristics of the field we are displaying) but before UpdateUIValue is called (so we don't yet
        ''' know the field value)
        ''' </summary>
        Protected Overrides Sub CreateChildControls()
            Controls.Clear()
            mTextField = New TextBox
            mTextField.Style.Add("width", "95%")
            mTextField.TextMode = TextBoxMode.MultiLine
            mTextField.Rows = 10
            mTextField.Visible = Not mField.IsReadOnly

            mTextField.ID = mField.Id.ToString

            Controls.Add(mTextField)

            Dim tinyField As String = $"{mTextField.ClientID}_ifr"

            SetupTinyMce(mField, mTextField, mField.SourceOfDataReplication)

            mSpellCheck = New SpellCheck()
            mSpellCheck.Visible = Not mField.IsReadOnly
            mSpellCheck.IsClientID = True
            mSpellCheck.ControlToCheck = tinyField
            Controls.Add(mSpellCheck)

        End Sub

        Private Function HasUpdatePanelParent(parentControl As Control) As Boolean

            If parentControl Is Nothing Then Return False

            If TypeOf (parentControl) Is UpdatePanel Then Return True

            Return HasUpdatePanelParent(parentControl.Parent)

        End Function

        Private Sub SetupTinyMce(ByVal mField As FieldMetadataWrapper, ByVal mTextField As TextBox, dataReplicationTrigger As Boolean)
            Dim key As String = $"tinyMCEScriptProfileTitle{mTextField.ClientID}"
            Dim ariaTitle As String = If(String.IsNullOrEmpty(mField.Name), mField.ShortName, mField.Name)

            If Page.ClientScript.IsStartupScriptRegistered(key) Then Return

            Dim script As String = $"<script>LongTextTinyMCEService.create().init('{ mField.EditorFieldType }', 'textarea#{ mTextField.ClientID}', '{ariaTitle}', '{dataReplicationTrigger.ToString.ToLower()}')</script>"

            ScriptManager.RegisterStartupScript(Me, Me.GetType, key, script, False)
        End Sub

        ''' <summary>
        ''' Writes out the HTML that makes up the control. This is called by the ASP.NET infrastructure late in the control lifecycle
        ''' when all properties have already been set.
        ''' </summary>
        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            'if the field is read only, then the <P> tag that surrounds the control is styled to suit
            If mField.IsReadOnly Then
                writer.AddStyleAttribute(HtmlTextWriterStyle.BorderStyle, "solid")
                writer.AddStyleAttribute(HtmlTextWriterStyle.BorderWidth, "1px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.BorderColor, "#999999")
                writer.AddStyleAttribute(HtmlTextWriterStyle.BackgroundColor, "white")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Height, "135px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.OverflowY, "scroll")
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "80%")
            Else
                writer.AddStyleAttribute(HtmlTextWriterStyle.MarginBottom, "20px")
            End If

            writer.AddStyleAttribute(HtmlTextWriterStyle.Display, "block")

            writer.RenderBeginTag(HtmlTextWriterTag.Span)

            'if the field is read only, write out the text property directly
            If mField.IsReadOnly Then
                writer.Write(mTextField.Text.SanitizeHtml())
            End If

            'render the textbox control
            mTextField.RenderControl(writer)

            writer.RenderEndTag() '/Span

            mSpellCheck.RenderControl(writer)

        End Sub

        ''' <summary>
        ''' Sets the value held in the business layer to the value displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal value As FieldValueBase) Implements IProfileField.Save

            If Not mField.IsReadOnly Then
                DirectCast(value, LongTextFieldValue).FieldValue = mTextField.Text.Trim()
            End If

        End Sub
    End Class
End Namespace

