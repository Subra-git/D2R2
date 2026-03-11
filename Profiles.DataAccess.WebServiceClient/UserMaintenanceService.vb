Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class UserMaintenanceService
    Implements IUserMaintenanceService

    Public Function VerifyDatabaseUser(ByVal request As VerifyDatabaseUserRequest) As UserVerification Implements IUserMaintenanceService.VerifyDatabaseUser
        Throw New InvalidOperationException("You cannot verify a database user via the web service.")
    End Function

    Public Sub UpdateSsoUser(ByVal request As SsoUserDetailUpdate) Implements Contracts.ServiceContracts.IUserMaintenanceService.UpdateSsoUser
        Throw New InvalidOperationException("You cannot update SSO user details via the web service.")
    End Sub

    Public Sub DeleteSsoUser(ByVal request As SsoUserDetailDelete) Implements IUserMaintenanceService.DeleteSsoUser
        Throw New InvalidOperationException("You cannot delete SSO user details via the web service.")
    End Sub

    Public Function GetProfileUserRoles() As List(Of ProfileUserRole) Implements IUserMaintenanceService.GetProfileUserRoles
        Throw New InvalidOperationException("You cannot get a list of profile user roles via the web service.")
    End Function

    Public Function GetProfileContributors(ByVal request As GetProfileContributorsRequest) As List(Of ProfileContributor) Implements IUserMaintenanceService.GetProfileContributors
        Throw New InvalidOperationException("You cannot get a list of profile contributors via the web service.")
    End Function

    Public Function GetProfileContributor(ByVal request As GetProfileContributorRequest) As ProfileContributor Implements IUserMaintenanceService.GetProfileContributor
        Throw New InvalidOperationException("You cannot get a profile contributor via the web service.")
    End Function

    Public Function UpdateProfileContributors(ByVal request As ProfileContributorChangeset) As ChangeResult Implements IUserMaintenanceService.UpdateProfileContributors
        Throw New InvalidOperationException("You cannot update profile contributors via the web service.")
    End Function

    Public Function GetGlobalUsers() As List(Of GlobalUser) Implements IUserMaintenanceService.GetGlobalUsers
        Throw New InvalidOperationException("You cannot get a list of global users via the web service.")
    End Function

    Public Function GetGlobalUser(ByVal request As GetGlobalUserRequest) As GlobalUser Implements IUserMaintenanceService.GetGlobalUser
        Throw New InvalidOperationException("You cannot get a global user via the web service.")
    End Function

    Public Function UpdateGlobalUsers(ByVal request As GlobalUserChangeset) As ChangeResult Implements IUserMaintenanceService.UpdateGlobalUsers
        Throw New InvalidOperationException("You cannot update global users via the web service.")
    End Function

    Public Function GetSsoMaintenance() As Contracts.DataContracts.SsoUserMaintenance Implements Contracts.ServiceContracts.IUserMaintenanceService.GetSsoUserMaintenance
        Throw New InvalidOperationException("You cannot get a list of sso users via the web service.")
    End Function

    Public Function UpdateSsoUsers(ByVal request As Contracts.DataContracts.SsoUserChangeset) As Contracts.DataContracts.ChangeResult Implements Contracts.ServiceContracts.IUserMaintenanceService.UpdateSsoUsers
        Throw New InvalidOperationException("You cannot update the sso users via the web service.")
    End Function
End Class

