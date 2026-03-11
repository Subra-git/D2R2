using Profiles.Reports.Extensions.Formatting.Paragraph;
using TallComponents.PDF.Layout.Paragraphs;
using ProfilesLibrary;

namespace Profiles.Reports.Extensions
{
    public class PdfParagraphBuilder 
    {
        private readonly ParagraphFormatting formatting;
        private readonly string text;

        public PdfParagraphBuilder(ParagraphFormatting formatting, string text)
        {
            this.formatting = formatting;
            this.text = text;
        }

        public Paragraph Generate()
        {
            var fontWeight = this.formatting.TextFormat == TextFormat.Bold ? "bold" : "normal";

            return new XhtmlParagraph
            {
                Text = $@"<span 
                            style='font-family:Arial,Helvetica; 
                            font-size: {this.formatting.FontSize}px; 
                            font-weight: {fontWeight}'>
                                {this.text.StripPTags().SanitizeHtml()}
                          </span>"
            };
        }
    }
}
