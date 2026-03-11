using System.Net.Mail;

namespace Profiles.EmailService
{
    public interface ISmtpClient
    {
        void Send(MailMessage message);
    }
}
