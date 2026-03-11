Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a standard (not per-species, not repeating) question.
    ''' It delegates most of this work to the ProfileFieldListPanel, including all of the rendering
    ''' </summary>
    Public Class StandardProfileQuestion
        Inherits WebControl
        Implements INamingContainer, IProfileQuestion

        Private mProfileVersionQuestion As StandardQuestion
        Private mProfileFieldListPanel As ProfileFieldListPanel

        ''' <summary>
        ''' The question within the profile that the control is mapped to
        ''' </summary>
        Public Property Question() As QuestionBase Implements IProfileQuestion.Question
            Get
                Return mProfileVersionQuestion
            End Get
            Set(ByVal value As ProfilesLibrary.QuestionBase)
                If Not TypeOf value Is StandardQuestion Then
                    Throw New ArgumentOutOfRangeException("Attempted to assign the wrong kind of question to this control")
                End If
                Me.ID = "ques" & value.ShortName.Replace(" ", String.Empty)
                Dim isRefresh As Boolean = (mProfileVersionQuestion IsNot Nothing)
                mProfileVersionQuestion = CType(value, StandardQuestion)
                EnsureChildControls()
                If (Not Me.Page.IsPostBack) OrElse isRefresh Then
                    mProfileFieldListPanel.UpdateUIValue(mProfileVersionQuestion.FieldValues)
                End If
            End Set
        End Property

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
        ''' Creates the controls that make up the interface.
        ''' </summary>
        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            mProfileFieldListPanel = New ProfileFieldListPanel
            Controls.Add(mProfileFieldListPanel)
            mProfileFieldListPanel.FieldList = mProfileVersionQuestion.FieldList

        End Sub

        ''' <summary>
        ''' Sets the values held in the business layer to the values displayed in the user interface 
        ''' </summary>
        Public Sub Save() Implements IProfileQuestion.Save

            'delegate to the panel
            mProfileFieldListPanel.Save(mProfileVersionQuestion.FieldValues)

        End Sub

        ''' <summary>
        ''' Closes any open sub-panels for this question
        ''' </summary>
        Public Sub CloseSubPanel() Implements IProfileQuestion.CloseSubPanel
            '
        End Sub
    End Class
End Namespace

