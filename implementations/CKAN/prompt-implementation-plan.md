# `ckanext-databox` Prompt Implementation Plan

## Purpose

This is the ordered implementation plan for a coding agent working in a pinned CKAN source/deployment repository.
It complements, rather than replaces, the design and conformance documents in this folder.

## Global prompt preamble

> You are implementing `ckanext-databox`, a CKAN extension that provides organisation-hosted Solid Databox
> functionality for institutions using CKAN for public and sensitive data. Read every document in this target and all
> accepted ADRs/handoffs before editing. Preserve CKAN source authorization, exact subject/field selection, programme
> isolation, separate workforce/service/consumer identity, append-only exchange, signed receipts, human-reviewed
> correction and Solid interoperability. Use supported CKAN plugin interfaces and extension-owned migrations; do not
> fork core or modify core tables. Never put personal mappings, credentials or payloads in dataset extras, Solr,
> activity streams, RQ arguments or logs. Do not weaken an invariant to make a test pass. Stop dependent work when a
> security, protocol or legal decision remains unresolved. Finish with changed files, decisions used, tests run,
> residual risks and the next task's inputs.

## Handoff contract

Every work package produces:

- a changed-file summary;
- accepted decisions and exact dependency/specification versions;
- tests and validation run;
- new or changed requirements/ADRs;
- security and privacy observations;
- unresolved blockers; and
- machine-readable fixtures needed downstream.

## Wave A — Discovery and decisions

### CKP-01 — CKAN deployment inventory

**Difficulty:** medium

Inspect the target CKAN release and reference deployment. Record plugin interfaces, Action API patterns, auth/SSO,
dataset schemas, DataStore, FileStore, Solr, Redis/RQ, harvesters, migrations, tests and deployment tooling. Inventory
installed extensions and identify conflicts. Make no production changes.

### CKP-02 — Resolve implementation decisions

**Difficulty:** hard

Resolve O-01 through O-12 in [Implementation decisions](implementation-decisions.md). Pin CKAN, Python, Solid/LWS,
proof and storage baselines. Produce ADRs with alternatives, consequences and test implications.

### CKP-03 — Threat model

**Difficulty:** hard

Model CKAN users/sysadmins, organization roles, institutional services, consumers/guardians, PostgreSQL, Solr,
DataStore, FileStore, Redis/RQ, harvesters, source systems, gateway, evidence, backups and observability. Cover
cross-subject selection, token confusion, SSRF, injection, malicious RDF, bulk-action bypass, metadata leakage,
operator bypass and policy substitution. Map each threat to controls and tests.

### CKP-04 — Executable requirements

**Difficulty:** hard

Translate [Conformance requirements](conformance-requirements.md) into machine-traceable requirements and test IDs.
Add exact CKAN and Solid assertions. Define positive, negative and evidence expectations for each conformance class.

## Wave B — Extension foundation

### CKP-05 — Extension scaffold

**Difficulty:** easy

Scaffold the package using the pinned CKAN extension conventions. Add plugin registration, config declaration,
templates/assets, CLI/test wiring and empty extension migration chain. Do not create unresolved protocol interfaces.

### CKP-06 — Programme and publisher models

**Difficulty:** medium

Implement verified publisher bindings, immutable programme versions, status transitions, processor chains,
institutional roles and signatures. Add migrations, actions, auth functions, validation and tests. Do not store
consumer relationships yet.

### CKP-07 — CKAN metadata integration

**Difficulty:** medium

Implement the selected dataset-schema integration for safe Databox programme metadata. Strip protected fields before
indexing and activity rendering. Test public/private datasets, search, API output and compatibility with the selected
schema extension.

### CKP-08 — Source binding schema

**Difficulty:** hard

Implement immutable source bindings, subject-selection contracts, field allow-lists, authority/provenance,
classification and transformation references. Add valid/invalid fixtures. Activation requires reviewed programme and
source signatures.

## Wave C — Source adapters and durable work

### CKP-09 — Durable outbox and worker

**Difficulty:** hard

Implement extension-owned outbox models, leases, attempts, retry policy, idempotency, terminal failure and
reconciliation. RQ jobs accept opaque event IDs only. Add crash-before/after-commit and duplicate-delivery tests.

### CKP-10 — Public resource adapter

**Difficulty:** medium

Implement a bounded adapter for one permissively licensed synthetic CKAN resource. Preserve dataset/resource
version, publisher, licence and transformation provenance. Show that relationship linkage remains private even when
source facts are public.

### CKP-11 — Private DataStore adapter

**Difficulty:** hard

Implement a least-privilege, parameterized adapter for the synthetic permit table. Allow only the configured
resource, typed subject selector and fields. Prohibit arbitrary SQL/filter/field input. Test cross-subject,
cross-resource, dump/search and timing/error leakage.

### CKP-12 — File and external-source hardening

**Difficulty:** hard

Implement optional bounded streaming/extraction for an approved file and URL. Add digest/media/size limits, redirect
and private-network controls, quarantine contract and multi-subject extraction tests.

## Wave D — Identity, relationship and Solid surface

### CKP-13 — Workforce and service authorization

**Difficulty:** hard

Implement extension roles and auth functions, service identities, step-up gates and separation of duties. Prove that
organization editor and sysadmin convenience paths do not silently become programme/data-plane authority.

### CKP-14 — Relationship provisioning

**Difficulty:** hard

Implement opaque programme-local relationships, encrypted source mapping, linking/recovery ceremony, guardianship
hooks and two isolated synthetic consumers. Ensure no protected identifiers enter CKAN search, activities, logs or
metrics.

### CKP-15 — Consumer authentication and connection credential

**Difficulty:** hard

Implement the adopted Solid authentication/access profile and holder-bound Databox Connection Credential lifecycle.
Keep it distinct from CKAN sessions/API tokens and short-lived access tokens. Add issuer, audience, replay,
revocation, rotation and key-substitution tests.

### CKP-16 — Solid gateway and storage

**Difficulty:** hard

Implement the chosen embedded or CSS-backed gateway. Provide pinned discovery, HTTP/RDF operations, authorization,
CORS, conditional requests, storage layout and independent-client tests. Preserve CKAN as the institutional
configuration/workflow surface.

## Wave E — Exchange and policy

### CKP-17 — Record transformation and deposit

**Difficulty:** hard

Transform approved public/private source snapshots into signed record envelopes. Enforce profile, binding, source
authorization, relationship, purpose, access grade, schema and policy. Durably deposit with idempotency.

### CKP-18 — Receipts and evidence ledger

**Difficulty:** hard

Implement canonical digests, signed acceptance receipts and append-only evidence. Bind actor, source authorization,
profile/policy/source versions, transformation and outcome. Keep acceptance, notification, retrieval and
acknowledgement distinct.

### CKP-19 — Notification and recovery

**Difficulty:** medium

Implement minimal hints plus the adopted durable cursor/reconciliation mechanism. Test dropped, duplicated,
reordered and delayed notifications without losing record discoverability.

### CKP-20 — Submission and review

**Difficulty:** hard

Accept a consumer correction, issue a receipt and route it through an institutional outbox to a synthetic review
queue. Explicitly prohibit direct `package_update`, `resource_update`, `datastore_upsert` and file overwrite. Return a
signed disposition and superseding record.

### CKP-21 — Policy and obligations

**Difficulty:** hard

Implement deterministic technical policy evaluation and durable duties for receipt, notification, review, response
and evidence. Consume pinned, signed profile inputs; do not interpret legislation at runtime or invent legal rules.

## Wave F — Assurance and release

### CKP-22 — Reconciliation and operational views

**Difficulty:** medium

Reconcile profiles, sources, outbox events, deposits, receipts, evidence, notifications, review cases and
dispositions. Provide authorized staff status through CKAN without exposing person-level state in search or metrics.

### CKP-23 — Adversarial conformance

**Difficulty:** hard

Execute every negative requirement, including subject swapping, DataStore expansion, token confusion, search and
activity leakage, bulk-action bypass, harvested authority, replay, sysadmin/support access and evidence deletion.
Fail the build on any cross-subject disclosure or invariant bypass.

### CKP-24 — End-to-end demonstration

**Difficulty:** medium

Automate the minimum demonstration from clean CKAN installation through publisher/programme activation, public and
private delivery, independent-agent retrieval, correction, review, superseding record, notification recovery and
reconciliation. Capture machine-readable evidence with synthetic data only.

### CKP-25 — Packaging and operations

**Difficulty:** medium

Produce install/upgrade/rollback instructions, configuration reference, secret and key setup, backup/restore,
monitoring/redaction, incident response, compatibility manifest, accessibility review and known limitations. Clearly
state residual CKAN/host administrator capability for each deployment profile.

## Dependency order

```text
CKP-01 -> CKP-02 -> CKP-03 -> CKP-04
                    |
                    v
CKP-05 -> CKP-06 -> CKP-07 -> CKP-08 -> CKP-09
                                      |         |
                                      v         v
                              CKP-10/11/12   CKP-13
                                      |         |
                                      +----+----+
                                           v
                                  CKP-14 -> CKP-15 -> CKP-16
                                                       |
                                                       v
                                  CKP-17 -> CKP-18 -> CKP-19
                                      |          |
                                      v          v
                                  CKP-20 ----> CKP-21
                                                       |
                                                       v
                                  CKP-22 -> CKP-23 -> CKP-24 -> CKP-25
```
