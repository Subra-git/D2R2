<Serializable()> _
Public Class ProfilesPrincipal
    Inherits Csla.Security.BusinessPrincipalBase

    Protected Sub New(ByVal identity As System.Security.Principal.IIdentity)
        MyBase.New(identity)
    End Sub

    Public Shared Function Login(ByVal userId As String) As Boolean

        If Not System.Text.RegularExpressions.Regex.IsMatch(userId, RegexPatterns.Username) Then
            Throw New System.Security.SecurityException("The Windows username must be in DOMAIN\USER format")
        End If

        Dim identity As ProfilesIdentity = ProfilesIdentity.GetIdentity(userId, "Windows")
        SetPrincipal(identity)
        Return identity.IsAuthenticated

    End Function

    Public Shared Function Login(ByVal userId As Guid, ByVal ssoTokenId As Guid) As Boolean

        Dim identity As ProfilesIdentity = ProfilesIdentity.GetIdentity(userId.ToString(), "Sso", ssoTokenId)
        SetPrincipal(identity)
        Return identity.IsAuthenticated

    End Function

    Private Shared Sub SetPrincipal(ByVal identity As ProfilesIdentity)

        If identity.IsAuthenticated Then
            Dim principal As New ProfilesPrincipal(identity)
            Csla.ApplicationContext.User = principal
        End If

    End Sub

    Public Shared Sub Logout()

        Dim principal As New ProfilesPrincipal(ProfilesIdentity.UnauthenticatedIdentity())
        Csla.ApplicationContext.User = principal

    End Sub

    Public Shared Sub Logout(ByVal ssoTokenId As Guid)

        Dim principal As New ProfilesPrincipal(ProfilesIdentity.UnauthenticatedIdentity(ssoTokenId))
        Csla.ApplicationContext.User = principal

    End Sub

End Class


