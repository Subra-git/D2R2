using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using FakeItEasy;
using Profiles.Contracts.DataContracts;
using Profiles.Contracts.ServiceContracts;
using Profiles.EmailService;
using Profiles.Infrastructure;
using Profiles.Infrastructure.Enums;
using Xunit;

namespace Profiles.Business.Tests.Integration
{
    /// <summary>
    /// Integration tests that exercise the review email business logic pipeline
    /// end-to-end without requiring a database connection. Both the data access
    /// layer (IReviewEmailService) and the email sending layer (IEmailService)
    /// are mocked. The test exercises the real EmailBusiness orchestration:
    /// user filtering, email composition delegation, and sender configuration.
    /// </summary>
    public class ReviewEmailIntegrationTests
    {
        [Fact]
        public void ReviewEmailFlow_EligibleUser_ShouldDelegateToEmailServiceWithCorrectArguments()
        {
            // Arrange
            var emailService = A.Fake<IEmailService>();
            var reviewEmailService = A.Fake<IReviewEmailService>();
            var globalSettings = A.Fake<IGlobalSettings>();

            A.CallTo(() => globalSettings.FromEmailAddress).Returns("noreply@apha.gov.uk");
            A.CallTo(() => globalSettings.FromEmailDisplayName).Returns("D2R2 System");

            var userId = Guid.NewGuid();
            var profileVersionId = Guid.NewGuid();

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse>
                {
                    new UserDueReviewEmailResponse
                    {
                        Id = userId,
                        EmailAddress = "reviewer@apha.gov.uk",
                        FullName = "Test Reviewer",
                        UserName = "treviewer",
                        ProfileVersions = new List<ProfileVersionResponse>
                        {
                            new ProfileVersionResponse
                            {
                                ProfileVersionId = profileVersionId,
                                ProfileTitle = "Avian Influenza Surveillance",
                                ScenarioTitle = null,
                                FullVersion = "2.1",
                                ProfileSections = new List<ProfileSectionResponse>
                                {
                                    new ProfileSectionResponse
                                    {
                                        SectionNumber = 1,
                                        SectionName = "Epidemiology",
                                        NextAuthorReview = DateTime.Now.AddDays(-5),
                                        NextTechnicalReview = DateTime.Now.AddDays(7),
                                        NextPolicyReview = DateTime.Now.AddDays(30),
                                        AuthorReviewStatus = ProfileSectionReviewStatus.Active,
                                        TechnicalReviewStatus = ProfileSectionReviewStatus.Proposed,
                                        PolicyReviewStatus = ProfileSectionReviewStatus.Unspecified
                                    },
                                    new ProfileSectionResponse
                                    {
                                        SectionNumber = 2,
                                        SectionName = "Diagnosis",
                                        NextAuthorReview = DateTime.Now.AddDays(3),
                                        NextTechnicalReview = null,
                                        NextPolicyReview = null,
                                        AuthorReviewStatus = ProfileSectionReviewStatus.Active,
                                        TechnicalReviewStatus = ProfileSectionReviewStatus.Unspecified,
                                        PolicyReviewStatus = ProfileSectionReviewStatus.Unspecified
                                    }
                                }
                            }
                        }
                    }
                });

            var emailBusiness = new EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);

            // Act
            emailBusiness.SendReviewEmails();

            // Assert — EmailService.SendEmail was called once for the eligible user
            UserDueReviewEmailResponse capturedData = null;
            IEnumerable<MailAddress> capturedRecipients = null;
            MailAddress capturedSender = null;

            A.CallTo(() => emailService.SendEmail(
                A<IEmail<UserDueReviewEmailResponse>>._,
                A<UserDueReviewEmailResponse>._,
                A<IEnumerable<MailAddress>>._,
                A<MailAddress>._))
                .MustHaveHappened(Repeated.Exactly.Once);

            // Capture arguments via Invokes and re-execute
            A.CallTo(() => emailService.SendEmail(
                A<IEmail<UserDueReviewEmailResponse>>._,
                A<UserDueReviewEmailResponse>._,
                A<IEnumerable<MailAddress>>._,
                A<MailAddress>._))
                .Invokes(call =>
                {
                    capturedData = (UserDueReviewEmailResponse)call.Arguments[1];
                    capturedRecipients = (IEnumerable<MailAddress>)call.Arguments[2];
                    capturedSender = (MailAddress)call.Arguments[3];
                });

            emailBusiness.SendReviewEmails();

            Assert.NotNull(capturedData);
            Assert.Equal("Test Reviewer", capturedData.FullName);
            Assert.Equal("reviewer@apha.gov.uk", capturedData.EmailAddress);
            Assert.Contains("reviewer@apha.gov.uk", capturedRecipients.Select(r => r.Address));
            Assert.Equal("noreply@apha.gov.uk", capturedSender.Address);
            Assert.Equal("D2R2 System", capturedSender.DisplayName);
        }

        [Fact]
        public void ReviewEmailFlow_NoEligibleUsers_ShouldNotSendAnyEmails()
        {
            var emailService = A.Fake<IEmailService>();
            var reviewEmailService = A.Fake<IReviewEmailService>();
            var globalSettings = A.Fake<IGlobalSettings>();

            A.CallTo(() => globalSettings.FromEmailAddress).Returns("noreply@apha.gov.uk");
            A.CallTo(() => globalSettings.FromEmailDisplayName).Returns("D2R2 System");

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse>
                {
                    new UserDueReviewEmailResponse
                    {
                        Id = Guid.NewGuid(),
                        EmailAddress = "user@apha.gov.uk",
                        FullName = "No Sections User",
                        UserName = "nosections",
                        ProfileVersions = new List<ProfileVersionResponse>
                        {
                            new ProfileVersionResponse
                            {
                                ProfileVersionId = Guid.NewGuid(),
                                ProfileTitle = "Empty Profile",
                                FullVersion = "1.0",
                                ProfileSections = new List<ProfileSectionResponse>()
                            }
                        }
                    }
                });

            var emailBusiness = new EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);

            emailBusiness.SendReviewEmails();

            A.CallTo(() => emailService.SendEmail(
                A<IEmail<UserDueReviewEmailResponse>>._,
                A<UserDueReviewEmailResponse>._,
                A<IEnumerable<MailAddress>>._,
                A<MailAddress>._))
                .MustNotHaveHappened();
        }
    }
}
