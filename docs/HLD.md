# High-Level Design — Surveillance Profiles (D2R2)

> **Status:** Current-state documentation — describes the system as it exists today.  
> **Last updated:** 2026-03-12  
> **Source branch:** `modernisation_net10`

---

## 1. System Purpose

Surveillance Profiles (internally referred to as **D2R2**) is an internal APHA (Animal and Plant Health Agency) application for creating, editing, reviewing, and publishing disease surveillance profiles. It manages the lifecycle of profiles covering animal diseases, including multi-stage review workflows, species associations, section-level contributions, prioritisation scoring, and bespoke reporting.

---

## 2. Major Components

The solution (`SurveillanceProfiles.sln`) contains **31 projects** organised across six logical solution folders.

### 2.1 Presentation Tier

| Component | Language | Technology | Role |
|-----------|----------|------------|------|
| **Profiles.Web** | VB.NET | ASP.NET WebForms (.NET Framework 4.8) | Primary internal application — ~100 .aspx pages for profile management, search, editing, reporting, user admin |
| **ProfilesWeb** | VB.NET | Legacy folder-based ASP.NET site | Secondary internal web application |
| **ProfilesPublicWeb** | VB.NET | Legacy folder-based ASP.NET site | Public-facing read-only profile viewer |
| **Profiles.SsoHarness** | C# | ASP.NET MVC 5 | SSO integration testing harness |
| **Profiles.SsoSubscriptionService** | VB.NET | ASMX Web Service | Legacy SOAP endpoint for SSO subscription callbacks |
| **Profiles.WebControls** | VB.NET | ASP.NET Server Controls | Shared custom UI controls (Telerik, AjaxControlToolkit) |

### 2.2 Service Tier

| Component | Language | Role |
|-----------|----------|------|
| **Profiles.Services** | VB.NET | 14 WCF SOAP services — profile search, editing, reports, species, auth, notes, disease ranking, etc. |
| **Profiles.Services.Authentication** | VB.NET | Authentication services — CSLA principal loading, Windows auth, SSO token validation |

### 2.3 Business / Domain Tier

| Component | Language | Role |
|-----------|----------|------|
| **ProfilesLibrary** | VB.NET | Core domain model — CSLA 3.0.5 business objects for Profiles, Scenarios, Sections, Species, Users (~25 namespaces) |
| **Profiles.Business** | C# | Modern business logic — email orchestration, bespoke report template management |
| **Profiles.Contracts** | VB.NET | Service contract interfaces (19 `IXxxService` interfaces) and WCF DataContract DTOs |
| **Profiles.Infrastructure** | C# | Cross-cutting utilities — `IGlobalSettings`, `LogHelper`, mapping builder infrastructure |
| **Profiles.DataModels** | C# | NPoco-annotated domain entities — `User`, `ProfileUser`, `BespokeReportTemplate`, review email view models |
| **Profiles.DiffMatchPatch** | C# | Google diff-match-patch algorithm for text comparison |
| **Profiles.EmailService** | C# | SMTP wrapper — `IEmailService` / `ISmtpClient` abstraction |

### 2.4 Data Access Tier

| Component | Language | Role |
|-----------|----------|------|
| **Profiles.DataAccess.Sql** | VB.NET | Legacy ADO.NET data access — 20+ service classes, manual `SqlConnection`/`SqlCommand`, stored procedure calls, `SafeDataReader` wrapper |
| **Profiles.DataAccess.NPoco** | C# | Modern ORM-based data access — NPoco queries against SQL views, transaction support |
| **Profiles.DataAccess.WebServiceClient** | VB.NET | WCF proxy/client — used when deployed in 3-tier mode to call remote services |

### 2.5 Reporting

| Component | Language | Role |
|-----------|----------|------|
| **Profiles.Reports** | VB.NET | Report generation using TallComponents PDF |
| **Profiles.Reports.Extensions** | C# | PDF report extensions |
| **ProfileCreation** | VB.NET (.NET 3.5) | Legacy PDF generation via SAP BusinessObjects DSWS |

### 2.6 Standalone Applications

| Component | Type | Role |
|-----------|------|------|
| **Profiles.ReviewEmails** | C# Console App | Scheduled batch processor — queries users due review emails, composes HTML, sends via SMTP |
| **Profiles.Database** | C# Console App | Database migration runner using AliaSQL — executes Create/Update/Everytime SQL scripts |
| **ProfilesCodeGen** | VB.NET WinForms | Developer tooling — code generation utility |

### 2.7 Test Projects

| Component | Framework |
|-----------|-----------|
| **Profiles.Business.Tests.Unit** | xUnit 2.1.0 + FakeItEasy 1.25.3 |
| **Profiles.Business.Tests.Integration** | xUnit 2.1.0 + FakeItEasy 1.25.3 |
| **Profiles.DataAccess.NPoco.Tests.Unit** | xUnit 2.1.0 |

---

## 3. System Architecture Diagram

```
┌──────────────────────────────────────────────────────────┐
│                    PRESENTATION TIER                      │
│                                                          │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────────┐  │
│  │ Profiles.Web │  │ ProfilesWeb  │  │ProfilesPublicWeb│ │
│  │ (WebForms)   │  │ (Legacy WAP) │  │ (Public site)   │ │
│  └──────┬───────┘  └──────┬───────┘  └───────┬────────┘  │
│         │                 │                   │           │
│         │   Profiles.WebControls (shared UI)  │           │
└─────────┼─────────────────┼───────────────────┼──────────┘
          │                 │                   │
          ▼                 ▼                   ▼
┌──────────────────────────────────────────────────────────┐
│                 DOMAIN / BUSINESS TIER                    │
│                                                          │
│  ┌───────────────┐  ┌──────────────────────────────────┐ │
│  │ ProfilesLibrary│  │ Profiles.Business (C#)           │ │
│  │ (CSLA 3.0.5   │  │  ├─ EmailBusiness                │ │
│  │  VB.NET)       │  │  └─ BespokeReportBusiness        │ │
│  └───────┬───────┘  └────────────┬─────────────────────┘ │
│          │                       │                        │
│  ┌───────┴──────────────┐  ┌─────┴───────────────────┐   │
│  │ Profiles.Contracts   │  │ Profiles.DataModels     │   │
│  │ (19 I-interfaces +   │  │ (NPoco entities +       │   │
│  │  WCF DataContracts)  │  │  view models)           │   │
│  └───────┬──────────────┘  └─────────────────────────┘   │
│          │  DataFactory.vb (StructureMap IoC)              │
└──────────┼────────────────────────────────────────────────┘
           │
           ▼  ←── UseSQLDirectly toggle
┌──────────────────────────────────────────────────────────┐
│                   DATA ACCESS TIER                        │
│                                                          │
│  ┌──────────────────┐    ┌──────────────────────────┐    │
│  │ DataAccess.Sql   │    │ DataAccess.NPoco         │    │
│  │ (VB.NET, ADO.NET)│    │ (C# ORM, views/tables)   │    │
│  │ 20+ services     │    │ 3 services               │    │
│  │ SafeDataReader   │    │ DatabaseInitializer       │    │
│  └────────┬─────────┘    └──────────┬───────────────┘    │
│           │                         │                     │
│  ┌────────┴─────────────────────────┴───────────────┐    │
│  │          OR (3-tier mode)                         │    │
│  │  DataAccess.WebServiceClient (WCF proxies)        │    │
│  └───────────────────────┬───────────────────────────┘    │
└──────────────────────────┼────────────────────────────────┘
                           │
                           ▼
┌──────────────────────────────────────────────────────────┐
│                      DATABASE                            │
│                                                          │
│              SQL Server — SurveillanceProfiles            │
│              (Stored Procedures + Views + Tables)         │
│              Migrations: AliaSQL (54 update scripts)      │
└──────────────────────────────────────────────────────────┘
```

---

## 4. Data Stores

| Store | Technology | Purpose |
|-------|-----------|---------|
| **SurveillanceProfiles** | SQL Server | Single relational database — profiles, users, species, review tracking, reference data. Accessed via stored procedures (~50+) and SQL views (`vwReviewEmailUsers`, `vwReviewEmailProfiles`, `vwReviewEmailProfileSections`). |
| **ASP.NET Session** | InProc (IIS) | User session state — `ProfilesIdentity`, cached edit objects, search state. 20-minute timeout. |
| **Module-level cache** | In-memory (static) | Profile metadata and species metadata cached in `DataFactory.vb` module-level variables with no expiry/invalidation. |

---

## 5. External Dependencies

### 5.1 Runtime Services

| Dependency | Protocol | Purpose |
|------------|----------|---------|
| **SQL Server** | TCP 1433/1434 | Primary data store (`SurveillanceProfiles` database) |
| **SMTP Server** | TCP 25 (localhost) | Outbound email delivery (review notifications) |
| **SsoUserManagement** | SOAP/HTTP | External SSO user identity service (`Service.asmx`) |
| **IIS** | HTTP/HTTPS | Application hosting (WebForms + WCF services) |

### 5.2 Key Third-Party Libraries

| Library | Version | Purpose |
|---------|---------|---------|
| **CSLA .NET** | 3.0.5 | Component-based business object framework (embedded in `ProfilesLibrary`) |
| **StructureMap** | 2.4.9 | IoC / dependency injection container |
| **NPoco** | 4.0.2 | Lightweight ORM for modern data access layer |
| **Telerik UI for ASP.NET AJAX** | 2024 Q4 1114 | Rich UI controls (grids, trees, editors) |
| **AjaxControlToolkit** | 4.1.60919 | ASP.NET AJAX control library |
| **TallComponents PDF Layout** | (bundled) | PDF document generation (licensed per environment) |
| **BusinessObjects DSWS** | 11.5.4100 | Legacy SAP Crystal Reports integration |
| **Newtonsoft.Json** | 7.0.1 | JSON serialization |
| **AntiXSS** | 4.3.0 | HTML sanitization / XSS prevention |
| **xUnit** | 2.1.0 | Unit test framework |
| **FakeItEasy** | 1.25.3 | Mocking library |

### 5.3 Build-Time Dependencies

| Dependency | Purpose |
|------------|---------|
| **NuGet** | Package restore (via `packages.config` per project) |
| **Visual Studio Build Tools** | MSBuild compilation |
| **AliaSQL** | Database migration runner (bundled in `Profiles.Database/scripts/`) |

---

## 6. Deployment Topology

The system supports **three deployment configurations**, selectable via solution build configurations and `Web.config` transforms:

### 6.1 Two-Tier (Direct SQL)

```
┌──────────┐         ┌──────────────┐
│  IIS     │  SQL    │  SQL Server  │
│  Web App │────────▶│  Database    │
└──────────┘         └──────────────┘
```

- `AppSettings["UseSQLDirectly"] = "true"`
- StructureMap resolves `IXxxService` → `DataAccess.Sql.*` implementations
- All data access happens in-process via ADO.NET + stored procedures

### 6.2 Three-Tier (WCF Services)

```
┌──────────┐  SOAP   ┌──────────────┐  SQL    ┌──────────────┐
│  IIS     │────────▶│  WCF Service │────────▶│  SQL Server  │
│  Web App │         │  Host (IIS)  │         │  Database    │
└──────────┘         └──────────────┘         └──────────────┘
```

- `AppSettings["UseSQLDirectly"] = "false"`
- StructureMap resolves `IXxxService` → `DataAccess.WebServiceClient.*` (WCF proxies)
- WCF endpoints use `wsHttpBinding` with message-level security (200 MB message limit)
- Service host at `http://vla71live/ProfilesServices/*` (live) or `localhost:44357` (dev)

### 6.3 Azure

- Variant of the above topologies adapted for Azure hosting
- Separate config transforms for UAT Azure and Live Azure

### Batch Processing

```
┌─────────────────────┐  SQL    ┌──────────────┐
│ Profiles.ReviewEmails│────────▶│  SQL Server  │
│ (Scheduled Console)  │         │  Database    │
│                      │  SMTP   ┌──────────────┐
│                      │────────▶│  Mail Server │
└─────────────────────┘         └──────────────┘
```

- Runs on a schedule (external scheduler)
- Uses its own StructureMap container configuration
- Authenticates as a system CSLA user

---

## 7. Runtime Assumptions

| Aspect | Detail |
|--------|--------|
| **Hosting** | IIS 7.0+ on Windows Server |
| **Framework** | .NET Framework 4.8 (all projects except legacy `ProfileCreation` targeting .NET 3.5) |
| **Authentication** | Windows Authentication (internal), Forms Authentication with SSO (external harness) |
| **Session** | InProc, 20-minute sliding expiry |
| **Database** | SQL Server (SQL auth via `VLAProfilesUser` service account) |
| **SMTP** | localhost:25 (no auth) |
| **PDF Licensing** | TallComponents license keys differ per environment (dev vs live) |
| **Machine Keys** | Hardcoded in Web.config for session/ViewState protection |
| **CI/CD** | Azure Pipelines — NuGet restore → VS Build → VSTest on `windows-latest` agent |
| **Branch strategy** | Triggers on `master` branch |

---

## 8. Component Dependency Graph

```
Profiles.Web ──────────────────────┐
  ├─▶ ProfilesLibrary (CSLA)       │
  ├─▶ Profiles.Contracts            │
  ├─▶ Profiles.Services             │
  ├─▶ Profiles.WebControls          │
  └─▶ Profiles.Business ◀──────────┤
       ├─▶ Profiles.Contracts       │
       ├─▶ Profiles.DataAccess.NPoco│
       ├─▶ Profiles.DataModels      │
       ├─▶ Profiles.EmailService    │
       ├─▶ Profiles.Infrastructure  │
       └─▶ ProfilesLibrary          │
                                    │
Profiles.DataAccess.NPoco           │
  ├─▶ Profiles.Contracts            │
  ├─▶ Profiles.DataModels           │
  └─▶ Profiles.Infrastructure       │
                                    │
Profiles.DataAccess.Sql             │
  └─▶ (CSLA embedded, no proj ref) │
                                    │
Profiles.Reports                    │
  └─▶ ProfilesLibrary               │
                                    │
Profiles.Reports.Extensions         │
  └─▶ ProfilesLibrary               │
```

---

## 9. Language Distribution

| Language | Project Count | Role |
|----------|--------------|------|
| VB.NET | 13 projects | Legacy core — domain model, web UI, data access, contracts, services, reports |
| C# | 12 projects | Modern additions — business logic, NPoco data access, infrastructure, email, tests |

The codebase shows an incremental modernisation pattern: newer components are written in C# while the original VB.NET projects remain operational.
