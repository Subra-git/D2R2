Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ReferenceValueService
    Implements IReferenceValueService

    Public Function GetLookupValues(ByVal request As GetLookupValuesRequest) As List(Of LookupValue) Implements IReferenceValueService.GetLookupValues

        Dim proxy As IReferenceValueService = ProxyFactory.GetProxy(Of IReferenceValueService)("ReferenceValueService")
        Return ProxyFactory.CallProxyMethod(Of IReferenceValueService, GetLookupValuesRequest, List(Of LookupValue))(proxy, request, AddressOf proxy.GetLookupValues)

    End Function

    Public Function GetReferenceValues(ByVal request As GetReferenceValuesRequest) As List(Of ReferenceValue) Implements IReferenceValueService.GetReferenceValues

        Dim proxy As IReferenceValueService = ProxyFactory.GetProxy(Of IReferenceValueService)("ReferenceValueService")
        Return ProxyFactory.CallProxyMethod(Of IReferenceValueService, GetReferenceValuesRequest, List(Of ReferenceValue))(proxy, request, AddressOf proxy.GetReferenceValues)

    End Function

    Public Function GetReferenceTableAuditTrail(ByVal request As GetReferenceTableAuditTrailRequest) As List(Of ReferenceTableAuditTrailEntry) Implements IReferenceValueService.GetReferenceTableAuditTrail
        Throw New InvalidOperationException("You cannot get an audit trail for a reference table via the web service.")
    End Function

    Public Function GetReferenceTable(ByVal request As GetReferenceTableRequest) As ReferenceTable Implements IReferenceValueService.GetReferenceTable
        Throw New InvalidOperationException("You cannot get a reference table via the web service.")
    End Function

    Public Function GetMaintainableReferenceTables() As List(Of ReferenceTable) Implements IReferenceValueService.GetMaintainableReferenceTables
        Throw New InvalidOperationException("You cannot get a list of maintainable reference tables via the web service.")
    End Function

    Public Function GetReferenceValueDetail(ByVal request As GetReferenceValueDetailRequest) As ReferenceValueDetail Implements IReferenceValueService.GetReferenceValueDetail
        Throw New InvalidOperationException("You cannot get reference value detail information via the web service.")
    End Function

    Public Sub UpdateReferenceValue(ByVal request As ReferenceValueChange) Implements IReferenceValueService.UpdateReferenceValue
        Throw New InvalidOperationException("You cannot make a reference data change via the web service.")
    End Sub

End Class
