using System.Collections.Generic;
using Profiles.Contracts.DataContracts;
using Profiles.Contracts.ServiceContracts;
using Profiles.DataModels.Tables;
using System.Linq;
using NPoco;
using System;

namespace Profiles.DataAccess.NPoco.Services.BespokeReport
{
    public class BespokeReportTemplateDataService : IBespokeReportTemplateDataService
    {
        private readonly IDatabaseInitializer dbInit;

        public BespokeReportTemplateDataService(IDatabaseInitializer dbInit)
        {
            this.dbInit = dbInit;
        }

        public IEnumerable<BespokeReportTemplateDataResponse> GetAll()
        {
            var database = dbInit.Instance;

            var templates = database
                .Query<BespokeReportTemplate>()
                .IncludeMany(x => x.CheckedList)
                .OrderBy(x => x.Title)
                .ToList();

            return templates.Select(x => new BespokeReportTemplateDataResponse { CheckedList = (x.CheckedList ?? new List<BespokeReportTemplateCheckedItems>()).Select(y => y.CheckedId).ToList(), Id = x.Id, Title = x.Title });
        }

        public Guid Upsert(BespokeReportTemplateDataRequest request)
        {
            var database = dbInit.Instance;

            using (var transaction = database.GetTransaction())
            {
                var result = Guid.Empty;

                if (request.Id == System.Guid.Empty)
                {
                    var id = Guid.NewGuid();

                    database.Insert(
                        new BespokeReportTemplate
                        {
                            Title = request.Title,
                            Id = id
                        });

                    database.InsertBulk(request.CheckedList.Select(x => new BespokeReportTemplateCheckedItems { CheckedId = x, BespokeReportTemplateId = id }));

                    result = id;
                }
                else
                {
                    database.Update(new BespokeReportTemplate { Title = request.Title, Id = request.Id, });

                    if (request.CheckedList != null)
                    {
                        DeleteChecked(request.Id, database);

                        database.InsertBulk(request.CheckedList
                                .Select(x => new BespokeReportTemplateCheckedItems { CheckedId = x, BespokeReportTemplateId = request.Id }));
                    }

                    result = request.Id;
                }

                transaction.Complete();

                return result;
            }
        }

        private void DeleteChecked(Guid templateId, IDatabase db)
        {
            db.DeleteMany<BespokeReportTemplateCheckedItems>().Where(x => x.BespokeReportTemplateId == templateId).Execute();
        }

        public void Delete(Guid id)
        {
            var database = dbInit.Instance;

            using (var transaction = database.GetTransaction())
            {
                DeleteChecked(id, database);

                database.Delete<BespokeReportTemplate>(id);

                transaction.Complete();
            }
        }

        public BespokeReportTemplateDataResponse GetSingleOrDefault(Guid id)
        {
            var database = dbInit.Instance;

            var res = database.Query<BespokeReportTemplate>()
                .IncludeMany(x => x.CheckedList)
                .SingleOrDefault(x => x.Id == id);

            if (res == null) return null;

            return new BespokeReportTemplateDataResponse { CheckedList = (res.CheckedList ?? new List<BespokeReportTemplateCheckedItems>()).Select(y => y.CheckedId).ToList(), Id = res.Id, Title = res.Title };
        }

        public BespokeReportTemplateDataResponse GetSingleOrDefault(string title)
        {
            var database = dbInit.Instance;

            var item = database.Query<BespokeReportTemplate>()
                .IncludeMany(x => x.CheckedList)
                .SingleOrDefault(x => x.Title == title);

            if (item == null) return null;

            return new BespokeReportTemplateDataResponse { CheckedList = (item.CheckedList ?? new List<BespokeReportTemplateCheckedItems>()).Select(y => y.CheckedId).ToList(), Id = item.Id, Title = item.Title };
        }
    }
}
