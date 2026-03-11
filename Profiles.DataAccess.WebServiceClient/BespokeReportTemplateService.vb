Imports Profiles.Contracts.ServiceContracts
Imports Profiles.Contracts.DataContracts

Public Class BespokeReportTemplateService
	Implements IBespokeReportTemplateService

	Public Function GetAll() As IEnumerable(Of BespokeReportTemplateResponse) Implements IBespokeReportTemplateService.GetAll
		Dim service As IBespokeReportTemplateService = Proxy()

		Return service.Invoke(AddressOf service.GetAll)
	End Function

	Public Function GetSingleByTitleOrDefault(title As String) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.GetSingleByTitleOrDefault
		Dim service As IBespokeReportTemplateService = Proxy()

		Return service.Invoke(title, AddressOf service.GetSingleByTitleOrDefault)
	End Function

	Public Function GetSingleOrDefault(id As Guid) As BespokeReportTemplateResponse Implements IBespokeReportTemplateService.GetSingleOrDefault
		Dim service As IBespokeReportTemplateService = Proxy()

		Return service.Invoke(id, AddressOf service.GetSingleOrDefault)
	End Function

	Public Function CanEdit() As Boolean Implements IBespokeReportTemplateService.CanEdit
		Dim service As IBespokeReportTemplateService = Proxy()

		Return service.Invoke(AddressOf service.CanEdit)
	End Function

	Public Function CanView() As Boolean Implements IBespokeReportTemplateService.CanView
		Dim service As IBespokeReportTemplateService = Proxy()

		Return service.Invoke(AddressOf service.CanView)
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

	Private Function Proxy() As IBespokeReportTemplateService
		Return GetProxy(Of IBespokeReportTemplateService)("BespokeReportTemplateService")
	End Function

	Private Sub SecurityException()
		Throw New System.Security.SecurityException("You cannot Add/ Edit/ Delete Bespoke Report Templates via WCF")
	End Sub
End Class
