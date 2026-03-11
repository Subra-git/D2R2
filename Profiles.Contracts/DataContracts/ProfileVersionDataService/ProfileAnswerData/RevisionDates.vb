Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class RevisionDates

        Private mVAReviewFrequency As Guid
        Private mPolicyReviewFrequency As Guid
        Private mAuthorReviewFrequency As Guid
        Private mNextVAReview As Date
        Private mNextPolicyReview As Date
        Private mNextAuthorReview As Date
        Private mHasPolicyReviewFrequency As Boolean
        Private mHasVAReviewFrequency As Boolean
        Private mHasAuthorReviewFrequency As Boolean
        Private mVAReviewStatusId As Guid
        Private mPolicyReviewStatusId As Guid
        Private mAuthorReviewStatusId As Guid
        Private mHasPolicyReviewStatusId As Boolean
        Private mHasVAReviewStatusId As Boolean
        Private mHasAuthorReviewStatusId As Boolean
        Private mVAReviewCompleted As Date
        Private mPolicyReviewCompleted As Date
        Private mAuthorReviewCompleted As Date

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

        <DataMember()> _
        Public Property HasVAReviewFrequency() As Boolean
            Get
                Return mHasVAReviewFrequency
            End Get
            Set(ByVal value As Boolean)
                mHasVAReviewFrequency = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasPolicyReviewFrequency() As Boolean
            Get
                Return mHasPolicyReviewFrequency
            End Get
            Set(ByVal value As Boolean)
                mHasPolicyReviewFrequency = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasAuthorReviewFrequency() As Boolean
            Get
                Return mHasAuthorReviewFrequency
            End Get
            Set(ByVal value As Boolean)
                mHasAuthorReviewFrequency = value
            End Set
        End Property

        <DataMember()> _
        Public Property NextVAReview() As Date
            Get
                Return mNextVAReview
            End Get
            Set(ByVal value As Date)
                mNextVAReview = value
            End Set
        End Property

        <DataMember()> _
        Public Property NextPolicyReview() As Date
            Get
                Return mNextPolicyReview
            End Get
            Set(ByVal value As Date)
                mNextPolicyReview = value
            End Set
        End Property

        <DataMember()> _
        Public Property NextAuthorReview() As Date
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date)
                mNextAuthorReview = value
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
        Public Property PolicyReviewStatusId() As Guid
            Get
                Return mPolicyReviewStatusId
            End Get
            Set(ByVal value As Guid)
                mPolicyReviewStatusId = value
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

        <DataMember()> _
        Public Property HasVAReviewStatusId() As Boolean
            Get
                Return mHasVAReviewStatusId
            End Get
            Set(ByVal value As Boolean)
                mHasVAReviewStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasPolicyReviewStatusId() As Boolean
            Get
                Return mHasPolicyReviewStatusId
            End Get
            Set(ByVal value As Boolean)
                mHasPolicyReviewStatusId = value
            End Set
        End Property

        <DataMember()> _
        Public Property HasAuthorReviewStatusId() As Boolean
            Get
                Return mHasAuthorReviewStatusId
            End Get
            Set(ByVal value As Boolean)
                mHasAuthorReviewStatusId = value
            End Set
        End Property

        Public Property VAReviewCompleted() As Date
            Get
                Return mVAReviewCompleted
            End Get
            Set(ByVal value As Date)
                mVAReviewCompleted = value
            End Set
        End Property

        Public Property PolicyReviewCompleted() As Date
            Get
                Return mPolicyReviewCompleted
            End Get
            Set(ByVal value As Date)
                mPolicyReviewCompleted = value
            End Set
        End Property

        Public Property AuthorReviewCompleted() As Date
            Get
                Return mAuthorReviewCompleted
            End Get
            Set(ByVal value As Date)
                mAuthorReviewCompleted = value
            End Set
        End Property

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
