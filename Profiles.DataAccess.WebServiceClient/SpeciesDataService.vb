Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class SpeciesDataService
    Implements ISpeciesDataService

    Public Function GetAllSpecies() As System.Collections.Generic.List(Of Contracts.DataContracts.SpeciesData) Implements Contracts.ServiceContracts.ISpeciesDataService.GetAllSpecies

        Dim proxy As ISpeciesDataService = ProxyFactory.GetProxy(Of ISpeciesDataService)("SpeciesDataService")
        Return ProxyFactory.CallProxyMethod(Of ISpeciesDataService, List(Of SpeciesData))(proxy, AddressOf proxy.GetAllSpecies)

    End Function

    Public Function GetSpeciesMetadata() As System.Collections.Generic.List(Of Contracts.DataContracts.SpeciesSectionMetadata) Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesMetadata

        Dim proxy As ISpeciesDataService = ProxyFactory.GetProxy(Of ISpeciesDataService)("SpeciesDataService")
        Return ProxyFactory.CallProxyMethod(Of ISpeciesDataService, List(Of SpeciesSectionMetadata))(proxy, AddressOf proxy.GetSpeciesMetadata)

    End Function

    Public Function GetSpeciesAnswerData(ByVal request As Contracts.DataContracts.GetSpeciesAnswerDataRequest) As Contracts.DataContracts.SpeciesAnswerData Implements Contracts.ServiceContracts.ISpeciesDataService.GetSpeciesAnswerData

        Dim proxy As ISpeciesDataService = ProxyFactory.GetProxy(Of ISpeciesDataService)("SpeciesDataService")
        Return ProxyFactory.CallProxyMethod(Of ISpeciesDataService, GetSpeciesAnswerDataRequest, SpeciesAnswerData)(proxy, request, AddressOf proxy.GetSpeciesAnswerData)

    End Function

    Public Function UpdateSpeciesAnswerData(ByVal request As Contracts.DataContracts.SpeciesAnswerDataChangeSet) As Contracts.DataContracts.SpeciesAnswerDataChangeResult Implements Contracts.ServiceContracts.ISpeciesDataService.UpdateSpeciesAnswerData
        Throw New InvalidOperationException("You cannot update the species answer data via the web service.")
    End Function

    Public Function GetAllSelectedSpecies(ByVal request As String) As System.Collections.Generic.List(Of Contracts.DataContracts.SpeciesData) Implements Contracts.ServiceContracts.ISpeciesDataService.GetAllSelectedSpecies

        Dim proxy As ISpeciesDataService = ProxyFactory.GetProxy(Of ISpeciesDataService)("SpeciesDataService")
        Return ProxyFactory.CallProxyMethod(Of ISpeciesDataService, List(Of SpeciesData))(proxy, AddressOf proxy.GetAllSpecies)

    End Function

End Class
