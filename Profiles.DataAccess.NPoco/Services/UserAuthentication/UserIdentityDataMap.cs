using System;
using System.Collections.Generic;
using System.Linq;
using Profiles.Contracts.DataContracts;
using Profiles.DataModels.Tables;
using Profiles.Infrastructure.Mapping;

namespace Profiles.DataAccess.NPoco.Services.UserAuthentication
{
    public class UserIdentityDataMap : IQuadrupleSourceMap<User,
                    IList<ProfileUser>,
                    IList<DataModels.Tables.ProfileUserRole>,
                    IList<ProfileSectionUser>,
                    UserIdentityData>
    {
        public UserIdentityData Map(User source1, IList<ProfileUser> source2, IList<DataModels.Tables.ProfileUserRole> source3, IList<ProfileSectionUser> source4)
        {
            var result = new UserIdentityData();

            if (source1.Id == Guid.Empty)
            {
                result.IsAuthenticated = false;
                return result;
            }

            result.FullName = source1.FullName;
            result.IsAuthenticated = source1.Id != Guid.Empty;
            result.IsPolicyProfileUser = source1.IsPolicyProfileUser;
            result.IsProfileEditor = source1.IsProfileEditor;
            result.IsSsoUser = source1.SsoUserId.HasValue;
            result.IsUserManagementSystem = source1.IsUserManagementSystem;
            result.Organisation = source1.Organisation;
            result.UserId = source1.Id;
            result.UserName = source1.UserName;

            var profilesAsContributor = source2
                .Where(pu => source3
                    .Where(pur => pur.IsContributor)
                    .Select(pur => pur.Id)
                    .Contains(pu.ProfileUserRoleId));

            result.ContributorRoles = profilesAsContributor.Select(pac => new ProfileRoleData
            {
                ProfileId = pac.ProfileId,
                Role = source3.Single(pur => pur.Id == pac.ProfileUserRoleId).Name,
                Sections = source4
                    .Where(sec => sec.ProfileId == pac.ProfileId)
                    .Select(sec => sec.ProfileSectionId)
                    .ToList()
            }).ToList();

            var profilesAsReviewer = source2
                .Where(pu => source3
                    .Where(pur => !pur.IsContributor)
                    .Select(pur => pur.Id)
                    .Contains(pu.ProfileUserRoleId));

            result.ReviewerRoles = profilesAsReviewer.Select(pac => new ProfileRoleData
            {
                ProfileId = pac.ProfileId,
                Role = source3.Single(pur => pur.Id == pac.ProfileUserRoleId).Name,
                Sections = source4
                    .Where(sec => sec.ProfileId == pac.ProfileId)
                    .Select(sec => sec.ProfileSectionId)
                    .ToList()
            }).ToList();

            return result;
        }
    }
}
