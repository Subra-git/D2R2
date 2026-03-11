Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PrioritiseProfileCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanPrioritiseProfiles() As Boolean

        'you can only prioritise profiles if you are a profile editor
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

    Public Shared Function CanPrioritiseProfile(ByVal profileVersionId As Guid) As Boolean

        'you can only prioritise a current profile version
        Dim profileVersion As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
        If Not profileVersion.IsCurrent Then
            Return False
        End If

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        If profileVersion.Status = ProfileVersionStatus.Published Then
            Return CanPrioritiseProfiles()
        Else
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return (identity.IsProfileContributorOrReviewer(profileVersion.ProfileId) _
            OrElse identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)
        End If

    End Function

#End Region

#Region " Client-side Code "

    Private mStatus As ProfileVersionStatus
    Private mProfileVersionId As Guid

    Public Property Status() As ProfileVersionStatus
        Get
            Return mStatus
        End Get
        Set(ByVal value As ProfileVersionStatus)
            mStatus = value
        End Set
    End Property

    Public Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionId = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Sub PrioritiseProfiles(ByVal status As ProfileVersionStatus)

        If Not PrioritiseProfileCommand.CanPrioritiseProfiles() Then
            Throw New System.Security.SecurityException("You do not have permission to prioritise profiles")
        End If

        Dim cmd As New PrioritiseProfileCommand
        cmd.Status = status

        cmd = DataPortal.Execute(Of PrioritiseProfileCommand)(cmd)

    End Sub

    Public Shared Sub PrioritiseProfile(ByVal profileVersionId As Guid)

        If Not PrioritiseProfileCommand.CanPrioritiseProfile(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to prioritise this profile version")
        End If

        Dim cmd As New PrioritiseProfileCommand
        cmd.ProfileVersionId = profileVersionId

        cmd = DataPortal.Execute(Of PrioritiseProfileCommand)(cmd)

    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IPrioritisationService = DataFactory.GetPrioritisationService()

        If Not mProfileVersionId.Equals(Guid.Empty) Then
            db.PrioritiseProfile(New DataContracts.ProfileVersionIdRequest(mProfileVersionId))
        Else
            If mStatus = ProfileVersionStatus.Published Then
                db.PrioritiseProfiles(New DataContracts.PrioritiseProfilesRequest(True))
            Else
                db.PrioritiseProfiles(New DataContracts.PrioritiseProfilesRequest(False))
            End If
        End If

    End Sub

#End Region

End Class

