using Profiles.Reports.Extensions.Formatting.Paragraph;

namespace Profiles.Reports.Extensions.Formatting.Cell
{
    public class CellFormatting
    {
        public double CellPadding { get; private set; }

        public double Width { get; private set; }

        public bool IsFixedWidth { get; private set; }

        public ParagraphFormatting ParagraphFormatting { get; private set; }

        public CellFormatting(ParagraphFormatting paragraphFormatting = null, double cellPadding = 3.5)
            : this(false, default(double), paragraphFormatting, cellPadding)
        {
        }

        public CellFormatting(ParagraphFormatting paragraphFormatting = null, double cellPadding = 3.5, double fixedWidth = 90)
            : this(true, fixedWidth, paragraphFormatting, cellPadding)
        {
        }

        private CellFormatting(bool isFixedWidth, double fixedWidth, ParagraphFormatting paragraphFormatting, double cellPadding)
        {
            IsFixedWidth = isFixedWidth;
            Width = fixedWidth;
            ParagraphFormatting = paragraphFormatting != null ? paragraphFormatting : new ParagraphFormatting();
            CellPadding = cellPadding;
        }
    }
}
