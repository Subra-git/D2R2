using System;

namespace Profiles.DataModels.Tables
{
    public class ProfileUserRole
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public bool IsContributor { get; set; }
    }
}
