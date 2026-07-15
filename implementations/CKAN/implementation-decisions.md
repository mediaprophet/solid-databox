# Implementation Decisions and Open Questions

## Adopted decisions

### CKD-01 — Product boundary

**Decision:** Deliver the functionality as `ckanext-databox`. Separately running workers, storage or gateways are
components of the extension architecture, not a separate institutional product.

### CKD-02 — Existing CKAN data

**Decision:** Public, private, restricted and sensitive CKAN resources may be configured as Databox sources. Source
authorization, subject/field selection and Databox authorization are cumulative.

### CKD-03 — Catalogue representation

**Decision:** CKAN datasets describe programmes, services, record classes and source provenance. Relationship and
credential state uses protected extension stores and is not indexed.

### CKD-04 — CKAN core changes

**Decision:** Use an extension and supported plugin interfaces. Do not fork CKAN or alter core tables for the first
implementation.

### CKD-05 — Identity separation

**Decision:** Workforce CKAN identity, institutional service identity and consumer Solid identity use separate
credentials and authorization paths.

### CKD-06 — Corrections

**Decision:** A consumer correction is an append-only submission routed to review. It never directly calls a CKAN
update/upsert/delete action on source data.

### CKD-07 — Jobs and evidence

**Decision:** CKAN RQ workers may execute asynchronous tasks, but a durable extension outbox and evidence ledger are
authoritative. Job arguments contain opaque references only.

### CKD-08 — Harvesting

**Decision:** Harvested metadata never creates issuance authority. An actionable programme needs an independently
verified principal, service and profile.

### CKD-09 — First demonstration

**Decision:** Use a synthetic local-government permit programme with one public CKAN resource and one private
DataStore source. Demonstrate two isolated consumers and a reviewed correction.

### CKD-10 — Policy history

**Decision:** Programme, source binding and policy versions are immutable after activation. Updates create new
versions and historical exchange remains bound to the version used.

## Decisions required before implementation

### O-01 — Solid backend

Choose one initial backend:

- embedded, extension-owned Solid gateway/storage; or
- CSS-backed gateway controlled by the extension.

The decision records protocol coverage, operational complexity, security boundary and conformance plan. Do not
scaffold both as production implementations.

### O-02 — CKAN release range

Pin the first supported CKAN patch release, Python version and extension compatibility set. Current `latest`
documentation is not a release baseline.

### O-03 — Dataset schema integration

Decide whether the reference deployment uses `ckanext-scheming`, a dedicated `IDatasetForm` dataset type or both via
an adapter. Only one fallback dataset form can control a dataset type.

### O-04 — Source transaction capture

For each source type decide whether delivery is:

- explicit extension action;
- chained CKAN action plus same-transaction outbox;
- controller callback plus reconciliation;
- scheduled snapshot; or
- upstream source outbox.

Document bulk-action coverage and atomicity.

### O-05 — Protected storage

Select databases/object storage, encryption envelope, key service, tenancy boundary, backup and deletion behavior
for relationship mappings, payloads and evidence.

### O-06 — Consumer authentication profile

Pin the Solid-OIDC/LWS authentication and authorization profile, token format, holder proof, issuer trust and
assurance vocabulary.

### O-07 — Source subject mapping

Define how the synthetic permit-system identifier is initially linked to the pairwise consumer relationship and how
ambiguity, relinking, guardianship and recovery work.

### O-08 — Sensitive CKAN authorization

Define the least-privilege service context used to read private DataStore/FileStore resources. Record residual
sysadmin/database administrator powers accurately.

### O-09 — Proof and key suites

Choose record, receipt, profile and evidence signature suites, canonicalization, status and key-history mechanisms.

### O-10 — Notification and recovery

Choose advertised notification channels and the authoritative cursor/reconciliation contract. A live hint alone is
insufficient.

### O-11 — Evidence storage

Choose append-only implementation, integrity protection, projections, retention and independent verification path.

### O-12 — Legal/profile content

For the synthetic programme, pin synthetic legal fixtures and clearly separate them from reviewed production legal
mapping. No agent may invent statutory rules.

## Definition of resolved

An open question is resolved only when an ADR records alternatives, decision, rationale, security/privacy effects,
migration implications, exact versions and traceable tests.
