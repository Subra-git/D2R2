Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ReferenceValueService
    Implements IReferenceValueService

    Public Function GetLookupValues(ByVal request As DataContracts.GetLookupValuesRequest) As List(Of DataContracts.LookupValue) Implements IReferenceValueService.GetLookupValues

        Dim lookupValueList As New List(Of DataContracts.LookupValue)
        Dim lookupList As LookupList = lookupList.GetList(request.ReferenceTableId)

        For Each lookup As Csla.NameValueListBase(Of Guid, String).NameValuePair In lookupList
            lookupValueList.Add(New DataContracts.LookupValue() With {.Id = lookup.Key, .LookupValue = lookup.Value})
        Next

        Return lookupValueList

    End Function

    Public Function GetReferenceValues(ByVal request As Contracts.DataContracts.GetReferenceValuesRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ReferenceValue) Implements Contracts.ServiceContracts.IReferenceValueService.GetReferenceValues

        Dim referenceValueList As New List(Of DataContracts.ReferenceValue)
        Dim referenceValueInfoList As ReferenceValueInfoList = referenceValueInfoList.GetList(request.ReferenceTableId)

        For Each refVal As ReferenceValueInfo In referenceValueInfoList

            referenceValueList.Add(New DataContracts.ReferenceValue() With { _
                                        .Id = refVal.Id, _
                                        .Value = refVal.Value, _
                                        .EffectiveDateFrom = refVal.EffectiveDateFrom, _
                                        .EffectiveDateTo = refVal.EffectiveDateTo, _
                                        .IsInUse = refVal.IsInUse, _
                                        .IsActive = refVal.IsActive})

        Next

        Return referenceValueList

    End Function

    Public Function GetReferenceTableAuditTrail(ByVal request As DataContracts.GetReferenceTableAuditTrailRequest) As List(Of DataContracts.ReferenceTableAuditTrailEntry) Implements IReferenceValueService.GetReferenceTableAuditTrail
        Throw New InvalidOperationException("You cannot get an audit trail for a reference table via the web service.")
    End Function

    Public Function GetReferenceTable(ByVal request As DataContracts.GetReferenceTableRequest) As DataContracts.ReferenceTable Implements IReferenceValueService.GetReferenceTable
        Throw New InvalidOperationException("You cannot get a reference table via the web service.")
    End Function

    Public Function GetMaintainableReferenceTables() As List(Of DataContracts.ReferenceTable) Implements IReferenceValueService.GetMaintainableReferenceTables
        Throw New InvalidOperationException("You cannot get a list of maintainable reference tables via the web service.")
    End Function

    Public Function GetReferenceValueDetail(ByVal request As DataContracts.GetReferenceValueDetailRequest) As DataContracts.ReferenceValueDetail Implements IReferenceValueService.GetReferenceValueDetail
        Throw New InvalidOperationException("You cannot get reference value detail information via the web service.")
    End Function

    Public Sub UpdateReferenceValue(ByVal request As DataContracts.ReferenceValueChange) Implements IReferenceValueService.UpdateReferenceValue
        Throw New InvalidOperationException("You cannot make a reference data change via the web service.")
    End Sub

End Class
