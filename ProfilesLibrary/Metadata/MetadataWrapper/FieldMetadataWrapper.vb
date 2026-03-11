Imports System.Text
Imports System.Web.UI
Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class FieldMetadataWrapper
    Inherits ReadOnlyBase(Of FieldMetadataWrapper)

    Private mFieldMetadata As FieldMetadataBase
    Private mIsProfileMetadataWrapper As Boolean
    Private mIsReadOnly As Boolean
    Private mParentId As Guid
    Private mProfileVersionId As Guid
    Private mAffectsRelevance As Boolean = False
    Private mAffectsRelevanceOf As String = String.Empty
    Private mName As String = String.Empty
    Private mIsReadOnlyScenario As Boolean
    Private mIsReadOnlyCurrentSituation As Boolean
    Private mIsReadOnlyByDefault As Boolean
    Private mIsPerSpecies As Boolean = False
    Private mIsRepeating As Boolean = False
    Private mQuestionType As QuestionType = ProfilesLibrary.QuestionType.Standard
    Private mIsVisible As Boolean = True

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mFieldMetadata.Id
        End Get
    End Property

    Public ReadOnly Property ShortName() As String
        Get
            Return mFieldMetadata.ShortName
        End Get
    End Property

    Public ReadOnly Property EditorFieldType() As EditorFieldType
        Get
            Return mFieldMetadata.EditorFieldType
        End Get
    End Property

    Public ReadOnly Property FieldNumber() As Integer
        Get
            Return mFieldMetadata.FieldNumber
        End Get
    End Property

    Public ReadOnly Property DataFieldTypeId() As Guid
        Get
            Return mFieldMetadata.DataFieldTypeId
        End Get
    End Property

    Public ReadOnly Property DataTypeName() As String
        Get
            Return mFieldMetadata.DataTypeName
        End Get
    End Property

    Public ReadOnly Property DataType() As DataFieldType
        Get
            Return mFieldMetadata.DataType
        End Get
    End Property

    Public ReadOnly Property IsMandatory() As Boolean
        Get
            Return mFieldMetadata.IsMandatory
        End Get
    End Property

    Public ReadOnly Property ReferenceTableId() As Guid
        Get
            Return mFieldMetadata.ReferenceTableId
        End Get
    End Property

    Public ReadOnly Property ReferenceTableIsMaintainable() As Boolean
        Get
            Return mFieldMetadata.ReferenceTableIsMaintainable
        End Get
    End Property

    Public ReadOnly Property IncludeInSummary() As Boolean
        Get
            Return mFieldMetadata.IncludeInSummary
        End Get
    End Property

    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mIsReadOnly
        End Get
    End Property

    Public ReadOnly Property ParentId() As Guid
        Get
            Return mParentId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property AffectsRelevance() As Boolean
        Get
            Return mAffectsRelevance
        End Get
    End Property

    Public ReadOnly Property AffectsRelevanceOf() As String
        Get
            Return mAffectsRelevanceOf
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property IsReadOnlyByDefault() As Boolean
        Get
            Return mIsReadOnlyByDefault
        End Get
    End Property

    Public ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mIsPerSpecies
        End Get
    End Property

    Public ReadOnly Property IsRepeating() As Boolean
        Get
            Return mIsRepeating
        End Get
    End Property

    Public ReadOnly Property QuestionType() As QuestionType
        Get
            Return mQuestionType
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mFieldMetadata.Id
    End Function

    Public ReadOnly Property RelevanceFieldId() As Guid
        Get
            Return mFieldMetadata.RelevanceFieldId
        End Get
    End Property

    Public ReadOnly Property RelevanceValueId() As Guid
        Get
            Return mFieldMetadata.RelevanceValueId
        End Get
    End Property

    Public ReadOnly Property AffectsVisibility As Boolean
        Get
            Return mFieldMetadata.AffectsVisibility
        End Get
    End Property

    Public ReadOnly Property SourceOfDataReplication As Boolean
        Get
            Return mFieldMetadata.SourceOfDataReplication
        End Get
    End Property

    Public ReadOnly Property TargetFieldList As List(Of Guid)
        Get
            Return mFieldMetadata.TargetFieldList
        End Get
    End Property

    Public Property IsVisible As Boolean
        Get
            Return mIsVisible
        End Get
        Set(value As Boolean)
            mIsVisible = value
        End Set
    End Property
#End Region

#Region " Helper Methods "

    Public Shared Function TriggerPropertyChangedEventScript() As String
        Return "triggerPropertyChangedEventServerSide();"
    End Function

    Public Shared Function AffectsVisibilityOnChangeScript() As String
        Return "HideAndClearIrrelevantQuestions();"
    End Function

	Public Shared Function AffectsRelevanceOnChangeScript(clientId As String, Field As FieldMetadataWrapper, refreshPanel As Boolean) As String
		Return $"apha.editProfileQuestions.affectsRelevance('{FieldStringBuilder(Field)}', {refreshPanel.ToString().ToLower}, '{clientId}')"
	End Function

	Public Shared Function AffectsRelevanceOnFocusScript(clientId As String) As String
        Return "lastSelectedIndex = document.getElementById('" & clientId & "').selectedIndex;"
    End Function

    Private Shared Function FieldStringBuilder(Field As FieldMetadataWrapper) As String
        Return Field.AffectsRelevanceOf.Substring(0, Field.AffectsRelevanceOf.Length - 2)
    End Function
#End Region

#Region " Factory Methods "

    Friend Shared Function GetFieldMetadataWrapper(ByVal fieldMetadata As FieldMetadataBase) As FieldMetadataWrapper
        Return New FieldMetadataWrapper(fieldMetadata)
    End Function

    Private Sub New(ByVal fieldMetadata As FieldMetadataBase)
        Fetch(fieldMetadata)
    End Sub

    Protected Sub New()
        ' requires use of factory methods
    End Sub

#End Region

#Region " Data Access"

    Friend Sub Fetch(ByVal fieldMetadata As FieldMetadataBase)
        mFieldMetadata = fieldMetadata

        If TypeOf (mFieldMetadata) Is SpeciesFieldMetadata Then
            mIsProfileMetadataWrapper = False
        Else
            mIsProfileMetadataWrapper = True
        End If

        If mIsProfileMetadataWrapper Then
            Dim profileFieldMetadata As ProfileFieldMetadata = TryCast(mFieldMetadata, ProfileFieldMetadata)
            If profileFieldMetadata IsNot Nothing Then
                mAffectsRelevance = profileFieldMetadata.AffectsRelevance
                mAffectsRelevanceOf = profileFieldMetadata.AffectsRelevanceOf
                mName = profileFieldMetadata.Name
                mIsPerSpecies = profileFieldMetadata.IsPerSpecies
                mIsRepeating = profileFieldMetadata.IsRepeating
                mIsReadOnlyScenario = profileFieldMetadata.IsReadOnlyScenario
                mIsReadOnlyCurrentSituation = profileFieldMetadata.IsReadOnlyCurrentSituation

                If mIsRepeating Then
                    mQuestionType = ProfilesLibrary.QuestionType.Repeating
                Else
                    If mIsPerSpecies Then
                        mQuestionType = ProfilesLibrary.QuestionType.PerSpecies
                    Else
                        mQuestionType = ProfilesLibrary.QuestionType.Standard
                    End If
                End If

            End If
        Else
            Dim speciesFieldMetadata As SpeciesFieldMetadata = TryCast(mFieldMetadata, SpeciesFieldMetadata)
            mName = speciesFieldMetadata.Name
        End If

    End Sub

    Friend Overridable Sub InitializeNonMetadata(ByVal isReadOnly As Boolean, ByVal parentId As Guid, ByVal profileVersionId As Guid, ByVal profiledSpeciesList As List(Of DataContracts.ProfiledSpecies))

        mParentId = parentId
        mProfileVersionId = profileVersionId

        If mIsProfileMetadataWrapper Then
            If mParentId.Equals(Guid.Empty) Then
                'current situation
                mIsReadOnlyByDefault = mIsReadOnlyCurrentSituation
            Else
                'whatif scenario
                mIsReadOnlyByDefault = mIsReadOnlyScenario
            End If
        End If

        If isReadOnly Then
            mIsReadOnly = True
        Else
            If mIsProfileMetadataWrapper Then
                mIsReadOnly = IsReadOnlyByDefault
            Else
                mIsReadOnly = False
            End If
        End If


        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        If (Not identity.IsProfileEditor) Then
            'This targets the 'Include extra epidemiology question in 1.5
            'so that it is not editable when you are not an editor
            Dim fieldId As New Guid("B93EE197-9E69-4e22-86BD-02B2C55223FB")

            If (Me.Id = fieldId) Then
                mIsReadOnly = True
            End If
        End If
    End Sub

#End Region


End Class
