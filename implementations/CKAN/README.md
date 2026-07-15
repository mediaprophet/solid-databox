# CKAN Solid Databox Implementation Target

## Purpose

This target defines a **CKAN extension** that adds organisation-hosted Solid Databox services to an institution's
existing CKAN deployment. It supports institutions that already publish permissively licensed data and institutions
that use CKAN authorization, private datasets, FileStore or DataStore to provide restricted or sensitive data.

CKAN is normally the catalogue and publishing workflow used by governments, research institutions, humanitarian
organisations, civic-data communities and enterprises. Solid Databox adds a private, relationship-specific exchange
channel through which an accountable organisation can provide a person with records and accept submissions,
corrections and evidence in return.

The implementation is one CKAN extension suite with two cooperating surfaces:

1. **the CKAN institutional surface**, which manages publisher/programme profiles, source selection, staff workflows,
   Action API operations and integration events using supported CKAN extension points; and
2. **the extension's Databox surface**, which provides Solid-compatible endpoints, consumer authentication,
   authorization, relationship storage, receipts, notifications, append-only evidence and consumer-agent
   interoperability.

Both are delivered by `ckanext-databox`. Operators may deploy its workers, evidence store, object storage and Solid
gateway as separate processes for scale or security, but they remain parts of the CKAN extension architecture and
are configured and governed through CKAN.

CKAN remains authoritative for catalogue metadata and may also be the configured source of record for resources it
already hosts. External institutional systems may remain authoritative for other record classes. The Databox
surface is authoritative for accepted exchange artefacts and evidence. Each programme profile declares the source
and authority explicitly.

## Why CKAN is a useful target

CKAN is widely used for national, regional and local government portals, research data catalogues, humanitarian
data exchanges, NGO and civic-data hubs, and enterprise data catalogues. These operators already manage:

- accountable publishers and delegated publishing teams;
- metadata schemas, licences, themes, classifications and data-quality workflows;
- public and private datasets, files and structured DataStore resources;
- harvested records from other catalogues;
- APIs and background processing; and
- public transparency and data-access programmes.

Those capabilities make CKAN a strong place both to define Databox programmes and, where the institution already
uses CKAN for controlled data provision, to select and transform governed CKAN resources for person-specific
delivery. The extension must preserve the source dataset's CKAN authorization and add Databox relationship,
assurance, purpose, receipt and evidence controls. It must never weaken a sensitive dataset into a public search or
unfiltered API path.

See [Operator profiles](operator-profiles.md) for the organisations and deployment patterns this target prioritises.

## Core boundary

```text
public or internal catalogue users
              |
              v
       CKAN + ckanext-databox
       | catalogue metadata |
       | publisher profiles |
       | staff workflow UI  |
       | source adapters     |
       | transactional outbox
       +----------+----------+
                  |
                  v
       Databox gateway / workers / policy compiler
       |          |          |
       |          |          `--> staff review and external systems of record
       |          v
       |     evidence ledger
       v
extension-managed Solid Databox surface <--> consumer agent or personal vault
```

The extension may read an authorized public or private CKAN dataset, resource, file or DataStore view as a declared
source. It must not expose a whole sensitive source when only subject-filtered records are authorized, create one
catalogue dataset per person, put credentials in dataset extras, or index box and relationship identifiers in Solr.

## CKAN concepts are not Databox concepts

| CKAN concept | Databox relationship | Rule |
|---|---|---|
| CKAN site | Hosting/operator boundary | A site may serve many accountable publishers and programmes. |
| CKAN organization | Candidate publisher/principal | It is not automatically the legal principal; the profile must identify the accountable entity. |
| Dataset/package | Catalogue description | It may describe a record class or service, never an individual person's box. |
| Resource | Distribution or service endpoint metadata | It must not expose a private Databox resource URL or bearer secret. |
| CKAN user | Workforce/collaborator identity | It is not the represented consumer identity. |
| CKAN API token | CKAN automation credential | It must not authenticate a consumer or grant Solid data-plane access. |
| Harvested dataset | Third-party metadata copy | It does not establish authority to issue a person's record. |

## Invariants

In addition to the project-wide invariants, every CKAN implementation must preserve these rules:

1. Person-level data already held in CKAN may be used only through a reviewed source adapter and subject-selection
   contract. Databox relationship mappings, credentials and exchange evidence stay in extension-owned protected
   stores and never enter Solr, public activity streams or dataset extras.
2. A CKAN organization is bound to a Databox programme only through an explicit, reviewed, versioned profile naming
   the principal, processors, jurisdiction, legal basis, record classes, systems of record and redress route.
3. A catalogue entry describes a service or record class, not the existence of a record about a named person.
4. Harvested metadata is untrusted for issuance until the source principal, provenance and signing authority have
   been independently validated.
5. CKAN sysadmin status alone never grants an ordinary consumer Databox token. Administrative capability and its
   limits must be accurately documented and audited for the chosen deployment.
6. CKAN API tokens, sessions and organization roles never become consumer credentials or Solid access tokens.
7. Extension state uses extension-owned, migrated tables and supported plugin interfaces; it does not modify CKAN
   core tables or depend on undocumented internals.
8. Asynchronous work is driven by a durable outbox. CKAN background jobs may execute delivery, but the RQ queue and
   job history are not the evidence ledger.
9. Every deposit and submission is idempotent, append-only after acceptance, receipted and reconcilable with the
   responsible source or review case.
10. Public search and API responses reveal no box URI, pairwise consumer identifier, access token, connection
    credential, correction case or protected record-existence fact.
11. Publisher and processor chains remain visible in metadata and evidence; aggregation or outsourcing does not
    launder accountability.
12. The extension's Databox surface preserves the Solid compatibility requirements defined by the project. A CSS
    adapter is one implementation option, not a prerequisite.

## Recommended package boundary

```text
ckanext-databox/
|- ckanext/databox/
|  |- plugin.py
|  |- config.py
|  |- auth.py
|  |- actions.py
|  |- validators.py
|  |- blueprints/
|  |- model/
|  |- migration/
|  |- outbox/
|  |- clients/
|  |- profiles/
|  |- templates/
|  `- fanstatic/
|- tests/
|  |- unit/
|  |- integration/
|  |- security/
|  `- conformance/
|- pyproject.toml
`- README.md
```

The extension package, worker and Databox gateway should be separately runnable and credentialed even when they are
distributed as one CKAN extension suite. A small demonstration may run them in one Compose project. A production
profile decides which components share a host or trust domain.

## Documents

- [Operator profiles](operator-profiles.md) identifies priority CKAN operators and safe initial use cases.
- [Architecture](architecture.md) defines components, trust boundaries, authority and failure ownership.
- [Metadata and record model](metadata-and-record-model.md) maps CKAN entities to programme and record-class
  metadata without indexing personal records.
- [Identity and access](identity-and-access.md) separates workforce, service and consumer identity.
- [Exchange and evidence](exchange-and-evidence.md) defines deposits, submissions, receipts, outbox processing and
  reconciliation.
- [Isolation and privacy](isolation-and-privacy.md) covers Solr, DataStore, FileStore, logs, queues and sysadmin risk.
- [Implementation scope](implementation-scope.md) maps the target onto supported CKAN extension interfaces.
- [Deployment profiles](deployment-profiles.md) defines small, government, federated and high-sensitivity patterns.
- [Conformance requirements](conformance-requirements.md) gives testable CKAN-specific requirements.
- [Implementation decisions](implementation-decisions.md) records adopted choices and pre-code blockers.
- [Implementation plan](prompt-implementation-plan.md) provides ordered, agent-ready work packages.
- [Sources](sources.md) pins the CKAN material used to prepare this target.

## Status

Design target dated 2026-07-15. It is an implementation plan, not a claim that a `ckanext-databox` package exists or
that CKAN itself implements the Solid Protocol. Pin a stable CKAN release and the exact Databox data-plane baseline
before implementation begins.
