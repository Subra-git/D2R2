using System.Collections.Generic;
using System.Net.Mail;

namespace Profiles.EmailService
{
    public interface IEmailService
    {
        void SendEmail<TData>(IEmail<TData> email, TData data, IEnumerable<MailAddress> toRecipients, MailAddress sender);
    }
}
