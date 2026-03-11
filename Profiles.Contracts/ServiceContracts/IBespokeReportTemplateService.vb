
Imports System.ServiceModel
Imports Profiles.Contracts.DataContracts

Namespace ServiceContracts
	<ServiceContract()>
	Public Interface IBespokeReportTemplateService

		<OperationContract()>
		Function GetAll() As IEnumerable(Of BespokeReportTemplateResponse)

		<OperationContract()>
		Function GetSingleOrDefault(id As Guid) As BespokeReportTemplateResponse

		<OperationContract()>
		Function GetSingleByTitleOrDefault(title As String) As BespokeReportTemplateResponse

		<OperationContract()>
		Function Save(request As BespokeReportTemplateRequest) As BespokeReportTemplateResponse

		<OperationContract()>
		Function SaveAs(request As BespokeReportTemplateRequest) As BespokeReportTemplateResponse

		<OperationContract()>
		Function SaveTitle(title As String, id As Guid) As BespokeReportTemplateResponse

		<OperationContract()>
		Sub Delete(model As Guid)

		<OperationContract()>
		Function CanEdit() As Boolean

		<OperationContract()>
		Function CanView() As Boolean
	End Interface

End Namespace
    