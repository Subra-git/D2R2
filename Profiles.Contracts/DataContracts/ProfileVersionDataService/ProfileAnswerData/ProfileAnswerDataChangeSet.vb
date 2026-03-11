Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileAnswerDataChangeSet
        Inherits AnswerDataChangeSet

        Private mUserId As Guid
        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid
        Private mVAReviewFrequency As Guid
        Private mPolicyReviewFrequency As Guid
        Private mAuthorReviewFrequency As Guid
        Private mNextVAReview As Date
        Private mNextPolicyReview As Date
        Private mNextAuthorReview As Date
        Private mQuestionRowDeleteList As List(Of QuestionRowDelete)
        Private mQuestionRowInsertList As List(Of QuestionRow)
        Private mQuestionRowUpdateList As List(Of QuestionRow)
        Private mPolicyReviewStatusId As Guid
        Private mVAReviewStatusId As Guid
        Private mAuthorReviewStatusId As Guid
        Private mVAReviewCompleted As Date
        Private mPolicyReviewCompleted As Date
        Private mAuthorReviewCompleted As Date

        'not a DataMember - not passed across the WCF interface
        Public Property UserId() As Guid
            Get
                Return mUserId
            End Get
            Private Set(ByVal value As Guid)
                mUserId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
            Private Set(ByVal value As Guid)
                mProfileSectionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property VAReviewFrequency() As Guid
            Get
                Return mVAReviewFrequency
            End Get
            Set(ByVal value As Guid)
                mVAReviewFrequency = value
            End Set
        End Property

        <DataMember()> _
        Public Property PolicyReviewFrequency() As Guid
            Get
                Return mPolicyReviewFrequency
            End Get
            Set(ByVal value As Guid)
                mPolicyReviewFrequency = value
            End Set
        End Property

        <DataMember()> _
        Public Property AuthorReviewFrequency() As Guid
            Get
                Return mAuthorReviewFrequency
            End Get
            Set(ByVal value As Guid)
                mAuthorReviewFrequency = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property NextVAReview() As Date
            Get
                Return mNextVAReview
            End Get
            Set(ByVal value As Date)
                mNextVAReview = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property NextPolicyReview() As Date
            Get
                Return mNextPolicyReview
            End Get
            Set(ByVal value As Date)
                mNextPolicyReview = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property NextAuthorReview() As Date
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date)
                mNextAuthorReview = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionRowDeleteList() As List(Of QuestionRowDelete)
            Get
                Return mQuestionRowDeleteList
            End Get
            Set(ByVal value As List(Of QuestionRowDelete))
                mQuestionRowDeleteList = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionRowInsertList() As List(Of QuestionRow)
            Get
                Return mQuestionRowInsertList
            End Get
            Set(ByVal value As List(Of QuestionRow))
                mQuestionRowInsertList = value
            End Set
        End Property

        <DataMember()> _
        Public Property QuestionRowUpdateList() As List(Of QuestionRow)
            Get
                Return mQuestionRowUpdateList
            End Get
            Set(ByVal value As List(Of QuestionRow))
                mQuestionRowUpdateList = value
            End Set
        End Property

        <DataMember()> _
        Public Property PolicyReviewStatusId() As Guid
            Get
                Return mPolicyReviewStatusId
            End Get
            Set(ByVal value As Guid)
                mPolicyReviewStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property VAReviewStatusId() As Guid
            Get
                Return mVAReviewStatusId
            End Get
            Set(ByVal value As Guid)
                mVAReviewStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property AuthorReviewStatusId() As Guid
            Get
                Return mAuthorReviewStatusId
            End Get
            Set(ByVal value As Guid)
                mAuthorReviewStatusId = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property VAReviewCompleted() As Date
            Get
                Return mVAReviewCompleted
            End Get
            Set(ByVal value As Date)
                mVAReviewCompleted = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property PolicyReviewCompleted() As Date
            Get
                Return mPolicyReviewCompleted
            End Get
            Set(ByVal value As Date)
                mPolicyReviewCompleted = value
            End Set
        End Property

        'not a DataMember - not passed across the WCF interface
        Public Property AuthorReviewCompleted() As Date
            Get
                Return mAuthorReviewCompleted
            End Get
            Set(ByVal value As Date)
                mAuthorReviewCompleted = value
            End Set
        End Property

        Public Sub New(ByVal userId As Guid, ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            MyBase.New()
            mUserId = userId
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
            mQuestionRowDeleteList = New List(Of QuestionRowDelete)
            mQuestionRowInsertList = New List(Of QuestionRow)
            mQuestionRowUpdateList = New List(Of QuestionRow)
        End Sub

    End Class

End Namespace
