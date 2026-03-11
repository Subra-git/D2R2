using System.Collections.Generic;
using System.Linq;
using TallComponents.PDF.Layout.Paragraphs;

namespace Profiles.Reports.Extensions
{
    public class PdfRowBuilder
    {
        private readonly List<PdfCellBuilder> data;

        public PdfRowBuilder(params PdfCellBuilder[] data)
        {
            this.data = data.ToList();
        }

        public Row Generate()
        {
            var row = new Row();

            foreach (var cellData in data)
            {
                row.Cells.Add(cellData.Generate());
            }

            return row;
        }
    }
}
