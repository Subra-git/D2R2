Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()>
    Public Class ProfileSearchProfileAnswer

        Private mAnswerId As Guid
        Private mProfileVersionId As Guid
        Private mScenarioId As Guid
        Private mProfileId As Guid
        Private mSectionNumber As Integer
        Private mAnswer As String
        Private mQuestionShortName As String
        Private mQuestionNumber As Integer
        Private mGuidance As String

        <DataMember()>
        Public Property AnswerId() As Guid
            Get
                Return mAnswerId
            End Get
            Set(ByVal value As Guid)
                mAnswerId = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()>
        Public Property ScenarioId() As Guid
            Get
                Return mScenarioId
            End Get
            Set(ByVal value As Guid)
                mScenarioId = value
            End Set
        End Property

        <DataMember()>
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()>
        Public Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
            Set(ByVal value As Integer)
                mSectionNumber = value
            End Set
        End Property

        <DataMember()>
        Public Property Answer() As String
            Get
                Return mAnswer
            End Get
            Set(ByVal value As String)
                mAnswer = value
            End Set
        End Property

        <DataMember()>
        Public Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
            Set(ByVal value As Integer)
                mQuestionNumber = value
            End Set
        End Property

        <DataMember()>
        Public Property QuestionShortName() As String
            Get
                Return mQuestionShortName
            End Get
            Set(ByVal value As String)
                mQuestionShortName = value
            End Set
        End Property

        <DataMember()>
        Public Property Guidance() As String
            Get
                Return mGuidance
            End Get
            Set(ByVal value As String)
                mGuidance = value
            End Set
        End Property

        Public Sub New(ByVal answerId As Guid,
                       ByVal profileVersionId As Guid,
                       ByVal scenarioId As Guid,
                       ByVal profileId As Guid,
                       ByVal sectionNumber As Integer,
                       ByVal answer As String,
                       ByVal questionNumber As Integer,
                       ByVal questionShortName As String,
                       ByVal guidance As String)
            mAnswerId = answerId
            mProfileVersionId = profileVersionId
            mScenarioId = scenarioId
            mProfileId = profileId
            mSectionNumber = sectionNumber
            mAnswer = answer
            mQuestionNumber = questionNumber
            mQuestionShortName = questionShortName
            mGuidance = guidance
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
