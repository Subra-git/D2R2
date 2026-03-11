Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface ISpeciesMaintenanceService

        Function GetSpeciesValidParents(ByVal request As GetSpeciesValidParentsRequest) As List(Of SpeciesValidParent)

        Function GetSpeciesAuditTrail() As List(Of SpeciesAuditTrailEntry)

        Sub ChangeSpeciesPosition(ByVal request As ChangeSpeciesPositionRequest)

        Function GetSpeciesDetail(ByVal request As GetSpeciesDetailRequest) As SpeciesDetail

        Sub UpdateSpecies(ByVal request As SpeciesChange)

    End Interface

End Namespace
