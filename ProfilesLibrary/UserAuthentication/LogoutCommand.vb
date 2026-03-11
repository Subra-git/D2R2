Imports System.Configuration
Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class LogoutCommand
    Inherits CommandBase

#Region " Authorization Rules "

    Public Shared Function CanExecuteCommand() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        Dim useSqlDirectlySettingValue As String = ConfigurationManager.AppSettings("UseSQLDirectly")
        Dim useSqlDirectlySetting As Boolean = If(useSqlDirectlySettingValue IsNot Nothing, Boolean.Parse(useSqlDirectlySettingValue), False)
        If useSqlDirectlySetting Then
            Return False
        End If

        Return identity.IsSsoUser AndAlso (Not identity.IsUserManagementSystem)
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function Execute() As LogoutCommand
        Dim command As New LogoutCommand
        command = DataPortal.Execute(Of LogoutCommand)(command)
        Return command

    End Function

    Private Sub New()
        '
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        If Not CanExecuteCommand() Then
            Throw New System.Security.SecurityException("You cannot log out because you are not an SSO user")
        End If

        Dim db As ServiceContracts.IUserAuthenticationService = DataFactory.GetUserAuthenticationService()
        db.Logout()

    End Sub

#End Region

End Class

