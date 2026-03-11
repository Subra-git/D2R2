using System;

namespace Profiles.DataModels.Tables
{
    public class ProfileUser
    {
        public Guid UserId { get; set; }

        public Guid ProfileId { get; set; }

        public Guid ProfileUserRoleId { get; set; }
    }
}
