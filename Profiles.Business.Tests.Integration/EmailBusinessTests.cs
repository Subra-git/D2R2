using FakeItEasy;
using Profiles.DataAccess.NPoco;
using Profiles.EmailService;
using Profiles.Infrastructure;
using Xunit;

namespace Profiles.Business.Tests.Integration
{
    public class EmailBusinessTests
    {
        public EmailBusinessTests()
        {
            Bootstrap.Initialize();
        }

        [Fact]
        public void CanRetrieveUsersDueReviewEmails()
        {
            EmailBusiness().GetUsersDueReviewEmail();
        }

        //[Fact]
        //public void CanSendReviewEmails()
        //{
        //    EmailBusiness().SendReviewEmails();
        //}

        private EmailBusiness.EmailBusiness EmailBusiness()
        {
            var settings = A.Fake<IGlobalSettings>();
            A.CallTo(() => settings.FromEmailAddress).Returns("a@b.c");
            A.CallTo(() => settings.FromEmailDisplayName).Returns("Test sender");

            return new EmailBusiness.EmailBusiness(
                new EmailService.EmailService(new SmtpClientWrapper()),
                new DataAccess.NPoco.Services.ReviewEmail.ReviewEmailService(new DatabaseInitializer()),
                settings);
        }
    }
}
