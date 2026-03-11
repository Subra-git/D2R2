Imports Csla
Imports Profiles.Contracts
Public Class DiseaseReviewsFilterInfo
    Inherits BusinessBase(Of DiseaseReviewsFilterInfo)


#Region " Business Methods "

    Private mProfileVersionId As Guid
    Private mName As String = String.Empty
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

    Public ReadOnly Property Id() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property
    
    Public Readonly Property Name() As String
        Get
            If (String.IsNullOrEmpty(mTitle))
                Return Title
            End If
            Return String.Format("{0} v{1}.{2}", mTitle, mVersionMajor, mVersionMinor)
        End Get
    End Property
    
    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property PolicayReviewDate() As Date?
        Get
            Return mNextPolicyReview
        End Get
    End Property

    Public ReadOnly Property NextAuthorReview() As Date?
        Get
            Return mNextAuthorReview
        End Get
    End Property

    Public ReadOnly Property TechnicalReviewDate() As Date?
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

    Protected Overrides Function GetIdValue() As Object
        Return mProfileVersionId
    End Function

#End Region


#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetDiseaseReviewsInfo(ByVal diseaseReviewsData As DataContracts.DiseaseReviewsData) As DiseaseReviewsFilterInfo

        Return New DiseaseReviewsFilterInfo(diseaseReviewsData)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal diseaseReviewsData As DataContracts.DiseaseReviewsData)
        Fetch(diseaseReviewsData)
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
   Friend Shared Function GetDiseaseReviewsFetch(ByVal user As DataContracts.DiseaseReviewsData) As DiseaseReviewsFilterInfo
        Return New DiseaseReviewsFilterInfo(user)
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetObject() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function
#End Region

#Region " Data Access "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal diseaseReviewsData As DataContracts.DiseaseReviewsData)

        mProfileVersionId = diseaseReviewsData.ProfileVersionId
        mTitle = diseaseReviewsData.Title
        mVersionMajor = diseaseReviewsData.VersionMajor
        mVersionMinor = diseaseReviewsData.VersionMinor
        mNextPolicyReview = diseaseReviewsData.NextPolicyReview
        mNextAuthorReview = diseaseReviewsData.NextAuthorReview
        mNextTechnicalReview = diseaseReviewsData.NextTechnicalReview

    End Sub

#End Region

End Class
