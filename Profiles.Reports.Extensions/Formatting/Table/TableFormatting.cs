namespace Profiles.Reports.Extensions.Formatting.Table
{
    public class TableFormatting
    {
        public bool ForceWidth { get; private set; }
        public double FixedWidth { get; private set; }

        public TableFormatting()
        {
            ForceWidth = ForceWidth = false;
        }

        public TableFormatting(double fixedWidth)
        {
            FixedWidth = fixedWidth;
            ForceWidth = true;
        }
    }
}
