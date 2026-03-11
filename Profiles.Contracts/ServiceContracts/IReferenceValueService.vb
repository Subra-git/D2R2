Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IReferenceValueService

        <OperationContract()> _
        Function GetLookupValues(ByVal request As GetLookupValuesRequest) As List(Of LookupValue)

        <OperationContract()> _
        Function GetReferenceValues(ByVal request As GetReferenceValuesRequest) As List(Of ReferenceValue)

        Function GetReferenceTableAuditTrail(ByVal request As GetReferenceTableAuditTrailRequest) As List(Of ReferenceTableAuditTrailEntry)

        Function GetReferenceTable(ByVal request As GetReferenceTableRequest) As ReferenceTable

        Function GetMaintainableReferenceTables() As List(Of ReferenceTable)

        Function GetReferenceValueDetail(ByVal request As GetReferenceValueDetailRequest) As ReferenceValueDetail

        Sub UpdateReferenceValue(ByVal request As ReferenceValueChange)

    End Interface

End Namespace
