Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCategoryScore
    Inherits ReadOnlyBase(Of PrioritisationCategoryScore)

#Region " Business Methods "

    Private mPrioritisationCategoryId As Guid
    Private mPrioritisationCategoryName As String
    Private mSpeciesId As Guid
    Private mSpeciesName As String
    Private mDataIncomplete As Boolean
    Private mScore As Integer
    Private mRank As Integer
    Private mIsProfiledSpecies As Boolean

    Public ReadOnly Property PrioritisationCategoryId() As Guid
        Get
            Return mPrioritisationCategoryId
        End Get
    End Property

    Public ReadOnly Property PrioritisationCategoryName() As String
        Get
            Return mPrioritisationCategoryName
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property SpeciesName() As String
        Get
            Return mSpeciesName
        End Get
    End Property

    Public ReadOnly Property DataIncomplete() As Boolean
        Get
            Return mDataIncomplete
        End Get
    End Property

    Public ReadOnly Property Score() As Integer
        Get
            Return mScore
        End Get
    End Property

    Public ReadOnly Property Rank() As Integer
        Get
            Return mRank
        End Get
    End Property

    Public ReadOnly Property IsProfiledSpecies() As Boolean
        Get
            Return mIsProfiledSpecies
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mPrioritisationCategoryId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetScore(ByVal dtoCategoryScore As DataContracts.PrioritisationCategoryScore) As PrioritisationCategoryScore

        Return New PrioritisationCategoryScore(dtoCategoryScore)

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal dtoCategoryScore As DataContracts.PrioritisationCategoryScore)
        Fetch(dtoCategoryScore)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCategoryScore As DataContracts.PrioritisationCategoryScore)

        mPrioritisationCategoryId = dtoCategoryScore.PrioritisationCategoryId
        mPrioritisationCategoryName = dtoCategoryScore.PrioritisationCategoryName
        mSpeciesId = dtoCategoryScore.SpeciesId
        mSpeciesName = dtoCategoryScore.SpeciesName
        mDataIncomplete = dtoCategoryScore.DataIncomplete
        mScore = dtoCategoryScore.Score
        mRank = dtoCategoryScore.Rank
        mIsProfiledSpecies = dtoCategoryScore.IsProfiledSpecies

    End Sub

#End Region

End Class

