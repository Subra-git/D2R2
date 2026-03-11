Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls

    ''' <summary>
    ''' This control encapsulates the user interface required to present a list field value to the user and enable them to edit it.
    ''' </summary>
    Public Class DropDownListProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mListField As DropDownList
        Private mField As FieldMetadataWrapper
        Private mReferenceList As ReferenceValueInfoList

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
                mListField.SelectedValue = DirectCast(value, ListFieldValue).FieldValue.ToString()
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

        Public ReadOnly Property SelectedItem As ListItem
            Get
                Return mListField?.SelectedItem
            End Get
        End Property

        Public ReadOnly Property SelectedItemText As String
            Get
                Return mListField?.SelectedItem?.Text
            End Get
        End Property

        Public ReadOnly Property SelectedItemValue As String
            Get
                Return mListField?.SelectedItem?.Value
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

            mListField.ID = "ddlDropDownListField"
            mListField.Attributes.Add("class", "govuk-select")

            mListField.Items.Add(New ListItem("Please select...", String.Empty))
            'if the reference table that this field uses to constrain its values is maintainable, then
            'we need to get the latest list of values. Some values may have been inactivated
            If mField.ReferenceTableIsMaintainable Then
                mReferenceList = ReferenceValueInfoList.GetList(Field.ReferenceTableId)
                For Each referenceItem As ReferenceValueInfo In mReferenceList
                    Dim currentListItem As New ListItem()
                    If referenceItem.IsActive Then
                        currentListItem.Text = referenceItem.Value.StripHtmlTags
                    Else
                        currentListItem.Text = referenceItem.Value.StripHtmlTags & " (inactive)"
                    End If
                    currentListItem.Value = referenceItem.Id.ToString()
                    mListField.Items.Add(currentListItem)
                Next
            Else
                'if the list isn't maintainable, it can be obtained from the cache
                'there won't be any inactive entries
                Dim lookup As LookupList = CommonUI.GetLookupList(Field.ReferenceTableId)
                For Each lookupItem As LookupList.NameValuePair In lookup
                    mListField.Items.Add(New ListItem(lookupItem.Value, lookupItem.Key.ToString()))
                Next
            End If

            mListField.Visible = Not mField.IsReadOnly
            Controls.Add(mListField)

            If mField.SourceOfDataReplication Then
                mListField.Attributes.Add("onchange", FieldMetadataWrapper.TriggerPropertyChangedEventScript)
            End If

            If mField.AffectsRelevance AndAlso Field.QuestionType = QuestionType.Standard Then
                mListField.Attributes.Add("onfocus", FieldMetadataWrapper.AffectsRelevanceOnFocusScript(mListField.ClientID))
                mListField.Attributes.Add("onchange", FieldMetadataWrapper.AffectsRelevanceOnChangeScript(mListField.ClientID, Field, False))
            ElseIf mField.AffectsRelevance Then
                mListField.Attributes.Add("onfocus", FieldMetadataWrapper.AffectsRelevanceOnFocusScript(mListField.ClientID))
                mListField.Attributes.Add("onchange", FieldMetadataWrapper.AffectsRelevanceOnChangeScript(mListField.ClientID, Field, True))
            ElseIf mField.AffectsVisibility Then
                mListField.Attributes.Add("onchange", FieldMetadataWrapper.AffectsVisibilityOnChangeScript())
            End If

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
            End If

            writer.RenderBeginTag(HtmlTextWriterTag.P)

            'if the field is read only, write out the text property directly
            If mField.IsReadOnly Then
                writer.Write(mListField.SelectedItem.Text)
            End If

            If mReferenceList IsNot Nothing Then
                Dim currentItem As Integer = 1
                For Each referenceItem As ReferenceValueInfo In mReferenceList
                    If Not referenceItem.IsActive AndAlso Not mListField.Items(currentItem).Selected Then
                        mListField.Items(currentItem).Enabled = False
                    End If
                    currentItem += 1
                Next
            End If


            'render the dropdown list
            mListField.RenderControl(writer)

            writer.RenderEndTag() '/P

        End Sub

        ''' <summary>
        ''' Sets the value held in the business layer to the value displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal value As FieldValueBase) Implements IProfileField.Save

            If Not mField Is Nothing Then
                If Not mField.IsReadOnly Then
                    If Not mListField Is Nothing Then
                        If Not mListField.SelectedValue Is Nothing Then
                            If mListField.SelectedValue.Length = 0 Then
                                DirectCast(value, ListFieldValue).FieldValue = Nothing
                            Else
                                DirectCast(value, ListFieldValue).FieldValue = New Guid(mListField.SelectedValue)
                            End If
                        End If
                    End If
                End If
            End If
        End Sub

    End Class
End Namespace


