using System.Collections.Generic;
using Profiles.Reports.Extensions.Formatting.Table;
using TallComponents.PDF.Layout.Paragraphs;

namespace Profiles.Reports.Extensions
{
    public class PdfTableBuilder
    {
        private readonly string caption;
        private readonly List<PdfRowBuilder> rows;
        private readonly TableFormatting tableFormatting;

        public PdfTableBuilder(string caption, List<PdfRowBuilder> rows, TableFormatting tableFormatting)
        {
            this.caption = caption;
            this.rows = rows;
            this.tableFormatting = tableFormatting;
        }

        public Table Generate()
        {
            var table = new Table
            {
                Caption = caption,
                ForceWidth = tableFormatting.ForceWidth,
                PreferredWidth = tableFormatting.FixedWidth
            };

            foreach (var row in rows)
            {
                table.Rows.Add(row.Generate());
            }

            return table;
        }
    }
}
