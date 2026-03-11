Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DeleteSsoUserCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsUserManagementSystem AndAlso identity.IsAuthenticated
    End Function

#End Region

#Region " Client-side Code "

    Private mSsoUserId As Guid

    Public ReadOnly Property SsoUserId() As Guid
        Get
            Return mSsoUserId
        End Get
    End Property


#End Region

#Region " Factory Methods "

    Public Shared Function Execute(ByVal ssoUserId As Guid) As DeleteSsoUserCommand
        Dim command As New DeleteSsoUserCommand(ssoUserId)
        command = DataPortal.Execute(Of DeleteSsoUserCommand)(command)
        Return command

    End Function

    Private Sub New(ByVal ssoUserId As Guid)
        mSsoUserId = ssoUserId
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        If Not CanExecuteCommand() Then
            Throw New System.Security.SecurityException("You do not have permission to delete this user")
        End If

        Dim db As ServiceContracts.IUserMaintenanceService = DataFactory.GetUserMaintenanceService()
        db.DeleteSsoUser(New DataContracts.SsoUserDetailDelete(mSsoUserId))

    End Sub

#End Region

End Class
