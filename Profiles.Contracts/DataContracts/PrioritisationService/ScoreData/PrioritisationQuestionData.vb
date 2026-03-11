Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class PrioritisationQuestionData

        Private mId As Guid
        Private mPrioritisationCategoryId As Guid
        Private mSectionNumber As Integer
        Private mQuestionNumber As Integer
        Private mName As String
        Private mIsPerSpecies As Boolean
        Private mCriterionCode As String
        Private mCriterionName As String

        <DataMember()> _
        Public Property Id() As Guid
            Get
                Return mId
            End Get
            Set(ByVal value As Guid)
                mId = value
            End Set
        End Property

        <DataMember()> _
        Public Property PrioritisationCategoryId() As Guid
            Get
                Return mPrioritisationCategoryId
            End Get
            Set(ByVal value As Guid)
                mPrioritisationCategoryId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
            Set(ByVal value As Integer)
                mSectionNumber = value
            End Set
        End Property

        <DataMember()> _
       Public Property QuestionNumber() As Integer
            Get
                Return mQuestionNumber
            End Get
            Set(ByVal value As Integer)
                mQuestionNumber = value
            End Set
        End Property

        <DataMember()> _
       Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsPerSpecies() As Boolean
            Get
                Return mIsPerSpecies
            End Get
            Set(ByVal value As Boolean)
                mIsPerSpecies = value
            End Set
        End Property

        <DataMember()> _
       Public Property CriterionCode() As String
            Get
                Return mCriterionCode
            End Get
            Set(ByVal value As String)
                mCriterionCode = value
            End Set
        End Property

        <DataMember()> _
        Public Property CriterionName() As String
            Get
                Return mCriterionName
            End Get
            Set(ByVal value As String)
                mCriterionName = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace