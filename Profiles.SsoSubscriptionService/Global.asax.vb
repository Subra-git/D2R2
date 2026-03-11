Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
        StructureMap.StructureMapConfiguration.AddRegistry(New Profiles.SsoSubscriptionService.IoC.SubscriptionServiceRegistry())
    End Sub
End Class