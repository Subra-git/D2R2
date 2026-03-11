Imports System
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports ProfilesLibrary
Imports System.Collections.Generic

Namespace ProfilesWeb.Controls

    Public Class FieldGroupPerSpeciesListPanel
        Inherits PerSpeciesListPanel

        Private mFieldGroupId As Guid

        Public Overrides Property SpeciesList() As QuestionSpeciesList
            Get
                If HttpContext.Current.Session("SpeciesList" + mFieldGroupId.ToString()) IsNot Nothing Then
                    mSpeciesList = DirectCast(HttpContext.Current.Session("SpeciesList" + mFieldGroupId.ToString()), QuestionSpeciesList)
                    Return mSpeciesList
                Else
                    Return Nothing
                End If
            End Get
            Set(ByVal value As QuestionSpeciesList)
                EnsureChildControls()
                mSpeciesList = value
                HttpContext.Current.Session("SpeciesList" + mFieldGroupId.ToString()) = mSpeciesList
            End Set
        End Property

        Public Property FieldGroupId() As Guid
            Get
                Return mFieldGroupId
            End Get
            Set(ByVal value As Guid)
                mFieldGroupId = value
            End Set
        End Property

    End Class
End Namespace


