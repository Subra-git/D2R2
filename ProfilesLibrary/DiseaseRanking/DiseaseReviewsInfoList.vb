Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DiseaseReviewsInfoList
    Inherits ReadOnlyListBase(Of DiseaseReviewsInfoList, DiseaseReviewsInfo)


    Public Function GetFilteredSortedList(ByRef diseases As List(Of DiseaseReviewsInfo)) As List(Of DiseaseReviewsInfo)

        Dim outputList As New List(Of DiseaseReviewsInfo)(Me)
        outputList = diseases
        Return outputList

    End Function

    'Public Shared Function FilterDiseasesWithNoRfiImpact(ByRef diseases As DiseaseReviewsInfoList)) As DiseaseReviewsInfoList
    '    Dim outputList As New List(Of DiseaseReviewsInfoList)()
    '    outputList = disease
    '    Return outputList
    'End Function

#Region " Authorization Rules "

    Public Shared Function CanGetRankProfileInfoList() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetDiseaseReviewsInfoListWithFilter(ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal authorId As Guid) As DiseaseReviewsInfoList

        If Not CanGetRankProfileInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Rank Profile Info List.")
        End If
        Return DataPortal.Fetch(Of DiseaseReviewsInfoList)(New Criteria(GetDescription, GetToDate, GetFromdate, authorId))
    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Public mDescription As String
        Private mToDate As Date
        Public mFromDate As Date
        Private mProfiName As String
        Private mAuthorId As Guid

        Public Property Description() As String
            Get
                Return mDescription
            End Get
            Set(ByVal value As String)
                mDescription = value
            End Set
        End Property

        Public Property ToDate() As Date
            Get
                Return mToDate
            End Get
            Set(ByVal value As Date)
                mToDate = value
            End Set
        End Property


        Public Property FromDate() As Date
            Get
                Return mFromDate
            End Get
            Set(ByVal value As Date)
                mFromDate = value
            End Set
        End Property

        Public Property ProfiName() As String
            Get
                Return mProfiName
            End Get
            Set(ByVal value As String)
                mProfiName = value
            End Set
        End Property

        Public Property AuthorId() As Guid
        Get
                Return mAuthorId
        End Get
            Set(value As Guid)
                mAuthorId = value
            End Set
        End Property

        Public Sub New(ByVal GetDescription As String, ByVal GetToDate As Date, ByVal GetFromdate As Date, ByVal authorId As Guid)
            mDescription = GetDescription
            mToDate = GetToDate
            mFromDate = GetFromdate
            mAuthorId = authorId
        End Sub

    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters", MessageId:="criteria")> <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoDiseaseReviewsDataList As List(Of DataContracts.DiseaseReviewsData) = db.GetDiseaseReviewsDataForFilter(criteria.Description, criteria.ToDate, criteria.FromDate, criteria.AuthorId)

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoDiseaseReviewsData As DataContracts.DiseaseReviewsData In dtoDiseaseReviewsDataList
            Me.Add(DiseaseReviewsInfo.GetDiseaseReviewsInfo(dtoDiseaseReviewsData))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region
End Class
