Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace ProfilesWeb.Controls
    ''' <summary>
    ''' Validates an input field to see if it contains a smartdate
    ''' </summary>
    Public Class DateValidator
        Inherits Sample.Web.UI.Compatibility.BaseValidator

        Public Property IsLargeDate() As Boolean
            Get
                If ViewState("IsLargeDate") IsNot Nothing Then
                    Return CBool(ViewState("IsLargeDate"))
                End If
                Return False
            End Get
            Set(ByVal value As Boolean)
                ViewState("IsLargeDate") = value
            End Set
        End Property

        Protected Overrides Function EvaluateIsValid() As Boolean
            Dim value As String = Me.GetControlValidationValue(Me.ControlToValidate)

            'Test if the date is empty - this is allowed by this validation function
            If value.Length = 0 Then
                Return True
            End If

            'Test if the value in the date field passed in is a valid date format
            If Not IsDate(value) Then
                Return False
            End If

            If IsLargeDate Then

                'Test for the maximum and minimum dates allowed by a datetime
                If Convert.ToDateTime(value) > ("31 December 9999") Then
                    Return False
                End If

                If Convert.ToDateTime(value) < ("1 January 1753") Then
                    Return False
                End If
            Else

                'Test for the maximum and minimum dates allowed by a smalldatetime
                If Convert.ToDateTime(value) > ("06/06/2079") Then
                    Return False
                End If

                If Convert.ToDateTime(value) < ("01/01/1900") Then
                    Return False
                End If
            End If

            Return True

        End Function

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
            MyBase.OnPreRender(e)

            If RenderUplevel AndAlso Page IsNot Nothing AndAlso Not Page.ClientScript.IsClientScriptIncludeRegistered(Me.GetType(), "dateValidatorCheckGen") Then
                Page.ClientScript.RegisterClientScriptInclude(Me.GetType, "dateValidatorCheckGen", "Javascript/checkgen.js")
            End If

            If RenderUplevel AndAlso Page IsNot Nothing AndAlso Not Page.ClientScript.IsClientScriptIncludeRegistered(Me.GetType(), "dateValidatorCheckDate") Then
                Page.ClientScript.RegisterClientScriptInclude(Me.GetType, "dateValidatorCheckDate", "Javascript/checkdate.js")
            End If

        End Sub

        Protected Overrides Sub AddAttributesToRender(ByVal writer As HtmlTextWriter)

            MyBase.AddAttributesToRender(writer)
            If IsLargeDate Then
                writer.AddAttribute("evaluationfunction", "DateValidatorEvaluateLarge", False)
            Else
                writer.AddAttribute("evaluationfunction", "DateValidatorEvaluateSmall", False)
            End If

        End Sub


    End Class

End Namespace