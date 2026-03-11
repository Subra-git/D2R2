Imports Profiles.Contracts.ServiceContracts
Imports Profiles.DataAccess.Sql
Imports StructureMap.Configuration.DSL

Namespace Profiles.SsoSubscriptionService.IoC

    Public Class SubscriptionServiceRegistry
        Inherits Registry

        Protected Overrides Sub configure()
            Me.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of UserMaintenanceService)
            Me.ForRequestedType(Of IUserAuthenticationService).TheDefaultIsConcreteType(Of UserAuthenticationService)()
        End Sub
    End Class

End Namespace

