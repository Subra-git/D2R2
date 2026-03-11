Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IStaticReportService

        <OperationContract()> _
        Function GetCurrentPublicStaticReports(ByVal request As GetCurrentPublicStaticReportsRequest) As List(Of StaticReportVersion)

        <OperationContract()> _
        Function GetCurrentStaticReports(ByVal request As GetCurrentStaticReportsRequest) As List(Of StaticReportVersion)

        <OperationContract()> _
        Function GetStaticReportPublicHistory(ByVal request As GetStaticReportPublicHistoryRequest) As List(Of StaticReportVersion)

        <OperationContract()> _
        Function GetStaticReportHistory(ByVal request As GetStaticReportHistoryRequest) As List(Of StaticReportVersion)

        <OperationContract()> _
        Function GetStaticReportData(ByVal request As GetStaticReportDataRequest) As StaticReportData

        Sub SetStaticReportPublicAccess(ByVal request As SetStaticReportPublicAccessRequest)

        Sub DeleteStaticReportVersion(ByVal request As DeleteStaticReportVersionRequest)

        Sub UploadStaticReport(ByVal request As UploadStaticReportRequest)

    End Interface

End Namespace
