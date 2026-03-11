Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports Profiles.WebControls
Imports ProfilesLibrary

Namespace Profiles.WebControls.ProfileControls
    ''' <summary>
    ''' This control encapsulates the user interface required to present a Field Group to the user and enable them to edit it.
    ''' </summary>
    Public Class FieldGroupProfileField
        Inherits WebControl
        Implements INamingContainer, IProfileField

        Private mPerSpeciesListPanel As FieldGroupPerSpeciesListPanel
        Private mFieldGroupFieldValue As FieldGroupFieldValue
        Private mFieldGroup As ProfileFieldGroupMetadataWrapper

        ''' <summary>
        ''' The field within the profile that the control is mapped to
        ''' </summary>
        Public Property Field() As FieldMetadataWrapper Implements IProfileField.Field
            Get
                Return mFieldGroup
            End Get
            Set(ByVal value As FieldMetadataWrapper)
                mFieldGroup = CType(value, ProfileFieldGroupMetadataWrapper)
            End Set
        End Property

        Public Property FieldGroupValue() As FieldGroupFieldValue
            Get
                Return mFieldGroupFieldValue
            End Get
            Set(ByVal value As FieldGroupFieldValue)
                mFieldGroupFieldValue = value
            End Set
        End Property

        ''' <summary>
        ''' Sets the value displayed in the user interface to the value held in the business layer
        ''' </summary>
        Public Sub UpdateUIValue(ByVal value As FieldValueBase) Implements IProfileField.UpdateUIValue
            '
        End Sub

        Public Sub CloseSubPanel()
            mPerSpeciesListPanel.CloseSubPanel()
        End Sub

        Public Sub SaveSubPanel()
            mPerSpeciesListPanel.SaveSubPanel()
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

            mPerSpeciesListPanel = New FieldGroupPerSpeciesListPanel
            mPerSpeciesListPanel.QuestionShortName = mFieldGroup.Name
            mPerSpeciesListPanel.FieldList = mFieldGroup.FieldList
            mPerSpeciesListPanel.ProfiledSpeciesList = mFieldGroup.ProfiledSpeciesList
            mPerSpeciesListPanel.FieldGroupId = mFieldGroup.Id

            Controls.Add(mPerSpeciesListPanel)

        End Sub

        Protected Overrides Sub OnPreRender(ByVal e As System.EventArgs)
            If FieldGroupValue IsNot Nothing Then
                mPerSpeciesListPanel.SpeciesList = FieldGroupValue.QuesSpecies
            End If
            MyBase.OnPreRender(e)

        End Sub

        ''' <summary>
        ''' Sets the value held in the business layer to the value displayed in the user interface 
        ''' </summary>
        Public Sub Save(ByVal value As FieldValueBase) Implements IProfileField.Save
            '
        End Sub

    End Class

End Namespace



