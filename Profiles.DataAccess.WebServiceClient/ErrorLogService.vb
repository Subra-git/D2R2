Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ErrorLogService
    Implements IErrorLogService

    Public Sub CreateErrorLogEntry(ByVal entry As Contracts.DataContracts.ErrorLogEntry) Implements Contracts.ServiceContracts.IErrorLogService.CreateErrorLogEntry

        Dim proxy As IErrorLogService = ProxyFactory.GetProxy(Of IErrorLogService)("ErrorLogService")
        ProxyFactory.CallProxyMethod(Of IErrorLogService, ErrorLogEntry)(proxy, entry, AddressOf proxy.CreateErrorLogEntry)

    End Sub

End Class
