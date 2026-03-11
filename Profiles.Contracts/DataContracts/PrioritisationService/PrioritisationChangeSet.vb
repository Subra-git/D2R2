Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationChangeSet

        Private mRankingRangeUpperBound As Integer
        Private mRankingRangeLowerBound As Integer
        Private mLastUpdated(7) As Byte
        Private mCriterionValueUpdateList As List(Of CriterionValueUpdate)
        Private mCriterionUpdateList As List(Of CriterionUpdate)

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

        Public Property LastUpdated() As Byte()
            Get
                Return mLastUpdated
            End Get
            Set(ByVal value As Byte())
                mLastUpdated = value
            End Set
        End Property

        Public Property CriterionValueUpdateList() As List(Of CriterionValueUpdate)
            Get
                Return mCriterionValueUpdateList
            End Get
            Set(ByVal value As List(Of CriterionValueUpdate))
                mCriterionValueUpdateList = value
            End Set
        End Property

        Public Property CriterionUpdateList() As List(Of CriterionUpdate)
            Get
                Return mCriterionUpdateList
            End Get
            Set(ByVal value As List(Of CriterionUpdate))
                mCriterionUpdateList = value
            End Set
        End Property

        Public Sub New()
            mCriterionValueUpdateList = New List(Of CriterionValueUpdate)
            mCriterionUpdateList = New List(Of CriterionUpdate)
        End Sub

    End Class
End Namespace

