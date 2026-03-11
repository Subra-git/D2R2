Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class UserAuthenticationService
    Implements IUserAuthenticationService

    Public Function GetUserIdentity(ByVal request As Contracts.DataContracts.GetUserIdentityRequest) As Contracts.DataContracts.UserIdentityData Implements Contracts.ServiceContracts.IUserAuthenticationService.GetUserIdentity

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        Dim contributorRoles As New List(Of DataContracts.ProfileRoleData)
        Dim reviewerRoles As New List(Of DataContracts.ProfileRoleData)

        For Each contributor As ContributorInfo In identity.ContributorRoles
            contributorRoles.Add(New DataContracts.ProfileRoleData() With { _
            .ProfileId = contributor.ProfileId, _
            .Role = contributor.Role, _
            .Sections = New List(Of Guid)(contributor.Sections)})
        Next

        For Each reviewer As ProfileRoleInfo In identity.ReviewerRoles
            reviewerRoles.Add(New DataContracts.ProfileRoleData() With { _
                                 .ProfileId = reviewer.ProfileId, _
                                 .Role = reviewer.Role, _
                                 .Sections = New List(Of Guid)})
        Next

        Return New DataContracts.UserIdentityData() With { _
            .IsAuthenticated = identity.IsAuthenticated, _
            .UserId = identity.UserId, _
            .UserName = identity.UserName, _
            .FullName = identity.FullName, _
            .Organisation = identity.Organisation, _
            .IsProfileEditor = identity.IsProfileEditor, _
            .IsPolicyProfileUser = identity.IsPolicyProfileUser, _
            .IsSsoUser = True, _
            .IsUserManagementSystem = identity.IsUserManagementSystem, _
            .ContributorRoles = contributorRoles, _
            .ReviewerRoles = reviewerRoles}

    End Function

    Public Sub Logout() Implements IUserAuthenticationService.Logout

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Authentication.LogoutCommand.Logout(New Guid(identity.Name))

    End Sub

End Class
