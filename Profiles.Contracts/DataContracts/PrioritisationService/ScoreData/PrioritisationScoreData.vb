Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationScoreData

        Private mProfileVersionId As Guid
        Private mSpeciesId As Guid
        Private mPrioritisationCategoryId As Guid
        Private mScore As Integer
        Private mRank As Integer

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationCategoryId() As Guid
            Get
                Return mPrioritisationCategoryId
            End Get
            Set(ByVal value As Guid)
                mPrioritisationCategoryId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Score() As Integer
            Get
                Return mScore
            End Get
            Set(ByVal value As Integer)
                mScore = value
            End Set
        End Property

        <DataMember()> _
        Public Property Rank() As Integer
            Get
                Return mRank
            End Get
            Set(ByVal value As Integer)
                mRank = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace