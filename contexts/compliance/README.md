# Compliance context

This context defines a machine-readable, human-governed bridge from legal
instruments to Solid-Databox controls. It is decision-support infrastructure,
not an automated declaration of legal compliance and not legal advice.

The first executable profile is Australian federal privacy and Consumer Data
Right support in the Community Solid Server implementation. Its source of truth
is the Federal Register of Legislation; the Web Civics corpus is a separately
identified derived representation used for provision discovery and processing.

## Required model

Every compliance release records:

- jurisdiction and organization applicability facts, including unresolved facts;
- an authoritative instrument identifier, official URL, corpus URL and source
  and corpus SHA-256 digests;
- provision citations and stable concept IRIs;
- obligation triggers, statutory exceptions, deadlines and remedies;
- provision-to-control mappings and evidence requirements;
- executable control-test results;
- effective dates, version status and legal-change impact;
- a signed or otherwise verifiable human legal-review attestation; and
- consumer and auditor views generated from the same mapping set.

Applicability has three values: `applicable`, `not-applicable`, and
`indeterminate`. Missing organization facts always produce `indeterminate`.
Mappings begin as `proposed`; software and language models cannot promote them
to `attested`.

## Publication gate

A release that claims legal compliance is blocked when any applicable mapping
has unknown or failed controls, missing/unverified/expired evidence, an unresolved
applicability fact, a changed corpus digest, or no current qualified human
attestation. A technical release making no legal claim is a separate publication
class and must not inherit a compliance label by implication.

## Current Australian baseline

The initial profile uses:

- Privacy Act 1988 compilation `C2026C00227`: APP 1, 5, 6, 8, 10–13 and
  Notifiable Data Breaches provisions 26WH, 26WK and 26WL;
- Competition and Consumer (Consumer Data Right) Rules 2020 compilation
  `F2025C00572`: the CDR correction workflow, 10-business-day rule and consumer
  dashboard requirement.

These mappings remain proposed pending qualified review of organizational
applicability, full provision text, exceptions, current effective dates and
sector-specific rules. The executable inventory is documented in
[`implementations/css/compliance-framework.md`](../../implementations/css/compliance-framework.md).

## Copyright and licences

Legal instruments, their official publication, the derived Web Civics corpus,
and the software that presents or evaluates mappings are distinct works. Each
artifact must retain its own source and rights statement. A software licence
must never be represented as licensing the underlying legislation.
