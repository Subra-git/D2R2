using System;
using System.Collections.Generic;
using System.Net.Mail;
using Profiles.EmailService;
using Profiles.Infrastructure.Enums;
using Profiles.Contracts.DataContracts;
using ProfilesLibrary;
using System.IO;

namespace Profiles.Business.EmailBusiness.Review.Email
{
    public class ReviewEmail : IEmail<UserDueReviewEmailResponse>
    {
        public string Subject
        {
            get { return "D2R2 - Profile review request"; }
        }

        public MailPriority Priority
        {
            get { return MailPriority.Normal; }
        }

        public string GeneratePlainTextContent(UserDueReviewEmailResponse data)
        {
            return string.Empty;
        }

        public string GenerateHtmlContent(UserDueReviewEmailResponse data)
        {
            // Header
            var contentMeta = new HtmlTagHelper("meta");
            contentMeta.AddAttribute("content", "utf-8");
            contentMeta.AddAttribute("http-equiv", "encoding");

            var encodingMeta = new HtmlTagHelper("meta");
            encodingMeta.AddAttribute("content", "utf-8");
            encodingMeta.AddAttribute("http-equiv", "encoding");

            var title = new HtmlTagHelper("title");
            title.AppendInnerContent(Subject);

            var header = new HtmlTagHelper("head", contentMeta, encodingMeta, title);

            // Body
            var body = new HtmlTagHelper("body");

            var dear = new HtmlTagHelper("p");
            dear.AppendInnerContent("Dear " + data.FullName + ",");

            body.AppendInnerContent(dear);

            var firstParagraph = new HtmlTagHelper("p");
            firstParagraph.AppendInnerContent("Please find the list of approaching, overdue and completed author, VA and policy reviews below. ");
            firstParagraph.AppendInnerContent(
                "After completing an author, VA or policy review please update the relevant review status for the profile section in the system. ");
            firstParagraph.AppendInnerContent(
                "This can be achieved by locating the profile on the search page, clicking the browse link and then selecting the revision dates tab. ");
            firstParagraph.AppendInnerContent("Set the status to complete by using the drop down list. ");

            body.AppendInnerContent(firstParagraph);

            foreach (var profileVersion in data.ProfileVersions)
            {
                var profileTitle = new HtmlTagHelper("u");

                if (string.IsNullOrEmpty(profileVersion.ScenarioTitle))
                {
                    profileTitle.AppendInnerContent(string.Format("{0} - v {1} (Draft)", profileVersion.ProfileTitle,
                        profileVersion.FullVersion));
                }
                else
                {
                    profileTitle.AppendInnerContent(string.Format("{0} ({1}) - v {2} (Draft)", profileVersion.ProfileTitle,
                        profileVersion.ScenarioTitle, profileVersion.FullVersion));
                }

                body.AppendInnerContent(new HtmlTagHelper("p", new HtmlTagHelper("strong", profileTitle)));
                body.AppendInnerContent(new HtmlTagHelper("br"));

                var table = new HtmlTagHelper("table");
                table.AddAttribute("border", "1");
                table.AddAttribute("cellpadding", "0");
                table.AddAttribute("cellspacing", "0");

                var tableHeaders = new HtmlTagHelper("tr",
                    TableCell(string.Empty),
                    TableCell("Section name", true, 1, "center"),
                    TableCell("VA review", true, 2, "center"),
                    TableCell("Policy review", true, 2, "center"),
                    TableCell("Author review", true, 2, "center"));

                table.AppendInnerContent(tableHeaders);

                foreach (var section in profileVersion.ProfileSections)
                {
                    var sectionNumber = TableCell(section.SectionNumber.ToString());
                    var sectionName = TableCell(section.SectionName);

                    var vaReviewDate = ReviewDateCell(section.NextAuthorReview);
                    var vaReviewStatus = ReviewStatusCell(section.NextAuthorReview, section.AuthorReviewStatus);

                    var technicalReviewDate = ReviewDateCell(section.NextTechnicalReview);
                    var technicalReviewStatus = ReviewStatusCell(section.NextTechnicalReview, section.TechnicalReviewStatus);

                    var policyReviewDate = ReviewDateCell(section.NextPolicyReview);
                    var policyReviewStatus = ReviewStatusCell(section.NextPolicyReview, section.PolicyReviewStatus);

                    table.AppendInnerContent(new HtmlTagHelper("tr",
                        sectionNumber,
                        sectionName,
                        vaReviewDate,
                        vaReviewStatus,
                        technicalReviewDate,
                        technicalReviewStatus,
                        policyReviewDate,
                        policyReviewStatus));
                }

                body.AppendInnerContent(table);
                body.AppendInnerContent(new HtmlTagHelper("br"));
            }

            body.AppendInnerContent(new HtmlTagHelper("br"));
            body.AppendInnerContent(new HtmlTagHelper("br"));
            body.AppendInnerContent(
                "Internal users can access the D2R2 system using the following link: " + GlobalSettings.InternalHomePageUrlForReports);
            body.AppendInnerContent(new HtmlTagHelper("br"));
            body.AppendInnerContent(new HtmlTagHelper("br"));
            body.AppendInnerContent(
                "If you have a problem accessing the D2R2 application (or aren't sure why you've received this email) please contact us by emailing the D2R2 mail box: D2R2@defra.gov.uk");
            body.AppendInnerContent(new HtmlTagHelper("br"));
            body.AppendInnerContent(new HtmlTagHelper("br"));

            return new HtmlTagHelper("html", header, body).ToString();
        }

        public IEnumerable<Attachment> GenerateAttachments(UserDueReviewEmailResponse data)
        {
            foreach (var profileVersion in data.ProfileVersions)
            {
                var profileInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersion.ProfileVersionId);
                var profile = Profile.GetProfile(profileInfo.ProfileId);

                if (profile.HasCurrentPublishedVersion)
                {
                    var publishedProfileVersionId = profile.CurrentPublishedVersion.Id;

                    if (publishedProfileVersionId != null)
                    {
                        var pdfData = GetProfileVersionComparisonReportCommand.GetProfileVersionComparisonReport(publishedProfileVersionId, profileVersion.ProfileVersionId);
                        var attachmentName = string.Format("{0} {1} - {2} {3} Comparison.pdf", profile.CurrentPublishedVersion.Title, profile.CurrentPublishedVersion.Version, profile.Title, profileInfo.Version);
                        yield return new Attachment(new MemoryStream(pdfData), attachmentName, "application/pdf");
                    }
                }
            }
        }

        private HtmlTagHelper ReviewStatusCell(DateTime? reviewDate, ProfileSectionReviewStatus status)
        {
            if (reviewDate.HasValue && reviewDate.Value.Date < DateTime.Now.AddDays(14))
            {
                switch (status)
                {
                    case ProfileSectionReviewStatus.Complete:
                        return TableCell(" (Completed) ", true, colorHex: "#009900");
                    case ProfileSectionReviewStatus.Active:
                    case ProfileSectionReviewStatus.Proposed:
                        return reviewDate < DateTime.Now.Date
                            ? TableCell(" (Overdue) ", true, colorHex: "#FF0000")
                            : TableCell(" (Due soon) ", true, colorHex: "#FF6103");
                    case ProfileSectionReviewStatus.Unspecified:
                    default:
                        return TableCell();
                }
            }

            return TableCell();
        }

        private HtmlTagHelper ReviewDateCell(DateTime? reviewDate)
        {
            return reviewDate.HasValue && reviewDate.Value.Date < DateTime.Now.AddDays(14)
                ? TableCell(reviewDate.Value.ToString("dd/MM/yyyy"))
                : TableCell();
        }

        private HtmlTagHelper TableCell(string text = "", bool isBold = false, int colSpan = 1, string align ="left", string colorHex = "#000000")
        {
            var cell = new HtmlTagHelper("td");
            cell.AddAttribute("align", align);
            cell.AddAttribute("colspan", colSpan.ToString());

            var content = new HtmlTagHelper("font");
            content.AddAttribute("face", "verdana");
            content.AddAttribute("size", "2");
            content.AddAttribute("color", colorHex);
            content.AppendInnerContent(text);

            cell.AppendInnerContent(isBold
                ? new HtmlTagHelper("strong", content)
                : content);

            return cell;
        }
    }
}
