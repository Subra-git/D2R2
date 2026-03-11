Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel


Public Class ProfileQuestionService
    Implements IProfileQuestionService

    Public Function GetProfileQuestion(ByVal request As GetProfileQuestionRequest) As ProfileQuestionData Implements IProfileQuestionService.GetProfileQuestion

        Dim proxy As IProfileQuestionService = ProxyFactory.GetProxy(Of IProfileQuestionService)("ProfileQuestionService")
        Return ProxyFactory.CallProxyMethod(Of IProfileQuestionService, GetProfileQuestionRequest, ProfileQuestionData)(proxy, request, AddressOf proxy.GetProfileQuestion)

    End Function

    Public Function UpdateProfileQuestion(ByVal request As UpdateProfileQuestionRequest) As Byte() Implements IProfileQuestionService.UpdateProfileQuestion
        Throw New System.Security.SecurityException("You cannot update profile questions via WCF")
    End Function

    Public Function GetProfileQuestionInfoList(ByVal request As Contracts.DataContracts.GetProfileQuestionInfoListRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileQuestionInfo) Implements Contracts.ServiceContracts.IProfileQuestionService.GetProfileQuestionInfoList

        Dim proxy As IProfileQuestionService = ProxyFactory.GetProxy(Of IProfileQuestionService)("ProfileQuestionService")
        Return ProxyFactory.CallProxyMethod(Of IProfileQuestionService, GetProfileQuestionInfoListRequest, List(Of ProfileQuestionInfo))(proxy, request, AddressOf proxy.GetProfileQuestionInfoList)

    End Function

    Public Function GetProfileGuidanceReport(ByVal request As Contracts.DataContracts.GetProfileQuestionReportRequest) As ProfileGuidanceReportData Implements IProfileQuestionService.GetProfileGuidanceReport

        Dim proxy As IProfileQuestionService = ProxyFactory.GetProxy(Of IProfileQuestionService)("ProfileQuestionService")
        Return ProxyFactory.CallProxyMethod(Of IProfileQuestionService, GetProfileQuestionReportRequest, ProfileGuidanceReportData)(proxy, request, AddressOf proxy.GetProfileGuidanceReport)

    End Function

End Class
