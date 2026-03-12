# ADR-001: Dual Data Access Layer (ADO.NET + NPoco ORM)

**Status:** Accepted (implicit)  
**Date discovered:** 2026-03-12  
**Context source:** `Profiles.DataAccess.Sql/` (VB.NET) and `Profiles.DataAccess.NPoco/` (C#)

## Context

The system has two parallel data access layers targeting the same SQL Server database:

1. **`Profiles.DataAccess.Sql`** — 20+ VB.NET service classes using manual `SqlConnection`/`SqlCommand` with stored procedures and `SafeDataReader`.
2. **`Profiles.DataAccess.NPoco`** — 3 C# service classes using the NPoco ORM querying tables and SQL views directly.

Both layers implement the same service contract interfaces (e.g., `IUserAuthenticationService` exists in both). The StructureMap IoC container (`Profiles.Web/IoC/WebsiteRegistry.vb`) selects which implementation to use at startup. Currently, the NPoco layer handles review emails, bespoke report templates, and a second user authentication implementation; all other data access uses the SQL layer.

## Decision

New data access features were built using NPoco (C#) rather than extending the legacy ADO.NET layer. Existing VB.NET services were left in place and remain the primary implementation for most domains.

## Consequences

- **Positive:** NPoco services are simpler, testable (unit tests exist in `Profiles.DataAccess.NPoco.Tests.Unit`), and use parameterised ORM queries instead of manual parsing.
- **Negative:** `IUserAuthenticationService` has two implementations that can diverge. A bug fix in one may not be replicated in the other.
- **Negative:** Two data access patterns increases cognitive load for developers. New team members must understand both ADO.NET/SP patterns and NPoco/ORM patterns.
- **Evidence:** `Profiles.DataAccess.NPoco/Services/UserAuthentication/UserAuthenticationService.cs` reads `User`, `ProfileUser`, `ProfileUserRole`, `ProfileSectionUser` entities directly, while `Profiles.DataAccess.Sql/UserAuthenticationService.vb` calls stored procedure `spgUserAuthorisation`.
