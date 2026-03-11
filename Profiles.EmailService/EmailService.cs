using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace Profiles.EmailService
{
    public class EmailService : IEmailService
    {
        private readonly ISmtpClient smtpClient;

        public EmailService(ISmtpClient smtpClient)
        {
            this.smtpClient = smtpClient;
        }

        public void SendEmail<TData>(IEmail<TData> email, TData data, IEnumerable<MailAddress> toRecipients, MailAddress sender)
        {
            foreach (var recipient in toRecipients)
            {
                var message = new MailMessage
                {
                    Sender = sender,
                    From = sender,
                    IsBodyHtml = true,
                    Subject = email.Subject,
                    Priority = email.Priority,
                };

                var htmlContent = email.GenerateHtmlContent(data);
                var plainTextContent = email.GeneratePlainTextContent(data);

                message.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(htmlContent, Encoding.UTF8,
                    MediaTypeNames.Text.Html));

                message.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(plainTextContent, Encoding.UTF8,
                    MediaTypeNames.Text.Plain));

                var attachments = email.GenerateAttachments(data);
                if (attachments != null && attachments.Any())
                {
                    foreach (var attachment in attachments)
                    {
                        message.Attachments.Add(attachment);
                    }
                }

                message.To.Add(recipient);

                smtpClient.Send(message);
            }
        }
    }
}
