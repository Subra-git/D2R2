using System;
using System.Collections.Generic;
using System.Net.Mail;
using FakeItEasy;
using Profiles.EmailService;
using Xunit;
using Profiles.Contracts.DataContracts;
using Profiles.Infrastructure.Enums;
using Profiles.Contracts.ServiceContracts;
using Profiles.Infrastructure;

namespace Profiles.Business.Tests.Unit.EmailBusiness
{
    public class EmailBusinessTests
    {
        private readonly IEmailService emailService;
        private readonly IReviewEmailService reviewEmailService;
        private readonly IGlobalSettings globalSettings;

        public EmailBusinessTests()
        {
            emailService = A.Fake<IEmailService>();
            reviewEmailService = A.Fake<IReviewEmailService>();
            globalSettings = A.Fake<IGlobalSettings>();
        }

        [Fact]
        public void SendReminderEmails_UserEmailIsRetrieved_ButNoRelatedProfilesRetrieved_ShouldNotSendEmail()
        {
            var userId = Guid.NewGuid();

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse>
                {
                    new UserDueReviewEmailResponse
                    {
                        EmailAddress = "a@b.c",
                        FullName = "Unit Tester",
                        Id = userId,
                        UserName = "Tester",
                        ProfileVersions = new List<ProfileVersionResponse>()
                    }
                });

            EmailBusiness().SendReviewEmails();

            A.CallTo(() => emailService.SendEmail(A<IEmail<UserDueReviewEmailResponse>>._, A<UserDueReviewEmailResponse>._, A<IEnumerable<MailAddress>>._, A<MailAddress>._))
                .MustNotHaveHappened();
        }

        [Fact]
        public void SendReminderEmails_UserEmailIsRetrieved_AndRelatedProfileRetrieved_ButNoRelatedProfileSectionsRetrieved_ShouldNotSendEmail()
        {
            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse>
                {
                    new UserDueReviewEmailResponse
                    {
                        EmailAddress = "a@b.c",
                        FullName = "Unit Tester",
                        Id = Guid.NewGuid(),
                        UserName = "Tester",
                        ProfileVersions = new List<ProfileVersionResponse>
                        {
                            new ProfileVersionResponse
                            {
                                ProfileTitle = A<string>._,
                                ProfileVersionId = A<Guid>._,
                                ScenarioTitle = A<string>._,
                                FullVersion = "1.0",
                                ProfileSections = new List<ProfileSectionResponse>()
                            }
                        }
                    }
                });

            EmailBusiness().SendReviewEmails();

            A.CallTo(() => emailService.SendEmail(A<IEmail<UserDueReviewEmailResponse>>._, A<UserDueReviewEmailResponse>._, A<IEnumerable<MailAddress>>._, A<MailAddress>._))
                .MustNotHaveHappened();
        }

        [Fact]
        public void
            SendReminderEmails_UserEmailIsRetrieved_AndRelatedProfileRetrieved_AndRelatedProfileSectionRetrieved_ShouldSendEmailOnce
            ()
        {
            var userId = Guid.NewGuid();
            var profileVersionId = Guid.NewGuid();

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
            .Returns(new List<UserDueReviewEmailResponse>
            {
                new UserDueReviewEmailResponse
                {
                    EmailAddress = "a@b.c",
                    FullName = "Unit Tester",
                    Id = Guid.NewGuid(),
                    UserName = "Tester",
                    ProfileVersions = new List<ProfileVersionResponse>
                    {
                        new ProfileVersionResponse
                        {
                            ProfileTitle = A<string>._,
                            ProfileVersionId = Guid.NewGuid(),
                            ScenarioTitle = A<string>._,
                            FullVersion = "1.0",
                            ProfileSections = new List<ProfileSectionResponse>
                            {
                                new ProfileSectionResponse
                                {
                                    AuthorReviewStatus = A<ProfileSectionReviewStatus>._,
                                    NextAuthorReview = A<DateTime?>._,
                                    NextPolicyReview = A<DateTime?>._,
                                    NextTechnicalReview = A<DateTime?>._,
                                    PolicyReviewStatus = A<ProfileSectionReviewStatus>._,
                                    SectionNumber = A<int>._,
                                    TechnicalReviewStatus = A<ProfileSectionReviewStatus>._
                                }
                            }
                        }
                    }
                }
            });

            EmailBusiness().SendReviewEmails();

            A.CallTo(
                () =>
                    emailService.SendEmail(A<IEmail<UserDueReviewEmailResponse>>._, A<UserDueReviewEmailResponse>._,
                        A<IEnumerable<MailAddress>>._, A<MailAddress>._))
                .MustHaveHappened(Repeated.Exactly.Once);
        }

        private Business.EmailBusiness.EmailBusiness EmailBusiness()
        {
            A.CallTo(() => globalSettings.FromEmailAddress).Returns("a@b.c");
            A.CallTo(() => globalSettings.FromEmailDisplayName).Returns("Test sender");

            return new Business.EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);
        }
    }
}
