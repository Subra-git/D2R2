Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfilePrioritisationMetadata
        Inherits PrioritisationMetadata

        Private mId As Guid
        Private mRankingRangeUpperBound As Integer
        Private mRankingRangeLowerBound As Integer
        Private mCriterionValueUpdate As List(Of CriterionValueUpdate)

        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        Public Property RankingRangeUpperBound() As Integer
            Get
                Return mRankingRangeUpperBound
            End Get
            Set(ByVal value As Integer)
                mRankingRangeUpperBound = value
            End Set
        End Property

        Public Property RankingRangeLowerBound() As Integer
            Get
                Return mRankingRangeLowerBound
            End Get
            Set(ByVal value As Integer)
                mRankingRangeLowerBound = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
