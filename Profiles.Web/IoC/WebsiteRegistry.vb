Imports Profiles.Business
Imports Profiles.Business.BespokeReport
Imports Profiles.Business.EmailBusiness
Imports Profiles.Contracts.ServiceContracts
Imports Profiles.DataAccess.NPoco
Imports Profiles.DataAccess.NPoco.Services.BespokeReport
Imports Profiles.EmailService
Imports Profiles.Infrastructure
Imports StructureMap.Configuration.DSL

Namespace Profiles.Web.IoC

	Public Class WebsiteRegistry
		Inherits Registry

		Protected Overrides Sub configure()
			'Bespoke Report Templates

			If (Convert.ToBoolean(ConfigurationManager.AppSettings("UseSQLDirectly"))) Then
				RegisterDirectSql()
			Else
				RegisterWCF()
			End If

			'Global settings
			Me.ForRequestedType(Of IGlobalSettings).TheDefaultIsConcreteType(Of WebConfigGlobalSettings)()

			'Other Business
			Me.ForRequestedType(Of IEmailBusiness).TheDefaultIsConcreteType(Of EmailBusiness)()

			' NPoco Data access
			Me.ForRequestedType(Of IDatabaseInitializer).TheDefaultIsConcreteType(Of DatabaseInitializer)()

			' Email service
			Me.ForRequestedType(Of ISmtpClient)().TheDefaultIsConcreteType(Of SmtpClientWrapper)()
			Me.ForRequestedType(Of IEmailService)().TheDefaultIsConcreteType(Of EmailService.EmailService)()
		End Sub

		Private Sub RegisterWCF()
			Me.ForRequestedType(Of IStaticReportService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.StaticReportService)()
			Me.ForRequestedType(Of IProfileReportService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileReportService)()
			Me.ForRequestedType(Of IUserAuthenticationService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.UserAuthenticationService)()
			Me.ForRequestedType(Of IProfileNoteService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileNoteService)()
			Me.ForRequestedType(Of IProfileSearchService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileSearchService)()
			Me.ForRequestedType(Of IErrorLogService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ErrorLogService)()
			Me.ForRequestedType(Of ISpellCheckService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.SpellCheckService)()
			Me.ForRequestedType(Of IProfileVersionDataService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileVersionDataService)()
			Me.ForRequestedType(Of ISpeciesDataService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.SpeciesDataService)()
			Me.ForRequestedType(Of IReviewCommentService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ReviewCommentService)()
			Me.ForRequestedType(Of IReferenceValueService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ReferenceValueService)()
			Me.ForRequestedType(Of IProfileQuestionService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileQuestionService)()
			Me.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.UserMaintenanceService)()
			Me.ForRequestedType(Of ISpeciesMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.SpeciesMaintenanceService)()
			Me.ForRequestedType(Of IProfileManagementService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ProfileManagementService)()
			Me.ForRequestedType(Of IPrioritisationService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.PrioritisationService)()
			Me.ForRequestedType(Of IDiseaseRankingService).TheDefaultIsConcreteType(Of DataAccess.Sql.DiseaseRankingService)()
			Me.ForRequestedType(Of IReviewEmailService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.ReviewEmailService)()

			Me.ForRequestedType(Of IBespokeReportTemplateDataService).TheDefaultIsConcreteType(Of Services.BespokeReport.BespokeReportTemplateDataService)()
			Me.ForRequestedType(Of IBespokeReportTemplateService).TheDefaultIsConcreteType(Of DataAccess.WcfClient.BespokeReportTemplateService)()
		End Sub

		Private Sub RegisterDirectSql()
			Me.ForRequestedType(Of IStaticReportService).TheDefaultIsConcreteType(Of DataAccess.Sql.StaticReportService)()
			Me.ForRequestedType(Of IProfileReportService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileReportService)()
			Me.ForRequestedType(Of IUserAuthenticationService).TheDefaultIsConcreteType(Of DataAccess.Sql.UserAuthenticationService)()
			Me.ForRequestedType(Of IProfileNoteService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileNoteService)()
			Me.ForRequestedType(Of IProfileSearchService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileSearchService)()
			Me.ForRequestedType(Of IErrorLogService).TheDefaultIsConcreteType(Of DataAccess.Sql.ErrorLogService)()
			Me.ForRequestedType(Of ISpellCheckService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpellCheckService)()
			Me.ForRequestedType(Of IProfileVersionDataService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileVersionDataService)()
			Me.ForRequestedType(Of ISpeciesDataService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpeciesDataService)()
			Me.ForRequestedType(Of IReviewCommentService).TheDefaultIsConcreteType(Of DataAccess.Sql.ReviewCommentService)()
			Me.ForRequestedType(Of IReferenceValueService).TheDefaultIsConcreteType(Of DataAccess.Sql.ReferenceValueService)()
			Me.ForRequestedType(Of IProfileQuestionService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileQuestionService)()
			Me.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.Sql.UserMaintenanceService)()
			Me.ForRequestedType(Of ISpeciesMaintenanceService).TheDefaultIsConcreteType(Of DataAccess.Sql.SpeciesMaintenanceService)()
			Me.ForRequestedType(Of IProfileManagementService).TheDefaultIsConcreteType(Of DataAccess.Sql.ProfileManagementService)()
			Me.ForRequestedType(Of IPrioritisationService).TheDefaultIsConcreteType(Of DataAccess.Sql.PrioritisationService)()
			Me.ForRequestedType(Of IDiseaseRankingService).TheDefaultIsConcreteType(Of DataAccess.Sql.DiseaseRankingService)()
			Me.ForRequestedType(Of IReviewEmailService).TheDefaultIsConcreteType(Of DataAccess.NPoco.Services.ReviewEmail.ReviewEmailService)()

			Me.ForRequestedType(Of IBespokeReportTemplateDataService).TheDefaultIsConcreteType(Of Services.BespokeReport.BespokeReportTemplateDataService)()
			Me.ForRequestedType(Of IBespokeReportTemplateService).TheDefaultIsConcreteType(Of BespokeReportTemplateService)()
		End Sub
	End Class

End Namespace

