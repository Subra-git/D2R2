Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationCategoryScore

        Private mPrioritisationCategoryId As Guid
        Private mPrioritisationCategoryName As String
        Private mProfileVersionTitle As String
        Private mSpeciesId As Guid
        Private mSpeciesName As String
        Private mDataIncomplete As Boolean
        Private mScore As Integer
        Private mRank As Integer
        Private mIsProfiledSpecies As Boolean

        Public Property PrioritisationCategoryId() As Guid
            Get
                Return mPrioritisationCategoryId
            End Get
            Set(ByVal value As Guid)
                mPrioritisationCategoryId = value
            End Set
        End Property

        Public Property PrioritisationCategoryName() As String
            Get
                Return mPrioritisationCategoryName
            End Get
            Set(ByVal value As String)
                mPrioritisationCategoryName = value
            End Set
        End Property

        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        Public Property SpeciesName() As String
            Get
                Return mSpeciesName
            End Get
            Set(ByVal value As String)
                mSpeciesName = value
            End Set
        End Property

        Public Property DataIncomplete() As Boolean
            Get
                Return mDataIncomplete
            End Get
            Set(ByVal value As Boolean)
                mDataIncomplete = value
            End Set
        End Property

        Public Property Score() As Integer
            Get
                Return mScore
            End Get
            Set(ByVal value As Integer)
                mScore = value
            End Set
        End Property

        Public Property Rank() As Integer
            Get
                Return mRank
            End Get
            Set(ByVal value As Integer)
                mRank = value
            End Set
        End Property

        Public Property IsProfiledSpecies() As Boolean
            Get
                Return mIsProfiledSpecies
            End Get
            Set(ByVal value As Boolean)
                mIsProfiledSpecies = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
