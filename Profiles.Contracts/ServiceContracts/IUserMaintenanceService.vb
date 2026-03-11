Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IUserMaintenanceService

        Function VerifyDatabaseUser(ByVal request As VerifyDatabaseUserRequest) As UserVerification

        Sub UpdateSsoUser(ByVal request As SsoUserDetailUpdate)

        Sub DeleteSsoUser(ByVal request As SsoUserDetailDelete)

        Function GetProfileUserRoles() As List(Of ProfileUserRole)

        Function GetProfileContributors(ByVal request As GetProfileContributorsRequest) As List(Of ProfileContributor)

        Function GetProfileContributor(ByVal request As GetProfileContributorRequest) As ProfileContributor

        Function UpdateProfileContributors(ByVal request As ProfileContributorChangeset) As ChangeResult

        Function GetGlobalUsers() As List(Of GlobalUser)

        Function GetSsoUserMaintenance() As SsoUserMaintenance

        Function GetGlobalUser(ByVal request As GetGlobalUserRequest) As GlobalUser

        Function UpdateGlobalUsers(ByVal request As GlobalUserChangeset) As ChangeResult

        Function UpdateSsoUsers(ByVal request As SsoUserChangeset) As ChangeResult

    End Interface

End Namespace
