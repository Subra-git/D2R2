Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface ISpellCheckService

        <OperationContract()> _
        Function GetCustomWords() As List(Of CustomWord)

        <OperationContract()> _
        Function UpdateCustomWords(ByVal request As DataContracts.CustomWordChangeset) As ChangeResult

    End Interface

End Namespace
