Imports System.IdentityModel.Selectors
Imports System.ServiceModel
Imports ProfilesLibrary

Public Class CredentialValidator
    Inherits UserNamePasswordValidator

    Private Shared mSsoRoleId As Guid

    Protected Shared ReadOnly Property SsoRoleId() As Guid
        Get
            If mSsoRoleId.Equals(Guid.Empty) Then
                mSsoRoleId = New Guid(System.Configuration.ConfigurationManager.AppSettings("SsoRoleId"))
            End If
            Return mSsoRoleId
        End Get
    End Property

    Public Overrides Sub Validate(ByVal userName As String, ByVal password As String)

        Try
            DoValidate(userName, password)
        Catch ex As Exception
            Dim errorLog As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry(ex)
            errorLog.Save()
            Throw
        End Try

    End Sub

    Private Sub DoValidate(ByVal userName As String, ByVal password As String)

        Dim tokenId As Guid = New Guid(userName)

        'if the token Id is an empty guid, then the user is anonymous
        If tokenId.Equals(Guid.Empty) Then
            ProfilesPrincipal.Logout()
            'otherwise, we try and map the token to an SSO user
        Else
            'check if this token is OK (the token is not expired, and the user is set up as a Profiles user)
            If Not AuthoriseUser(tokenId) Then
                Throw New System.Security.SecurityException("The SSO token id passed in is not valid")
            End If

            'ask the SSO for the user id relating to this token id
            Dim user As SsoUserManagement.VlaUser = GetUserByTokenId(tokenId)

            ProfilesPrincipal.Logout()

            'log the user in based on this user id and token id
            If Not ProfilesPrincipal.Login(user.Id, tokenId) Then
                Throw New System.Security.SecurityException(String.Format("The user '{0}' is not in the Profiles database, but is set up on SSO with access rights to the Surveillance Profiles system", user.Login))
            End If

        End If

        ' add current principal to rolling cache
        Csla.Security.PrincipalCache.AddPrincipal(Csla.ApplicationContext.User)

    End Sub

    Private Function AuthoriseUser(ByVal tokenId As Guid) As Boolean

        Dim response As Boolean
        Dim success As Boolean = False

        Dim factory As New ChannelFactory(Of SsoUserManagement.ServiceSoap)("SsoUserManagement")
        Dim proxy As SsoUserManagement.ServiceSoap = factory.CreateChannel()
        Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)

        Try
            response = proxy.AuthoriseUser(tokenId, SsoRoleId)
            channel.Close()
            success = True
        Catch tex As TimeoutException
            Throw New InvalidOperationException("The service failed to respond in a timely manner.")
        Catch cex As CommunicationException
            Throw New InvalidOperationException("There was a problem communicating with the service.")
        Finally
            If Not success Then
                channel.Abort()
            End If
        End Try

        Return response

    End Function

    Private Function GetUserByTokenId(ByVal tokenId As Guid) As SsoUserManagement.VlaUser

        Dim request As New SsoUserManagement.GetUserByTokenIdRequest( _
            New SsoUserManagement.GetUserByTokenIdRequestBody(tokenId))
        Dim response As SsoUserManagement.GetUserByTokenIdResponse

        Dim factory As New ChannelFactory(Of SsoUserManagement.ServiceSoap)("SsoUserManagement")
        Dim proxy As SsoUserManagement.ServiceSoap = factory.CreateChannel()
        Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)
        Dim success As Boolean = False

        Try
            response = proxy.GetUserByTokenId(request)
            channel.Close()
            success = True
        Catch tex As TimeoutException
            Throw New InvalidOperationException("The service failed to respond in a timely manner.")
        Catch cex As CommunicationException
            Throw New InvalidOperationException("There was a problem communicating with the service.")
        Finally
            If Not success Then
                channel.Abort()
            End If
        End Try

        Return response.Body.GetUserByTokenIdResult

    End Function

End Class
