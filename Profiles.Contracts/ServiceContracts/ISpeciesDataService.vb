Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface ISpeciesDataService

        <OperationContract()> _
        Function GetAllSpecies() As List(Of SpeciesData)

        <OperationContract()> _
        Function GetSpeciesMetadata() As List(Of SpeciesSectionMetadata)

        <OperationContract()> _
        Function GetSpeciesAnswerData(ByVal request As GetSpeciesAnswerDataRequest) As SpeciesAnswerData

        <OperationContract()> _
        Function UpdateSpeciesAnswerData(ByVal request As SpeciesAnswerDataChangeSet) As SpeciesAnswerDataChangeResult

        <OperationContract()> _
        Function GetAllSelectedSpecies(ByVal request As String) As List(Of SpeciesData)

    End Interface

End Namespace