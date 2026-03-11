Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    <KnownType(GetType(ProfileFieldGroupMetadata))> _
    Public Class ProfileFieldMetadata
        Inherits FieldMetadata

        Private mName As String
        Private mAffectsRelevance As Boolean
        Private mAffectsRelevanceOf As String
        Private mIsReadOnlyCurrentSituation As Boolean
        Private mIsReadOnlyScenario As Boolean
        Private mIsPerSpecies As Boolean
        Private mIsRepeating As Boolean
        Private mProfileFieldGroupId As Guid = Guid.Empty

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property AffectsRelevance() As Boolean
            Get
                Return mAffectsRelevance
            End Get
            Set(ByVal value As Boolean)
                mAffectsRelevance = value
            End Set
        End Property

        <DataMember()> _
        Public Property AffectsRelevanceOf() As String
            Get
                If String.IsNullOrEmpty(mAffectsRelevanceOf) Then
                    Return String.Empty
                Else
                    Return mAffectsRelevanceOf
                End If
            End Get
            Set(ByVal value As String)
                mAffectsRelevanceOf = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsReadOnlyCurrentSituation() As Boolean
            Get
                Return mIsReadOnlyCurrentSituation
            End Get
            Set(ByVal value As Boolean)
                mIsReadOnlyCurrentSituation = value
            End Set
        End Property
        <DataMember()> _
        Public Property IsReadOnlyScenario() As Boolean
            Get
                Return mIsReadOnlyScenario
            End Get
            Set(ByVal value As Boolean)
                mIsReadOnlyScenario = value
            End Set
        End Property
        <DataMember()> _
        Public Property IsPerSpecies() As Boolean
            Get
                Return mIsPerSpecies
            End Get
            Set(ByVal value As Boolean)
                mIsPerSpecies = value
            End Set
        End Property
        <DataMember()> _
        Public Property IsRepeating() As Boolean
            Get
                Return mIsRepeating
            End Get
            Set(ByVal value As Boolean)
                mIsRepeating = value
            End Set
        End Property
        <DataMember()> _
        Public Property ProfileFieldGroupId() As Guid
            Get
                Return mProfileFieldGroupId
            End Get
            Set(ByVal value As Guid)
                mProfileFieldGroupId = value
            End Set
        End Property
        Public Sub New()
            '
        End Sub

    End Class

End Namespace
