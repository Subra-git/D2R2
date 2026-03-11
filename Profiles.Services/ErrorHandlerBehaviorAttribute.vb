Imports System.ServiceModel
Imports System.ServiceModel.Channels
Imports System.ServiceModel.Dispatcher
Imports System.ServiceModel.Description

<AttributeUsage(AttributeTargets.Class)> _
Public Class ErrorHandlerBehaviorAttribute
    Inherits Attribute
    Implements IErrorHandler, IServiceBehavior

#Region " IErrorHandler implementation"

    Dim mServiceType As Type

    Protected Property ServiceType() As Type
        Get
            Return mServiceType
        End Get
        Set(ByVal value As Type)
            mServiceType = value
        End Set
    End Property

    Public Function HandleError(ByVal ex As Exception) As Boolean Implements IErrorHandler.HandleError

        Try
            Dim errorLog As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry(ex)
            errorLog.Save()
        Catch exp As Exception
            'must not throw an error from here - if we do, we'll go into a loop and kill the whole service
        End Try

        Return False

    End Function

    Public Sub ProvideFault(ByVal ex As Exception, ByVal version As MessageVersion, ByRef fault As Message) Implements IErrorHandler.ProvideFault

        Dim errorMessage As String
        If TypeOf ex Is Csla.DataPortalException Then
            errorMessage = DirectCast(ex, Csla.DataPortalException).BusinessException.Message
        ElseIf TypeOf ex Is ApplicationException Then
            errorMessage = ex.Message
        Else
            errorMessage = "An internal error occurred within the Surveillance Profiles service interface."
        End If

        Dim newException As New FaultException(errorMessage)
        Dim messageFault As MessageFault = newException.CreateMessageFault()
        fault = Message.CreateMessage(version, messageFault, newException.Action)

    End Sub

#End Region

#Region " IServiceBehavior implementation"

    Public Sub AddBindingParameters(ByVal description As ServiceDescription, ByVal host As ServiceHostBase, ByVal endpoints As System.Collections.ObjectModel.Collection(Of ServiceEndpoint), ByVal bindingParameters As BindingParameterCollection) Implements IServiceBehavior.AddBindingParameters
        ' do nothing
    End Sub

    Public Sub ApplyDispatchBehavior(ByVal description As ServiceDescription, ByVal host As ServiceHostBase) Implements IServiceBehavior.ApplyDispatchBehavior

        ServiceType = description.ServiceType
        For Each dispatcher As ChannelDispatcher In host.ChannelDispatchers
            dispatcher.ErrorHandlers.Add(Me)
        Next

    End Sub

    Public Sub Validate(ByVal description As ServiceDescription, ByVal host As ServiceHostBase) Implements IServiceBehavior.Validate
        ' do nothing
    End Sub

#End Region

End Class