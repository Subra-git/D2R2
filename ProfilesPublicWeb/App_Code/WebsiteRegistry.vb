Imports Microsoft.VisualBasic
Imports StructureMap.Configuration.DSL
Imports Profiles.Contracts.ServiceContracts

Public Class WebsiteRegistry
    Inherits Registry

    Protected Overrides Sub configure()
        If (Convert.ToBoolean(ConfigurationManager.AppSettings("UseSQLDirectly"))) Then
            Me.ForRequestedType(Of IStaticReportService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.StaticReportService)()
            Me.ForRequestedType(Of IProfileReportService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileReportService)()
            Me.ForRequestedType(Of IUserAuthenticationService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.UserAuthenticationService)()
            Me.ForRequestedType(Of IProfileNoteService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileNoteService)()
            Me.ForRequestedType(Of IProfileSearchService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileSearchService)()
            Me.ForRequestedType(Of IErrorLogService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ErrorLogService)()
            Me.ForRequestedType(Of ISpellCheckService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.SpellCheckService)()
            Me.ForRequestedType(Of IProfileVersionDataService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileVersionDataService)()
            Me.ForRequestedType(Of ISpeciesDataService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.SpeciesDataService)()
            Me.ForRequestedType(Of IReviewCommentService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ReviewCommentService)()
            Me.ForRequestedType(Of IReferenceValueService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ReferenceValueService)()
            Me.ForRequestedType(Of IProfileQuestionService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileQuestionService)()
            Me.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.UserMaintenanceService)()
            Me.ForRequestedType(Of ISpeciesMaintenanceService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.SpeciesMaintenanceService)()
            Me.ForRequestedType(Of IProfileManagementService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.ProfileManagementService)()
            Me.ForRequestedType(Of IPrioritisationService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.PrioritisationService)()
            Me.ForRequestedType(Of IDiseaseRankingService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.DiseaseRankingService)()
        Else
            Me.ForRequestedType(Of IStaticReportService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.StaticReportService)()
            Me.ForRequestedType(Of IProfileReportService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileReportService)()
            Me.ForRequestedType(Of IUserAuthenticationService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.UserAuthenticationService)()
            Me.ForRequestedType(Of IProfileNoteService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileNoteService)()
            Me.ForRequestedType(Of IProfileSearchService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileSearchService)()
            Me.ForRequestedType(Of IErrorLogService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ErrorLogService)()
            Me.ForRequestedType(Of ISpellCheckService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.SpellCheckService)()
            Me.ForRequestedType(Of IProfileVersionDataService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileVersionDataService)()
            Me.ForRequestedType(Of ISpeciesDataService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.SpeciesDataService)()
            Me.ForRequestedType(Of IReviewCommentService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ReviewCommentService)()
            Me.ForRequestedType(Of IReferenceValueService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ReferenceValueService)()
            Me.ForRequestedType(Of IProfileQuestionService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileQuestionService)()
            Me.ForRequestedType(Of IUserMaintenanceService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.UserMaintenanceService)()
            Me.ForRequestedType(Of ISpeciesMaintenanceService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.SpeciesMaintenanceService)()
            Me.ForRequestedType(Of IProfileManagementService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.ProfileManagementService)()
            Me.ForRequestedType(Of IPrioritisationService).TheDefaultIsConcreteType(Of Profiles.DataAccess.WcfClient.PrioritisationService)()
            Me.ForRequestedType(Of IDiseaseRankingService).TheDefaultIsConcreteType(Of Profiles.DataAccess.Sql.DiseaseRankingService)()
        End If
    End Sub


End Class
