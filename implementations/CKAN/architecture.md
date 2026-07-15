# CKAN Integration Architecture

## Architectural position

`ckanext-databox` adds the Solid Databox protocol and institutional workflow to CKAN. It uses CKAN-native actions,
authorization, datasets, resources and background work where appropriate, and adds protected extension stores and
consumer-facing Solid endpoints where CKAN core has no equivalent. Components may be split into processes without
turning the solution into a product separate from CKAN.

## Participants

| Participant | Responsibility |
|---|---|
| CKAN site operator | Operates the catalogue and extension; enforces platform isolation and operational controls. |
| Publisher principal | Is accountable for a programme and the records it exposes. |
| CKAN organization administrator | Manages catalogue metadata within delegated scope; does not automatically control Databox records. |
| Programme administrator | Maintains a reviewed programme profile and activates approved record classes. |
| Institutional bridge | Resolves source identities, transforms source records, signs deposits and reconciles outcomes. |
| `ckanext-databox` gateway | Authenticates consumers, authorizes, stores, receipts, notifies and exposes Solid-compatible operations. |
| Evidence ledger | Retains append-only exchange, decision, policy, notification and disposition evidence. |
| Review officer | Reviews consumer submissions and corrections in the responsible institutional workflow. |
| Consumer agent | Retrieves records and makes deliberate submissions for the person. |
| Harvester | Imports catalogue metadata; never establishes person-level issuance authority on its own. |

The acting agent, represented person, accountable principal, publisher, processor and technical operator must be
recorded separately.

## Components

```text
                                   public catalogue/API
                                           |
                                           v
                              +---------------------------+
                              | CKAN web + Action API     |
                              | organizations/datasets    |
                              | ckanext-databox UI/actions|
                              +-------------+-------------+
                                            |
                profiles/source adapters   | durable extension outbox
                                            v
                              +---------------------------+
                              | Databox integration worker|
                              | validation + routing      |
                              +-----+---------------+-----+
                                    |               |
                         programme  |               | source/review connectors
                         profile    |               v
                                    |      +---------------------+
                                    |      | systems of record   |
                                    |      | case/review systems |
                                    |      +---------------------+
                                    v
                         +-----------------------+
consumer agent <-------> | Databox gateway and  |
                         | Solid extension plane |
                         +-----------+-----------+
                                     |
                                     v
                              evidence ledger
```

## Authority matrix

| State | Authoritative system | CKAN representation |
|---|---|---|
| Publisher identity and delegation | Verified publisher registry/profile | Public identifier and safe contact metadata |
| Programme definition | Signed, reviewed programme profile | Discoverable catalogue projection and current status |
| Public dataset metadata | CKAN or upstream harvested catalogue | Native dataset/resource metadata |
| Operational person record | CKAN resource/DataStore or external institutional system, as profiled | Safe metadata plus governed source binding |
| Relationship-to-box mapping | Protected institutional bridge registry | None |
| Accepted Databox record/submission | Databox data plane | Aggregate operational state only, if safe |
| Exchange and policy evidence | Evidence ledger | Minimised staff status projection |
| Correction/review case | Institutional case system | Opaque workflow status only where authorized |
| Consumer-retained copy | Consumer-selected vault or agent | None |

No synchronization process may silently promote CKAN metadata into an authoritative personal record.

## CKAN extension responsibilities

`ckanext-databox` should:

- register validated extension configuration;
- manage verified publisher bindings and versioned programme profiles;
- add safe, first-class metadata for Databox service descriptions;
- provide authorized staff actions and views for programme administration;
- register governed adapters for CKAN datasets, resources, FileStore objects, DataStore queries and external sources;
- expose Solid-compatible discovery and resource operations through extension blueprints or a bundled gateway;
- provision relationship-specific Databox storage in an extension-managed backend;
- write durable extension outbox events when approved profiles change;
- show minimised delivery/reconciliation status to authorized staff;
- link catalogue users to public human-readable rights, access, correction and redress information;
- enforce its own action authorization through CKAN's logic layer; and
- expose health and compatibility information without secrets or person identifiers.

It should not:

- pass consumer Solid access tokens into ordinary CKAN Action API authentication;
- store connection credentials or holder keys in CKAN user, dataset or resource fields;
- resolve a public request to a person's box;
- place Databox copies or supporting evidence in public catalogue resources; protected extension storage is allowed;
- make CKAN organization membership sufficient for Databox administration;
- use templates or JavaScript as an authorization control; or
- write directly to CKAN core database tables.

## Programme profile flow

```text
publisher administrator drafts profile
  -> schema and policy validation
  -> accountable programme officer reviews and signs
  -> CKAN stores immutable profile version in extension-owned table
  -> same transaction appends activation event to extension outbox
  -> worker sends profile to policy compiler/control plane
  -> control plane validates signature, version and invariants
  -> Databox programme is activated or activation failure is recorded
  -> CKAN receives a signed reconciliation result
```

Editing a profile creates a new version. Existing evidence remains bound to the earlier version. A CKAN dataset edit
must never silently change the policy governing already accepted records.

## Record exchange flow

CKAN may be the source of a record, but catalogue discovery is not itself authorization to deliver it:

```text
CKAN or external source transaction
  -> source-owned or extension-owned transactional outbox
  -> institutional bridge resolves programme-local relationship
  -> bridge validates record class and current signed profile
  -> bridge transforms and signs record
  -> Databox gateway accepts durable deposit
  -> signed acceptance receipt and evidence event
  -> consumer notification hint
  -> authenticated consumer retrieval
```

The extension may show person-level delivery state only through specifically authorized staff actions that bypass
public search and activity streams. Raw mappings, credentials and evidence stay in protected extension stores.

## Consumer submission flow

```text
consumer agent submits to Databox
  -> durable acceptance and signed receipt
  -> evidence event and institutional delivery outbox
  -> bridge creates a governed case in the responsible review system
  -> review officer records disposition
  -> source is corrected or statement associated where appropriate
  -> disposition/superseding record returned through Databox
```

CKAN can provide the public correction route and authorized aggregate queue status. It must not become the case
management system unless a separately assessed extension and access model deliberately provides that function.

## Dataset and programme discovery

A public CKAN dataset can describe a Databox programme or record class using safe metadata such as:

- programme identifier and human-readable title;
- accountable publisher and processor chain;
- service jurisdiction and eligibility description;
- record and submission class identifiers;
- public schema, vocabulary and policy-profile links;
- supported interoperability profiles;
- access, correction, complaint and redress routes; and
- service status and accessibility information.

It must not contain person-specific endpoints, relationship status, small-cohort counts that create disclosure risk,
private policy instances or any credential material.

## Federation and harvesting

Harvested metadata retains its upstream provenance and is labelled as asserted by the upstream source. Before an
operator enables a Databox action for a harvested programme it must complete a separate trust ceremony that verifies:

- the legal principal and delegated operator;
- control of the advertised service domain;
- institutional signing keys and rotation process;
- the profile digest and version;
- source-system authority for each record class; and
- the processor and redress chain.

Harvest refreshes can suggest profile changes but cannot activate them automatically.

## Failure ownership

| Failure | Owner | Required behavior |
|---|---|---|
| CKAN unavailable | Site operator | Existing Databox access continues; catalogue administration pauses. |
| Solr unavailable | Site operator | No effect on personal record access; do not fall back to unsafe enumeration. |
| CKAN outbox worker unavailable | Site operator | Events remain durable and retryable; no false success status. |
| Databox data plane unavailable | Databox provider | CKAN reports degraded aggregate status; deposits remain in source outbox. |
| Source bridge unavailable | Publisher principal/operator | No record is fabricated from catalogue data; retry and reconcile. |
| Evidence ledger unavailable | Databox provider | Fail closed before claiming acceptance. |
| Profile compilation fails | Programme administrator | Keep previous active version; expose actionable staff error. |
| Harvester imports malicious metadata | Site operator | Treat as untrusted content; never activate issuance or render unsafe markup. |

## Data-plane choice

The first implementation should evaluate two extension backends: a thin bundled gateway backed by extension-owned
storage, and an adapter to the separately developed CSS target. The choice must be recorded before protocol code is
written. In either case installation, configuration, source binding and staff operation are provided through
`ckanext-databox`, and CKAN-specific and Solid-surface conformance are reported separately.
