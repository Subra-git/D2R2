using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Profiles.DataModels.Tables
{
    public class ProfileSectionUser
    {
        public Guid UserId { get; set; }

        public Guid ProfileId { get; set; }

        public Guid ProfileSectionId { get; set; }

        public bool ReviewEmail { get; set; }
    }
}
