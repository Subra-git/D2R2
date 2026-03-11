using System.Collections.Generic;
using System.Net.Mail;

namespace Profiles.EmailService
{
    public interface IEmail<in TData>
    {
        string Subject { get; }

        MailPriority Priority { get; }

        string GeneratePlainTextContent(TData data);

        string GenerateHtmlContent(TData data);

        IEnumerable<Attachment> GenerateAttachments(TData data);
    }
}
