Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()>
    Public Class DiseaseReviewsData

        Private mProfileVersionId As Guid
        Private mTitle As String = String.Empty
        Private mNextPolicyReview As Date?
        Private mNextAuthorReview As Date?
        Private mNextTechnicalReview As Date?
        Private mVersionMajor As Integer
        Private mVersionMinor As Integer
        Private mSectionNumber As Integer
        Private mSectionName As String = String.Empty
        Private mDescription As String = String.Empty
        Private mToDate As Date
        Private mFromdate As Date
        Private mProfileSelected As Integer
        Private mProfileName As String = String.Empty
        Private mAuthorName As String = String.Empty
        Private mAuthorId As Guid
        Private mPdfData As Byte()


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
        Public Property Title() As String
            Get
                Return mTitle
            End Get
            Set(ByVal value As String)
                mTitle = value
            End Set
        End Property

        <DataMember()>
        Public Property VersionMajor() As Integer
            Get
                Return mVersionMajor
            End Get
            Set(ByVal value As Integer)
                mVersionMajor = value
            End Set
        End Property

        <DataMember()>
        Public Property VersionMinor() As Integer
            Get
                Return mVersionMinor
            End Get
            Set(ByVal value As Integer)
                mVersionMinor = value
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

        Public Property SectionName() As String
            Get
                Return mSectionName
            End Get
            Set(ByVal value As String)
                mSectionName = value
            End Set
        End Property

        <DataMember()>
        Public Property NextPolicyReview() As Date?
            Get
                Return mNextPolicyReview
            End Get
            Set(ByVal value As Date?)
                mNextPolicyReview = value
            End Set
        End Property

        <DataMember()>
        Public Property NextAuthorReview() As Date?
            Get
                Return mNextAuthorReview
            End Get
            Set(ByVal value As Date?)
                mNextAuthorReview = value
            End Set
        End Property

        <DataMember()>
        Public Property NextTechnicalReview() As Date?
            Get
                Return mNextTechnicalReview
            End Get
            Set(ByVal value As Date?)
                mNextTechnicalReview = value
            End Set
        End Property

        <DataMember()>
        Public Property Description() As String
            Get
                Return mDescription
            End Get
            Set(ByVal value As String)
                mDescription = value
            End Set
        End Property

        <DataMember()>
        Public Property ToDate() As Date
            Get
                Return mToDate
            End Get
            Set(ByVal value As Date)
                mToDate = value
            End Set
        End Property

        <DataMember()>
        Public Property Fromdate() As Date
            Get
                Return mFromdate
            End Get
            Set(ByVal value As Date)
                mFromdate = value
            End Set
        End Property

        <DataMember()>
        Public Property PdfData() As Byte()
            Get
                Return mPdfData
            End Get
            Private Set(ByVal value As Byte())
                mPdfData = value
            End Set
        End Property

        <DataMember()>
        Public Property AuthorName() As String
            Get
                Return mAuthorName
            End Get
            Set(ByVal value As String)
                mAuthorName = value
            End Set
        End Property

        Public Property AuthorId() As Guid
            Get
                Return mAuthorId
            End Get
            Set(ByVal value As Guid)
                mAuthorId = value
            End Set
        End Property

        Public Sub New(ByVal pdfData As Byte(), ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal GetAuthorName As String, ByVal authorId As Guid)
            mPdfData = pdfData
            mDescription = GetDescription
            mToDate = GetToDate
            mFromdate = GetFromdate
            mAuthorName = GetAuthorName
            mAuthorId = authorId
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace