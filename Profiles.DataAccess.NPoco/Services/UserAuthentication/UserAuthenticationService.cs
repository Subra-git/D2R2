using System;
using System.Collections.Generic;
using Profiles.Contracts.DataContracts;
using Profiles.Contracts.ServiceContracts;
using Profiles.DataModels.Tables;
using Profiles.Infrastructure.Mapping;

namespace Profiles.DataAccess.NPoco.Services.UserAuthentication
{
    public class UserAuthenticationService : IUserAuthenticationService
    {
        private IDatabaseInitializer databaseInitializer;

        public UserAuthenticationService(IDatabaseInitializer databaseInitializer)
        {
            this.databaseInitializer = databaseInitializer;   
        }

        public UserIdentityData GetUserIdentity(GetUserIdentityRequest request)
        {
            var user = new User();
            IList<ProfileUser> profileUsers;
            IList<DataModels.Tables.ProfileUserRole> profileUserRoles;
            IList<ProfileSectionUser> profileSectionUsers;

            using (var database = databaseInitializer.Instance)
            {
                profileUserRoles = database.Fetch<DataModels.Tables.ProfileUserRole>("SELECT * FROM [dbo].[luProfileUserRole]");

                if (request.AuthenticationType == AuthenticationType.Windows)
                {
                    user = database.Single<User>("SELECT * FROM [dbo].[User] WHERE UserName = @0", request.UserId);
                }
                else
                {
                    user = database.Single<User>("SELECT * FROM [dbo].[User] WHERE SsoUserId = @0", request.UserId);
                }

                profileUsers = database.Fetch<ProfileUser>("SELECT * FROM [dbo].[ProfileUser] WHERE UserId = @0", user.Id);
                profileSectionUsers = database.Fetch<ProfileSectionUser>("SELECT * FROM [dbo].[ProfileSectionUser] WHERE UserId = @0", user.Id);
            }

            return ExplicitlyMap.TheseTypes<User, IList<ProfileUser>, IList<DataModels.Tables.ProfileUserRole>, IList<ProfileSectionUser>, UserIdentityData>()
                        .Using<UserIdentityDataMap>()
                        .Map(user, profileUsers, profileUserRoles, profileSectionUsers);
        }

        public void Logout()
        {
            throw new InvalidOperationException("You cannot log out using the NPoco SQL version of the data layer.");
        }
    }
}
