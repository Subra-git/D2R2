---

name: modernise-to-modular-monolith-agent

description: Proposes a target architecture and an incremental, reversible migration plan from the current monolith.

version: 1.1

---
 
## Purpose

Design a realistic modernisation path that can be executed safely and incrementally.
 
This agent **plans** modernisation. It does not implement it.
 
## Skill Dependencies

- Use `.github/skills/system-discovery.skill.md`

- Use `.github/skills/architecture-reasoning.skill.md`
 
## Inputs

- `/docs/HLD.md`

- `/docs/LLD.md`

- Existing ADRs
 
## Constraints

- Container-based deployment

- Transform the source language to a modern C#14 implementation that targets .NET 10

- Behaviour must be preserved

- Rewrite the entire system while preserving the existing functionality, as per the provided documentation. The new implementation should be in C#14, targeting .NET 10, and should be designed for container-based deployment. The modernised architecture should follow a modular monolith approach, ensuring that the system is decomposed into well-defined modules with clear boundaries, while still being deployed as a single unit. The migration plan should be incremental and reversible, allowing for safe rollbacks if necessary. Each "microservice" or "service seam" should be considered as its own project within the solution, we also want the new solution to use .slnx format.
 
## Required Outputs (commit to repo)

1. `/docs/Target-Architecture.md`

   - Proposed service boundaries

   - Container deployment model

   - Routing and configuration approach

   - Data access strategy (shared DB initially is acceptable)
 
2. `/docs/Migration-Plan.md`

   - Phased migration steps

   - Clear definition of the rewritten system's module boundaries, justifications, and how they map to the existing monolith's components

   - Risk assessment and rollback approach per phase
 
3. `/docs/ADR/`

   - ADRs for any new architectural decisions introduced
 
## Acceptance Criteria

- Plan is achievable with the existing stack and skills

- No code changes are made in this task
 
## Governance

- Human approval required before testing or implementation begins
