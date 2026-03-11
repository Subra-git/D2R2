Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class ProfileNoteService
    Implements IProfileNoteService

    Public Function GetNoteTypes() As List(Of ProfileNoteType) Implements IProfileNoteService.GetNoteTypes

        Dim proxy As IProfileNoteService = ProxyFactory.GetProxy(Of IProfileNoteService)("ProfileNoteService")
        Return ProxyFactory.CallProxyMethod(Of IProfileNoteService, List(Of ProfileNoteType))(proxy, AddressOf proxy.GetNoteTypes)

    End Function

    Public Function GetNotesBySection(ByVal request As GetProfileNotesBySectionRequest) As List(Of ProfileNote) Implements IProfileNoteService.GetNotesBySection

        Dim proxy As IProfileNoteService = ProxyFactory.GetProxy(Of IProfileNoteService)("ProfileNoteService")
        Return ProxyFactory.CallProxyMethod(Of IProfileNoteService, GetProfileNotesBySectionRequest, List(Of ProfileNote))(proxy, request, AddressOf proxy.GetNotesBySection)

    End Function

    Public Function GetNotesByVersion(ByVal request As Contracts.DataContracts.GetProfileNotesByVersionRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileNote) Implements Contracts.ServiceContracts.IProfileNoteService.GetNotesByVersion

        Dim proxy As IProfileNoteService = ProxyFactory.GetProxy(Of IProfileNoteService)("ProfileNoteService")
        Return ProxyFactory.CallProxyMethod(Of IProfileNoteService, GetProfileNotesByVersionRequest, List(Of ProfileNote))(proxy, request, AddressOf proxy.GetNotesByVersion)

    End Function


    Public Function UpdateNotes(ByVal request As ProfileNoteChangeset) As ChangeResult Implements IProfileNoteService.UpdateNotes

        Dim proxy As IProfileNoteService = ProxyFactory.GetProxy(Of IProfileNoteService)("ProfileNoteService")
        Return ProxyFactory.CallProxyMethod(Of IProfileNoteService, ProfileNoteChangeset, ChangeResult)(proxy, request, AddressOf proxy.UpdateNotes)

    End Function

End Class
