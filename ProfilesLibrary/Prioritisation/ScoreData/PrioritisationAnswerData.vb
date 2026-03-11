Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationAnswerData
    Inherits ReadOnlyBase(Of PrioritisationAnswerData)

    Private mId As Guid
    Private mSpeciesId As Guid
    Private mAnswer As String
    Private mScore As Integer
    Private mWeighting As Integer

#Region " Business Methods "

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

    Public ReadOnly Property Answer() As String
        Get
            Return mAnswer
        End Get
    End Property

    Public ReadOnly Property Score() As Integer
        Get
            Return mScore
        End Get
    End Property

    Public ReadOnly Property Weighting() As Integer
        Get
            Return mWeighting
        End Get
    End Property

    Public ReadOnly Property WeightedScore() As Integer
        Get
            Return mScore * mWeighting
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationAnswerData(ByVal dtoAnswerData As DataContracts.PrioritisationAnswerData) As PrioritisationAnswerData
        Return New PrioritisationAnswerData(dtoAnswerData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoAnswerData As DataContracts.PrioritisationAnswerData)
        Fetch(dtoAnswerData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoAnswerData As DataContracts.PrioritisationAnswerData)
        mId = dtoAnswerData.Id
        mSpeciesId = dtoAnswerData.SpeciesId
        mAnswer = dtoAnswerData.Answer
        mScore = dtoAnswerData.Score
        mWeighting = dtoAnswerData.Weighting
    End Sub

#End Region


End Class
