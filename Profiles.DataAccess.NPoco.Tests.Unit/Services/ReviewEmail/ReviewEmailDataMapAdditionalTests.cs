using System;
using System.Collections.Generic;
using System.Linq;
using Profiles.DataAccess.NPoco.Services.ReviewEmail;
using Profiles.DataModels.Views;
using Profiles.Infrastructure.Enums;
using Xunit;

namespace Profiles.DataAccess.NPoco.Tests.Unit.Services.ReviewEmail
{
    public class ReviewEmailDataMapAdditionalTests
    {
        [Fact]
        public void MultipleUsers_ShouldMapIndependently()
        {
            var user1Id = Guid.NewGuid();
            var user2Id = Guid.NewGuid();
            var pv1Id = Guid.NewGuid();
            var pv2Id = Guid.NewGuid();

            var users = new List<ReviewEmailUser>
            {
                new ReviewEmailUser { Id = user1Id, FullName = "User One", EmailAddress = "u1@t.com", UserName = "u1" },
                new ReviewEmailUser { Id = user2Id, FullName = "User Two", EmailAddress = "u2@t.com", UserName = "u2" }
            };

            var profiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile { UserId = user1Id, ProfileVersionId = pv1Id, ProfileTitle = "Profile A", VersionMajor = 1, VersionMinor = 0 },
                new ReviewEmailProfile { UserId = user2Id, ProfileVersionId = pv2Id, ProfileTitle = "Profile B", VersionMajor = 2, VersionMinor = 1 }
            };

            var sections = new List<ReviewEmailProfileSection>
            {
                new ReviewEmailProfileSection { UserId = user1Id, ProfileVersionId = pv1Id, ProfileSectionId = Guid.NewGuid(), SectionNumber = 1, ShortName = "S1" },
                new ReviewEmailProfileSection { UserId = user2Id, ProfileVersionId = pv2Id, ProfileSectionId = Guid.NewGuid(), SectionNumber = 1, ShortName = "S1-B" },
                new ReviewEmailProfileSection { UserId = user2Id, ProfileVersionId = pv2Id, ProfileSectionId = Guid.NewGuid(), SectionNumber = 2, ShortName = "S2-B" }
            };

            var result = new ReviewEmailDataMap().Map(users, profiles, sections).ToList();

            Assert.Equal(2, result.Count);

            var user1Data = result.Single(u => u.Id == user1Id);
            Assert.Equal(1, user1Data.ProfileVersions.Count);
            Assert.Equal(1, user1Data.ProfileVersions[0].ProfileSections.Count);

            var user2Data = result.Single(u => u.Id == user2Id);
            Assert.Equal(1, user2Data.ProfileVersions.Count);
            Assert.Equal(2, user2Data.ProfileVersions[0].ProfileSections.Count);
        }

        [Fact]
        public void UserWithNoMatchingProfiles_ShouldHaveEmptyProfileVersions()
        {
            var userId = Guid.NewGuid();
            var otherId = Guid.NewGuid();

            var users = new List<ReviewEmailUser>
            {
                new ReviewEmailUser { Id = userId, FullName = "Orphan User", EmailAddress = "orphan@t.com", UserName = "orphan" }
            };

            var profiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile { UserId = otherId, ProfileVersionId = Guid.NewGuid(), ProfileTitle = "Other Profile" }
            };

            var sections = new List<ReviewEmailProfileSection>();

            var result = new ReviewEmailDataMap().Map(users, profiles, sections).ToList();

            Assert.Equal(1, result.Count);
            Assert.Equal(0, result[0].ProfileVersions.Count);
        }

        [Fact]
        public void VersionFormat_ShouldCombineMajorAndMinor()
        {
            var userId = Guid.NewGuid();
            var pvId = Guid.NewGuid();

            var users = new List<ReviewEmailUser>
            {
                new ReviewEmailUser { Id = userId }
            };

            var profiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile { UserId = userId, ProfileVersionId = pvId, VersionMajor = 3, VersionMinor = 7 }
            };

            var sections = new List<ReviewEmailProfileSection>();

            var result = new ReviewEmailDataMap().Map(users, profiles, sections).ToList();

            Assert.Equal("3.7", result[0].ProfileVersions[0].FullVersion);
        }

        [Fact]
        public void SectionProperties_ShouldMapAllFields()
        {
            var userId = Guid.NewGuid();
            var pvId = Guid.NewGuid();
            var sectionId = Guid.NewGuid();
            var authorReviewDate = new DateTime(2026, 6, 15);
            var techReviewDate = new DateTime(2026, 7, 20);
            var policyReviewDate = new DateTime(2026, 8, 25);

            var users = new List<ReviewEmailUser> { new ReviewEmailUser { Id = userId } };
            var profiles = new List<ReviewEmailProfile> { new ReviewEmailProfile { UserId = userId, ProfileVersionId = pvId } };
            var sections = new List<ReviewEmailProfileSection>
            {
                new ReviewEmailProfileSection
                {
                    UserId = userId,
                    ProfileVersionId = pvId,
                    ProfileSectionId = sectionId,
                    SectionNumber = 5,
                    ShortName = "Epidemiology",
                    NextAuthorReview = authorReviewDate,
                    NextTechnicalReview = techReviewDate,
                    NextPolicyReview = policyReviewDate,
                    AuthorReviewStatus = ProfileSectionReviewStatus.Active,
                    TechnicalReviewStatus = ProfileSectionReviewStatus.Complete,
                    PolicyReviewStatus = ProfileSectionReviewStatus.Proposed
                }
            };

            var result = new ReviewEmailDataMap().Map(users, profiles, sections).ToList();

            var section = result[0].ProfileVersions[0].ProfileSections[0];
            Assert.Equal(5, section.SectionNumber);
            Assert.Equal("Epidemiology", section.SectionName);
            Assert.Equal(ProfileSectionReviewStatus.Active, section.AuthorReviewStatus);
            Assert.Equal(ProfileSectionReviewStatus.Complete, section.TechnicalReviewStatus);
            Assert.Equal(ProfileSectionReviewStatus.Proposed, section.PolicyReviewStatus);
            Assert.True(section.NextAuthorReview.HasValue, "NextAuthorReview should have value");
            Assert.True(section.NextTechnicalReview.HasValue, "NextTechnicalReview should have value");
            Assert.True(section.NextPolicyReview.HasValue, "NextPolicyReview should have value");
        }

        [Fact]
        public void ScenarioTitle_ShouldBeMapped()
        {
            var userId = Guid.NewGuid();
            var pvId = Guid.NewGuid();

            var users = new List<ReviewEmailUser> { new ReviewEmailUser { Id = userId } };
            var profiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile { UserId = userId, ProfileVersionId = pvId, ProfileTitle = "Avian Influenza", ScenarioTitle = "What-If Scenario" }
            };
            var sections = new List<ReviewEmailProfileSection>();

            var result = new ReviewEmailDataMap().Map(users, profiles, sections).ToList();

            Assert.Equal("Avian Influenza", result[0].ProfileVersions[0].ProfileTitle);
            Assert.Equal("What-If Scenario", result[0].ProfileVersions[0].ScenarioTitle);
        }
    }
}
