Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls

    Public Class RepeatingProfileQuestion
        Inherits WebControl
        Implements INamingContainer, IProfileQuestion

        Private mProfileVersionQuestion As RepeatingQuestion
        Private mProfileRowListPanel As ProfileRowListPanel

        Public Property Question() As QuestionBase Implements IProfileQuestion.Question
            Get
                Return mProfileVersionQuestion
            End Get
            Set(ByVal value As QuestionBase)
                If Not TypeOf value Is RepeatingQuestion Then
                    Throw New ArgumentOutOfRangeException("Attempted to assign the wrong kind of question to this control")
                End If
                Me.ID = "ques" & value.ShortName.Replace(" ", String.Empty)
                Dim isRefresh As Boolean = (mProfileVersionQuestion IsNot Nothing)
                mProfileVersionQuestion = CType(value, RepeatingQuestion)
                EnsureChildControls()
                If isRefresh Then
                    mProfileRowListPanel.Question = mProfileVersionQuestion
                End If
            End Set
        End Property

        Public Overrides ReadOnly Property Controls() As System.Web.UI.ControlCollection
            Get
                EnsureChildControls()
                Return MyBase.Controls
            End Get
        End Property

        Protected Overrides Sub CreateChildControls()

            Controls.Clear()

            mProfileRowListPanel = New ProfileRowListPanel
            Controls.Add(mProfileRowListPanel)
            mProfileRowListPanel.Question = mProfileVersionQuestion

        End Sub

        Public Sub Save() Implements IProfileQuestion.Save
            mProfileRowListPanel.SaveSubPanel()
        End Sub

        ''' <summary>
        ''' Closes any open sub-panels for this question
        ''' </summary>
        Public Sub CloseSubPanel() Implements IProfileQuestion.CloseSubPanel
            mProfileRowListPanel.CloseSubPanel()
        End Sub
    End Class
End Namespace

