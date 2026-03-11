Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationScoreData
    Inherits ReadOnlyBase(Of PrioritisationScoreData)

    Private mId As Guid
    Private mSpeciesId As Guid
    Private mPrioritisationCategoryId As Guid
    Private mScore As Integer
    Private mRank As Integer

#Region " Business Methods"

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property PrioritisationCategoryId() As Guid
        Get
            Return mPrioritisationCategoryId
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

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationScoreData(ByVal dtoPrioritisationScoreData As DataContracts.PrioritisationScoreData) As PrioritisationScoreData
        Return New PrioritisationScoreData(dtoPrioritisationScoreData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoPrioritisationScoreData As DataContracts.PrioritisationScoreData)
        Fetch(dtoPrioritisationScoreData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoPrioritisationScoreData As DataContracts.PrioritisationScoreData)
        mId = Guid.NewGuid()
        mSpeciesId = dtoPrioritisationScoreData.SpeciesId
        mPrioritisationCategoryId = dtoPrioritisationScoreData.PrioritisationCategoryId
        mScore = dtoPrioritisationScoreData.Score
        mRank = dtoPrioritisationScoreData.Rank
    End Sub

#End Region

End Class
