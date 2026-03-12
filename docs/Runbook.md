# Runbook — Surveillance Profiles (D2R2)

> **Status:** Current-state documentation — describes the system as it runs today.  
> **Last updated:** 2026-03-12  
> **Source branch:** `modernisation_net10`

---

## 1. Build Commands

### 1.1 CI/CD Pipeline (Azure Pipelines)

Defined in [azure-pipelines.yml](../azure-pipelines.yml). Triggers on `master` branch.

```
Agent:    windows-latest
Steps:
  1. NuGet restore    → nuget restore **/*.sln
  2. VS Build         → msbuild /p:DeployOnBuild=true /p:WebPublishMethod=Package
                              /p:PackageAsSingleFile=true /p:PackageLocation="$(build.artifactStagingDirectory)"
     Platform:        Any CPU
     Configuration:   Release
  3. VS Test          → vstest (discovers xUnit tests automatically)
```

### 1.2 Local Build

**Prerequisites:**
- Visual Studio 2022 (or later) with .NET Framework 4.8 targeting pack
- NuGet CLI or Visual Studio NuGet package manager

**Steps:**

```powershell
# 1. Restore NuGet packages
nuget restore SurveillanceProfiles.sln

# 2. Build the solution (Debug configuration for local development)
msbuild SurveillanceProfiles.sln /p:Configuration=Debug /p:Platform="Any CPU"

# Or build a specific deployment configuration:
msbuild SurveillanceProfiles.sln /p:Configuration="Local 2-tier" /p:Platform="Any CPU"
```

**Available build configurations:**
- `Debug`, `Release`
- `Local 2-tier`, `Local 3-tier`
- `UAT 2-tier`, `UAT 3-tier`, `UAT Azure`
- `Live 2-tier`, `Live 3-tier`, `Live Azure`

---

## 2. Run Commands

### 2.1 Web Application (Profiles.Web)

**IIS Express (Visual Studio):**
1. Open `SurveillanceProfiles.sln` in Visual Studio
2. Set `Profiles.Web` as startup project
3. Press F5 (Debug) or Ctrl+F5 (without debugger)

**IIS (Full):**
1. Create an IIS site pointing to the `Profiles.Web/` folder
2. Configure the application pool for .NET Framework 4.8, Integrated pipeline mode
3. Enable Windows Authentication on the site (disable Anonymous if using Windows auth)
4. Ensure the `ProfilesDatabase` connection string in `Web.config` points to the correct SQL Server

### 2.2 Review Email Processor

```powershell
# Run the console application directly
Profiles.ReviewEmails\bin\Debug\Profiles.ReviewEmails.exe
```

Requires:
- A valid `App.config` with `ProfilesDatabase` connection string
- SMTP server accessible on localhost:25
- `CslaAuthentication.User` app setting configured with a system user name

### 2.3 Database Migration Runner

```powershell
# Run interactively — prompts for operation (Create/Update/Rebuild/TestData/Baseline)
Profiles.Database\bin\Debug\Profiles.Database.exe
```

Uses AliaSQL (`Profiles.Database/scripts/AliaSQL.exe`) to apply SQL scripts from:
- `scripts/Create/` — initial database creation (login + database)
- `scripts/Update/` — incremental schema changes (54 scripts: 0001–0054)
- `scripts/Everytime/` — scripts executed on every deployment
- `scripts/TestData/` — test fixture data

---

## 3. Test Commands

### 3.1 Run All Tests

```powershell
# Via Visual Studio Test runner
vstest.console.exe Profiles.Business.Tests.Unit\bin\Debug\Profiles.Business.Tests.Unit.dll ^
                   Profiles.Business.Tests.Integration\bin\Debug\Profiles.Business.Tests.Integration.dll ^
                   Profiles.DataAccess.NPoco.Tests.Unit\bin\Debug\Profiles.DataAccess.NPoco.Tests.Unit.dll
```

Or from Visual Studio: **Test → Run All Tests**

### 3.2 Test Projects

| Project | Type | Framework | Notes |
|---------|------|-----------|-------|
| `Profiles.Business.Tests.Unit` | Unit | xUnit 2.1.0 + FakeItEasy 1.25.3 | Tests `EmailBusiness` and `BespokeReportTemplateService` |
| `Profiles.Business.Tests.Integration` | Integration | xUnit 2.1.0 + FakeItEasy 1.25.3 | Tests `EmailBusiness` with real dependencies; requires `App.config` with connection string |
| `Profiles.DataAccess.NPoco.Tests.Unit` | Unit | xUnit 2.1.0 | Tests NPoco services and data mapping |

### 3.3 Test Coverage Gaps

- No tests for `ProfilesLibrary` (CSLA business objects)
- No tests for `Profiles.DataAccess.Sql` (20+ VB.NET services)
- No tests for WebForms code-behind pages
- No tests for WCF service layer
- No end-to-end or UI tests

---

## 4. Local Dependencies and Configuration

### 4.1 Required Software

| Dependency | Version | Purpose |
|------------|---------|---------|
| Windows OS | 10/11 or Windows Server | IIS hosting |
| .NET Framework | 4.8 | Runtime (all projects) |
| Visual Studio | 2022+ | IDE and build tools |
| SQL Server | 2016+ | Database (`SurveillanceProfiles`) |
| IIS | 7.0+ | Web application hosting (production) |
| NuGet CLI | Latest | Package restore |

### 4.2 Optional / Legacy Software

| Dependency | Purpose | Notes |
|------------|---------|-------|
| `en_ASP_.NET_ajax_1.0.msi` | Legacy Microsoft AJAX component | Located in `Libraries/`. Required on new build VMs. |
| SAP BusinessObjects | Crystal Reports PDF generation | Required by `ProfileCreation` project (targets .NET 3.5) |

### 4.3 Database Setup

**Option A — Restore from backup:**
The `Database/` folder contains an initial database backup from the MAS development VM. Restore this into a local SQL Server instance.

**Option B — Create from scripts:**
1. Build and run `Profiles.Database.exe`
2. Select "Create" operation
3. Provide connection string to local SQL Server
4. Run "Update" to apply all 54 incremental scripts
5. Optionally run "TestData" to load fixtures

### 4.4 Connection Strings

All projects use the connection string named `ProfilesDatabase` from their respective config files:

| Environment | Server | Database | Auth |
|-------------|--------|----------|------|
| Local dev | `.` or `localhost` | `SurveillanceProfiles` | SQL Auth (`VLAProfilesUser`) |
| Dev VM | `10.98.2.4` | `SurveillanceProfiles` | SQL Auth |
| Local test | `10.201.2.20` | `SurveillanceProfiles` | SQL Auth |
| Live | `dawhedbs01:1434` | `SurveillanceProfiles` | SQL Auth |

### 4.5 Key App Settings

| Setting | Location | Purpose |
|---------|----------|---------|
| `UseSQLDirectly` | `Profiles.Web/Web.config` | `true` = 2-tier (direct SQL), `false` = 3-tier (WCF proxies) |
| `CslaAuthentication` | `Web.config` / `App.config` | CSLA principal type configuration |
| `CslaAuthentication.User` | `Profiles.ReviewEmails/App.config` | System user for batch email processing |
| `SearchUseTextSearch` | `ProfilesLibrary/GlobalSettings.vb` | Toggle SQL full-text search |
| `SearchUseExactWordMatch` | `ProfilesLibrary/GlobalSettings.vb` | Toggle exact word matching in search |

### 4.6 SMTP Configuration

| Setting | Dev Value | Live Value |
|---------|-----------|------------|
| Server | `localhost` | `localhost` |
| Port | `25` | `25` |
| From address | `testing@sfwltd.co.uk` | `noreply@apha.gov.uk` |

### 4.7 Third-Party Licenses

| Component | License Type | Notes |
|-----------|-------------|-------|
| Telerik UI for ASP.NET AJAX | Commercial (2024 Q4 1114 Dev hotfix) | Binaries in `lib/Telerik UI for ASP.NET AJAX 2024 Q4 1114 Dev hotfix/` |
| TallComponents PDF Layout | Per-environment license keys | Dev key and live key configured in `Web.config` |

---

## 5. Known Limitations and Technical Debt

### 5.1 Framework and Library Age

| Item | Current Version | Latest Available | Gap |
|------|----------------|-----------------|-----|
| .NET Framework | 4.8 | .NET 10 (LTS) | End of .NET Framework feature development; security-only patches |
| CSLA .NET | 3.0.5 (~2007) | 8.x | 17 years behind; no async, no modern DI |
| StructureMap | 2.4.9 | Discontinued | Replaced by Lamar in the ecosystem |
| Newtonsoft.Json | 7.0.1 | 13.x | 6 major versions behind |
| xUnit | 2.1.0 | 2.9.x | 8 minor versions behind |
| FakeItEasy | 1.25.3 | 8.x | 7 major versions behind |
| AjaxControlToolkit | 4.1.60919 | 20.x | Severely outdated |
| AntiXSS | 4.3.0 | Deprecated | Microsoft recommends `System.Web.Security.AntiXss.AntiXssEncoder` |

### 5.2 Architecture Constraints

| Constraint | Impact |
|------------|--------|
| **WebForms UI** | ~100+ .aspx pages tied to code-behind pattern. No separation of concerns. Difficult to unit test. |
| **CSLA DataPortal** | Business objects embed data access logic. Cannot be tested without CSLA infrastructure. |
| **Static IoC** | `ObjectFactory.GetInstance<T>()` is a service locator anti-pattern. Most code does not use constructor injection. |
| **Module-level caching** | `DataFactory.vb` caches profile and species metadata with no invalidation mechanism. Requires app restart to refresh. |
| **Multi-result-set parsing** | `ProfileSearchService.GetAllProfiles()` parses 9+ result sets by position. Schema changes to `spgaProfile` stored procedure silently break parsing. |
| **Machine keys in config** | Hardcoded `<machineKey>` values in `Web.config`. Should be managed via secure key storage. |
| **No containerisation** | Traditional IIS deployment only. No Docker support. |
| **Legacy project** | `ProfileCreation` targets .NET Framework 3.5 and depends on SAP BusinessObjects DSWS 11.5. |

### 5.3 Testing Gaps

- **No tests** for the largest codebases: `ProfilesLibrary` (CSLA objects), `Profiles.DataAccess.Sql` (20+ services), `Profiles.Web` (100+ pages)
- **Integration tests** require a live SQL Server database connection
- **No automated UI/E2E tests**
- **No performance/load tests**

### 5.4 Operational Concerns

| Concern | Detail |
|---------|--------|
| **Session state** | InProc only — cannot scale to multiple IIS instances without switching to distributed session (SQL or Redis) |
| **Error logging** | `IErrorLogService` logs to database. No structured logging framework (Serilog, NLog, etc.) |
| **Health checks** | No health-check endpoint for monitoring |
| **Deployment** | Manual IIS deployment or Azure Pipelines packaging. No blue/green or canary deployments |
| **Secrets management** | Connection strings and credentials stored in plain text in `Web.config` / `App.config` |
