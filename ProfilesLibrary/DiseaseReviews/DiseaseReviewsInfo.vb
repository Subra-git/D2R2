Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DiseaseReviewsInfo
    Inherits ReadOnlyBase(Of DiseaseReviewsInfo)

    Private mProfileVersionId As Guid
    Private mName As String = String.Empty
    Private mSectionNumber As Integer
    Private mSectionName As String = String.Empty
    Private mTitle As String = String.Empty
    Private mVersionMajor As Integer
    Private mVersionMinor As Integer
    Private mNextPolicyReview As Date?
    Private mNextAuthorReview As Date?
    Private mNextTechnicalReview As Date?
    Private mDescription As String = String.Empty
    Private mToDate As String = String.Empty
    Private mFromdate As String = String.Empty
    Private mProfileSelected As Integer
    Private mAuthorName As String = String.Empty


#Region " Business Methods"
    Public ReadOnly Property Id() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property


    Public Readonly Property Name() As String
        Get
            If (String.IsNullOrEmpty(mTitle))
                Return mTitle
            End If
            Return String.Format("{0} v{1}.{2}", mTitle, mVersionMajor, mVersionMinor)
        End Get
    End Property

    Public Readonly Property SectionNumber() As Integer
        Get
            Return mSectionNumber
        End Get
    End Property

    Public Readonly Property SectionName() As String
        Get 
            Return mSectionName
        End Get
    End Property

    Public ReadOnly Property NextPolicyReview() As Date?
        Get
            Return mNextPolicyReview
        End Get
    End Property

    Public ReadOnly Property NextAuthorReview() As Date?
        Get
            Return mNextAuthorReview
        End Get
    End Property

    Public ReadOnly Property NextTechnicalReview() As Date?
        Get
            Return mNextTechnicalReview
        End Get
    End Property

    Public Property Description() As String
        Get
            Return mDescription
        End Get
        Set(ByVal value As String)
            mDescription = value
        End Set
    End Property

    Public Property ToDate() As String
        Get
            Return mToDate
        End Get
        Set(ByVal value As String)
            mToDate = value
        End Set
    End Property

    Public Property Fromdate() As String
        Get
            Return mFromdate
        End Get
        Set(ByVal value As String)
            mFromdate = value
        End Set
    End Property

    Public Property ProfileSelected() As Integer
        Get
            Return mProfileSelected
        End Get
        Set(ByVal value As Integer)
            mProfileSelected = value
        End Set
    End Property

    Public Readonly Property ProfileName() As String
        Get
            If (String.IsNullOrEmpty(mTitle))
                Return mTitle
            End If
            Return String.Format("{0} v{1}.{2}", mTitle, mVersionMajor, mVersionMinor)
        End Get
    End Property

    Public Property AuthorName() As String
        Get
            Return mAuthorName
        End Get
        Set(ByVal value As String)
            mAuthorName = value
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mProfileVersionId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetDiseaseReviewsInfo(ByVal dtoDiseaseReviewsData As DataContracts.DiseaseReviewsData) As DiseaseReviewsInfo

        Return New DiseaseReviewsInfo(dtoDiseaseReviewsData)

    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoDiseaseReviewsData As DataContracts.DiseaseReviewsData)

        Fetch(dtoDiseaseReviewsData)

    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoDiseaseReviewsData As DataContracts.DiseaseReviewsData)

        mTitle = dtoDiseaseReviewsData.Title
        mVersionMajor = dtoDiseaseReviewsData.VersionMajor
        mVersionMinor = dtoDiseaseReviewsData.VersionMinor
        mNextPolicyReview = dtoDiseaseReviewsData.NextPolicyReview
        mNextAuthorReview = dtoDiseaseReviewsData.NextAuthorReview
        mNextTechnicalReview = dtoDiseaseReviewsData.NextTechnicalReview
        mProfileVersionId = dtoDiseaseReviewsData.ProfileVersionId
        mSectionName = dtoDiseaseReviewsData.SectionName
        mSectionNumber = dtoDiseaseReviewsData.SectionNumber

    End Sub

#End Region

End Class
