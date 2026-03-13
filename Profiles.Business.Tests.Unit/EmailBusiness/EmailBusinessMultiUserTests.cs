using System;
using System.Collections.Generic;
using System.Net.Mail;
using FakeItEasy;
using Profiles.Contracts.DataContracts;
using Profiles.Contracts.ServiceContracts;
using Profiles.EmailService;
using Profiles.Infrastructure;
using Profiles.Infrastructure.Enums;
using Xunit;

namespace Profiles.Business.Tests.Unit.EmailBusiness
{
    public class EmailBusinessMultiUserTests
    {
        private readonly IEmailService emailService;
        private readonly IReviewEmailService reviewEmailService;
        private readonly IGlobalSettings globalSettings;

        public EmailBusinessMultiUserTests()
        {
            emailService = A.Fake<IEmailService>();
            reviewEmailService = A.Fake<IReviewEmailService>();
            globalSettings = A.Fake<IGlobalSettings>();

            A.CallTo(() => globalSettings.FromEmailAddress).Returns("test@example.com");
            A.CallTo(() => globalSettings.FromEmailDisplayName).Returns("Test Sender");
        }

        [Fact]
        public void SendReviewEmails_MultipleUsers_OnlyUsersWithSectionsShouldReceiveEmail()
        {
            var userWithSections = new UserDueReviewEmailResponse
            {
                EmailAddress = "has-sections@test.com",
                FullName = "User With Sections",
                Id = Guid.NewGuid(),
                UserName = "user1",
                ProfileVersions = new List<ProfileVersionResponse>
                {
                    new ProfileVersionResponse
                    {
                        ProfileTitle = "Profile A",
                        ProfileVersionId = Guid.NewGuid(),
                        FullVersion = "1.0",
                        ProfileSections = new List<ProfileSectionResponse>
                        {
                            new ProfileSectionResponse
                            {
                                SectionNumber = 1,
                                SectionName = "Section 1",
                                AuthorReviewStatus = ProfileSectionReviewStatus.Active,
                                TechnicalReviewStatus = ProfileSectionReviewStatus.Active,
                                PolicyReviewStatus = ProfileSectionReviewStatus.Active
                            }
                        }
                    }
                }
            };

            var userWithoutSections = new UserDueReviewEmailResponse
            {
                EmailAddress = "no-sections@test.com",
                FullName = "User Without Sections",
                Id = Guid.NewGuid(),
                UserName = "user2",
                ProfileVersions = new List<ProfileVersionResponse>
                {
                    new ProfileVersionResponse
                    {
                        ProfileTitle = "Profile B",
                        ProfileVersionId = Guid.NewGuid(),
                        FullVersion = "2.0",
                        ProfileSections = new List<ProfileSectionResponse>()
                    }
                }
            };

            var userWithEmptyProfiles = new UserDueReviewEmailResponse
            {
                EmailAddress = "empty@test.com",
                FullName = "User Empty",
                Id = Guid.NewGuid(),
                UserName = "user3",
                ProfileVersions = new List<ProfileVersionResponse>()
            };

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse> { userWithSections, userWithoutSections, userWithEmptyProfiles });

            var sut = new Business.EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);
            sut.SendReviewEmails();

            A.CallTo(() => emailService.SendEmail(
                A<IEmail<UserDueReviewEmailResponse>>._,
                A<UserDueReviewEmailResponse>._,
                A<IEnumerable<MailAddress>>._,
                A<MailAddress>._))
                .MustHaveHappened(Repeated.Exactly.Once);
        }

        [Fact]
        public void SendReviewEmails_TwoUsersWithSections_ShouldSendTwoEmails()
        {
            var user1 = new UserDueReviewEmailResponse
            {
                EmailAddress = "user1@test.com",
                FullName = "User One",
                Id = Guid.NewGuid(),
                UserName = "user1",
                ProfileVersions = new List<ProfileVersionResponse>
                {
                    new ProfileVersionResponse
                    {
                        ProfileTitle = "Profile A",
                        ProfileVersionId = Guid.NewGuid(),
                        FullVersion = "1.0",
                        ProfileSections = new List<ProfileSectionResponse>
                        {
                            new ProfileSectionResponse { SectionNumber = 1, SectionName = "S1" }
                        }
                    }
                }
            };

            var user2 = new UserDueReviewEmailResponse
            {
                EmailAddress = "user2@test.com",
                FullName = "User Two",
                Id = Guid.NewGuid(),
                UserName = "user2",
                ProfileVersions = new List<ProfileVersionResponse>
                {
                    new ProfileVersionResponse
                    {
                        ProfileTitle = "Profile B",
                        ProfileVersionId = Guid.NewGuid(),
                        FullVersion = "2.0",
                        ProfileSections = new List<ProfileSectionResponse>
                        {
                            new ProfileSectionResponse { SectionNumber = 1, SectionName = "S1" }
                        }
                    }
                }
            };

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(new List<UserDueReviewEmailResponse> { user1, user2 });

            var sut = new Business.EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);
            sut.SendReviewEmails();

            A.CallTo(() => emailService.SendEmail(
                A<IEmail<UserDueReviewEmailResponse>>._,
                A<UserDueReviewEmailResponse>._,
                A<IEnumerable<MailAddress>>._,
                A<MailAddress>._))
                .MustHaveHappened(Repeated.Exactly.Twice);
        }

        [Fact]
        public void GetUsersDueReviewEmail_ShouldReturnResultFromReviewEmailService()
        {
            var expected = new List<UserDueReviewEmailResponse>
            {
                new UserDueReviewEmailResponse { Id = Guid.NewGuid(), FullName = "Test" }
            };

            A.CallTo(() => reviewEmailService.UsersDueReviewEmail(A<UsersDueReviewEmailRequest>._))
                .Returns(expected);

            var sut = new Business.EmailBusiness.EmailBusiness(emailService, reviewEmailService, globalSettings);
            var result = sut.GetUsersDueReviewEmail();

            Assert.Equal(1, result.Count);
            Assert.Equal("Test", result[0].FullName);
        }
    }
}
