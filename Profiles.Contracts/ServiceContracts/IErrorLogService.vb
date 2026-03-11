Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IErrorLogService

        <OperationContract()> _
        Sub CreateErrorLogEntry(ByVal entry As ErrorLogEntry)

    End Interface

End Namespace

