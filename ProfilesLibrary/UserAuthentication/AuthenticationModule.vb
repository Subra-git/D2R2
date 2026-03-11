Imports System.Web
Imports System.Web.Security
Imports Profiles.Infrastructure

Public Class AuthenticationModule
    Implements IHttpModule

    Public Sub Dispose() Implements System.Web.IHttpModule.Dispose
        '
    End Sub

    Public Sub Init(ByVal context As System.Web.HttpApplication) Implements System.Web.IHttpModule.Init

        If context Is Nothing Then
            Exit Sub
        End If

        AddHandler context.PostAcquireRequestState, New EventHandler(AddressOf Application_PostAcquireRequestState)

    End Sub

    Private Sub Application_PostAcquireRequestState(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim application As HttpApplication = DirectCast(sender, HttpApplication)
        Dim context As HttpContext = application.Context

        ' When a page has smart navigation enabled, this event seems to get fired twice.  The
        ' second time is after the page has loaded, and for some reason HttpContext.Current.Session
        ' is null at that point.  So we'll check whether the session is null before attempting
        ' to save our security principal to it.
        If Not context.Session Is Nothing Then
            ' Check whether we already have a CSLA security principal in session
            Dim principal As System.Security.Principal.IPrincipal

            Try
                principal = DirectCast(context.Session("CslaPrincipal"),  _
                                       System.Security.Principal.IPrincipal)
            Catch iex As InvalidCastException
                principal = Nothing
            End Try

            If principal Is Nothing Then
                ' The user is not yet logged in. Check whether the user is authenticated via 
                ' ASP.NET mechanism (Forms or Windows authentication), and if they are then load the custom CSLA 
                ' security principle encapsulating the user roles from the database.
                If application.User.Identity.IsAuthenticated Then
                    Dim name As String = context.User.Identity.Name
                    If context.User.Identity.AuthenticationType <> "Forms" Then
                        ProfilesPrincipal.Logout() 'need to give CSLA a ProfilesPrincipal, even just the anonymous one, so that
                        ' it has rights to call the remoting portal if needed
                        If ProfilesPrincipal.Login(name) Then
                            context.Session("CslaPrincipal") = Csla.ApplicationContext.User
                        End If

                    Else
                        ProfilesPrincipal.Logout(New Guid(name)) 'need to give CSLA a ProfilesPrincipal, even just the anonymous one, so that
                        ' it has rights to call the remoting portal if needed
                        Try
                            ProfilesPrincipal.Login(New Guid(name), New Guid(name))
                        Catch ex As Csla.DataPortalException
                            'if we get an error here, we assume the authentication has failed, and redirect the user to the login page
                            Dim errorLogEntry As ErrorLogEntry = ErrorLogEntry.NewErrorLogEntry(ex)
                            errorLogEntry.Save()

                            FormsAuthentication.SignOut()
                            If application.Request.UrlReferrer Is Nothing Then
                                FormsAuthentication.RedirectToLoginPage()
                            Else
                                Try
                                    Dim loginUrlPathAndQuery As String = New Uri(FormsAuthentication.LoginUrl).PathAndQuery
                                     If application.Request.UrlReferrer.PathAndQuery.Contains(New Uri(FormsAuthentication.LoginUrl).PathAndQuery) Then
                                        application.Response.Redirect(application.Request.UrlReferrer.ToString())
                                     End If

                                Catch uriEx As Exception
                                    ' If there is a problem with the Uri formation from the login Url, just redirect manually
                                    application.Response.Redirect( _
                                        FormsAuthentication.LoginUrl & "?ReturnUrl=" & _
                                        HttpUtility.UrlEncode(application.Request.UrlReferrer.PathAndQuery) _
                                    )
                                End Try
                            End If
                        End Try
                    End If
                Else
                    ' user's not authenticated - tell CSLA to use a logged-out/anonymous security
                    ' principal
                    ProfilesPrincipal.Logout()
                End If
            Else
                ' the user is already logged in so tell CSLA to use the security principal 
                ' from session.
                Csla.ApplicationContext.User = principal
            End If
        End If

    End Sub

End Class

