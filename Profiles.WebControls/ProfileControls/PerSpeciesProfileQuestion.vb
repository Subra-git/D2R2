Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls

    Public Class PerSpeciesProfileQuestion
        Inherits WebControl
        Implements INamingContainer, IProfileQuestion

        Private mProfileVersionQuestion As PerSpeciesQuestion
        Private mPerSpeciesListPanel As PerSpeciesListPanel

        Public Property Question() As QuestionBase Implements IProfileQuestion.Question
            Get
                Return mProfileVersionQuestion
            End Get
            Set(ByVal value As QuestionBase)
                If Not TypeOf value Is PerSpeciesQuestion Then
                    Throw New ArgumentOutOfRangeException("Attempted to assign the wrong kind of question to this control")
                End If
                Me.ID = "ques" & value.ShortName.Replace(" ", String.Empty)
                mProfileVersionQuestion = CType(value, PerSpeciesQuestion)
                EnsureChildControls()
                mPerSpeciesListPanel.SpeciesList = mProfileVersionQuestion.SpeciesList
                mPerSpeciesListPanel.QuestionShortName = mProfileVersionQuestion.ShortName
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

            mPerSpeciesListPanel = New PerSpeciesListPanel
            mPerSpeciesListPanel.QuestionShortName = mProfileVersionQuestion.ShortName
            mPerSpeciesListPanel.FieldList = mProfileVersionQuestion.FieldList
            mPerSpeciesListPanel.ProfiledSpeciesList = mProfileVersionQuestion.ProfiledSpeciesList
            mPerSpeciesListPanel.SpeciesList = mProfileVersionQuestion.SpeciesList

            Controls.Add(mPerSpeciesListPanel)

        End Sub

        Public Sub Save() Implements IProfileQuestion.Save
            mPerSpeciesListPanel.SaveSubPanel()
        End Sub

        Public Sub CloseSubPanel() Implements IProfileQuestion.CloseSubPanel
            mPerSpeciesListPanel.CloseSubPanel()
        End Sub

    End Class
End Namespace

