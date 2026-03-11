Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileQuestionMetadata
        Inherits QuestionMetadata

        Private mIsPerSpecies As Boolean
        Private mIsRepeating As Boolean
        Private mIrrelevanceFieldId As Guid
        Private mIrrelevanceValueId As Guid
        Private mIrrelevanceFlag As Boolean

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
        Public Property IrrelevanceFieldId() As Guid
            Get
                Return mIrrelevanceFieldId
            End Get
            Set(ByVal value As Guid)
                mIrrelevanceFieldId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IrrelevanceValueId() As Guid
            Get
                Return mIrrelevanceValueId
            End Get
            Set(ByVal value As Guid)
                mIrrelevanceValueId = value
            End Set
        End Property

        <DataMember()> _
        Public Property IrrelevanceFlag() As Boolean
            Get
                Return mIrrelevanceFlag
            End Get
            Set(ByVal value As Boolean)
                mIrrelevanceFlag = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
