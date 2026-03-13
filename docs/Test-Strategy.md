# Test Strategy — Surveillance Profiles (D2R2)

> **Status:** Baseline safety-net for incremental modernisation  
> **Last updated:** 2026-03-13  
> **Source branch:** `modernisation_net10`

---

## 1. Test Pyramid Approach

```
        ╱  UI / E2E  ╲          ← OUT OF SCOPE (WebForms; brittle, slow)
       ╱───────────────╲
      ╱  Integration    ╲       ← Thin layer: real services, mocked DB
     ╱───────────────────╲
    ╱  Unit               ╲    ← Primary focus: business logic, mapping, helpers
   ╱───────────────────────╲
```

### Unit tests (primary focus)

Target pure logic that can be tested without infrastructure:

- Business orchestration (`EmailBusiness`, `BespokeReportTemplateService`)
- Data mapping (`ReviewEmailDataMap`)
- HTML generation (`HtmlTagHelper`, `ReviewEmail`)
- Email composition (`EmailService` with mocked SMTP)

### Integration tests (secondary focus)

Target one meaningful domain flow proving the service stack wires together correctly:

- Review email retrieval → mapping → email composition (end-to-end in-process flow with mocked data access)

### UI / E2E tests

Out of scope. The WebForms UI is tightly coupled to IIS and CSLA infrastructure, making automated UI tests impractical for a baseline safety net.

---

## 2. Critical Flows Covered

| # | Flow | Test Type | Test Class | What Is Verified |
|---|------|-----------|------------|------------------|
| 1 | **Review email: skip users with no profiles** | Unit | `EmailBusinessTests` (existing) | No email sent when user has empty ProfileVersions |
| 2 | **Review email: skip users with no sections** | Unit | `EmailBusinessTests` (existing) | No email sent when profile has no sections |
| 3 | **Review email: send for valid data** | Unit | `EmailBusinessTests` (existing) | Email sent exactly once for user with valid profile sections |
| 4 | **Review email: multiple users with mixed data** | Unit | `EmailBusinessTests` (new) | Correct send count when some users have data and others do not |
| 5 | **Review email data mapping: empty sources** | Unit | `ReviewEmailDataMapTests` (existing) | Empty collections produce empty result |
| 6 | **Review email data mapping: grouping** | Unit | `ReviewEmailDataMapTests` (existing) | Users, profiles, sections grouped correctly by ID |
| 7 | **Review email data mapping: multi-user** | Unit | `ReviewEmailDataMapTests` (new) | Multiple users with distinct profiles map independently |
| 8 | **Review email data mapping: section ordering** | Unit | `ReviewEmailDataMapTests` (new) | Sections preserve order from source |
| 9 | **Bespoke template: SaveAs duplicate name** | Unit | `BespokeReportTemplateServiceTests` (new) | Throws `InvalidOperationException` when title already exists |
| 10 | **Bespoke template: SaveAs success** | Unit | `BespokeReportTemplateServiceTests` (new) | Upserts and returns mapped response |
| 11 | **Bespoke template: Save** | Unit | `BespokeReportTemplateServiceTests` (new) | Upserts and returns mapped response |
| 12 | **Bespoke template: Delete** | Unit | `BespokeReportTemplateServiceTests` (new) | Delegates to data service |
| 13 | **Bespoke template: GetAll** | Unit | `BespokeReportTemplateServiceTests` (new) | Returns all mapped templates |
| 14 | **Bespoke template: GetSingleOrDefault** | Unit | `BespokeReportTemplateServiceTests` (new) | Returns single mapped template |
| 15 | **Bespoke template: null response mapping** | Unit | `BespokeReportTemplateServiceTests` (new) | Returns null when data service returns null |
| 16 | **HtmlTagHelper: basic tag rendering** | Unit | `HtmlTagHelperTests` (new) | Self-closing, with content, with attributes |
| 17 | **HtmlTagHelper: nested tags** | Unit | `HtmlTagHelperTests` (new) | Nested HTML structure renders correctly |
| 18 | **EmailService: sends to each recipient** | Unit | `EmailServiceTests` (new) | SMTP client called per recipient |
| 19 | **EmailService: message composition** | Unit | `EmailServiceTests` (new) | Subject, sender, priority, HTML/plain text alternate views set correctly |
| 20 | **Review email: end-to-end orchestration** | Integration | `ReviewEmailIntegrationTests` (new) | EmailBusiness orchestration: data retrieval → user filtering → email service delegation with verified sender, recipient, and data arguments |

---

## 3. Known Gaps

| Gap | Reason | Risk |
|-----|--------|------|
| **BespokeReportTemplateService authorisation guards** | `CanEdit()` / `CanView()` depend on `Csla.ApplicationContext.User.Identity` — **RESOLVED** by creating an uninitialised `ProfilesIdentity` via `FormatterServices.GetUninitializedObject` and setting private fields with reflection. Parallel test execution disabled via `[assembly: CollectionBehavior(DisableTestParallelization = true)]` to prevent CSLA static state leakage. | Low — guards are now tested via the BespokeReport unit tests |
| **ReviewEmail.GenerateAttachments()** | Calls `ProfileVersionInfo.GetProfileVersionInfo()` and `Profile.GetProfile()` — static CSLA methods that require full DataPortal infrastructure | Medium — attachment generation untested |
| **ReviewEmail.GenerateHtmlContent()** | Uses `GlobalSettings.InternalHomePageUrlForReports` — VB.NET module-level static property | Low — HTML body generation for the review email template not fully unit-testable |
| **ProfilesLibrary CSLA business objects** | Entire domain model (`Profile`, `ProfileInfoList`, etc.) tightly coupled to CSLA DataPortal | High — core domain logic has no automated tests; tested only through manual QA |
| **Profiles.DataAccess.Sql (20+ services)** | VB.NET ADO.NET services with direct SQL connections | High — legacy data access layer untested; relies on database integration |
| **WebForms code-behind (~100 pages)** | Tightly coupled to ASP.NET page lifecycle and IIS | High — no automated UI coverage |
| **WCF service layer** | Thin wrappers; low logic density | Low — low risk of behavioural bugs |
| **Multi-result-set parsing** | `ProfileSearchService.GetAllProfiles()` positional parsing of 9+ result sets | Medium — would require database integration tests to verify |
| **PDF report generation** | Depends on TallComponents PDF (licensed) | Low — tested manually |

---

## 4. Test Configuration

### Running tests locally

```powershell
# 1. Restore NuGet packages
nuget restore SurveillanceProfiles.sln

# 2. Create required directories
New-Item -ItemType Directory -Path ProfilesWeb\bin -Force

# 3. Build solution (Debug maps to UAT Azure for most projects)
msbuild SurveillanceProfiles.sln /p:Configuration=Debug /p:Platform="Any CPU"

# 4. Run all unit tests
dotnet vstest `
  "Profiles.Business.Tests.Unit\bin\UAT Azure\Profiles.Business.Tests.Unit.dll" `
  "Profiles.DataAccess.NPoco.Tests.Unit\bin\Debug\Profiles.DataAccess.NPoco.Tests.Unit.dll" `
  /TestAdapterPath:"packages\xunit.runner.visualstudio.2.1.0\build\_common"

# 5. Run integration tests (database-independent tests only)
dotnet vstest `
  "Profiles.Business.Tests.Integration\bin\UAT Azure\Profiles.Business.Tests.Integration.dll" `
  /TestAdapterPath:"packages\xunit.runner.visualstudio.2.1.0\build\_common" `
  /Tests:"ReviewEmailFlow_EligibleUser_ShouldDelegateToEmailServiceWithCorrectArguments,ReviewEmailFlow_NoEligibleUsers_ShouldNotSendAnyEmails"
```

### Test configuration requirements

| Requirement | Unit Tests | Integration Tests |
|-------------|-----------|-------------------|
| SQL Server | Not required | Required — configure `ProfilesDatabase` in `App.config` |
| SMTP Server | Not required | Not required (mocked) |
| CSLA Runtime | Not required for new tests | Required for `Bootstrap.cs` |
| NuGet packages | xUnit 2.1.0, FakeItEasy 1.25.3 | Same + NPoco, StructureMap |

---

## 5. Conventions

| Convention | Standard |
|------------|----------|
| **Framework** | xUnit 2.1.0 (`[Fact]` attribute) |
| **Mocking** | FakeItEasy 1.25.3 (`A.Fake<T>()`, `A.CallTo(...)`, `MustHaveHappened()`) |
| **Naming** | `{Behaviour}_{Condition}_{ExpectedResult}()` |
| **Structure** | Test file mirrors source file path (e.g., `EmailBusiness/` → `EmailBusiness/EmailBusinessTests.cs`) |
| **Assertions** | xUnit `Assert.*` methods |
| **Project naming** | `{ProjectName}.Tests.Unit` for unit tests, `{ProjectName}.Tests.Integration` for integration tests |
