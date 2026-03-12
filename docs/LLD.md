# Low-Level Design — Surveillance Profiles (D2R2)

> **Status:** Current-state documentation — describes the system as it exists today.  
> **Last updated:** 2026-03-12  
> **Source branch:** `modernisation_net10`

---

## 1. Domain Boundaries

### 1.1 Domain Map

| Domain | Owns Data | Owns Business Rules | Owns HTTP Surface | Key Files |
|--------|-----------|--------------------|--------------------|-----------|
| **Profile Management** | Profiles, Scenarios, Versions, Affected Species | Creation, editing, versioning, cloning, publishing | `ProfileProperties.aspx`, `EditProfileQuestions.aspx`, `NewProfileVersion.aspx` | `ProfilesLibrary/Profiles/Profile.vb`, `Profiles.DataAccess.Sql/ProfileManagementService.vb` |
| **Profile Search** | Search indexes, filter criteria | Filtering (published/draft/species/section), full-text search toggle | `Search.aspx` | `Profiles.DataAccess.Sql/ProfileSearchService.vb` |
| **Review Workflow** | Section review status, review dates, review comments | Review assignment, section-level contributor/reviewer roles, review completion tracking | `ReviewComment.aspx`, section edit pages | `Profiles.DataAccess.Sql/ReviewCommentService.vb`, `ProfilesLibrary/ReviewComments/` |
| **User & Auth** | Users, SSO mappings, profile-user-role assignments | Windows auth, SSO token validation, role-based access (Editor, Contributor, Reviewer) | Login pages, SSO harness | `ProfilesLibrary/Security/ProfilesIdentity.vb`, `Profiles.Services.Authentication/`, `Profiles.DataAccess.Sql/UserAuthenticationService.vb` |
| **Species** | Species, species metadata, species answer data | Species CRUD, species-section metadata, species answer management | `SpeciesMaintenance.aspx` | `Profiles.DataAccess.Sql/SpeciesDataService.vb`, `Profiles.DataAccess.Sql/SpeciesMaintenanceService.vb` |
| **Reporting** | Report templates, bespoke report configurations | 6 report types (print, contributions, summary, bespoke, prioritisation, static), PDF generation | Report pages (`Report.aspx`, `BespokeReport.aspx`, etc.) | `Profiles.Reports/`, `Profiles.Reports.Extensions/`, `Profiles.DataAccess.Sql/ProfileReportService.vb` |
| **Review Emails** | Review email views (denormalised) | Email scheduling, composing HTML review summaries, SMTP delivery | None (batch console) | `Profiles.ReviewEmails/Program.cs`, `Profiles.Business/EmailBusiness/EmailBusiness.cs` |
| **Disease Ranking** | Disease filter values, ranking reference tables | Insert/update disease filter values, ranking date-range queries | Disease ranking pages | `Profiles.DataAccess.Sql/DiseaseRankingService.vb` |
| **Prioritisation** | Prioritisation scores | Prioritisation scoring and reporting | Prioritisation pages | `Profiles.DataAccess.Sql/PrioritisationService.vb` |
| **Notes & Questions** | Profile notes, profile questions | Note CRUD, question CRUD | Inline editing in profile pages | `Profiles.DataAccess.Sql/ProfileNoteService.vb`, `Profiles.DataAccess.Sql/ProfileQuestionService.vb` |

---

## 2. Key Classes and Services per Domain

### 2.1 Profile Management

#### CSLA Business Objects (`ProfilesLibrary/Profiles/`)

| Class | File | Responsibility |
|-------|------|----------------|
| `Profile` | `ProfilesLibrary/Profiles/Profile.vb` | Root aggregate — CSLA `BusinessBase`. Factory methods: `NewProfile()`, `GetProfile(id)`. DataPortal methods: `DataPortal_Create`, `DataPortal_Fetch`, `DataPortal_Insert`, `DataPortal_Update`. Manages title, scenario, status, versioning, affected species list. |
| `ProfileInfoList` | `ProfilesLibrary/Profiles/ProfileInfoList.vb` | Read-only CSLA list for search results. `GetProfileInfoList()` fetches from `IProfileSearchService`. |
| `AffectedSpeciesList` | `ProfilesLibrary/Profiles/AffectedSpeciesList.vb` | Child collection of species associated with a profile version. `Add()`, `Remove()`, `GetInsertList()`, `GetDeleteList()`. |
| `ProfileList` | `ProfilesLibrary/Profiles/ProfileList.vb` | Filtered list — applies client-side filtering (published/draft/species/letter). |

#### Service Contracts

| Interface | File | Methods |
|-----------|------|---------|
| `IProfileManagementService` | `Profiles.Contracts/ServiceContracts/IProfileManagementService.vb` | `CreateProfile()`, `DeleteProfileVersion()`, `GetProfileAttributes()`, `CreateNewProfileVersion()`, `UpdateProfileAttributes()`, `GetNewProfileDefaults()`, `SetProfileVersionPublicAccess()`, `UpdateProfileStatus()` |

#### Data Access

| Class | File | Pattern |
|-------|------|---------|
| `ProfileManagementService` | `Profiles.DataAccess.Sql/ProfileManagementService.vb` | ADO.NET + stored procedures (`spiProfile`, `spiProfileVersion`, `spgProfile`, `spiProfileVersionSpecies`). Uses `TransactionScope` for multi-step operations. |

### 2.2 Profile Search

| Class | File | Responsibility |
|-------|------|----------------|
| `ProfileSearchService` | `Profiles.DataAccess.Sql/ProfileSearchService.vb` | Executes stored procedure `spgaProfile` with search parameters. Parses **9+ result sets** sequentially into a hierarchy: `ProfileSearchProfileInfo` → `ProfileSearchProfileScenarioInfo` → `ProfileSearchProfileVersionSummaryInfo` → `AffectedSpecies`, `Answers`, `Notes`. |

**DTOs:**  
- `GetAllProfilesRequest` — `Profiles.Contracts/DataContracts/ProfileSearch/GetAllProfilesRequest.vb`
- `ProfileSearchProfileInfo` — `Profiles.Contracts/DataContracts/ProfileSearch/ProfileSearchProfileInfo.vb`
- `ProfileSearchProfileScenarioInfo`, `ProfileSearchProfileVersionSummaryInfo`, `ProfileSearchProfileAffectedSpecies`, `ProfileSearchProfileAnswer`, `ProfileSearchProfileNote`

### 2.3 User & Authentication

#### Security Model (`ProfilesLibrary/Security/`)

| Class | File | Responsibility |
|-------|------|----------------|
| `ProfilesIdentity` | `ProfilesLibrary/Security/ProfilesIdentity.vb` | CSLA Identity — carries `IsProfileEditor`, `IsPolicyProfileUser`, `IsUserManagementSystem`, `IsSsoUser`. Loaded from DB via `spgUserAuthorisation`. |
| `ProfilesPrincipal` | `ProfilesLibrary/Security/ProfilesPrincipal.vb` | CSLA Principal wrapping `ProfilesIdentity`. `Login()` authenticates via Windows or SSO credentials. |

#### Authentication Flow

| Component | File | Role |
|-----------|------|------|
| `AuthenticationModule` | `Profiles.Web/` (HTTP Module) | Intercepts requests, loads CSLA principal from session or Windows identity. |
| `UserAuthenticationService` (SQL) | `Profiles.DataAccess.Sql/UserAuthenticationService.vb` | Calls `spgUserAuthorisation` to load user identity, roles, section assignments. |
| `UserAuthenticationService` (NPoco) | `Profiles.DataAccess.NPoco/Services/UserAuthentication/UserAuthenticationService.cs` | Parallel C# implementation — reads `User`, `ProfileUser`, `ProfileUserRole`, `ProfileSectionUser` via NPoco ORM. |
| `UserMaintenanceService` | `Profiles.DataAccess.Sql/UserMaintenanceService.vb` | `VerifyDatabaseUser()`, `GetSsoMaintenance()` — user provisioning and SSO user mapping. |

### 2.4 Review Email Processing

| Class | File | Responsibility |
|-------|------|----------------|
| `Program` | `Profiles.ReviewEmails/Program.cs` | Entry point — configures StructureMap, authenticates as system user, invokes `IEmailBusiness.SendReviewEmails()`. |
| `EmailBusiness` | `Profiles.Business/EmailBusiness/EmailBusiness.cs` | Orchestrates flow: query users due → filter users with actionable sections → compose and send emails. |
| `ReviewEmailService` | `Profiles.DataAccess.NPoco/Services/ReviewEmail/ReviewEmailService.cs` | Queries three SQL views (`vwReviewEmailUsers`, `vwReviewEmailProfiles`, `vwReviewEmailProfileSections`) via NPoco. |
| `ReviewEmailDataMap` | `Profiles.DataAccess.NPoco/Services/ReviewEmail/ReviewEmailDataMap.cs` | Transforms three flat query results into hierarchical `UserDueReviewEmailResponse` object graph. |
| `ReviewEmail` | `Profiles.Business/EmailBusiness/Review/ReviewEmail.cs` | Composes HTML email content — profile sections table with review dates and statuses. Subject: "D2R2 - Profile review request". |
| `EmailService` | `Profiles.EmailService/EmailService.cs` | Sends `MailMessage` via `ISmtpClient` with configured SMTP settings. |

### 2.5 Bespoke Report Templates

| Class | File | Responsibility |
|-------|------|----------------|
| `BespokeReportTemplateService` | `Profiles.Business/BespokeReport/BespokeReportTemplateService.cs` | Business logic with permission guards (`CanEdit()`, `CanView()`). |
| `BespokeReportTemplateDataService` | `Profiles.DataAccess.NPoco/Services/BespokeReport/BespokeReportTemplateDataService.cs` | CRUD via NPoco — `GetAll()`, `GetSingleOrDefault()`, `Upsert()`, `Delete()`. Uses transactions. |

### 2.6 Reporting

| Class | File | Responsibility |
|-------|------|----------------|
| `ProfileReportService` | `Profiles.DataAccess.Sql/ProfileReportService.vb` | 10+ report query methods — `GetProfileVersionReports()`, `GetProfileReportData()`, `GetContributionsReport()`, `GetProfilePrintVersion()`, `GetSummaryPrioritisationReport()`, `GetProfileVersionBespokeReport()`. Each calls dedicated stored procedures. |
| `StaticReportService` | `Profiles.DataAccess.Sql/StaticReportService.vb` | Static report data retrieval and relocating. |
| Report renderers | `Profiles.Reports/` | TallComponents PDF rendering of profile print versions, contributions, summaries. |

---

## 3. Request and Execution Flows

### 3.1 Flow: Profile Search

```
User clicks "Search" on Search.aspx
         │
         ▼
[Profiles.Web/Search.aspx.vb]
  btnSearch_Click() → RefreshResults()
    │  Collects: title text, species selection, section filters
    │
    ▼
[ProfilesLibrary/Profiles/ProfileInfoList.vb]
  ProfileInfoList.GetProfileInfoList(returnAnswers, returnNotes, title, useTextSearch, sections)
    │  CSLA DataPortal_Fetch
    │
    ▼
[Profiles.Contracts/DataFactory.vb]
  DataFactory.GetProfileSearchService()
    │  ObjectFactory.GetInstance(Of IProfileSearchService)
    │
    ▼
[Profiles.DataAccess.Sql/ProfileSearchService.vb]
  GetAllProfiles(GetAllProfilesRequest)
    │  SqlConnection → GlobalSettings.ProfilesDatabase
    │  SqlCommand → "spgaProfile" (stored procedure)
    │  Parameters: @UserId, @Words, @PerformSqlSearch, @SectionSelection
    │
    ▼
  Parses 9+ result sets via SafeDataReader:
    1. Profiles         → ProfileSearchProfileInfo
    2. Scenarios         → ProfileSearchProfileScenarioInfo
    3. ProfileVersions   → ProfileSearchProfileVersionSummaryInfo
    4. AffectedSpecies
    5-8. Review dates/status
    9. Answers
    10. Notes
    │
    ▼
[ProfilesLibrary/Profiles/ProfileList.vb]
  ProfileList.GetFilteredList() — client-side filtering
    │
    ▼
  Binds to rptProfileList Repeater in Search.aspx
```

### 3.2 Flow: Profile Creation

```
User navigates to ProfileProperties.aspx (no ProfileId query param)
         │
         ▼
[Profiles.Web/ProfileProperties.aspx.vb]
  Page_Load() — empty ProfileId → CREATE mode
    │
    ▼
[ProfilesLibrary/Profiles/Profile.vb]
  Profile.NewProfile()
    │  CanCreateProfile() → checks ProfilesIdentity.IsProfileEditor
    │  DataPortal.Create(Of Profile)()
    │  → DataPortal_Create(): mId = Guid.NewGuid(), mCurrentDraftProfileVersionId = Guid.NewGuid()
    │
    ▼
  User fills: Title (TinyMCE), Affected Species (RadTreeView)
    │
    ▼
  btnUpdate_Click()
    │  mEditProfile.Title = txtTitle.Value.Trim()
    │  UpdateAffectedSpecies() — adds/removes species
    │  mEditProfile.Save()
    │
    ▼
[ProfilesLibrary/Profiles/Profile.vb]
  DataPortal_Insert()
    │  Builds CreateProfileRequest DTO
    │  Calls DataFactory.GetProfileManagementService().CreateProfile(request)
    │
    ▼
[Profiles.DataAccess.Sql/ProfileManagementService.vb]
  CreateProfile(CreateProfileRequest)
    │  TransactionScope
    │  SqlCommand → "spiProfile" (insert profile)
    │  SqlCommand → "spiProfileVersion" (insert draft version)
    │  For each species: SqlCommand → "spiProfileVersionSpecies"
    │  Commit
    │
    ▼
  Response.Redirect("EditProfileQuestions.aspx?ProfileVersionId=...")
```

### 3.3 Flow: Review Email Batch

```
Scheduled task invokes Profiles.ReviewEmails.exe
         │
         ▼
[Profiles.ReviewEmails/Program.cs]
  Main()
    │  StructureMap: Configure DI container
    │  ProfilesPrincipal.Login(systemUser)
    │  ObjectFactory.GetInstance<IEmailBusiness>().SendReviewEmails()
    │
    ▼
[Profiles.Business/EmailBusiness/EmailBusiness.cs]
  SendReviewEmails()
    │  GetUsersDueReviewEmail()
    │
    ▼
[Profiles.DataAccess.NPoco/Services/ReviewEmail/ReviewEmailService.cs]
  UsersDueReviewEmail(request)
    │  NPoco queries against 3 SQL views:
    │   - vwReviewEmailUsers         → List<ReviewEmailUser>
    │   - vwReviewEmailProfiles      → List<ReviewEmailProfile>
    │   - vwReviewEmailProfileSections → List<ReviewEmailProfileSection>
    │
    ▼
[ReviewEmailDataMap.cs]
  Map(users, profileVersions, profileSections)
    │  Joins flat lists → hierarchical UserDueReviewEmailResponse
    │   └─ ProfileVersions[]
    │       └─ ProfileSections[] (sorted by SectionNumber)
    │
    ▼
[EmailBusiness.cs]
  For each user with actionable sections:
    │  new ReviewEmail() — composes HTML (profile table with review dates/status)
    │
    ▼
[Profiles.EmailService/EmailService.cs]
  SendEmail(reviewEmail, userData, recipients, fromAddress)
    │  MailMessage → ISmtpClient → localhost:25
    │
    ▼
  Email delivered to reviewer
```

---

## 4. Dependency Injection Configuration

### 4.1 StructureMap — Web Application

**Registry:** `Profiles.Web/IoC/WebsiteRegistry.vb`

The application checks `AppSettings["UseSQLDirectly"]` at startup to determine which data access implementations to register:

**Direct SQL mode (`UseSQLDirectly = true`):**

| Interface | Implementation |
|-----------|----------------|
| `IProfileSearchService` | `DataAccess.Sql.ProfileSearchService` |
| `IProfileManagementService` | `DataAccess.Sql.ProfileManagementService` |
| `IUserAuthenticationService` | `DataAccess.Sql.UserAuthenticationService` |
| `IProfileVersionDataService` | `DataAccess.Sql.ProfileVersionDataService` |
| `ISpeciesDataService` | `DataAccess.Sql.SpeciesDataService` |
| `IProfileReportService` | `DataAccess.Sql.ProfileReportService` |
| `IStaticReportService` | `DataAccess.Sql.StaticReportService` |
| `IProfileNoteService` | `DataAccess.Sql.ProfileNoteService` |
| `IProfileQuestionService` | `DataAccess.Sql.ProfileQuestionService` |
| `IReviewCommentService` | `DataAccess.Sql.ReviewCommentService` |
| `IReferenceValueService` | `DataAccess.Sql.ReferenceValueService` |
| `IUserMaintenanceService` | `DataAccess.Sql.UserMaintenanceService` |
| `ISpeciesMaintenanceService` | `DataAccess.Sql.SpeciesMaintenanceService` |
| `IPrioritisationService` | `DataAccess.Sql.PrioritisationService` |
| `IDiseaseRankingService` | `DataAccess.Sql.DiseaseRankingService` |
| `IReviewEmailService` | `DataAccess.NPoco.Services.ReviewEmail.ReviewEmailService` |
| `IBespokeReportTemplateService` | `BespokeReportTemplateService` |

**WCF mode (`UseSQLDirectly = false`):**  
All `IXxxService` interfaces resolve to `DataAccess.WebServiceClient.*` (WCF proxy classes).

**Common registrations (both modes):**

| Interface | Implementation |
|-----------|----------------|
| `IGlobalSettings` | `WebConfigGlobalSettings` |
| `IEmailBusiness` | `EmailBusiness` |
| `IDatabaseInitializer` | `DatabaseInitializer` |
| `ISmtpClient` | `SmtpClientWrapper` |
| `IEmailService` | `EmailService.EmailService` |

### 4.2 StructureMap — Review Email Console

**Configuration:** `Profiles.ReviewEmails/Program.cs` (inline `ObjectFactory.Configure`)

Same service registrations as the web app's Direct SQL mode, with explicit wiring for all required services.

### 4.3 Service Resolution Pattern

All business-layer code resolves services through `Profiles.Contracts/DataFactory.vb`:

```vb
Public Module DataFactory
    Public Function GetProfileSearchService() As IProfileSearchService
        Return ObjectFactory.GetInstance(Of IProfileSearchService)()
    End Function
    ' ... 15+ similar factory methods
End Module
```

`DataFactory` also holds **module-level cached** metadata:
- `GetProfileMetadata()` — cached `ProfileSectionMetadata` tree (no invalidation)
- `GetSpeciesMetadata()` — cached `SpeciesSectionMetadata` tree (no invalidation)

---

## 5. Data Model & Persistence

### 5.1 NPoco Entity Model (`Profiles.DataModels/`)

**Table-mapped entities:**

| Entity | Table | Key Properties |
|--------|-------|----------------|
| `User` | `[dbo].[User]` | `Id` (Guid), `UserName`, `FullName`, `Organisation`, `IsProfileEditor`, `IsPolicyProfileUser`, `SsoUserId` (Guid?), `IsUserManagementSystem`, `EmailAddress` |
| `ProfileUser` | `[dbo].[ProfileUser]` | `UserId` (Guid), `ProfileId` (Guid), `ProfileUserRoleId` (Guid) |
| `ProfileUserRole` | `[dbo].[ProfileUserRole]` | `Id` (Guid), `Name`, `IsContributor` (bool) |
| `BespokeReportTemplate` | `[dbo].[BespokeReportTemplate]` | `Id` (Guid PK), `Title`, `CheckedList` (1-to-many) |
| `BespokeReportTemplateCheckedItems` | `[dbo].[BespokeReportTemplateCheckedItem]` | `Id` (Guid PK), `BespokeReportTemplateId` (Guid FK), `CheckedId` (string) |
| `ProfileSectionUser` | `[dbo].[ProfileSectionUser]` | `UserId`, `ProfileId`, `ProfileSectionId`, `ReviewEmail` (bool) |

**View-mapped entities (read-only):**

| Entity | View | Purpose |
|--------|------|---------|
| `ReviewEmailUser` | `vwReviewEmailUsers` | Users eligible for review emails |
| `ReviewEmailProfile` | `vwReviewEmailProfiles` | Profile versions assigned to users |
| `ReviewEmailProfileSection` | `vwReviewEmailProfileSections` | Sections with review dates and statuses |

**Stored procedure DTOs:**

| Entity | Purpose |
|--------|---------|
| `ReviewTimingsReport` | Maps SP result set for review timing reports |

### 5.2 Legacy ADO.NET Model

The SQL data access layer (`Profiles.DataAccess.Sql/`) does not use an ORM. It accesses data through:

- **50+ stored procedures** — named with prefixes: `spi` (insert), `spg` (get), `spga` (get all), `spu` (update)
- **Manual `SqlCommand` construction** with parameterised queries
- **`SafeDataReader`** (`Profiles.DataAccess.Sql/SafeDataReader.vb`) — wraps `SqlDataReader` with null-safe accessors (`GetString`, `GetGuid`, `GetInt32`, `GetBoolean`, `GetDouble`)
- **Multi-result-set parsing** — sequential `reader.NextResult()` calls, position-dependent

### 5.3 Database Migration

**Tool:** AliaSQL (`Profiles.Database/scripts/AliaSQL.exe`)  
**Runner:** `Profiles.Database/Program.cs` — interactive console selecting operation and connection

**Script phases:**

| Phase | Folder | Scripts | Purpose |
|-------|--------|---------|---------|
| Create | `scripts/Create/` | 2 scripts | `0001-CreateLogin.sql`, `0002-CreateDatabase.sql` |
| Update | `scripts/Update/` | 54 scripts | Incremental schema changes — views, stored procedures, tables, data migrations |
| Everytime | `scripts/Everytime/` | Variable | Scripts run on every deployment |
| TestData | `scripts/TestData/` | Variable | Test fixture data |

**Legacy alternative:** `ProfilesDatabase/` — Visual Studio SQL Server Database Project (`.sqlproj` / `.dbp`) — appears superseded by AliaSQL approach.

---

## 6. Coupling Hotspots and Complexity Indicators

### 6.1 High-Risk Coupling Points

| Hotspot | Location | Risk | Detail |
|---------|----------|------|--------|
| **Multi-result-set parsing** | `ProfileSearchService.vb::GetAllProfiles()` | **High** | Parses 9+ result sets in strict sequence. Any schema change to `spgaProfile` (column order, result set count) silently breaks parsing. No compile-time safety. |
| **Dual data access implementations** | `DataAccess.Sql/UserAuthenticationService.vb` vs `DataAccess.NPoco/UserAuthenticationService.cs` | **High** | Same interface implemented in two layers. Behaviour divergence risk — changes in one may not be replicated in the other. |
| **Static metadata cache** | `Profiles.Contracts/DataFactory.vb` | **Medium** | Module-level `ProfileSectionMetadata` and `SpeciesSectionMetadata` cached with no invalidation. App restart required to pick up metadata changes. |
| **GlobalSettings module coupling** | `Profiles.DataAccess.Sql/GlobalSettings.vb` | **Medium** | Every SQL service directly references `GlobalSettings.ProfilesDatabase`. No indirection or per-request scoping. |
| **CSLA DataPortal tight coupling** | `ProfilesLibrary/Profiles/Profile.vb` | **Medium** | Business objects embed data access calls inside `DataPortal_Xxx` methods. Business logic and persistence are interleaved in the same class. |
| **Stored procedure sprawl** | `Profiles.DataAccess.Sql/` (20 services × 2-10 SPs each) | **Medium** | 50+ stored procedures. Schema changes cascade through SP definitions, SafeDataReader parsing, DTO mapping, and service contracts. |
| **N+1 species operations** | `ProfileManagementService.vb::RemoveAffectedSpecies()` | **Low** | Loops with individual SP calls per species. Set-based operations would be more efficient. |
| **TransactionScope + SqlConnection** | `ProfileManagementService.vb` | **Low** | `TransactionScope` wrapping multiple `SqlConnection` opens may escalate to distributed transactions (MSDTC). |

### 6.2 Complexity Indicators

| Indicator | Measurement |
|-----------|-------------|
| **Language mix** | 13 VB.NET + 12 C# projects in one solution |
| **Project count** | 31 projects (high coupling surface) |
| **Framework age** | CSLA 3.0.5 (~2007 era), StructureMap 2.4.9, AjaxControlToolkit 4.1 |
| **Package versions** | Newtonsoft.Json 7.0.1 (current: 13.x), xUnit 2.1.0 (current: 2.9.x), FakeItEasy 1.25.3 (current: 8.x) |
| **WebForms page count** | ~100+ .aspx pages |
| **Stored procedure count** | ~50+ (maintained via 54 migration scripts) |
| **Test coverage** | 3 test projects — unit tests for `Profiles.Business` and `Profiles.DataAccess.NPoco` only; no tests for `ProfilesLibrary`, `DataAccess.Sql`, or WebForms code-behind |
| **Deployment configurations** | 8 build configs × 6 platforms = 48 possible combinations |

### 6.3 Cross-Domain Dependencies

```
Profile Management ──▶ Species (affected species list)
Profile Management ──▶ User & Auth (permission checks)
Profile Search     ──▶ Profile Management (profile data)
Profile Search     ──▶ Species (species filtering)
Review Workflow    ──▶ User & Auth (reviewer assignments)
Review Workflow    ──▶ Profile Management (section status)
Review Emails      ──▶ Review Workflow (due dates/status)
Review Emails      ──▶ User & Auth (email addresses)
Reporting          ──▶ Profile Management (profile data)
Reporting          ──▶ Species (species data)
Reporting          ──▶ Review Workflow (review timings)
Disease Ranking    ──▶ Profile Management (profile data)
Prioritisation     ──▶ Profile Management (profile data)
```

---

## 7. Service Contract Inventory

All 19 service contract interfaces defined in `Profiles.Contracts/ServiceContracts/`:

| # | Interface | Methods | Domain |
|---|-----------|---------|--------|
| 1 | `IProfileManagementService` | 8 | Profile lifecycle |
| 2 | `IProfileSearchService` | 7 | Search & retrieval |
| 3 | `IProfileVersionDataService` | 6 | Version metadata & answers |
| 4 | `IProfileReportService` | 10+ | Report generation |
| 5 | `IStaticReportService` | 3+ | Static report management |
| 6 | `IUserAuthenticationService` | 2 | Authentication |
| 7 | `IUserMaintenanceService` | 3+ | User provisioning |
| 8 | `ISpeciesDataService` | 5 | Species data |
| 9 | `ISpeciesMaintenanceService` | 3+ | Species admin |
| 10 | `IProfileNoteService` | 3+ | Profile notes |
| 11 | `IProfileQuestionService` | 3+ | Profile questions |
| 12 | `IReviewCommentService` | 3+ | Review comments |
| 13 | `IReferenceValueService` | 3+ | Reference/lookup data |
| 14 | `ISpellCheckService` | 2+ | Spell checking |
| 15 | `IDiseaseRankingService` | 5+ | Disease ranking |
| 16 | `IPrioritisationService` | 3+ | Prioritisation |
| 17 | `IReviewEmailService` | 1 | Review email queries |
| 18 | `IBespokeReportTemplateService` | 6 | Bespoke report templates |
| 19 | `IErrorLogService` | 2+ | Error logging |

---

## 8. Infrastructure Utilities

### `Profiles.Infrastructure/`

| Class/Interface | File | Responsibility |
|----------------|------|----------------|
| `IGlobalSettings` | `Profiles.Infrastructure/IGlobalSettings.cs` | Interface for application configuration: SMTP settings (`SmtpServer`, `SmtpPort`, `FromEmailAddress`, `FromEmailDisplayName`), report URLs (`InternalHomePageUrlForReports`) |
| `LogHelper` | `Profiles.Infrastructure/LogHelper.cs` | Logging utility |
| `ISingleSourceMap<TSource, TDest>` | `Profiles.Infrastructure/Mapping/` | Single-source mapping interface (DTO ↔ entity transforms) |
| `ITripleSourceMap<T1,T2,T3,TDest>` | `Profiles.Infrastructure/Mapping/` | Three-source mapping interface (used by `ReviewEmailDataMap`) |
| Mapping builders | `Profiles.Infrastructure/Mapping/` | Fluent mapping builder infrastructure |

### `Profiles.DiffMatchPatch/`

| Class | Responsibility |
|-------|----------------|
| `diff_match_patch` | Google's diff-match-patch algorithm — used for text comparison in profile content revision tracking |

### `Profiles.Contracts/StringExtensions.vb`

Utility string extensions used across the contracts layer.
