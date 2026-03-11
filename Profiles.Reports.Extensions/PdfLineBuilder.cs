using TallComponents.PDF.Layout.Paragraphs;

namespace Profiles.Reports.Extensions
{
    public class PdfLineBuilder
    {
        public PdfLineBuilder()
        {
        }

        public XhtmlParagraph GenerateBlankLine()
        {
            return new XhtmlParagraph
            {
                Text = "<font size='1'><br /></font>"
            };
        }

        public HorizontalLine GenerateHorizontalLine()
        {
            return new HorizontalLine
            {
                Width = 700,
                HorizontalAlignment = TallComponents.PDF.Layout.HorizontalAlignment.Center
            };
        }
    }
}
