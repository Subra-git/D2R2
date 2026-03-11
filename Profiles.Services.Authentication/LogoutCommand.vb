Imports System.ServiceModel

Public Module LogoutCommand

    Public Function Logout(ByVal tokenId As Guid) As Boolean

        Dim response As Boolean

        Dim factory As New ChannelFactory(Of SsoUserManagement.ServiceSoap)("SsoUserManagement")
        Dim proxy As SsoUserManagement.ServiceSoap = factory.CreateChannel()
        Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)
        Dim success As Boolean = False

        Try
            response = proxy.LogOut(tokenId)
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

End Module
