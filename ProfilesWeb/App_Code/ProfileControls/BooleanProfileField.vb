Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace ProfilesWeb.Controls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a boolean field value to the user and enable them to edit it.
    ''' </summary>
    Public Class BooleanProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mListField As DropDownList
        Private mField As FieldMetadataWrapper

#Region "Event handling for reacting to changes in selection (unused)"

        'Public Event ValueChanged As EventHandler(Of EventArgs) Implements IProfileField.ValueChanged

        'Protected Overridable Sub OnValueChanged(ByVal e As EventArgs)
        '    RaiseEvent ValueChanged(Me, e)
        'End Sub

        'Protected Sub mListField_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        '    OnValueChanged(New EventArgs())
        '    SetClientSideConfirmScript()

        'End Sub

        'Private Sub SetClientSideConfirmScript()

        '    mListField.Attributes("onChange") = "var m = document.getElementById('" & mListField.ClientID & "'); if (!window.confirm('Changing this value may affect any data captured in this section. Are you sure you wish to proceed?')) {m.options(" & mListField.SelectedIndex & ").selected = true; return false;} " '& mListField.Attributes("onChange")

        'End Sub

#End Region

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
            If value IsNot Nothing AndAlso Not value.IsEmpty Then
                mListField.SelectedValue = value.ToString()
            Else
                mListField.SelectedValue = String.Empty
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
            mListField = New DropDownList
            Controls.Add(mListField)

            mListField.ID = "ddlBooleanField"
            mListField.Items.Add(New ListItem("Please select...", String.Empty))

            mListField.Items.Add(New ListItem("Yes", "Yes"))
            mListField.Items.Add(New ListItem("No", "No"))

            If mField.AffectsRelevance AndAlso Field.QuestionType = QuestionType.Standard Then
                mListField.Attributes.Add("onclick", "try{lastSelectedIndex = document.getElementById('" & mListField.ClientID & "').selectedIndex;}catch(err){}")
                mListField.Attributes.Add("onchange", "try{var m = document.getElementById('" & mListField.ClientID & "'); if(confirm('Changing the answer to this question may affect the relevancy of other parts of this section, any questions that become irrelevant will be cleared and hidden. Questions that may be affected are: " & Field.AffectsRelevanceOf.Substring(0, Field.AffectsRelevanceOf.Length - 2) & ". Do you wish to continue?')){HideAndClearIrrelevantQuestions();}else{m.options(lastSelectedIndex).selected=true;return false;}}catch(err){}")
            ElseIf mField.AffectsRelevance Then
                mListField.Attributes.Add("onclick", "try{lastSelectedIndex = document.getElementById('" & mListField.ClientID & "').selectedIndex;}catch(err){}")
                mListField.Attributes.Add("onchange", "try{var m = document.getElementById('" & mListField.ClientID & "'); if(confirm('Changing the answer to this question may affect the relevancy of other parts of this section, any questions that become irrelevant will be cleared and hidden. Questions that may be affected are: " & Field.AffectsRelevanceOf.Substring(0, Field.AffectsRelevanceOf.Length - 2) & ". Do you wish to continue?')){refreshPanel=true;}else{m.options(lastSelectedIndex).selected=true;return false;}}catch(err){}")
            End If

            mListField.Visible = Not mField.IsReadOnly

        End Sub

        ''' <summary>
        ''' Writes out the HTML that makes up the control. This is called by the ASP.NET infrastructure late in the control lifecycle
        ''' when all properties have already been set.
        ''' </summary>
        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            'if the field is read only, then the control is rendered as read-only checkboxes
            If mField.IsReadOnly Then
                'begin the table
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
                writer.RenderBeginTag(HtmlTextWriterTag.Table)
                writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

                RenderSpacerRow(writer)

                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                If mListField.SelectedValue = "Yes" Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSelected.png")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxUnselected.png")
                End If
                'draw an image of a checkbox
                writer.RenderBeginTag(HtmlTextWriterTag.Img)
                writer.RenderEndTag()
                writer.RenderEndTag() '/Td

                'plus the text next to it
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write("Yes")
                writer.RenderEndTag() '/Td

                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                If mListField.SelectedValue = "No" Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSelected.png")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxUnselected.png")
                End If
                'draw an image of a checkbox
                writer.RenderBeginTag(HtmlTextWriterTag.Img)
                writer.RenderEndTag() '/Img
                writer.RenderEndTag() '/Td

                'plus the text next to it
                writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
                writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write("No")
                writer.RenderEndTag() '/Td

                'then make up the space
                RenderSpacerBlock(writer, "&nbsp;")

                writer.RenderEndTag() '/Tr
                writer.RenderEndTag() '/TBody
                writer.RenderEndTag() '/Table
            Else

                writer.RenderBeginTag(HtmlTextWriterTag.P)
                'render the dropdown list control
                mListField.RenderControl(writer)
                writer.RenderEndTag() '/P

            End If

        End Sub

        Private Sub RenderSpacerRow(ByVal writer As HtmlTextWriter)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            For spacer As Integer = 1 To 3
                RenderSpacerBlock(writer)
            Next
            writer.RenderEndTag() '/Tr

        End Sub

        Private Sub RenderSpacerBlock(ByVal writer As HtmlTextWriter)
            RenderSpacerBlock(writer, String.Empty)
        End Sub

        Private Sub RenderSpacerBlock(ByVal writer As HtmlTextWriter, ByVal label As String)

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSpacer.png")
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
            writer.RenderEndTag() '/Img
            writer.RenderEndTag() '/Td
            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.Write(label)
            writer.RenderEndTag() '/Td

        End Sub

        ''' <summary>
        ''' Sets the value held in the business layer to the value displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal value As FieldValueBase) Implements IProfileField.Save

            If Not mField.IsReadOnly Then
                Select Case mListField.SelectedValue
                    Case String.Empty
                        DirectCast(value, BooleanFieldValue).FieldValue = Nothing
                    Case "Yes"
                        DirectCast(value, BooleanFieldValue).FieldValue = True
                    Case "No"
                        DirectCast(value, BooleanFieldValue).FieldValue = False
                End Select
            End If

        End Sub

    End Class

End Namespace



