using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Profiles.Contracts.DataContracts;
using Profiles.DataModels.Views;
using Profiles.Infrastructure.Mapping;

namespace Profiles.DataAccess.NPoco.Services.ReviewEmail
{
    public class ReviewEmailDataMap :
        ITripleSourceMap
            <IEnumerable<ReviewEmailUser>, IEnumerable<ReviewEmailProfile>, IEnumerable<ReviewEmailProfileSection>,
                IEnumerable<UserDueReviewEmailResponse>>
    {
        public IEnumerable<UserDueReviewEmailResponse> Map(IEnumerable<ReviewEmailUser> source1,
            IEnumerable<ReviewEmailProfile> source2, IEnumerable<ReviewEmailProfileSection> source3)
        {
            var response = new UserDueReviewEmailResponse();
            
            foreach (var user in source1)
            {
                var emailData = new UserDueReviewEmailResponse
                {
                    FullName = user.FullName,
                    EmailAddress = user.EmailAddress,
                    Id = user.Id,
                    UserName = user.UserName,
                    ProfileVersions = new List<ProfileVersionResponse>()
                };

                foreach (var profileVersion in source2
                    .Where(pv => pv.UserId == user.Id))
                {
                    var profileVersionData = new ProfileVersionResponse
                    {
                        FullVersion = string.Format("{0}.{1}", profileVersion.VersionMajor, profileVersion.VersionMinor),
                        ProfileTitle = profileVersion.ProfileTitle,
                        ScenarioTitle = profileVersion.ScenarioTitle,
                        ProfileVersionId = profileVersion.ProfileVersionId,
                        ProfileSections = new List<ProfileSectionResponse>()
                    };

                    foreach (var profileSection in source3
                        .Where(ps => ps.UserId == user.Id && ps.ProfileVersionId == profileVersion.ProfileVersionId))
                    {
                        var profileSectionData = new ProfileSectionResponse
                        {
                            SectionName = profileSection.ShortName,
                            SectionNumber = profileSection.SectionNumber,
                            NextAuthorReview = profileSection.NextAuthorReview,
                            NextTechnicalReview = profileSection.NextTechnicalReview,
                            NextPolicyReview = profileSection.NextPolicyReview,
                            AuthorReviewStatus = profileSection.AuthorReviewStatus,
                            TechnicalReviewStatus = profileSection.TechnicalReviewStatus,
                            PolicyReviewStatus = profileSection.PolicyReviewStatus
                        };

                        profileVersionData.ProfileSections.Add(profileSectionData);
                    }

                    emailData.ProfileVersions.Add(profileVersionData);
                }

                yield return emailData;
            }
        }
    }
}
