Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Collections.Generic
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a list or multi value list field
    ''' to the user and enable them to edit it.
    ''' </summary>
    Public Class CheckBoxListProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mCheckboxList As New List(Of CheckBox)
        Private mCheckboxLabels As New List(Of String)
        Private mCheckboxValues As New List(Of Guid)
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
            Dim currentCheckbox As Integer
            'loop through each checkbox
            For Each lookupValue As Guid In mCheckboxValues

                'default the checkbox to unchecked
                mCheckboxList(currentCheckbox).Checked = False

                'if the field contains the value of the checkbox
                If (mField.DataType = DataFieldType.MultiValueListType AndAlso DirectCast(value, MultiValueListFieldValue).ContainsValue(lookupValue)) OrElse _
                    (mField.DataType = DataFieldType.ListType AndAlso DirectCast(value, ListFieldValue).FieldValue = lookupValue) Then
                    'tick the checkbox
                    mCheckboxList(currentCheckbox).Checked = True
                End If
                currentCheckbox += 1
            Next

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

            'if the reference table that this field uses to constrain its values is maintainable, then
            'we need to get the latest list of values. Some values may have been inactivated
            If mField.ReferenceTableIsMaintainable Then
                mReferenceList = ReferenceValueInfoList.GetList(Field.ReferenceTableId)

                For Each referenceItem As ReferenceValueInfo In mReferenceList
                    'add a checkbox for every value in the reference table
                    Dim box As New CheckBox
                    Controls.Add(box)

                    'use the enabled property to set whether the field is read only or not
                    'This will be used when rendering to decide whether to show the
                    'checkbox or to substitute a read only representation
                    box.Enabled = Not mField.IsReadOnly

                    'if the list is single select, add a javascript handler so that we can uncheck the
                    'other checkboxes in the group whenever a checkbox is selected
                    If mField.DataType = DataFieldType.ListType Then
                        box.Attributes("onClick") = "UnCheck$" & Me.UniqueID & "(this.id)"
                    End If

                    'add the checkbox to the internal list
                    mCheckboxList.Add(box)
                    mCheckboxValues.Add(referenceItem.Id)
                    mCheckboxLabels.Add(referenceItem.Value.StripPTags & CStr(IIf(referenceItem.IsActive, String.Empty, " (inactive)")))
                Next
            Else
                'if the list isn't maintainable, it can be obtained from the cache
                'there won't be any inactive entries
                Dim lookup As LookupList = CommonUI.GetLookupList(Field.ReferenceTableId)

                For Each lookupItem As LookupList.NameValuePair In lookup
                    Dim box As New CheckBox
                    Controls.Add(box)

                    'use the enabled property to set whether the field is read only or not
                    'This will be used when rendering to decide whether to show the
                    'checkbox or to substitute a read only representation
                    box.Enabled = Not mField.IsReadOnly

                    'if the list is single select, add a javascript handler so that we can uncheck the
                    'other checkboxes in the group whenever a checkbox is selected
                    If mField.DataType = DataFieldType.ListType Then
                        box.Attributes("onClick") = "if (this.checked) UnCheck$" & Me.UniqueID & "(this.id);"
                    End If

                    'add the checkbox to the internal list
                    mCheckboxList.Add(box)
                    mCheckboxValues.Add(lookupItem.Key)
                    mCheckboxLabels.Add(lookupItem.Value)
                Next
            End If

        End Sub

        ''' <summary>
        ''' If the list comes from a maintainable reference table, we need to adjust the entries before rendering them, hiding any
        ''' inactive entries that are not currently selected
        ''' </summary>
        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            If mField.ReferenceTableIsMaintainable Then
                Dim currentItem As Integer
                For Each box As CheckBox In mCheckboxList
                    box.Visible = True
                    If Not mReferenceList(currentItem).IsActive AndAlso Not box.Checked Then
                        box.Visible = False
                    End If
                    currentItem += 1
                Next
            End If

            MyBase.OnPreRender(e)

        End Sub

        ''' <summary>
        ''' Writes out the HTML that makes up the control. This is called by the ASP.NET infrastructure late in the control lifecycle
        ''' when all properties have already been set.
        ''' </summary>
        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            'The checkboxes are placed in a table, three to each row
            Dim CheckBoxListProfileFieldId As String = $"CheckBoxListProfileField{Guid.NewGuid()}"
            Dim currentCheckbox As Integer
            Dim currentVisibleCheckbox As Integer
            Dim boxVisible As Boolean

            'begin the table
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "95%")
            writer.AddStyleAttribute(HtmlTextWriterStyle.MarginLeft, "10px")
            writer.AddAttribute(HtmlTextWriterAttribute.Id, CheckBoxListProfileFieldId)
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

            RenderSpacerRow(writer)

            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "top")
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)

            For Each box As CheckBox In mCheckboxList

                boxVisible = box.Visible

                'if the checkbox's Enabled property is set to False, then we need a read only
                'representation of it

                If boxVisible Then

                    'render the checkbox
                    If box.Enabled Then
                        box.RenderControl(writer)
                    Else
                        writer.AddAttribute(HtmlTextWriterAttribute.Id, box.ClientID)
                        writer.AddAttribute(HtmlTextWriterAttribute.Type, "checkbox")
                        writer.AddAttribute(HtmlTextWriterAttribute.Class, "govuk-checkboxes__input")
                        If box.Checked Then
                            writer.AddAttribute(HtmlTextWriterAttribute.Checked, "checked")
                        End If
                        writer.AddAttribute(HtmlTextWriterAttribute.Disabled, "disabled")
                        writer.RenderBeginTag(HtmlTextWriterTag.Input)
                        writer.RenderEndTag() '/Input

                    End If

                    'plus the text next to it
                    writer.AddAttribute(HtmlTextWriterAttribute.For, box.ClientID)
                    writer.RenderBeginTag(HtmlTextWriterTag.Label)
                    writer.Write(mCheckboxLabels(currentCheckbox))
                    writer.RenderEndTag() '</Label>

                    currentVisibleCheckbox += 1
                    If (currentCheckbox + 1) < mCheckboxList.Count Then
                        writer.RenderEndTag() '/Td

                        If currentVisibleCheckbox Mod 3 = 0 Then
                            writer.RenderEndTag() '/Tr
                            writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                        End If
                        writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "top")
                        writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "33%")
                        writer.RenderBeginTag(HtmlTextWriterTag.Td)
                    End If

                    'if this is a single-select list, need client script to prevent multiple section
                    If mField.DataType = DataFieldType.ListType Then
                        ScriptManager.RegisterArrayDeclaration(Me, Me.UniqueID & "$checkBoxList", "'" & box.ClientID & "'")
                    End If

                End If

                currentCheckbox += 1

            Next

            writer.RenderEndTag() '/Td

            'add spacers to rows that do not have enough checkboxes to fill the line
            'the number of spacers depends upon whether the last checkbox was visible or not
            If boxVisible Then
                If currentVisibleCheckbox Mod 3 > 0 Then
                    For currentSpacer As Integer = 1 To 3 - (currentVisibleCheckbox Mod 3)
                        RenderSpacerBlock(writer, String.Empty)
                    Next
                End If
            Else
                If currentVisibleCheckbox Mod 3 = 1 Then
                    RenderLabelSpacer(writer, String.Empty)
                ElseIf currentVisibleCheckbox Mod 3 = 2 Then
                    RenderLabelSpacer(writer, String.Empty)
                    RenderSpacerBlock(writer, String.Empty)
                End If
            End If

            writer.RenderEndTag() '/Tr
            writer.RenderEndTag() '/TBody
            writer.RenderEndTag() '/Table

            'if this is a single-select list, need client script to prevent multiple selection
            If mField.DataType = DataFieldType.ListType Then
                Dim output As New StringBuilder

                output.Append("function UnCheck$").Append(Me.UniqueID).Append("(checkId) {")
                output.Append("for (var i = 0; i < ").Append(Me.UniqueID).Append("$checkBoxList.length; i++) {")
                output.Append("if (").Append(Me.UniqueID).Append("$checkBoxList[i] != checkId) {")
                output.Append("document.getElementById(").Append(Me.UniqueID).Append("$checkBoxList[i]).checked = false;")
                output.Append("}")
                output.Append("}")
                output.Append("}")

                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "UnCheck$" & Me.UniqueID, output.ToString(), True)
            End If

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), $"aspCheckboxListGdsStyling{CheckBoxListProfileFieldId}", $"aspCheckboxListGdsStyling('{CheckBoxListProfileFieldId}');", True)

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

            'RenderCheckboxSpacer(writer)
            RenderLabelSpacer(writer, label)

        End Sub

        Private Sub RenderCheckboxSpacer(ByVal writer As HtmlTextWriter)

            writer.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle")
            writer.RenderBeginTag(HtmlTextWriterTag.Td)
            writer.AddAttribute(HtmlTextWriterAttribute.Src, "Images/CheckboxSpacer.png")
            writer.AddAttribute(HtmlTextWriterAttribute.Alt, "")
            writer.RenderBeginTag(HtmlTextWriterTag.Img)
            writer.RenderEndTag() '/Img
            writer.RenderEndTag() '/Td

        End Sub

        Private Sub RenderLabelSpacer(ByVal writer As HtmlTextWriter, ByVal label As String)

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
                Dim currentItem As Integer
                For Each currentCheckbox As CheckBox In mCheckboxList
                    'if the list is multi select, synchronise the field values with the checked/unchecked status
                    'of the checkbox
                    If mField.DataType = DataFieldType.MultiValueListType Then
                        Dim multiValue As MultiValueListFieldValue = DirectCast(value, MultiValueListFieldValue)
                        If currentCheckbox.Checked AndAlso Not multiValue.ContainsValue(mCheckboxValues(currentItem)) Then
                            multiValue.AddFieldValue(mCheckboxValues(currentItem))
                        ElseIf Not currentCheckbox.Checked AndAlso multiValue.ContainsValue(mCheckboxValues(currentItem)) Then
                            multiValue.RemoveFieldValue(mCheckboxValues(currentItem))
                        End If
                        'otherwise, assume that there is only one checkbox checked (the clientside script should 
                        'ensure this). Set the field value
                    ElseIf currentCheckbox.Checked Then
                        DirectCast(value, ListFieldValue).FieldValue = mCheckboxValues(currentItem)
                    End If
                    currentItem += 1
                Next
            End If

        End Sub

    End Class
End Namespace



