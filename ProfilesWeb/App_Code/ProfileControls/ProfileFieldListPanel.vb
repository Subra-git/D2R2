Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace ProfilesWeb.Controls

    ''' <summary>
    ''' This control encapsulates the user interface required to present a list of field values to the user and enable them to edit those values.
    ''' It does this by grouping together a number of controls implementing the IProfileField interface
    ''' </summary>
    Public Class ProfileFieldListPanel
        Inherits WebControl
        Implements INamingContainer

        Private mProfileVersionFieldList As FieldMetadataListWrapper
        Private mFieldValueList As FieldValueList

        ''' <summary>
        ''' The field list within the profile that the control is mapped to
        ''' </summary>
        Public Property FieldList() As FieldMetadataListWrapper
            Get
                Return mProfileVersionFieldList
            End Get
            Set(ByVal value As FieldMetadataListWrapper)
                mProfileVersionFieldList = value
                EnsureChildControls()
                Dim currentField As Integer
                'when the field list is set, cascade this to the controls by setting each of their Field properties
                For Each childControl As Control In Me.Controls
                    Dim fieldControl As IProfileField = DirectCast(childControl, IProfileField)
                    fieldControl.Field = mProfileVersionFieldList(currentField)
                    currentField += 1
                Next
            End Set
        End Property

        Public Property FieldValues() As FieldValueList
            Get
                Return mFieldValueList
            End Get
            Set(ByVal value As FieldValueList)
                mFieldValueList = value
            End Set
        End Property

        ''' <summary>
        ''' Sets the values displayed in the user interface to the values held in the business layer
        ''' </summary>
        Public Sub UpdateUIValue(ByVal valueList As FieldValueList)

            Dim currentValueIndex As Integer

            'loop through each child control and update its UI value
            For Each childControl As Control In Me.Controls

                Dim fieldControl As IProfileField = DirectCast(childControl, IProfileField)

                fieldControl.UpdateUIValue(valueList(currentValueIndex))
                currentValueIndex += 1
            Next

        End Sub

        Public Sub CloseSubPanel()

            For Each childControl As Control In Me.Controls
                If TypeOf (childControl) Is FieldGroupProfileField Then
                    Dim fieldGroupControl As FieldGroupProfileField = DirectCast(childControl, FieldGroupProfileField)
                    fieldGroupControl.CloseSubPanel()
                End If
            Next

        End Sub

        Public Sub SaveSubPanel()

            For Each childControl As Control In Me.Controls
                If TypeOf (childControl) Is FieldGroupProfileField Then
                    Dim fieldGroupControl As FieldGroupProfileField = DirectCast(childControl, FieldGroupProfileField)
                    fieldGroupControl.SaveSubPanel()
                End If
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
        ''' Creates the controls that make up the interface. This is called by the ASP.NET infrastructure after the FieldList property is
        ''' set (so we know the characteristics of the fields we are displaying) but before UpdateUIValue is called (so we don't yet
        ''' know the field values)
        ''' </summary>
        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            Dim fieldControl As IProfileField
            For Each field As FieldMetadataWrapper In mProfileVersionFieldList
                Select Case field.DataType
                    Case DataFieldType.LongTextType
                        fieldControl = New LongTextProfileField
                    Case DataFieldType.ListType
                        If field.IsReadOnly Then
                            fieldControl = New CheckBoxListProfileField
                        Else
                            fieldControl = New DropDownListProfileField
                        End If
                    Case DataFieldType.BooleanType
                        fieldControl = New BooleanProfileField
                    Case DataFieldType.MultiValueListType
                        fieldControl = New CheckBoxListProfileField
                    Case DataFieldType.DateType
                        fieldControl = New DateProfileField
                    Case DataFieldType.DecimalType
                        fieldControl = New DecimalProfileField
                    Case DataFieldType.FieldGroup
                        fieldControl = New FieldGroupProfileField
                    Case Else
                        fieldControl = New TextProfileField
                End Select
                Controls.Add(fieldControl)
            Next

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)

            If mFieldValueList IsNot Nothing Then

                Dim controlIndex As Integer = 0
                For Each currentControl As Control In Me.Controls

                    Dim value As FieldValueBase = mFieldValueList(controlIndex)

                    If TypeOf (value) Is FieldGroupFieldValue Then
                        Dim currentFieldGroupProfileField As FieldGroupProfileField = DirectCast(currentControl, FieldGroupProfileField)
                        currentFieldGroupProfileField.FieldGroupValue = DirectCast(value, FieldGroupFieldValue)
                    End If

                    controlIndex += 1
                Next
            End If

            MyBase.OnPreRender(e)

        End Sub


        ''' <summary>
        ''' Writes out the HTML that makes up the control. This is called by the ASP.NET infrastructure late in the control lifecycle
        ''' when all properties have already been set.
        ''' </summary>
        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

            Dim currentFieldIndex As Integer
            Dim currentField As FieldMetadataWrapper

            'place all of the child controls in a table, with a control per row
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, "100%")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)

            For Each currentControl As Control In Controls

                currentField = mProfileVersionFieldList(currentFieldIndex)

                writer.RenderBeginTag(HtmlTextWriterTag.Tr)
                writer.RenderBeginTag(HtmlTextWriterTag.Td)

                writer.RenderBeginTag(HtmlTextWriterTag.Strong)
                writer.Write(currentField.Name)
                If currentField.DataType = DataFieldType.MultiValueListType Then
                    If currentField.Name.Length = 0 Then
                        writer.Write("Please select all that apply")
                    Else
                        writer.Write(" (please select all that apply)")
                    End If
                End If
                writer.RenderEndTag() '/Strong

                currentControl.RenderControl(writer)

                writer.RenderEndTag() '/Td
                writer.RenderEndTag() '/Tr
                currentFieldIndex += 1
            Next

            writer.RenderEndTag() '/Tbody
            writer.RenderEndTag() '/Table

        End Sub

        ''' <summary>
        ''' Sets the values held in the business layer to the values displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal valueList As FieldValueList)

            Dim currentValueIndex As Integer

            'cascade this save to the child controls
            For Each childControl As Control In Me.Controls
                Dim fieldControl As IProfileField = DirectCast(childControl, IProfileField)
                fieldControl.Save(valueList(currentValueIndex))
                currentValueIndex += 1
            Next

        End Sub

    End Class
End Namespace


