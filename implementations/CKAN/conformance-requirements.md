# CKAN Extension Conformance Requirements

## Conformance classes

An implementation reports results separately for:

- **CKAN plugin conformance** — installation, interfaces, actions, authorization, migrations and compatibility;
- **source adapter conformance** — CKAN/public/private/external source selection and provenance;
- **Databox service conformance** — relationships, exchange, policy, receipts, evidence and review;
- **Solid surface conformance** — the pinned Solid/LWS protocol profile; and
- **deployment conformance** — isolation, secrets, operations, backup and accountability.

Passing one class does not imply another.

## Project invariant requirements

| ID | Requirement |
|---|---|
| DBX-CKAN-001 | Machine-generated legal interpretations and normative mappings remain proposed until an authorized human attests them; ordinary factual source events retain actor/method provenance. |
| DBX-CKAN-002 | Current authentication assurance meets or exceeds the configured minimum for the record class. |
| DBX-CKAN-003 | No consumer submission or correction is applied destructively or automatically to CKAN or an external system of record. |
| DBX-CKAN-004 | Every institutional human and software actor is recorded with a stable resolvable identifier; automated actors disclose their nature. |
| DBX-CKAN-005 | The record and evidence name the principal, delivering party, processors and accountable party. |
| DBX-CKAN-006 | Deposits, submissions, deletion/tombstone events and configured non-response events preserve independently verifiable evidence. |
| DBX-CKAN-007 | A determination carries the competent review/redress body and applicable response or filing time limit. |
| DBX-CKAN-008 | Every record class cites the legal instrument/provision or other reviewed authority that grounds the obligation; synthetic fixtures are clearly labelled non-authoritative. |

## CKAN plugin requirements

| ID | Requirement |
|---|---|
| CKAN-001 | The feature is installable as an extension on the pinned CKAN release without a core fork. |
| CKAN-002 | Extension models use revisioned extension-owned tables and do not alter CKAN core tables. |
| CKAN-003 | Every state-changing extension action is POST-only, validated and protected by an auth function. |
| CKAN-004 | Templates, helpers and client-side controls are not authorization boundaries. |
| CKAN-005 | Existing dataset-schema, authentication, harvesting and storage extensions are inventoried and tested. |
| CKAN-006 | Protected relationship and exchange fields are removed from search/index inputs and activity streams. |
| CKAN-007 | Core and bulk CKAN actions cannot bypass adopted Databox triggers or constraints. |
| CKAN-008 | CKAN workforce, service and consumer credentials are not interchangeable. |
| CKAN-009 | Extension configuration contains secret references rather than exposed private keys/tokens. |
| CKAN-010 | Upgrade and migration tests preserve profiles, outbox state, evidence and relationship isolation. |

## Source requirements

| ID | Requirement |
|---|---|
| SRC-001 | Every record class names an immutable, reviewed source-binding version. |
| SRC-002 | CKAN authorization is checked before a private or restricted source is read. |
| SRC-003 | A subject-selection contract uses typed mapping and parameterized, allow-listed selectors. |
| SRC-004 | Cross-subject, cross-resource and cross-organization selection attempts are denied and logged safely. |
| SRC-005 | Only allow-listed rows and fields enter transformation. |
| SRC-006 | Arbitrary `datastore_search_sql`, URL, field list or user filter cannot be supplied by a consumer. |
| SRC-007 | File/URL adapters enforce size, media-type, redirect, network-egress and extraction bounds. |
| SRC-008 | Source dataset/resource/version, authority, authorization and transformation provenance are retained. |
| SRC-009 | Harvested metadata alone cannot activate a programme or establish issuance authority. |
| SRC-010 | Public-source linkage that reveals a relationship is treated as protected output. |

## Exchange requirements

| ID | Requirement |
|---|---|
| EX-001 | A relationship is programme-specific and addressed only by opaque random identifiers. |
| EX-002 | Accepted deposits and submissions are append-only and idempotent. |
| EX-003 | A signed acceptance receipt is issued only after durable commit and evidence append. |
| EX-004 | Consumer corrections are staged for review and never directly overwrite CKAN or an external source. |
| EX-005 | Notifications are non-authoritative, minimal and recoverable through durable state reconciliation. |
| EX-006 | RQ jobs contain opaque references; RQ/Redis history is not treated as exchange evidence. |
| EX-007 | Worker crash and retry cannot duplicate an accepted exchange. |
| EX-008 | Reconciliation detects missing source events, receipts, evidence, review cases and dispositions. |
| EX-009 | Profile and policy changes create new versions and never rewrite historical evidence. |
| EX-010 | Principal, processor, issuer, actor and represented party remain distinct in records and evidence. |

## Access and privacy requirements

| ID | Requirement |
|---|---|
| AP-001 | Source authorization and Databox authorization are both required for sensitive delivery. |
| AP-002 | Current authentication assurance satisfies the record class's minimum grade. |
| AP-003 | A CKAN API token is rejected by consumer Solid endpoints. |
| AP-004 | A consumer Solid token is rejected by ordinary CKAN Action API authentication. |
| AP-005 | Search, facets, activities, DataStore dumps, FileStore routes, jobs, logs and metrics leak no protected relationship fact. |
| AP-006 | Knowing a resource, box or receipt URI never grants access. |
| AP-007 | Programme and relationship boundaries hold against sysadmin convenience paths, support tools and backups. |
| AP-008 | Consumer connection credentials are holder-bound, programme-specific, rotatable and revocable. |
| AP-009 | The institution cannot use a connection credential to browse the consumer's vault or other relationships. |
| AP-010 | Administrative capability and residual host-admin access are documented accurately for the deployment profile. |

## Evidence requirements

| ID | Requirement |
|---|---|
| EV-001 | The evidence ledger is append-only and independent of CKAN activity and RQ logs. |
| EV-002 | Evidence binds verified actor context, authorization decisions, source/profile/policy versions and payload digest. |
| EV-003 | Acceptance, notification, retrieval, acknowledgement, review, disposition and source correction remain distinct states. |
| EV-004 | Consumers can retain independently verifiable records, submissions and receipts. |
| EV-005 | Denials and administrative operations are recorded without exposing protected content. |
| EV-006 | Deletion, withdrawal, tombstone and retained-evidence events are distinguishable. |

## Required negative demonstrations

The release fails conformance if any test can:

- retrieve subject B's row using subject A's relationship;
- expand an allow-listed DataStore field set;
- turn a private dataset into a public Databox route;
- find a relationship through CKAN search or activity APIs;
- replay a connection credential as an access token;
- create a record without a current signed programme/source profile;
- accept a submission without producing a durable receipt;
- apply a correction directly to source data;
- issue from harvested metadata without verified authority; or
- erase historical evidence by editing/deleting a CKAN dataset.
