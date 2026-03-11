Imports Profiles.Contracts.ServiceContracts
Imports Profiles.DataAccess.NPoco
Imports Profiles.DataAccess.NPoco.Services.BespokeReport
Imports StructureMap.Configuration.DSL

Public Class Global_asax
	Inherits System.Web.HttpApplication

	Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
		StructureMap.ObjectFactory.Configure(Sub(a)
												 a.ForRequestedType(Of IDatabaseInitializer)().TheDefaultIsConcreteType(Of DatabaseInitializer)()
												 a.ForRequestedType(Of IUserAuthenticationService)().TheDefaultIsConcreteType(Of DataAccess.NPoco.Services.UserAuthentication.UserAuthenticationService)()
												 a.ForRequestedType(Of IStaticReportService).TheDefaultIsConcreteType(Of DataAccess.Sql.StaticReportService)()
												 a.ForRequestedType(Of IProfileReportService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileReportService)()
												 a.ForRequestedType(Of IProfileNoteService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileNoteService)()
												 a.ForRequestedType(Of IProfileSearchService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileSearchService)()
												 a.ForRequestedType(Of IErrorLogService).TheDefaultIsConcreteType(Of DataAccess.Sql.ErrorLogService)()
												 a.ForRequestedType(Of ISpellCheckService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpellCheckService)()
												 a.ForRequestedType(Of IProfileVersionDataService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileVersionDataService)()
												 a.ForRequestedType(Of ISpeciesDataService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpeciesDataService)()
												 a.ForRequestedType(Of IReviewCommentService).TheDefaultIsConcreteType(Of DataAccess.Sql.ReviewCommentService)()
												 a.ForRequestedType(Of IReferenceValueService).TheDefaultIsConcreteType(Of DataAccess.Sql.ReferenceValueService)()
												 a.ForRequestedType(Of IProfileQuestionService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileQuestionService)()
												 a.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.Sql.UserMaintenanceService)()
												 a.ForRequestedType(Of ISpeciesMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpeciesMaintenanceService)()
												 a.ForRequestedType(Of IProfileManagementService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileManagementService)()
												 a.ForRequestedType(Of IPrioritisationService).TheDefaultIsConcreteType(Of DataAccess.Sql.PrioritisationService)()
												 a.ForRequestedType(Of IDiseaseRankingService).TheDefaultIsConcreteType(Of DataAccess.Sql.DiseaseRankingService)()

												 ConfigureBespokeReportTemplate(a)
											 End Sub)
	End Sub

	Private Sub ConfigureBespokeReportTemplate(registry As Registry)
		registry.ForRequestedType(Of IBespokeReportTemplateDataService).TheDefaultIsConcreteType(Of DataAccess.NPoco.Services.BespokeReport.BespokeReportTemplateDataService)()
		registry.ForRequestedType(Of IBespokeReportTemplateService).TheDefaultIsConcreteType(Of Profiles.Business.BespokeReport.BespokeReportTemplateService)()
	End Sub

	Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when the session is started
	End Sub

	Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
		' Fires at the beginning of each request
	End Sub

	Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
		' Fires upon attempting to authenticate the use
	End Sub

	Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when an error occurs
	End Sub

	Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when the session ends
	End Sub

	Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when the application ends
	End Sub
End Class