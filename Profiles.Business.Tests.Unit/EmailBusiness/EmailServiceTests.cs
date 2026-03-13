using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using FakeItEasy;
using Profiles.Contracts.DataContracts;
using Profiles.EmailService;
using Profiles.Infrastructure.Enums;
using Xunit;

namespace Profiles.Business.Tests.Unit.EmailBusiness
{
    public class EmailServiceTests
    {
        private readonly ISmtpClient smtpClient;
        private readonly EmailService.EmailService sut;

        public EmailServiceTests()
        {
            smtpClient = A.Fake<ISmtpClient>();
            sut = new EmailService.EmailService(smtpClient);
        }

        [Fact]
        public void SendEmail_SingleRecipient_ShouldCallSmtpClientOnce()
        {
            var email = A.Fake<IEmail<string>>();
            A.CallTo(() => email.Subject).Returns("Test Subject");
            A.CallTo(() => email.Priority).Returns(MailPriority.Normal);
            A.CallTo(() => email.GenerateHtmlContent(A<string>._)).Returns("<p>Hello</p>");
            A.CallTo(() => email.GeneratePlainTextContent(A<string>._)).Returns("Hello");
            A.CallTo(() => email.GenerateAttachments(A<string>._)).Returns(Enumerable.Empty<Attachment>());

            var recipients = new List<MailAddress> { new MailAddress("recipient@test.com", "Recipient") };
            var sender = new MailAddress("sender@test.com", "Sender");

            sut.SendEmail(email, "data", recipients, sender);

            A.CallTo(() => smtpClient.Send(A<MailMessage>._)).MustHaveHappened(Repeated.Exactly.Once);
        }

        [Fact]
        public void SendEmail_MultipleRecipients_ShouldCallSmtpClientForEach()
        {
            var email = A.Fake<IEmail<string>>();
            A.CallTo(() => email.Subject).Returns("Test");
            A.CallTo(() => email.Priority).Returns(MailPriority.Normal);
            A.CallTo(() => email.GenerateHtmlContent(A<string>._)).Returns("<p>Hi</p>");
            A.CallTo(() => email.GeneratePlainTextContent(A<string>._)).Returns("Hi");
            A.CallTo(() => email.GenerateAttachments(A<string>._)).Returns(Enumerable.Empty<Attachment>());

            var recipients = new List<MailAddress>
            {
                new MailAddress("r1@test.com"),
                new MailAddress("r2@test.com"),
                new MailAddress("r3@test.com")
            };
            var sender = new MailAddress("sender@test.com");

            sut.SendEmail(email, "data", recipients, sender);

            A.CallTo(() => smtpClient.Send(A<MailMessage>._)).MustHaveHappened(Repeated.Exactly.Times(3));
        }

        [Fact]
        public void SendEmail_ShouldSetSubjectAndPriorityFromEmailObject()
        {
            MailMessage capturedMessage = null;
            A.CallTo(() => smtpClient.Send(A<MailMessage>._))
                .Invokes(call => capturedMessage = (MailMessage)call.Arguments[0]);

            var email = A.Fake<IEmail<string>>();
            A.CallTo(() => email.Subject).Returns("Important Subject");
            A.CallTo(() => email.Priority).Returns(MailPriority.High);
            A.CallTo(() => email.GenerateHtmlContent(A<string>._)).Returns("<p>Urgent</p>");
            A.CallTo(() => email.GeneratePlainTextContent(A<string>._)).Returns("Urgent");
            A.CallTo(() => email.GenerateAttachments(A<string>._)).Returns(Enumerable.Empty<Attachment>());

            var recipients = new List<MailAddress> { new MailAddress("r@test.com") };
            var sender = new MailAddress("s@test.com", "Sender Name");

            sut.SendEmail(email, "data", recipients, sender);

            Assert.NotNull(capturedMessage);
            Assert.Equal("Important Subject", capturedMessage.Subject);
            Assert.Equal(MailPriority.High, capturedMessage.Priority);
            Assert.Equal("s@test.com", capturedMessage.From.Address);
        }

        [Fact]
        public void SendEmail_ShouldAddHtmlAndPlainTextAlternateViews()
        {
            MailMessage capturedMessage = null;
            A.CallTo(() => smtpClient.Send(A<MailMessage>._))
                .Invokes(call => capturedMessage = (MailMessage)call.Arguments[0]);

            var email = A.Fake<IEmail<string>>();
            A.CallTo(() => email.Subject).Returns("Test");
            A.CallTo(() => email.Priority).Returns(MailPriority.Normal);
            A.CallTo(() => email.GenerateHtmlContent(A<string>._)).Returns("<html><body>Test</body></html>");
            A.CallTo(() => email.GeneratePlainTextContent(A<string>._)).Returns("Test plain");
            A.CallTo(() => email.GenerateAttachments(A<string>._)).Returns(Enumerable.Empty<Attachment>());

            sut.SendEmail(email, "data", new List<MailAddress> { new MailAddress("r@t.com") }, new MailAddress("s@t.com"));

            Assert.NotNull(capturedMessage);
            Assert.Equal(2, capturedMessage.AlternateViews.Count);
        }
    }
}
