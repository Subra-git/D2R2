# ADR-003: CSLA Framework as Domain Model Foundation

**Status:** Accepted (implicit)  
**Date discovered:** 2026-03-12  
**Context source:** `ProfilesLibrary/` (all CSLA business objects), embedded CSLA 3.0.5 assemblies

## Context

The core domain model in `ProfilesLibrary/` is built on **CSLA .NET 3.0.5** (Component-based Scalable Logical Architecture), a framework from approximately 2007. CSLA provides:

- `BusinessBase<T>` base class for editable business objects (e.g., `Profile.vb`)
- `ReadOnlyListBase<T>` for read-only collections (e.g., `ProfileInfoList.vb`)
- `DataPortal` for transparent client/server data access (`DataPortal_Create`, `DataPortal_Fetch`, `DataPortal_Insert`, `DataPortal_Update`)
- `ApplicationContext.User` for security principal propagation
- Built-in validation rules, dirty tracking, and undo support

The CSLA assemblies appear to be embedded directly in the project (not sourced from NuGet).

## Decision

All original domain logic was built as CSLA business objects. Business rules, authorisation checks, validation, and data portal operations are co-located within each business object class.

## Consequences

- **Positive:** CSLA provides built-in n-level undo, dirty tracking, and validation rules — reducing boilerplate in the original implementation.
- **Positive:** The `DataPortal` pattern enabled the 2-tier/3-tier deployment flexibility (ADR-002).
- **Negative:** CSLA 3.0.5 is ~19 years old. It predates modern .NET patterns (async/await, dependency injection, CQRS). Upgrading to current CSLA versions (8.x) would require significant refactoring.
- **Negative:** Business logic and data access are tightly coupled within `DataPortal_Xxx` methods. `Profile.vb` mixes domain rules with `SqlCommand` building and DTO mapping, making unit testing impractical without the full CSLA infrastructure.
- **Negative:** CSLA's static `ApplicationContext.User` and `DataPortal` usage makes the domain layer resistant to modern DI patterns. The newer `Profiles.Business` (C#) layer does not use CSLA.
- **Evidence:** `ProfilesLibrary/Profiles/Profile.vb` contains `DataPortal_Create()`, `DataPortal_Fetch()`, `DataPortal_Insert()`, `DataPortal_Update()` methods that directly invoke `DataFactory.GetProfileManagementService()` and map between DTOs and object state.
- **Evidence:** `ProfilesLibrary/Security/ProfilesIdentity.vb` and `ProfilesPrincipal.vb` implement CSLA's identity/principal model for role-based access.
