Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileStatusCommand
    Inherits CommandBase

#Region " Authorisation Rules "

    Public Shared Function CanChangeProfileStatus() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Protected mProfileId As Guid
    Protected mProfileStatusId As Guid

    Friend ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Friend ReadOnly Property ProfileStatusId() As Guid
        Get
            Return mProfileStatusId
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Sub SetProfileStatus(ByVal profileId As Guid, ByVal profileStatusId As Guid)
        Dim cmd As New ProfileStatusCommand
        cmd.mProfileId = profileId
        cmd.mProfileStatusId = profileStatusId
        cmd = DataPortal.Execute(Of ProfileStatusCommand)(cmd)
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        db.UpdateProfileStatus(New DataContracts.UpdateProfileStatusRequest(mProfileId, mProfileStatusId))

    End Sub

#End Region

End Class
