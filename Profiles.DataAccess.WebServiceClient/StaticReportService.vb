Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class StaticReportService
    Implements IStaticReportService

    Public Function GetCurrentPublicStaticReports(ByVal request As GetCurrentPublicStaticReportsRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetCurrentPublicStaticReports

        Dim proxy As IStaticReportService = ProxyFactory.GetProxy(Of IStaticReportService)("StaticReportService")
        Return ProxyFactory.CallProxyMethod(Of IStaticReportService, GetCurrentPublicStaticReportsRequest, List(Of StaticReportVersion))(proxy, request, AddressOf proxy.GetCurrentPublicStaticReports)

    End Function

    Public Function GetCurrentStaticReports(ByVal request As GetCurrentStaticReportsRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetCurrentStaticReports

        Dim proxy As IStaticReportService = ProxyFactory.GetProxy(Of IStaticReportService)("StaticReportService")
        Return ProxyFactory.CallProxyMethod(Of IStaticReportService, GetCurrentStaticReportsRequest, List(Of StaticReportVersion))(proxy, request, AddressOf proxy.GetCurrentStaticReports)

    End Function

    Public Function GetStaticReportPublicHistory(ByVal request As GetStaticReportPublicHistoryRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetStaticReportPublicHistory

        Dim proxy As IStaticReportService = ProxyFactory.GetProxy(Of IStaticReportService)("StaticReportService")
        Return ProxyFactory.CallProxyMethod(Of IStaticReportService, GetStaticReportPublicHistoryRequest, List(Of StaticReportVersion))(proxy, request, AddressOf proxy.GetStaticReportPublicHistory)

    End Function

    Public Function GetStaticReportHistory(ByVal request As GetStaticReportHistoryRequest) As List(Of StaticReportVersion) Implements IStaticReportService.GetStaticReportHistory

        Dim proxy As IStaticReportService = ProxyFactory.GetProxy(Of IStaticReportService)("StaticReportService")
        Return ProxyFactory.CallProxyMethod(Of IStaticReportService, GetStaticReportHistoryRequest, List(Of StaticReportVersion))(proxy, request, AddressOf proxy.GetStaticReportHistory)

    End Function

    Public Function GetStaticReportData(ByVal request As GetStaticReportDataRequest) As StaticReportData Implements IStaticReportService.GetStaticReportData

        Dim proxy As IStaticReportService = ProxyFactory.GetProxy(Of IStaticReportService)("StaticReportService")
        Return ProxyFactory.CallProxyMethod(Of IStaticReportService, GetStaticReportDataRequest, StaticReportData)(proxy, request, AddressOf proxy.GetStaticReportData)

    End Function

    Public Sub DeleteStaticReportVersion(ByVal request As DeleteStaticReportVersionRequest) Implements IStaticReportService.DeleteStaticReportVersion
        Throw New InvalidOperationException("You cannot delete a static report version via the web service.")
    End Sub

    Public Sub SetStaticReportPublicAccess(ByVal request As SetStaticReportPublicAccessRequest) Implements IStaticReportService.SetStaticReportPublicAccess
        Throw New InvalidOperationException("You cannot set the public access of a static report via the web service.")
    End Sub

    Public Sub UploadStaticReport(ByVal request As UploadStaticReportRequest) Implements IStaticReportService.UploadStaticReport
        Throw New InvalidOperationException("You cannot upload a static report via the web service.")
    End Sub

End Class



