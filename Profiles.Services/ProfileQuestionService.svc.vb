Imports Profiles.Contracts
Imports Profiles.Contracts.ServiceContracts
Imports ProfilesLibrary

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)> _
<ErrorHandlerBehavior()> _
Public Class ProfileQuestionService
    Implements IProfileQuestionService

    Public Function GetProfileQuestion(ByVal request As DataContracts.GetProfileQuestionRequest) As DataContracts.ProfileQuestionData Implements IProfileQuestionService.GetProfileQuestion

        Dim question As ProfileQuestion = ProfileQuestion.GetProfileQuestion(request.Id)

        Dim questionData As New DataContracts.ProfileQuestionData() With { _
                .Id = question.Id, _
                .Name = question.Name, _
                .NonTechnicalName = question.NonTechnicalName, _
                .ShortName = question.ShortName, _
                .QuestionNumber = question.QuestionNumber, _
                .UserGuidance = question.UserGuidance, _
                .LastUpdated = question.LastUpdated}

        Return questionData

    End Function

    Public Function UpdateProfileQuestion(ByVal request As DataContracts.UpdateProfileQuestionRequest) As Byte() Implements IProfileQuestionService.UpdateProfileQuestion
        Throw New System.Security.SecurityException("You cannot update profile questions via WCF")
    End Function

    Public Function GetProfileQuestionInfoList(ByVal request As Contracts.DataContracts.GetProfileQuestionInfoListRequest) As System.Collections.Generic.List(Of Contracts.DataContracts.ProfileQuestionInfo) Implements Contracts.ServiceContracts.IProfileQuestionService.GetProfileQuestionInfoList

        Dim questionInfoList As ProfilesLibrary.ProfileQuestionInfoList = ProfileQuestionInfoList.GetList(request.ProfileSectionId)

        Dim dtoQuestionInfoList As New List(Of DataContracts.ProfileQuestionInfo)
        For Each questionInfo As ProfileQuestionInfo In questionInfoList

            Dim dtoQuestionInfo As New DataContracts.ProfileQuestionInfo() With { _
               .Id = questionInfo.Id, _
               .Name = questionInfo.Name, _
               .QuestionNumber = questionInfo.QuestionNumber _
               }

            dtoQuestionInfoList.Add(dtoQuestionInfo)
        Next

        Return dtoQuestionInfoList

    End Function

    Public Function GetProfileGuidanceReport(ByVal request As Contracts.DataContracts.GetProfileQuestionReportRequest) As DataContracts.ProfileGuidanceReportData Implements IProfileQuestionService.GetProfileGuidanceReport

        Return New DataContracts.ProfileGuidanceReportData(ProfileQuestionMetadataList.GetProfileGuidanceReport(request.ReportType))

    End Function
End Class
