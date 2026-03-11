using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using Profiles.Business.EmailBusiness.Review.Email;
using Profiles.EmailService;
using Profiles.Contracts.ServiceContracts;
using Profiles.Contracts.DataContracts;
using Profiles.Infrastructure;

namespace Profiles.Business.EmailBusiness
{
    public class EmailBusiness : IEmailBusiness
    {
        private readonly IEmailService emailService;
        private readonly IReviewEmailService reviewEmailService;
        private readonly IGlobalSettings globalSettings;

        public EmailBusiness(IEmailService emailService, IReviewEmailService reviewEmailService, IGlobalSettings globalSettings)
        {
            this.emailService = emailService;
            this.reviewEmailService = reviewEmailService;
            this.globalSettings = globalSettings;
        }

        public void SendReviewEmails()
        {
            var usersDueReviewEmail = this.GetUsersDueReviewEmail();

            foreach (var userDueReviewEmail in usersDueReviewEmail
                .Where(u => u.ProfileVersions.Any(pv => pv.ProfileSections.Any())))
            {

                emailService.SendEmail(
                new ReviewEmail(),
                userDueReviewEmail,
                new List<MailAddress> { new MailAddress(userDueReviewEmail.EmailAddress, userDueReviewEmail.FullName) },
                new MailAddress(globalSettings.FromEmailAddress, globalSettings.FromEmailDisplayName));
            }
        }

        public List<UserDueReviewEmailResponse> GetUsersDueReviewEmail()
        {
            return reviewEmailService.UsersDueReviewEmail(new UsersDueReviewEmailRequest()).ToList();
        }
    }
}
    