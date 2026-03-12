# ADR-004: Mixed VB.NET and C# Codebase with Incremental Language Migration

**Status:** Accepted (implicit)  
**Date discovered:** 2026-03-12  
**Context source:** `SurveillanceProfiles.sln` — 13 VB.NET projects, 12 C# projects

## Context

The solution contains a mix of VB.NET and C# projects:

- **VB.NET (13 projects):** The original codebase — `ProfilesLibrary`, `Profiles.Web`, `Profiles.Contracts`, `Profiles.DataAccess.Sql`, `Profiles.Services`, `Profiles.Services.Authentication`, `Profiles.Reports`, `Profiles.WebControls`, `ProfilesCodeGen`, `Profiles.SsoSubscriptionService`, and legacy web projects.
- **C# (12 projects):** Later additions — `Profiles.Business`, `Profiles.DataAccess.NPoco`, `Profiles.DataModels`, `Profiles.Infrastructure`, `Profiles.EmailService`, `Profiles.DiffMatchPatch`, `Profiles.Reports.Extensions`, `Profiles.ReviewEmails`, `Profiles.Database`, `Profiles.SsoHarness`, and all 3 test projects.

The pattern is consistent: all **newer** components (modern business logic, NPoco data access, infrastructure, email service, tests, database migrations) are written in C#, while all **original** components remain in VB.NET.

## Decision

Rather than rewriting the entire codebase, new features and modernised layers were implemented in C# alongside the existing VB.NET code. Cross-language project references allow C# projects to consume VB.NET assemblies and vice versa.

## Consequences

- **Positive:** Allowed incremental modernisation without a risky "big bang" rewrite. New features benefit from modern C# capabilities (generics, async, LINQ, etc.).
- **Positive:** Test projects (all C#) can reference and test both C# and VB.NET assemblies.
- **Negative:** Developers must be proficient in both VB.NET and C#. The VB.NET code follows different conventions (Modules, `Dim`/`As`, `DirectCast`, `ReadOnly Property` syntax).
- **Negative:** The contract layer (`Profiles.Contracts`) is VB.NET with WCF `<DataContract()>` attributes, while the NPoco data models (`Profiles.DataModels`) are C# with NPoco `[TableName]`/`[PrimaryKey]` attributes — two parallel entity representations.
- **Evidence:** The branch name `modernisation_net10` suggests an ongoing or planned migration to .NET 10, which would further formalise the shift to C#.
