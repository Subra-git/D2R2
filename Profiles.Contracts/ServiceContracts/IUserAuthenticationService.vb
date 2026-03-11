Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IUserAuthenticationService

        <OperationContract()> _
        Function GetUserIdentity(ByVal request As GetUserIdentityRequest) As UserIdentityData

        <OperationContract()> _
        Sub Logout()

    End Interface

End Namespace

