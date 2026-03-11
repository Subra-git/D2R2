using Profiles.Business.EmailBusiness;
using Profiles.Contracts.ServiceContracts;
using Profiles.DataAccess.NPoco;
using Profiles.EmailService;
using ProfilesLibrary;

namespace Profiles.Business.Tests.Integration
{
    public class Bootstrap
    {
        public static void Initialize()
        {
            // StructureMap config
            StructureMap.ObjectFactory.Configure(a =>
            {
                a.ForRequestedType<IStaticReportService>().TheDefaultIsConcreteType<DataAccess.Sql.StaticReportService>();
                a.ForRequestedType<IProfileReportService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileReportService>();
                a.ForRequestedType<IUserAuthenticationService>().TheDefaultIsConcreteType<DataAccess.Sql.UserAuthenticationService>();
                a.ForRequestedType<IProfileNoteService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileNoteService>();
                a.ForRequestedType<IProfileSearchService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileSearchService>();
                a.ForRequestedType<IErrorLogService>().TheDefaultIsConcreteType<DataAccess.Sql.ErrorLogService>();
                a.ForRequestedType<ISpellCheckService>().TheDefaultIsConcreteType<DataAccess.Sql.SpellCheckService>();
                a.ForRequestedType<IProfileVersionDataService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileVersionDataService>();
                a.ForRequestedType<ISpeciesDataService>().TheDefaultIsConcreteType<DataAccess.Sql.SpeciesDataService>();
                a.ForRequestedType<IReviewCommentService>().TheDefaultIsConcreteType<DataAccess.Sql.ReviewCommentService>();
                a.ForRequestedType<IReferenceValueService>().TheDefaultIsConcreteType<DataAccess.Sql.ReferenceValueService>();
                a.ForRequestedType<IProfileQuestionService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileQuestionService>();
                a.ForRequestedType<IUserMaintenanceService>().TheDefaultIsConcreteType<DataAccess.Sql.UserMaintenanceService>();
                a.ForRequestedType<ISpeciesMaintenanceService>().TheDefaultIsConcreteType<DataAccess.Sql.SpeciesMaintenanceService>();
                a.ForRequestedType<IProfileManagementService>().TheDefaultIsConcreteType<DataAccess.Sql.ProfileManagementService>();
                a.ForRequestedType<IPrioritisationService>().TheDefaultIsConcreteType<DataAccess.Sql.PrioritisationService>();
                a.ForRequestedType<IDiseaseRankingService>().TheDefaultIsConcreteType<DataAccess.Sql.DiseaseRankingService>();
                a.ForRequestedType<IReviewEmailService>().TheDefaultIsConcreteType<DataAccess.NPoco.Services.ReviewEmail.ReviewEmailService>();
                a.ForRequestedType<IDatabaseInitializer>().TheDefaultIsConcreteType<DatabaseInitializer>();
                a.ForRequestedType<ISmtpClient>().TheDefaultIsConcreteType<SmtpClientWrapper>();
                a.ForRequestedType<IEmailService>().TheDefaultIsConcreteType<EmailService.EmailService>();
                a.ForRequestedType<IEmailBusiness>().TheDefaultIsConcreteType<EmailBusiness.EmailBusiness>();
            });

            ProfilesPrincipal.Login("internal\\admin");
        }
    }
}
