Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a date field value to the user and enable them to edit it.
    ''' </summary>
    Public Class DateProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mTextField As TextBox
        Private mCalendarImage As Image
        Private mCalendarExtender As AjaxControlToolkit.CalendarExtender
        Private mValidator As DateValidator

        Private mField As FieldMetadataWrapper

        ''' <summary>
        ''' The field within the profile that the control is mapped to
        ''' </summary>
        Public Property Field() As ProfilesLibrary.FieldMetadataWrapper Implements IProfileField.Field
            Get
                Return mField
            End Get
            Set(ByVal value As ProfilesLibrary.FieldMetadataWrapper)
                mField = value
            End Set
        End Property

        ''' <summary>
        ''' Sets the value displayed in the user interface to the value held in the business layer
        ''' </summary>
        Public Sub UpdateUIValue(ByVal value As FieldValueBase) Implements IProfileField.UpdateUIValue

            EnsureChildControls()
            If value IsNot Nothing AndAlso Not value.IsEmpty Then
                mTextField.Text = Csla.SmartDate.DateToString(DirectCast(value, DateFieldValue).FieldValue.Value, "d MMMM yyyy")
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

            'text field to hold the date value
            Controls.Clear()
            mTextField = New TextBox
            mTextField.Style.Add("width", "150px")
            mTextField.ID = "dateBox"
            mTextField.Visible = Not mField.IsReadOnly
            Controls.Add(mTextField)

            If mField.SourceOfDataReplication Then
                mTextField.Attributes.Add("onblur", FieldMetadataWrapper.TriggerPropertyChangedEventScript)
            End If

            'validator to ensure only dates can be entered
            mValidator = New DateValidator

            mValidator.ID = "cvalDate"
            mValidator.ControlToValidate = mTextField.ID
            mValidator.ErrorMessage = "Please enter a valid date"
            mValidator.Text = "*"
            mValidator.ToolTip = "Please enter a valid date"
            mValidator.IsLargeDate = True
            mValidator.EnableClientScript = True
            mValidator.Enabled = True

            Controls.Add(mValidator)


            'image button to enable the user to choose dropdown calendar
            mCalendarImage = New Image
            mCalendarImage.ImageUrl = "~/Images/Calendar.gif"
            mCalendarImage.ID = "imgCalendar"
            mCalendarImage.Visible = Not mField.IsReadOnly
            Controls.Add(mCalendarImage)


            'Ajax control toolkit calendar extender
            mCalendarExtender = New AjaxControlToolkit.CalendarExtender
            mCalendarExtender.Format = "d MMMM yyyy"
            mCalendarExtender.TargetControlID = mTextField.ID
            mCalendarExtender.PopupButtonID = mCalendarImage.ID
            mCalendarExtender.CssClass = "ProfilesCalendar"
            Controls.AddAt(0, mCalendarExtender)

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
            End If

            writer.RenderBeginTag(HtmlTextWriterTag.P)

            'if the field is read only, write out the text property directly
            If mField.IsReadOnly Then
                writer.Write(mTextField.Text)
            End If

            'render the textbox control
            mTextField.RenderControl(writer)

            'render the image button
            writer.Write("&nbsp;")
            mCalendarImage.RenderControl(writer)

            'render the validator
            writer.Write("&nbsp;")
            mValidator.RenderControl(writer)

            'render the calendar extender
            mCalendarExtender.RenderControl(writer)

            writer.RenderEndTag() '/P

        End Sub

        ''' <summary>
        ''' Sets the value held in the business layer to the value displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal value As FieldValueBase) Implements IProfileField.Save

            If Not mField.IsReadOnly Then
                If mTextField.Text.Length = 0 Then
                    DirectCast(value, DateFieldValue).FieldValue = Nothing
                Else
                    Try
                        DirectCast(value, DateFieldValue).FieldValue = DateTime.Parse(mTextField.Text)
                    Catch ex As Exception
                        Throw New InvalidOperationException("Cannot save as value is not a valid date")
                    End Try

                End If
            End If

        End Sub

    End Class
End Namespace



