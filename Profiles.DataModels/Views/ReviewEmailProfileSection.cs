using System;
using Profiles.Infrastructure.Enums;

namespace Profiles.DataModels.Views
{
    public class ReviewEmailProfileSection
    {
        public Guid UserId { get; set; }

        public Guid ProfileVersionId { get; set; }

        public Guid ProfileSectionId { get; set; }

        public string ShortName { get; set; }

        public int SectionNumber { get; set; }

        public ProfileSectionReviewStatus TechnicalReviewStatus { get; set; }

        public ProfileSectionReviewStatus PolicyReviewStatus { get; set; }

        public ProfileSectionReviewStatus AuthorReviewStatus { get; set; }

        public DateTime? NextTechnicalReview { get; set; }

        public DateTime? NextPolicyReview { get; set;}

        public DateTime? NextAuthorReview { get; set; }

        public DateTime? TechnicalReviewCompleted { get; set; }

        public DateTime? PolicyReviewCompleted { get; set; }

        public DateTime AuthorReviewCompleted { get; set; }
    }
}
