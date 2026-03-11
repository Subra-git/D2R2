using System;
using System.Collections.Generic;
using System.Linq;
using Profiles.DataAccess.NPoco.Services.ReviewEmail;
using Profiles.DataModels.Views;
using Xunit;

namespace Profiles.DataAccess.NPoco.Tests.Unit.Services.ReviewEmail
{
    public class ReviewEmailDataMapTests
    {
        [Fact]
        public void EmptyMappingSources_ShouldReturnNoResults()
        {
            var reviewEmailDataMap = new ReviewEmailDataMap();
            var result = reviewEmailDataMap.Map(new List<ReviewEmailUser>(), new List<ReviewEmailProfile>(), new List<ReviewEmailProfileSection>());

            Assert.Empty(result);
        }

        [Fact]
        public void EmptyProfileUser_ButNonEmptyProfileSectionsAndversions_ShouldReturnNoResults()
        {
            var reviewEmailUsers = new List<ReviewEmailUser>();
            var reviewEmailProfiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile()
            };
            var reviewEmailProfileSections = new List<ReviewEmailProfileSection>
            {
                new ReviewEmailProfileSection()
            };

            var reviewEmailDataMap = new ReviewEmailDataMap();
            var result = reviewEmailDataMap.Map(reviewEmailUsers, reviewEmailProfiles, reviewEmailProfileSections);

            Assert.Empty(result);
        }

        [Fact]
        public void ProfileUsersAndProfileSectionsAndProfileVersions_ShouldBeGroupedById()
        {
            var userId = Guid.NewGuid();
            var profileVersion1Id = Guid.NewGuid();
            var profileVersion2Id = Guid.NewGuid();

            var profileVersion1Section1Id = Guid.NewGuid();
            var profileVersion2Section1Id = Guid.NewGuid();
            var profileVersion2Section2Id = Guid.NewGuid();

            var users = new List<ReviewEmailUser>
            {
                new ReviewEmailUser
                {
                    Id = userId
                }
            };
            var profiles = new List<ReviewEmailProfile>
            {
                new ReviewEmailProfile
                {
                    UserId = userId,
                    ProfileVersionId = profileVersion1Id
                },
                new ReviewEmailProfile
                {
                    UserId = userId,
                    ProfileVersionId = profileVersion2Id
                }
            };
            var profileSections = new List<ReviewEmailProfileSection>
            {
                new ReviewEmailProfileSection
                {
                    UserId = userId,
                    ProfileVersionId = profileVersion1Id,
                    ProfileSectionId = profileVersion1Section1Id
                },
                new ReviewEmailProfileSection
                {
                    UserId = userId,
                    ProfileVersionId = profileVersion2Id,
                    ProfileSectionId = profileVersion2Section1Id
                },
                new ReviewEmailProfileSection
                {
                    UserId = userId,
                    ProfileVersionId = profileVersion2Id,
                    ProfileSectionId = profileVersion2Section2Id
                }
            };

            var reviewEmailDataMap = new ReviewEmailDataMap();
            var result = reviewEmailDataMap.Map(users, profiles, profileSections);

            Assert.Equal(1, result.Count());

            var userProfiles = result.Single();
            Assert.Equal(2, userProfiles.ProfileVersions.Count());

            var profile1 = userProfiles.ProfileVersions[0];
            var profile2 = userProfiles.ProfileVersions[1];

            Assert.Equal(1, profile1.ProfileSections.Count);
            Assert.Equal(2, profile2.ProfileSections.Count);
        }
    }
}
