Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class SpeciesMaintenanceService
    Implements ISpeciesMaintenanceService

    Public Function GetSpeciesValidParents(ByVal request As GetSpeciesValidParentsRequest) As List(Of SpeciesValidParent) Implements ISpeciesMaintenanceService.GetSpeciesValidParents
        Throw New InvalidOperationException("You cannot get a list of valid parents for a species via the web service.")
    End Function

    Public Function GetSpeciesAuditTrail() As List(Of SpeciesAuditTrailEntry) Implements ISpeciesMaintenanceService.GetSpeciesAuditTrail
        Throw New InvalidOperationException("You cannot get a species audit trail via the web service.")
    End Function

    Public Sub ChangeSpeciesPosition(ByVal request As ChangeSpeciesPositionRequest) Implements ISpeciesMaintenanceService.ChangeSpeciesPosition
        Throw New InvalidOperationException("You cannot change species position via the web service.")
    End Sub

    Public Function GetSpeciesDetail(ByVal request As GetSpeciesDetailRequest) As SpeciesDetail Implements ISpeciesMaintenanceService.GetSpeciesDetail
        Throw New InvalidOperationException("You cannot get the details of a species via the web service.")
    End Function

    Public Sub UpdateSpecies(ByVal request As SpeciesChange) Implements ISpeciesMaintenanceService.UpdateSpecies
        Throw New InvalidOperationException("You cannot update a species via the web service.")
    End Sub

End Class
