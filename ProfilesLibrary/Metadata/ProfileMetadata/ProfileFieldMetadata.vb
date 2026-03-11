Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileFieldMetadata
    Inherits FieldMetadataBase

#Region " Business Methods "

    Private mAffectsRelevance As Boolean
    Private mAffectsRelevanceOf As String
    Private mName As String
    Private mIsReadOnlyCurrentSituation As Boolean
    Private mIsReadOnlyScenario As Boolean
    Private mIsPerSpecies As Boolean
    Private mIsRepeating As Boolean

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

    Public ReadOnly Property IsReadOnlyCurrentSituation() As Boolean
        Get
            Return mIsReadOnlyCurrentSituation
        End Get
    End Property

    Public ReadOnly Property IsReadOnlyScenario() As Boolean
        Get
            Return mIsReadOnlyScenario
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
#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileFieldMetadata(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata) As ProfileFieldMetadata

        Dim dataTypeName As String = dtoProfileFieldMetadata.DataTypeName

        If GlobalCommon.GetDataFieldType(dataTypeName) = DataFieldType.FieldGroup Then
            Dim dtoGroup As DataContracts.ProfileFieldGroupMetadata = DirectCast(dtoProfileFieldMetadata, DataContracts.ProfileFieldGroupMetadata)
            Return ProfileFieldGroupMetadata.GetProfileFieldGroupMetadata(dtoProfileFieldMetadata)
        Else
            Return New ProfileFieldMetadata(dtoProfileFieldMetadata)
        End If

    End Function

    Private Sub New(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata)
        Fetch(dtoProfileFieldMetadata)
    End Sub

    Protected Sub New()
        '
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata)
        MyBase.Fetch(dtoProfileFieldMetadata)
        mAffectsRelevance = dtoProfileFieldMetadata.AffectsRelevance
        mAffectsRelevanceOf = dtoProfileFieldMetadata.AffectsRelevanceOf
        mName = dtoProfileFieldMetadata.Name
        mIsReadOnlyCurrentSituation = dtoProfileFieldMetadata.IsReadOnlyCurrentSituation
        mIsReadOnlyScenario = dtoProfileFieldMetadata.IsReadOnlyScenario
        mIsPerSpecies = dtoProfileFieldMetadata.IsPerSpecies
        mIsRepeating = dtoProfileFieldMetadata.IsRepeating
        mIncludeInSummary = dtoProfileFieldMetadata.IncludeInSummary
    End Sub

#End Region

End Class

