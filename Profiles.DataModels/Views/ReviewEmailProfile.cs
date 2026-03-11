using System;

namespace Profiles.DataModels.Views
{
    public class ReviewEmailProfile
    {
        public Guid UserId { get; set; }

        public Guid ProfileVersionId { get; set; }

        public string ProfileTitle { get; set; }

        public string ScenarioTitle { get; set; }

        public byte VersionMinor { get; set; }

        public byte VersionMajor { get; set; }
    }
}
