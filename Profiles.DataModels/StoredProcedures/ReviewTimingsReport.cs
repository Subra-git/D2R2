using System;

namespace Profiles.DataModels.StoredProcedures
{
    public class ReviewTimingsReport
    {
        public Guid ProfileVersionId { get; set; }

        public string Title { get; set; }

        public int VersionMajor { get; set; }

        public int VersionMinor { get; set; }

        public int SectionNumber { get; set; }

        public DateTime? NextPolicyReview { get; set; }

        public DateTime? NextAuthorReview { get; set; }

        public DateTime? NextTechnicalReview { get; set; }

        public string SectionName { get; set; }
    }
}
