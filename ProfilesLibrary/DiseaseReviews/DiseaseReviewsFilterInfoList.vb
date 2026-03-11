Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class DiseaseReviewsFilterInfoList
    Inherits ReadOnlyListBase(Of DiseaseReviewsFilterInfoList, DiseaseReviewsFilterInfo)

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean

        Return True 'anyone can view this list, even anonymous users
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetList(ByVal valueDes As String, ByVal valueDiseaseTo As String, ByVal valueDiseaseFrom As String, ByVal valueProfile As Integer) As DiseaseReviewsFilterInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of species.")
        End If

        Return DataPortal.Fetch(Of DiseaseReviewsFilterInfoList)(New Criteria(valueDes, valueDiseaseTo, valueDiseaseFrom, valueProfile))

    End Function

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewList() As DiseaseReviewsFilterInfoList

        Return New DiseaseReviewsFilterInfoList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mDiseaseTo As String
        Private mDiseaseFrom As String
        Private mDescription As String
        Private mValueProfile As Integer

        Public ReadOnly Property DiseaseTo() As String
            Get
                Return mDiseaseTo
            End Get
        End Property

        Public ReadOnly Property DiseaseFrom() As String
            Get
                Return mDiseaseFrom
            End Get
        End Property

        Public ReadOnly Property Description() As String
            Get
                Return mDescription
            End Get
        End Property

        Public ReadOnly Property ProfileSelected() As Integer
            Get
                Return mValueProfile
            End Get
        End Property

        Public Sub New(ByVal valueDes As String, ByVal valueDiseaseTo As String, ByVal valueDiseaseFrom As String, ByVal valueProfile As Integer)

            mDescription = valueDes
            mDiseaseTo = valueDiseaseTo
            mDiseaseFrom = valueDiseaseFrom
            mValueProfile = valueProfile

        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IDiseaseRankingService = DataFactory.GetDiseaseReviewsForSelectedDates()
        Dim diseaseReviewsList As List(Of DataContracts.DiseaseReviewsData) = db.GetAllDiseaseReviewsForSelectedDates(criteria.Description, criteria.DiseaseTo, criteria.DiseaseFrom, criteria.ProfileSelected)
        For Each fetchedDiseaseReviews As DataContracts.DiseaseReviewsData In diseaseReviewsList
            Add(DiseaseReviewsFilterInfo.GetDiseaseReviewsFetch(fetchedDiseaseReviews))
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
