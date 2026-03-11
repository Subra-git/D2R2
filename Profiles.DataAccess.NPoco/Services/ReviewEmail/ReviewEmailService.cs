using System.Collections.Generic;
using System.Linq;
using Profiles.Contracts.DataContracts;
using Profiles.Contracts.ServiceContracts;
using Profiles.DataModels.Views;
using Profiles.Infrastructure.Mapping;

namespace Profiles.DataAccess.NPoco.Services.ReviewEmail
{
    public class ReviewEmailService : IReviewEmailService
    {
        private readonly IDatabaseInitializer dbInit;

        public ReviewEmailService(IDatabaseInitializer dbInit)
        {
            this.dbInit = dbInit;
        }

        public IEnumerable<UserDueReviewEmailResponse> UsersDueReviewEmail(UsersDueReviewEmailRequest request)
        {
            var database = dbInit.Instance;

            var users = database.Fetch<ReviewEmailUser>("SELECT * FROM [dbo].[vwReviewEmailUsers]");

            var profileVersions =
                database.Fetch<ReviewEmailProfile>("SELECT * FROM [dbo].[vwReviewEmailProfiles]");

            var profileSections =
                database.Fetch<ReviewEmailProfileSection>("SELECT * FROM [dbo].[vwReviewEmailProfileSections]")
                .OrderBy(s => s.SectionNumber);

            return ExplicitlyMap
                .TheseTypes
                    <IEnumerable<ReviewEmailUser>,
                    IEnumerable<ReviewEmailProfile>,
                    IEnumerable<ReviewEmailProfileSection>,
                    IEnumerable<UserDueReviewEmailResponse>>()
                .Using<ReviewEmailDataMap>()
                .Map(users, profileVersions, profileSections);
        }
    }
}
