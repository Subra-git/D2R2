Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Public Class SpellCheckService
    Implements ISpellCheckService


    Public Function GetCustomWords() As List(Of CustomWord) Implements ISpellCheckService.GetCustomWords

        Dim proxy As ISpellCheckService = ProxyFactory.GetProxy(Of ISpellCheckService)("SpellCheckService")
        Return ProxyFactory.CallProxyMethod(Of ISpellCheckService, List(Of CustomWord))(proxy, AddressOf proxy.GetCustomWords)

    End Function

    Public Function UpdateCustomWords(ByVal request As CustomWordChangeset) As ChangeResult Implements ISpellCheckService.UpdateCustomWords

        Dim proxy As ISpellCheckService = ProxyFactory.GetProxy(Of ISpellCheckService)("SpellCheckService")
        Return ProxyFactory.CallProxyMethod(Of ISpellCheckService, CustomWordChangeset, ChangeResult)(proxy, request, AddressOf proxy.UpdateCustomWords)

    End Function

End Class
