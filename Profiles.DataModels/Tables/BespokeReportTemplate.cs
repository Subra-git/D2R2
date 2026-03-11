using NPoco;
using System;
using System.Collections.Generic;

namespace Profiles.DataModels.Tables
{
    [TableName("BespokeReportTemplate")]
    [PrimaryKey("Id", AutoIncrement = false)]
   
    public class BespokeReportTemplate
    {
        public Guid Id { get; set; }
        public string Title { get; set; }

        [Reference(ReferenceType.Many, ColumnName = "Id", ReferenceMemberName = "BespokeReportTemplateId")]
        public List<BespokeReportTemplateCheckedItems> CheckedList { get; set; }

    }

    [TableName("BespokeReportTemplateCheckedItems")]
    [PrimaryKey("Id")]
    public class BespokeReportTemplateCheckedItems
    {
        public Guid Id { get; set; }
        public Guid BespokeReportTemplateId { get; set; }
        public string CheckedId { get; set; }
    }
}
