Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritisationCriterionScoreList
    Inherits ReadOnlyListBase(Of PrioritisationCriterionScoreList, PrioritisationCriterionScore)

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        ' TODO: customize to check user role
        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If
        Return True
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetList(ByVal profileVersionId As Guid) As PrioritisationCriterionScoreList
        Return DataPortal.Fetch(Of PrioritisationCriterionScoreList)(New Criteria(profileVersionId))
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
        Dim dtoCriterionScoreList As List(Of DataContracts.PrioritisationCriterionScore) = db.GetPrioritisationCriterionScores(New DataContracts.ProfileVersionIdRequest(criteria.ProfileVersionId))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each item As DataContracts.PrioritisationCriterionScore In dtoCriterionScoreList

            Add(PrioritisationCriterionScore.GetScore(item))

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class


