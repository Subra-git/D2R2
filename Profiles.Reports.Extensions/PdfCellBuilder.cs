using System.Drawing;
using Profiles.Reports.Extensions.Formatting.Cell;
using TallComponents.PDF.Layout;
using TallComponents.PDF.Layout.Paragraphs;

namespace Profiles.Reports.Extensions
{
    public class PdfCellBuilder : PdfParagraphBuilder
    {
        private readonly CellFormatting formatting;
        private readonly string data;

        public PdfCellBuilder(CellFormatting formatting, object data)
            : this(formatting, data.ToString())
        {
        }

        public PdfCellBuilder(CellFormatting formatting, string data)
            : base(formatting.ParagraphFormatting, data)
        {
            this.formatting = formatting;
            this.data = data;
        }

        public new Cell Generate()
        {
            var paragraph = base.Generate();

            var cell = new Cell
            {
                Border = new Border(Color.Black, 0.01)
                {
                    Background = new TallComponents.PDF.Layout.Brushes.SolidBrush(Color.White)
                },
                FitToContent = !formatting.IsFixedWidth,
                PreferredWidth = formatting.Width,
                Padding = this.formatting.CellPadding
            };

            cell.Paragraphs.Add(paragraph);

            return cell;
        }
    }
}
