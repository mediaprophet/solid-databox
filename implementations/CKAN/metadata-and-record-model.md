# Metadata and Record Model

## Purpose

The extension must connect CKAN's catalogue and governed data holdings to relationship-specific Databox exchange
without confusing metadata discovery, source-data authorization and consumer authorization.

## Four layers

| Layer | Example | Visibility | Authority |
|---|---|---|---|
| Catalogue metadata | Dataset title, publisher, licence, themes | Public or CKAN-private | CKAN/upstream catalogue |
| Databox service metadata | Programme, record classes, schemas, redress | Normally public; some operational fields private | Signed programme profile |
| Source data | DataStore rows, uploaded file, external API result | Source-specific | Declared CKAN or external source |
| Relationship exchange | One person's record, submission, receipt and disposition | Databox-authorized only | Databox evidence plus declared source/review system |

An item can move from source data into a relationship exchange only through a configured source adapter, subject
selection, transformation, policy check and durable acceptance event.

## Programme profile

Each programme profile must include:

- stable programme identifier, title and version;
- accountable principal, CKAN organization, processors and service operator;
- jurisdiction, purposes, legal bases, redress bodies and contacts;
- active dates and profile status;
- workforce administration roles;
- accepted consumer identity providers and assurance mappings;
- relationship linking and recovery ceremony;
- record classes and submission classes;
- source bindings and subject-selection contracts;
- transformation, signing and validation profiles;
- minimum assurance and record-existence visibility per class;
- retention, correction, deletion/tombstone and prior-recipient behavior;
- notification, receipt and evidence profiles; and
- deployment, encryption and key references.

Draft, reviewed, active, suspended and retired are distinct states. Only a signed active version can drive exchange.

## Safe CKAN fields

A Databox service dataset or programme page may expose:

| Field | Meaning |
|---|---|
| `databox_program_id` | Stable non-personal programme identifier |
| `databox_profile` | URI of a public profile projection |
| `databox_profile_version` | Current advertised version |
| `databox_principal_id` | Verified legal entity identifier |
| `databox_record_classes` | Public class IRIs, not record instances |
| `databox_submission_classes` | Public accepted-submission class IRIs |
| `databox_access_route` | Human onboarding/access information, not a box URL |
| `databox_correction_route` | Public explanation of correction procedure |
| `databox_redress_route` | Competent review body and time limits |
| `databox_interop_profiles` | Supported dated protocol/profile identifiers |
| `databox_service_status` | Aggregate operational state |

Use `IDatasetForm` or an explicit dataset type where it does not conflict with an installed schema extension. For
sites using `ckanext-scheming`, provide a schema fragment and compatibility adapter rather than installing a second
fallback dataset form.

## Prohibited catalogue fields

Never put the following into dataset extras, resource metadata, tags, activity details or Solr fields:

- subject/customer identifiers;
- opaque relationship or box identifiers;
- personal WebIDs or pairwise identifiers;
- record instance identifiers or protected existence state;
- connection credentials, tokens, keys or grant instances;
- correction case identifiers;
- exact notification destinations;
- sensitive policy evaluation results; or
- payload, receipt or evidence digests where they enable correlation.

## Source binding

A source binding is an immutable versioned configuration that names exactly how a record class is obtained. Supported
binding types should include:

1. `ckan-resource-file` — a FileStore or linked resource processed by a bounded extractor;
2. `ckan-datastore` — a parameterized, allow-listed DataStore query or view;
3. `ckan-action` — a purpose-built side-effect-free Action API action;
4. `ckan-public-resource` — public data wrapped with a relationship-specific signed statement;
5. `external-api` — a separately authenticated institutional endpoint; and
6. `event-stream` — a source outbox or message stream.

Every binding records the CKAN dataset/resource ID where applicable, source version, authoritative party, allowed
fields, subject-selection method, expected cardinality, transformation, update semantics and failure behavior.

## Subject-selection contract

A consumer identifier must never be inserted into arbitrary SQL, Solr or URL templates. A subject-selection contract
defines:

- the accepted typed identifier namespace;
- the protected relationship-to-source mapping owner;
- the exact parameterized selector;
- row-level and field-level allow-lists;
- zero, one or many result semantics;
- duplicate and ambiguity handling;
- snapshot/transaction behavior;
- minimum source authorization context;
- expected sensitivity and output record class; and
- tests proving that another subject cannot be selected.

For DataStore, use parameterized operations and preferably a reviewed database view or purpose-built extension
action. Never expose `datastore_search_sql` or user-supplied filters as a subject selector.

## Public data

Public or permissively licensed data can still produce a relationship-specific Databox record. For example, a public
recall dataset may be filtered against products a consumer has registered. The source facts remain public, while the
fact that this person has a particular product is private. The derived record and notification therefore stay in the
Databox surface even though the source dataset is public.

The record must retain source dataset/resource/version provenance and licence information.

## Restricted and sensitive data

For private CKAN datasets and sensitive resources:

- the source service identity must pass CKAN authorization for the source action;
- Databox authorization must separately confirm relationship, purpose, assurance and record grade;
- only allow-listed fields and rows are transformed;
- the source response must not be cached in public web or shared worker caches;
- logs and job arguments contain opaque event references, not payloads;
- transformed output is written only to the protected Databox store; and
- source authorization and selected source version are bound into evidence.

CKAN's source authorization is necessary but not sufficient. Databox authorization must never expand what CKAN
would permit the configured institutional service to access.

## Files and binary resources

Large files require:

- an allow-listed resource and content type;
- streaming rather than unbounded buffering;
- digest calculation and size limits;
- malware and content-safety quarantine where applicable;
- field or page extraction where the whole file contains records for many people;
- no direct reuse of a public FileStore URL for protected relationship delivery; and
- an immutable accepted-copy reference or retained source version.

## Versioning and correction

CKAN dataset/resource revision, source business version and Databox record version are separate. An update to CKAN
metadata does not supersede a personal record. A source-data change generates a new source event; the bridge decides
whether it produces a new Databox record linked with `prov:wasRevisionOf` or an equivalent project term.

A consumer correction creates a submission and institutional review case. It must not call `package_update`,
`datastore_upsert` or overwrite a FileStore object automatically. A signed disposition may authorize a controlled
source update through a source-specific workflow, after which a superseding Databox record is issued.

## Harvested content

Harvested datasets carry upstream metadata provenance. They may advertise an upstream Databox programme, but the
local CKAN operator must not become an issuer or processor implicitly. A locally actionable programme needs a
verified profile and explicit service relationship independent of the harvest job.
