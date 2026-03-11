namespace Profiles.Reports.Extensions.Formatting.Paragraph
{
    public class ParagraphFormatting
    {
        public TextFormat TextFormat { get; private set; }
        
        public int FontSize { get; private set; }

        public ParagraphFormatting(TextFormat textFormat = TextFormat.PlainText, int fontSize = 9)
        {
            TextFormat = textFormat;
            FontSize = fontSize;
        }
    }
}
