Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class UserAuthenticationService
    Implements IUserAuthenticationService

    Public Function GetUserIdentity(ByVal request As Contracts.DataContracts.GetUserIdentityRequest) As Contracts.DataContracts.UserIdentityData Implements Contracts.ServiceContracts.IUserAuthenticationService.GetUserIdentity

        Dim proxy As IUserAuthenticationService = ProxyFactory.GetProxy(Of IUserAuthenticationService)("UserAuthenticationService")
		Return ProxyFactory.CallProxyMethod(Of IUserAuthenticationService, GetUserIdentityRequest, UserIdentityData)(proxy, request, AddressOf proxy.GetUserIdentity)

	End Function

    Public Sub Logout() Implements IUserAuthenticationService.Logout

        Dim proxy As IUserAuthenticationService = ProxyFactory.GetProxy(Of IUserAuthenticationService)("UserAuthenticationService")
        ProxyFactory.CallProxyMethod(Of IUserAuthenticationService)(proxy, AddressOf proxy.Logout)

    End Sub

End Class
