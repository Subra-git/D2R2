Imports Profiles.Infrastructure.Enums

Namespace DataContracts

    Public Class ProfileSectionResponse

        Private mSectionNumber As Integer
        Private mSectionName As String
        Private mNextAuthorReview As Date?
        Private mNextTechnicalReview As Date?
        Private mNextPolicyReview As Date?
        Private mAuthorReviewStatus As ProfileSectionReviewStatus
        Private mTechnicalReviewStatus As ProfileSectionReviewStatus
        Private mPolicyReviewStatus As ProfileSectionReviewStatus

        Public Property SectionNumber() As Integer
            Get
                Return mSectionNumber
            End Get
            Set(ByVal value As Integer)
                mSectionNumber = value
            End Set
        End Property

        Public Property SectionName() As String
            Get
                Return mSectionName
            End Get
            Set(ByVal value As String)
                mSectionName = value
            End Set
        End Property

        Public Property NextAuthorReview() As Date?
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date?)
                mNextAuthorReview = value
            End Set
        End Property

        Public Property NextTechnicalReview() As Date?
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date?)
                mNextAuthorReview = value
            End Set
        End Property

        Public Property NextPolicyReview() As Date?
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date?)
                mNextAuthorReview = value
            End Set
        End Property

        Public Property AuthorReviewStatus() As ProfileSectionReviewStatus
            Get
                Return mAuthorReviewStatus
            End Get
            Set(ByVal value As ProfileSectionReviewStatus)
                mAuthorReviewStatus = value
            End Set
        End Property

        Public Property TechnicalReviewStatus() As ProfileSectionReviewStatus
            Get
                Return mTechnicalReviewStatus
            End Get
            Set(ByVal value As ProfileSectionReviewStatus)
                mTechnicalReviewStatus = value
            End Set
        End Property

        Public Property PolicyReviewStatus() As ProfileSectionReviewStatus
            Get
                Return mPolicyReviewStatus
            End Get
            Set(ByVal value As ProfileSectionReviewStatus)
                mPolicyReviewStatus = value
            End Set
        End Property

    End Class

End Namespace
