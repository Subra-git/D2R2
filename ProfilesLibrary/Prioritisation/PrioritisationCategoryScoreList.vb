Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCategoryScoreList
    Inherits ReadOnlyListBase(Of PrioritisationCategoryScoreList, PrioritisationCategoryScore)

#Region " Authorization Rules "

    Public Overloads Function IsAvailable(ByVal categoryName As String) As Boolean

        For Each categoryScore As PrioritisationCategoryScore In Me

            If categoryScore.PrioritisationCategoryName.ToLower() = categoryName.ToLower() Then
                Return True
            End If
        Next

        Return False

    End Function

    Public Shared Function CanGetList() As Boolean
        ' TODO: customize to check user role
        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If
        Return True
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetList(ByVal profileVersionId As Guid) As PrioritisationCategoryScoreList
        Return DataPortal.Fetch(Of PrioritisationCategoryScoreList)(New Criteria(profileVersionId))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileVersionId As Guid
        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid)
            mProfileVersionId = profileVersionId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()
        Dim dtoCategoryScoreList As List(Of DataContracts.PrioritisationCategoryScore) = db.GetPrioritisationCategoryScores(New DataContracts.ProfileVersionIdRequest(criteria.ProfileVersionId))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each item As DataContracts.PrioritisationCategoryScore In dtoCategoryScoreList

            Me.Add(PrioritisationCategoryScore.GetScore(item))

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

