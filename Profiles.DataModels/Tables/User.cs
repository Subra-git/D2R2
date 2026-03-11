using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Profiles.DataModels.Tables
{
    public class User
    {
        public Guid Id { get; set; }

        public string UserName { get; set; }

        public string FullName { get; set; }

        public string Organisation { get; set; }

        public bool IsProfileEditor { get; set; }

        public bool IsPolicyProfileUser { get; set; }

        public Guid? SsoUserId { get; set; }

        public bool IsUserManagementSystem { get; set; }

        public string EmailAddress { get; set; }
    }
}
