using System;
using System.Collections.Generic;
using System.Reflection;
using System.Security.Principal;
using FakeItEasy;
using Profiles.Business.BespokeReport;
using Profiles.Contracts.DataContracts;
using Profiles.DataAccess.NPoco.Services.BespokeReport;
using ProfilesLibrary;
using Xunit;

namespace Profiles.Business.Tests.Unit.BespokeReport
{
    public class BespokeReportTemplateServiceTests : IDisposable
    {
        private readonly IBespokeReportTemplateDataService dataService;
        private readonly BespokeReportTemplateService sut;
        private readonly System.Security.Principal.IPrincipal previousPrincipal;

        public BespokeReportTemplateServiceTests()
        {
            dataService = A.Fake<IBespokeReportTemplateDataService>();
            sut = new BespokeReportTemplateService(dataService);

            // Save the current principal so we can restore it after each test.
            previousPrincipal = Csla.ApplicationContext.User;

            // Set up a CSLA identity that satisfies CanView/CanEdit guards.
            // ProfilesIdentity is a CSLA ReadOnlyBase with private fields,
            // so we use reflection to configure an authenticated editor identity.
            var identity = (ProfilesIdentity)System.Runtime.Serialization.FormatterServices
                .GetUninitializedObject(typeof(ProfilesIdentity));

            SetField(identity, "mIsAuthenticated", true);
            SetField(identity, "mIsProfileEditor", true);
            SetField(identity, "mIsPolicyProfileUser", false);
            SetField(identity, "mIsUserManagementSystem", false);

            var principal = new GenericPrincipal(identity, new string[0]);
            Csla.ApplicationContext.User = principal;
        }

        public void Dispose()
        {
            Csla.ApplicationContext.User = previousPrincipal;
        }

        private static void SetField(object obj, string fieldName, object value)
        {
            var field = obj.GetType().GetField(fieldName, BindingFlags.NonPublic | BindingFlags.Instance);
            field.SetValue(obj, value);
        }

        // --- SaveAs ---

        [Fact]
        public void SaveAs_TitleAlreadyExists_ShouldThrowInvalidOperationException()
        {
            var request = new BespokeReportTemplateRequest { Title = "Existing", Id = Guid.Empty, CheckedList = new List<string>() };

            A.CallTo(() => dataService.GetSingleOrDefault("Existing"))
                .Returns(new BespokeReportTemplateDataResponse { Id = Guid.NewGuid(), Title = "Existing" });

            Assert.Throws<InvalidOperationException>(() => sut.SaveAs(request));
        }

        [Fact]
        public void SaveAs_TitleDoesNotExist_ShouldUpsertAndReturnMappedResponse()
        {
            var newId = Guid.NewGuid();
            var request = new BespokeReportTemplateRequest { Title = "New Template", Id = Guid.Empty, CheckedList = new List<string> { "a", "b" } };

            A.CallTo(() => dataService.GetSingleOrDefault("New Template")).Returns((BespokeReportTemplateDataResponse)null);
            A.CallTo(() => dataService.Upsert(A<BespokeReportTemplateDataRequest>._)).Returns(newId);
            A.CallTo(() => dataService.GetSingleOrDefault(A<Guid>._))
                .Returns(new BespokeReportTemplateDataResponse { Id = newId, Title = "New Template", CheckedList = new List<string> { "a", "b" } });

            var result = sut.SaveAs(request);

            Assert.NotNull(result);
            Assert.Equal(newId, result.Id);
            Assert.Equal("New Template", result.Title);
        }

        // --- Save ---

        [Fact]
        public void Save_ValidRequest_ShouldUpsertAndReturnMappedResponse()
        {
            var id = Guid.NewGuid();
            var request = new BespokeReportTemplateRequest { Title = "Template", Id = id, CheckedList = new List<string> { "x" } };

            A.CallTo(() => dataService.Upsert(A<BespokeReportTemplateDataRequest>._)).Returns(id);
            A.CallTo(() => dataService.GetSingleOrDefault(A<Guid>._))
                .Returns(new BespokeReportTemplateDataResponse { Id = id, Title = "Template", CheckedList = new List<string> { "x" } });

            var result = sut.Save(request);

            Assert.NotNull(result);
            Assert.Equal(id, result.Id);
            Assert.Equal("Template", result.Title);
        }

        // --- SaveTitle ---

        [Fact]
        public void SaveTitle_ValidIdAndTitle_ShouldUpdateTitleAndReturnResponse()
        {
            var id = Guid.NewGuid();

            A.CallTo(() => dataService.Upsert(A<BespokeReportTemplateDataRequest>._)).Returns(id);

            // The method calls GetSingleOrDefault(Guid) twice:
            // first to get the current template, then to get the saved result.
            A.CallTo(() => dataService.GetSingleOrDefault(A<Guid>._))
                .ReturnsNextFromSequence(
                    new BespokeReportTemplateDataResponse { Id = id, Title = "Old Title", CheckedList = new List<string>() },
                    new BespokeReportTemplateDataResponse { Id = id, Title = "New Title", CheckedList = new List<string>() });

            var result = sut.SaveTitle("New Title", id);

            Assert.NotNull(result);
            Assert.Equal("New Title", result.Title);
        }

        // --- Delete ---

        [Fact]
        public void Delete_ValidId_ShouldCallDataServiceDelete()
        {
            var id = Guid.NewGuid();

            sut.Delete(id);

            A.CallTo(() => dataService.Delete(id)).MustHaveHappened(Repeated.Exactly.Once);
        }

        // --- GetSingleOrDefault ---

        [Fact]
        public void GetSingleOrDefault_DataServiceReturnsNull_ShouldReturnNull()
        {
            var id = Guid.NewGuid();

            A.CallTo(() => dataService.GetSingleOrDefault(id))
                .Returns((BespokeReportTemplateDataResponse)null);

            var result = sut.GetSingleOrDefault(id);

            Assert.Null(result);
        }

        [Fact]
        public void GetSingleOrDefault_DataServiceReturnsData_ShouldReturnMappedResponse()
        {
            var id = Guid.NewGuid();

            A.CallTo(() => dataService.GetSingleOrDefault(A<Guid>._))
                .Returns(new BespokeReportTemplateDataResponse { Id = id, Title = "Found", CheckedList = new List<string> { "c1" } });

            var result = sut.GetSingleOrDefault(id);

            Assert.NotNull(result);
            Assert.Equal(id, result.Id);
            Assert.Equal("Found", result.Title);
        }

        // --- GetSingleByTitleOrDefault ---

        [Fact]
        public void GetSingleByTitleOrDefault_DataServiceReturnsNull_ShouldReturnNull()
        {
            A.CallTo(() => dataService.GetSingleOrDefault("Missing")).Returns((BespokeReportTemplateDataResponse)null);

            var result = sut.GetSingleByTitleOrDefault("Missing");

            Assert.Null(result);
        }

        [Fact]
        public void GetSingleByTitleOrDefault_DataServiceReturnsData_ShouldReturnMappedResponse()
        {
            var id = Guid.NewGuid();

            A.CallTo(() => dataService.GetSingleOrDefault("MyTitle"))
                .Returns(new BespokeReportTemplateDataResponse { Id = id, Title = "MyTitle", CheckedList = new List<string>() });

            var result = sut.GetSingleByTitleOrDefault("MyTitle");

            Assert.NotNull(result);
            Assert.Equal("MyTitle", result.Title);
        }

        // --- GetAll ---

        [Fact]
        public void GetAll_DataServiceReturnsList_ShouldReturnMappedResponses()
        {
            A.CallTo(() => dataService.GetAll())
                .Returns(new List<BespokeReportTemplateDataResponse>
                {
                    new BespokeReportTemplateDataResponse { Id = Guid.NewGuid(), Title = "A", CheckedList = new List<string>() },
                    new BespokeReportTemplateDataResponse { Id = Guid.NewGuid(), Title = "B", CheckedList = new List<string>() }
                });

            var result = sut.GetAll();

            Assert.Equal(2, new List<BespokeReportTemplateResponse>(result).Count);
        }

        [Fact]
        public void GetAll_DataServiceReturnsEmpty_ShouldReturnEmptyCollection()
        {
            A.CallTo(() => dataService.GetAll())
                .Returns(new List<BespokeReportTemplateDataResponse>());

            var result = sut.GetAll();

            Assert.Empty(result);
        }
    }
}
