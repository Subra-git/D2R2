using System.Collections.Generic;
using Profiles.Contracts.DataContracts;

namespace Profiles.Business.EmailBusiness
{
    public interface IEmailBusiness
    {
        void SendReviewEmails();

        List<UserDueReviewEmailResponse> GetUsersDueReviewEmail();
    }
}
