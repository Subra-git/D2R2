using System.Collections.Generic;
using Profiles.Contracts.DataContracts;
using System;

namespace Profiles.DataAccess.NPoco.Services.BespokeReport
{
    public interface IBespokeReportTemplateDataService
    {
        IEnumerable<BespokeReportTemplateDataResponse> GetAll();
        BespokeReportTemplateDataResponse GetSingleOrDefault(Guid id);
        BespokeReportTemplateDataResponse GetSingleOrDefault(string title);
        Guid Upsert(BespokeReportTemplateDataRequest model);
        void Delete(Guid model);
    }
}
