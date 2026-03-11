Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationQuestionData
    Inherits ReadOnlyBase(Of PrioritisationQuestionData)

    Private mId As Guid
    Private mPrioritisationCategoryId As Guid
    Private mSectionNumber As Integer
    Private mQuestionNumber As Integer
    Private mName As String
    Private mIsPerSpecies As Boolean
    Private mCriterionCode As String
    Private mCriterionName As String

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property PrioritisationCategoryId() As Guid
        Get
            Return mPrioritisationCategoryId
        End Get
    End Property

    Public ReadOnly Property DisplayQuestionNumber() As String
        Get
            Return mSectionNumber.ToString() & "." & mQuestionNumber.ToString()
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mIsPerSpecies
        End Get
    End Property

    Public ReadOnly Property CriterionCode() As String
        Get
            Return mCriterionCode
        End Get
    End Property

    Public ReadOnly Property CriterionName() As String
        Get
            Return mCriterionName
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetPrioritisationQuestionData(ByVal dtoQuestionData As DataContracts.PrioritisationQuestionData) As PrioritisationQuestionData
        Return New PrioritisationQuestionData(dtoQuestionData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoQuestionData As DataContracts.PrioritisationQuestionData)
        Fetch(dtoQuestionData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoQuestionData As DataContracts.PrioritisationQuestionData)
        mId = dtoQuestionData.Id
        mPrioritisationCategoryId = dtoQuestionData.PrioritisationCategoryId
        mSectionNumber = dtoQuestionData.SectionNumber
        mQuestionNumber = dtoQuestionData.QuestionNumber
        mName = dtoQuestionData.Name
        mIsPerSpecies = dtoQuestionData.IsPerSpecies
        mCriterionCode = dtoQuestionData.CriterionCode
        mCriterionName = dtoQuestionData.CriterionName
    End Sub

#End Region



End Class
