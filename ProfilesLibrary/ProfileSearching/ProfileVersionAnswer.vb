Imports Csla
Imports Profiles.Contracts

<Serializable()>
Public Class ProfileVersionAnswer
    Inherits ReadOnlyBase(Of ProfileVersionAnswer)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileId As Guid
    Private mScenarioId As Guid
    Private mProfileVersionId As Guid
    Private mSectionNumber As Integer
    Private mAnswer As String
    Private mQuestionNumber As Integer
    Private mQuestionShortName As String
    Private mGuidance As String
    Private mWordsMatched As List(Of String)
    Private mMatchedInGuidance As Boolean

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ScenarioId() As Guid
        Get
            Return mScenarioId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property SectionNumber() As Integer
        Get
            Return mSectionNumber
        End Get
    End Property

    Public ReadOnly Property Answer() As String
        Get
            Return mAnswer
        End Get
    End Property

    Public ReadOnly Property QuestionNumber As Integer
        Get
            Return mQuestionNumber
        End Get
    End Property

    Public ReadOnly Property QuestionShortName As String
        Get
            Return mQuestionShortName
        End Get
    End Property

    Public ReadOnly Property Guidance As String
        Get
            Return mGuidance
        End Get
    End Property

    Public ReadOnly Property WordsMatched As List(Of String)
        Get
            Return mWordsMatched
        End Get
    End Property

    Public ReadOnly Property MatchedInGuidance As Boolean
        Get
            Return mMatchedInGuidance
        End Get
    End Property

    Public Function AnswerContainsWords(ByVal words As List(Of String), ByVal sectionSelection As List(Of Integer)) As Boolean
        Return words.All(Function(word) words IsNot Nothing AndAlso mAnswer.ToLower.Contains(word.ToLower) AndAlso sectionSelection IsNot Nothing AndAlso sectionSelection.Contains(mSectionNumber))
    End Function

    Public Function GuidanceContainsWords(ByVal words As List(Of String), ByVal sectionSelection As List(Of Integer)) As Boolean
        Return words.All(Function(word) words IsNot Nothing AndAlso mGuidance.ToLower.Contains(word.ToLower) AndAlso sectionSelection IsNot Nothing AndAlso sectionSelection.Contains(mSectionNumber))
    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mId.ToString
    End Function

    Public Sub AddMatchedWord(ByVal word As String, ByVal matchedInGuidance As Boolean)
        mWordsMatched.Add(word)
        mMatchedInGuidance = matchedInGuidance
    End Sub

    Public Sub ClearMatchedWords()
        mWordsMatched.Clear()
    End Sub
#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionAnswer(ByVal answer As DataContracts.ProfileSearchProfileAnswer) As ProfileVersionAnswer
        Return New ProfileVersionAnswer(answer)
    End Function

    Private Sub New()
        mWordsMatched = New List(Of String)
    End Sub

    Private Sub New(ByVal answer As DataContracts.ProfileSearchProfileAnswer)
        Fetch(answer)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal answer As DataContracts.ProfileSearchProfileAnswer)
        mId = answer.AnswerId
        mProfileId = answer.ProfileId
        mScenarioId = answer.ScenarioId
        mProfileVersionId = answer.ProfileVersionId
        mSectionNumber = answer.SectionNumber
        mAnswer = answer.Answer
        mQuestionNumber = answer.QuestionNumber
        mQuestionShortName = answer.QuestionShortName
        mGuidance = answer.Guidance
        mWordsMatched = New List(Of String)
    End Sub

#End Region

End Class



