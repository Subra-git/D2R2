Imports Profiles.Contracts
Imports Profiles.Contracts.DataContracts
Imports Profiles.Contracts.ServiceContracts

<ServiceBehavior(InstanceContextMode:=InstanceContextMode.PerCall)>
<ErrorHandlerBehavior()>
Public Class BespokeReportTemplateService
	Implements IBespokeReportTemplateService

	Public Function GetAll() As IEnumerable(Of BespokeReportTemplateResponse) Implements IBespokeReportTemplateService.GetAll
		Return DataFactory.GetBespokeReportTemplateService().GetAll()
	End Function

	Public Function GetSingleByTitleOrDefault(title As String) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.GetSingleByTitleOrDefault
		Return DataFactory.GetBespokeReportTemplateService().GetSingleByTitleOrDefault(title)
	End Function

	Public Function GetSingleOrDefault(id As Guid) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.GetSingleOrDefault
		Return DataFactory.GetBespokeReportTemplateService().GetSingleOrDefault(id)
	End Function

	Public Function CanEdit() As Boolean Implements IBespokeReportTemplateService.CanEdit
		Return DataFactory.GetBespokeReportTemplateService().CanEdit()
	End Function

	Public Function CanView() As Boolean Implements IBespokeReportTemplateService.CanView
		Return DataFactory.GetBespokeReportTemplateService().CanView()
	End Function

	Public Function Save(request As BespokeReportTemplateRequest) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.Save
		SecurityException()
	End Function

	Public Function SaveAs(request As BespokeReportTemplateRequest) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.SaveAs
		SecurityException()
	End Function

	Public Function SaveTitle(title As String, id As Guid) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.SaveTitle
		SecurityException()
	End Function

	Public Sub Delete(id As Guid) Implements IBespokeReportTemplateService.Delete
		SecurityException()
	End Sub

	Private Sub SecurityException()
		Throw New System.Security.SecurityException("You cannot Add/ Edit/ Delete Bespoke Report Templates via WCF")
	End Sub
End Class
