# ADR-002: Switchable Deployment Topology (2-Tier / 3-Tier / Azure)

**Status:** Accepted (implicit)  
**Date discovered:** 2026-03-12  
**Context source:** `Profiles.Web/IoC/WebsiteRegistry.vb`, `Profiles.Web/Web.config`, solution build configurations

## Context

The application supports three deployment topologies selected via `AppSettings["UseSQLDirectly"]` and solution build configurations:

- **2-Tier:** Web application calls `Profiles.DataAccess.Sql` classes directly (in-process ADO.NET → SQL Server).
- **3-Tier:** Web application calls `Profiles.DataAccess.WebServiceClient` WCF proxy classes, which make SOAP calls to a separate WCF service host (`Profiles.Services`), which then calls `Profiles.DataAccess.Sql`.
- **Azure:** Variants of the above adapted for cloud hosting.

The solution file defines **8 build configurations** (Local 2-tier, Local 3-tier, UAT 2-tier, UAT 3-tier, UAT Azure, Live 2-tier, Live 3-tier, Live Azure) × **6 platforms** = 48 possible build combinations.

## Decision

Service interfaces (`IProfileSearchService`, etc.) were defined in `Profiles.Contracts`, and the StructureMap IoC container in `WebsiteRegistry.vb` switches implementations at startup. WCF services in `Profiles.Services` expose the same interfaces as a separate host for 3-tier mode. `Web.config` transforms apply environment-specific endpoint URLs, certificates, and security settings.

## Consequences

- **Positive:** Same codebase deploys to development (2-tier, simple) and production (3-tier, distributed) without code changes.
- **Positive:** All 19 service interfaces are pluggable — any can be swapped between direct SQL, WCF, or NPoco.
- **Negative:** 48 build configuration permutations create a large configuration surface area. Config transform files must be maintained for each combination.
- **Negative:** WCF service layer (`Profiles.Services/`) adds 14 WCF service classes that are thin wrappers, adding maintenance overhead.
- **Negative:** WCF `wsHttpBinding` with 200 MB message limits and message-level security adds serialisation overhead in 3-tier mode.
- **Evidence:** `Profiles.Web/IoC/WebsiteRegistry.vb` contains `RegisterDirectSql()` and `RegisterWCF()` methods that wire all 17 service registrations.
