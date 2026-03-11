Imports System.Runtime.CompilerServices
Imports System.ServiceModel

Public Module ProxyFactory

	'create a WCF proxy passing in username based on the name of the current identity (which should be the SSO token ID)
	'and an empty password
	Public Function GetProxy(Of T)(ByVal serviceName As String) As T

		Dim factory As New ChannelFactory(Of T)(serviceName)

		Dim ssoTokenId As String = System.Web.HttpContext.Current.User.Identity.Name
		If ssoTokenId.Length = 0 Then
			ssoTokenId = Guid.Empty.ToString()
		End If

		factory.Credentials.UserName.UserName = ssoTokenId
		factory.Credentials.UserName.Password = String.Empty

		Return factory.CreateChannel()

	End Function

	Public Sub CallProxyMethod(Of T)(ByVal proxy As T, ByVal method As Action)

		Dim success As Boolean = False
		Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)

		Try
			method()
			channel.Close()
			success = True
		Finally
			If Not success Then
				channel.Abort()
			End If
		End Try

	End Sub

	Public Sub CallProxyMethod(Of T, TRequest)(ByVal proxy As T, ByVal request As TRequest, ByVal method As Action(Of TRequest))

		Dim success As Boolean = False
		Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)

		Try
			method(request)
			channel.Close()
			success = True
		Finally
			If Not success Then
				channel.Abort()
			End If
		End Try

	End Sub

	Public Function CallProxyMethod(Of T, TResponse)(ByVal proxy As T, ByVal method As Func(Of TResponse)) As TResponse

		Dim success As Boolean = False
		Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)
		Dim response As TResponse

		Try
			response = method()
			channel.Close()
			success = True
		Finally
			If Not success Then
				channel.Abort()
			End If
		End Try

		Return response

	End Function

	Public Function CallProxyMethod(Of T, TRequest, TResponse)(ByVal proxy As T, ByVal request As TRequest, ByVal method As Func(Of TRequest, TResponse)) As TResponse

		Dim response As TResponse
		Dim success As Boolean = False
		Dim channel As IClientChannel = DirectCast(proxy, IClientChannel)

		Try
			response = method(request)
			channel.Close()
			success = True
		Finally
			If Not success Then
				channel.Abort()
			End If
		End Try

		Return response

	End Function

	<Extension()>
	Public Function Invoke(Of T, TResponse)(ByVal proxy As T, ByVal method As Func(Of TResponse)) As TResponse
		Return CallProxyMethod(proxy, method)
	End Function


	<Extension()>
	Public Function Invoke(Of T, TRequest, TResponse)(ByVal proxy As T, ByVal request As TRequest, ByVal method As Func(Of TRequest, TResponse)) As TResponse
		Return CallProxyMethod(proxy, request, method)
	End Function

End Module
