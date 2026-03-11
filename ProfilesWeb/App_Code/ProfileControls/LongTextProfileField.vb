Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary
Imports ProfilesWeb.Spell

Namespace ProfilesWeb.Controls
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
                mTextField.Text = value.ToString()
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

            Controls.Add(mTextField)

            mSpellCheck = New SpellCheck()
            mSpellCheck.Visible = Not mField.IsReadOnly
            mSpellCheck.IsClientID = True
            mSpellCheck.ControlToCheck = mTextField.ClientID
            Controls.Add(mSpellCheck)

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
                writer.AddStyleAttribute(HtmlTextWriterStyle.BackgroundColor, "white")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Height, "135px")
                writer.AddStyleAttribute(HtmlTextWriterStyle.OverflowY, "scroll")
                writer.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "80%")
            End If

            writer.RenderBeginTag(HtmlTextWriterTag.P)

            'if the field is read only, write out the text property directly
            If mField.IsReadOnly Then
                writer.Write(System.Web.HttpUtility.HtmlEncode(mTextField.Text).Replace(ControlChars.NewLine, "<br/>"))
            End If

            'render the textbox control
            mTextField.RenderControl(writer)

            writer.RenderEndTag() '/P

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

