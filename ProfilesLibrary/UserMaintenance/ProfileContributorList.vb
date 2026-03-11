Imports Csla
Imports Profiles.Contracts

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class ProfileContributorList
    Inherits BusinessListBase(Of ProfileContributorList, ProfileContributor)

    Private mProfileId As Guid

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public Function GetById(ByVal userId As Guid) As ProfileContributor

        For Each currentContributor As ProfileContributor In Me
            If currentContributor.Id.Equals(userId) Then
                Return currentContributor
            End If
        Next

        Return Nothing

    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetContributorList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanEditContributorList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate")> _
    Public Shared Function GetProfileContributorList(ByVal profileId As Guid) As ProfileContributorList

        If Not CanGetContributorList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of profile contributors.")
        End If

        Return DataPortal.Fetch(Of ProfileContributorList)(New Criteria(profileId))

    End Function

    Public Overloads Function AddNew(ByVal userName As String) As ProfileContributor

        Dim newContributor As ProfileContributor = ProfileContributor.NewProfileContributor(userName)
        Add(newContributor)
        Return newContributor

    End Function

    Public Overloads Function AddNew(ByVal profileContributorId As Guid) As ProfileContributor

        Dim newContributor As ProfileContributor = ProfileContributor.NewProfileContributor(profileContributorId, mProfileId)
        Add(newContributor)
        Return newContributor

    End Function

    Public Overrides Function Save() As ProfileContributorList

        If Not CanEditContributorList() Then
            Throw New System.Security.SecurityException("You do not have permission to save changes to a list of profile contributors.")
        End If

        Return MyBase.Save()

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria
        Private mProfileId As Guid
        Public ReadOnly Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
        End Property
        Public Sub New(ByVal profileId As Guid)
            mProfileId = profileId
        End Sub
    End Class

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA1801:ReviewUnusedParameters")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False

        mProfileId = criteria.ProfileId

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim contributors As List(Of DataContracts.ProfileContributor) = db.GetProfileContributors(New DataContracts.GetProfileContributorsRequest(criteria.ProfileId))
        For Each contributor As DataContracts.ProfileContributor In contributors
            Add(ProfileContributor.GetProfileContributor(contributor))
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        Dim changeset As New DataContracts.ProfileContributorChangeset(mProfileId)

        Dim updateRequired As Boolean

        For Each item As ProfileContributor In DeletedList
            changeset.DeleteList.Add(item.GetDelete())
            updateRequired = True
        Next

        For Each item As ProfileContributor In Me
            If item.IsDirty OrElse item.IsNew Then
                changeset.InsertList.Add(item.GetInsert())
            End If
            updateRequired = True
        Next

        If updateRequired Then
            Dim result As DataContracts.ChangeResult = db.UpdateProfileContributors(changeset)
            Dim currentInsert As Integer

            RaiseListChangedEvents = False

            For Each item As ProfileContributor In DeletedList
                item.DeleteSelf()
            Next

            For Each item As ProfileContributor In Me
                If item.IsDirty OrElse item.IsNew Then
                    item.InsertUpdate(result.IdInsertList(currentInsert), result.LastUpdatedInsertList(currentInsert))
                    currentInsert += 1
                End If
            Next

            RaiseListChangedEvents = True

        End If

    End Sub

#End Region

End Class

