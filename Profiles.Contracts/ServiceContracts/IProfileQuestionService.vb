Imports Profiles.Contracts.DataContracts
Imports System.ServiceModel

Namespace ServiceContracts

    <ServiceContract()> _
    Public Interface IProfileQuestionService

        <OperationContract()> _
        Function GetProfileQuestion(ByVal request As GetProfileQuestionRequest) As ProfileQuestionData

        <OperationContract()> _
        Function UpdateProfileQuestion(ByVal request As UpdateProfileQuestionRequest) As Byte()

        <OperationContract()> _
        Function GetProfileQuestionInfoList(ByVal request As GetProfileQuestionInfoListRequest) As List(Of ProfileQuestionInfo)

        <OperationContract()> _
        Function GetProfileGuidanceReport(ByVal request As GetProfileQuestionReportRequest) As ProfileGuidanceReportData

    End Interface

End Namespace

