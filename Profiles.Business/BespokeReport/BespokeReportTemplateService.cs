using System.Collections.Generic;
using Profiles.Contracts.ServiceContracts;
using Profiles.Contracts.DataContracts;
using ProfilesLibrary;
using System;
using System.Linq;
using Profiles.DataAccess.NPoco.Services.BespokeReport;

namespace Profiles.Business.BespokeReport
{
    public class BespokeReportTemplateService : IBespokeReportTemplateService
    {
        private readonly IBespokeReportTemplateDataService dataService;

        public BespokeReportTemplateService(IBespokeReportTemplateDataService dataService)
        {
            this.dataService = dataService;
        }

        public BespokeReportTemplateResponse SaveAs(BespokeReportTemplateRequest request)
        {
            GuardCanEdit();

            var byname = dataService.GetSingleOrDefault(request.Title);

            if (byname != null) throw new InvalidOperationException("A template with the same name exists");
            
            var savedId = dataService.Upsert(MapRequest(request));

            var data = dataService.GetSingleOrDefault(savedId);

            return MapResponse(data);
        }

        public BespokeReportTemplateResponse Save(BespokeReportTemplateRequest request)
        {
            GuardCanEdit();

            var savedId = dataService.Upsert(MapRequest(request));

            var data = dataService.GetSingleOrDefault(savedId);

            return MapResponse(data);
        }

        public BespokeReportTemplateResponse SaveTitle(string title, Guid id)
        {
            GuardCanEdit();

            var current = dataService.GetSingleOrDefault(id);
            current.Title = title;

            var savedId = dataService.Upsert(new BespokeReportTemplateDataRequest { Title = current.Title, Id = current.Id });

            var data = dataService.GetSingleOrDefault(savedId);

            return MapResponse(data);
        }

        public void Delete(Guid id)
        {
            GuardCanEdit();

            dataService.Delete(id);
        }

        public BespokeReportTemplateResponse GetSingleOrDefault(Guid id)
        {
            GuardCanView();

            var data = dataService.GetSingleOrDefault(id);

            return MapResponse(data);
        }

        public BespokeReportTemplateResponse GetSingleByTitleOrDefault(string title)
        {
            GuardCanView();

            var data = dataService.GetSingleOrDefault(title);

            return MapResponse(data);
        }

        public IEnumerable<BespokeReportTemplateResponse> GetAll() 
        {
            GuardCanView();

            return dataService.GetAll().Select(MapResponse); 
        }

        public bool CanEdit()
        {
            var identity = Csla.ApplicationContext.User.Identity as ProfilesIdentity;

            return identity.IsProfileEditor && !identity.IsUserManagementSystem;
        }

        public bool CanView()
        {
            var identity = Csla.ApplicationContext.User.Identity as ProfilesIdentity;

            return (identity.IsProfileEditor || identity.IsPolicyProfileUser) && !identity.IsUserManagementSystem;
        }

        private BespokeReportTemplateResponse MapResponse(BespokeReportTemplateDataResponse response)
        {
            if (response == null) return null;

            return new BespokeReportTemplateResponse { Id = response.Id, Title = response.Title, CheckedList = response.CheckedList };
        }

        private BespokeReportTemplateDataRequest MapRequest(BespokeReportTemplateRequest request)
        {
            if (request == null) return null;

            return new BespokeReportTemplateDataRequest { Id = request.Id, Title = request.Title, CheckedList = request.CheckedList };
        }

        private void GuardCanEdit()
        {
            if (CanEdit() == false)
                throw new System.Security.SecurityException("You do not have permission to Edit Bespoke Report Templates");
        }

        private void GuardCanView()
        {
            if (CanView() == false)
                throw new System.Security.SecurityException("You do not have permission to View Bespoke Report Templates");
        }
    }
}
    