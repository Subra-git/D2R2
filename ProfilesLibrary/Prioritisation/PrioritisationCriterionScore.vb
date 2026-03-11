Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCriterionScore
    Inherits ReadOnlyBase(Of PrioritisationCriterionScore)

#Region " Business Methods "

    Private mPrioritisationCategoryId As Guid
    Private mPrioritisationCategoryName As String
    Private mPrioritisationCategoryDisplayName As String
    Private mPrioritisationCriterionId As Guid
    Private mPrioritisationCriterionName As String
    Private mPrioritisationCriterionCode As String
    Private mSpeciesId As Guid
    Private mSpeciesName As String
    Private mDataIncomplete As Boolean
    Private mIrrelevantCategory As Boolean
    Private mCriterionValue As String
    Private mScore As Integer

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

    Public ReadOnly Property PrioritisationCriterionId() As Guid
        Get
            Return mPrioritisationCriterionId
        End Get
    End Property

    Public ReadOnly Property PrioritisationCriterionName() As String
        Get
            Return mPrioritisationCriterionName
        End Get
    End Property

    Public ReadOnly Property PrioritisationCategoryDisplayName() As String
        Get
            Return mPrioritisationCategoryDisplayName
        End Get
    End Property

    Public ReadOnly Property PrioritisationCriterionCode() As String
        Get
            Return mPrioritisationCriterionCode
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

    Public ReadOnly Property IrrelevantCategory() As Boolean
        Get
            Return mIrrelevantCategory
        End Get
    End Property

    Public ReadOnly Property CriterionValue() As String
        Get
            Return mCriterionValue
        End Get
    End Property

    Public ReadOnly Property Score() As Integer
        Get
            Return mScore
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mPrioritisationCategoryId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetScore(ByVal dtoCriterionScore As DataContracts.PrioritisationCriterionScore) As PrioritisationCriterionScore

        Return New PrioritisationCriterionScore(dtoCriterionScore)

    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoCriterionScore As DataContracts.PrioritisationCriterionScore)
        Fetch(dtoCriterionScore)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoCriterionScore As DataContracts.PrioritisationCriterionScore)

        mPrioritisationCategoryId = dtoCriterionScore.PrioritisationCategoryId
        mPrioritisationCategoryName = dtoCriterionScore.PrioritisationCategoryName
        mPrioritisationCategoryDisplayName = dtoCriterionScore.PrioritisationCategoryDisplayName
        mPrioritisationCriterionId = dtoCriterionScore.PrioritisationCriterionId
        mPrioritisationCriterionCode = dtoCriterionScore.PrioritisationCriterionCode
        mPrioritisationCriterionName = dtoCriterionScore.PrioritisationCriterionName
        mSpeciesId = dtoCriterionScore.SpeciesId
        mSpeciesName = dtoCriterionScore.SpeciesName
        mDataIncomplete = dtoCriterionScore.DataIncomplete
        mIrrelevantCategory = dtoCriterionScore.IrrelevantCategory
        mCriterionValue = dtoCriterionScore.CriterionValue
        mScore = dtoCriterionScore.Score

    End Sub

#End Region

End Class


