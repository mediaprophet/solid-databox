# `ckanext-databox` Implementation Scope

## Strategy

Implement Solid Databox as an installable CKAN extension suite. Avoid a CKAN core fork. Use supported plugin
interfaces and the plugins toolkit, keep extension models in extension-owned migrated tables, and make optional
backend services replaceable through narrow interfaces.

The package provides:

- institutional administration through CKAN pages and Action API actions;
- programme and source-binding metadata integrated with CKAN datasets and organizations;
- CKAN source adapters for public, private, restricted and sensitive data;
- relationship provisioning and consumer onboarding;
- Solid-compatible consumer discovery and resource operations;
- policy, assurance and access-grade enforcement;
- append-only exchange, signed receipts and durable notifications;
- consumer-submission intake and institutional review routing;
- durable outbox, evidence and reconciliation; and
- separate workforce and consumer authentication pipelines.

## Version baseline

Before code is scaffolded, select a supported stable CKAN release and record:

- exact CKAN and Python versions;
- enabled core and external extensions;
- database, Solr, Redis/RQ and storage versions;
- authentication/SSO extension;
- dataset-schema extension such as `ckanext-scheming`;
- DataStore loader in use;
- harvesting extensions;
- dated Solid/LWS and Databox protocol profiles; and
- known compatibility constraints.

Do not implement against the `latest` CKAN documentation without pinning the corresponding release or commit.

## Proposed package

```text
ckanext-databox/
|- ckanext/databox/
|  |- plugin.py
|  |- config.py
|  |- auth.py
|  |- actions/
|  |  |- programme.py
|  |  |- source.py
|  |  |- relationship.py
|  |  |- exchange.py
|  |  `- audit.py
|  |- blueprints/
|  |  |- admin.py
|  |  |- onboarding.py
|  |  `- solid.py
|  |- model/
|  |- migration/databox/versions/
|  |- profiles/
|  |- sources/
|  |  |- datastore.py
|  |  |- resource_file.py
|  |  |- action.py
|  |  `- external.py
|  |- relationships/
|  |- policy/
|  |- exchange/
|  |- outbox/
|  |- evidence/
|  |- notifications/
|  |- storage/
|  |- templates/
|  `- fanstatic/
|- tests/
|  |- unit/
|  |- integration/
|  |- source_adapters/
|  |- security/
|  `- conformance/
|- pyproject.toml
`- README.md
```

## Plugin interfaces

### Configuration

Use `IConfigDeclaration` to declare extension settings and `IConfigurer` to register templates, assets and defaults.
Configuration names use the `ckanext.databox.*` namespace. Reject missing security-critical settings at startup.

Secrets, private keys and bearer credentials are references to a secret manager, not literal CKAN configuration
values where the deployment can avoid it.

### Actions

Use `IActions` for explicit institutional operations, including:

- `databox_programme_create`, `databox_programme_update`, `databox_programme_submit_review`;
- `databox_programme_activate`, `databox_programme_suspend`;
- `databox_source_binding_create`, `databox_source_binding_test`;
- `databox_relationship_provision`, `databox_relationship_suspend`;
- `databox_delivery_request`, `databox_delivery_status`;
- `databox_submission_status`, `databox_disposition_record`; and
- `databox_reconcile`, `databox_audit_projection`.

Every action validates input and calls `toolkit.check_access`. Side-effect-free actions are explicitly marked; no
state-changing action is exposed over GET.

Use chained actions only where an approved design must observe or constrain a core action. Catalogue callbacks alone
are insufficient for durable delivery because bulk actions can bypass some controller callbacks.

### Authorization

Use `IAuthFunctions` for each extension action. Compose:

- site/organization membership where applicable;
- extension-specific programme role;
- programme and source scope;
- step-up/freshness for sensitive actions;
- separation-of-duties state; and
- explicit service identity for automation.

Never infer authorization from a template, navigation link or an unverified request field.

### Dataset and resource schemas

Use `IDatasetForm` only after inventorying existing schema plugins. Prefer a dedicated Databox service dataset type
or a `ckanext-scheming` schema fragment. Add validators through `IValidators` where reusable.

Use `IPackageController` and `IResourceController` for safe post-validation observations and search/index filtering,
not as the sole enforcement or outbox mechanism. `before_dataset_index` must strip all protected extension fields.

### Blueprints

Use `IBlueprint` for:

- staff administration pages;
- a human onboarding/recovery ceremony; and
- the versioned Solid/Databox protocol surface if the embedded gateway option is selected.

The Solid blueprint uses its own authentication middleware and never maps a consumer token to a CKAN user session.
The Action API remains the institutional API; the Solid resource surface is not disguised as CKAN `package_*`
actions.

## Extension models

Use extension-owned, revisioned tables without adding columns or foreign keys to CKAN core tables. Store CKAN object
IDs as validated values and handle deletion/reconciliation explicitly.

Suggested models include:

- `databox_publisher_binding`;
- `databox_programme` and immutable `databox_programme_version`;
- `databox_source_binding` and version;
- `databox_role_assignment`;
- `databox_relationship` with encrypted mapping fields;
- `databox_access_grant` and credential status;
- `databox_outbox_event` and delivery attempt;
- `databox_exchange_index` containing safe opaque references;
- `databox_duty_instance`;
- `databox_evidence_event`; and
- `databox_reconciliation_run`.

Payload blobs, credentials and cryptographic keys should use a protected storage backend, not ordinary text columns.

## Source adapter contract

Every source adapter implements:

```text
validate_binding(profile, binding) -> validation result
authorize_source(service_context, binding, operation) -> decision
resolve_subject(relationship_ref, binding) -> typed opaque selector
read_snapshot(binding, selector, field_allowlist) -> source snapshot
transform(snapshot, record_profile) -> candidate record
source_provenance(snapshot) -> immutable provenance
reconcile(source_ref, accepted_record_ref) -> result
```

Adapters must be bounded, deterministic for a pinned source snapshot, time/size limited and safe against SSRF,
injection and confused-deputy use.

## DataStore adapter

The DataStore adapter:

- uses a dedicated least-privilege institutional context;
- calls supported Action API functions or a reviewed database view;
- permits only configured resources, selectors, fields and sort/order behavior;
- uses parameter binding;
- prohibits arbitrary SQL and user-provided field lists;
- limits rows and response size;
- records source revision/snapshot evidence; and
- tests cross-subject and cross-organization denial.

## Resource/FileStore adapter

The resource adapter validates CKAN authorization before access, streams bounded content, verifies expected digest
and media type, and runs a record-specific extractor. It cannot deliver a whole multi-subject file merely because one
consumer is represented within it.

Linked URLs are subject to URL allow-lists, DNS/IP protections, redirect limits and egress policy.

## Background processing

Use CKAN's background job framework for execution where suitable, but persist authoritative state in the extension
outbox/evidence tables. Jobs receive only an opaque event ID. Workers reload and authorize current state, acquire a
lease, execute idempotently and write a durable result.

Provide dedicated queues for source extraction, deposits, notifications, submissions and reconciliation so large
files cannot starve security-critical work.

## Solid surface options

### Embedded gateway

An extension blueprint and protected storage adapter implement the pinned Solid/Databox subset. This has the
simplest installation but requires the extension to implement and test discovery, RDF/HTTP behavior, authentication,
authorization, CORS, conditional requests, notifications and storage invariants.

### CSS-backed gateway

The extension provisions and controls the CSS implementation target behind a versioned adapter. CKAN remains the
institutional UI, profile/source authority and workflow surface. This reduces Solid server work but adds deployment
and reconciliation complexity.

Select one for the first release through an ADR. Do not maintain two partial production paths simultaneously.

## Minimum demonstration

The first demonstration uses synthetic data and must show:

1. install and enable `ckanext-databox` on a pinned CKAN release;
2. create and approve a verified local-government publisher and permit programme;
3. bind one public CKAN resource and one private DataStore resource;
4. provision two isolated synthetic consumer relationships;
5. link each relationship to only its own private DataStore rows;
6. issue and install a holder-bound connection credential;
7. deliver a public-data-derived notice and a sensitive permit determination;
8. retrieve both through an independent consumer agent;
9. submit a correction and receive a signed acceptance receipt;
10. route it to a synthetic review queue without updating the DataStore automatically;
11. publish a disposition and superseding record;
12. demonstrate missed-notification recovery and reconciliation; and
13. pass cross-subject, search-leakage, token-confusion and sysadmin-path negative tests.

## Test layers

- unit tests for validators, policy, selectors and transformations;
- CKAN plugin tests for actions, auth, schemas, migrations and compatibility;
- source-adapter tests for public/private DataStore and FileStore behavior;
- integration tests with PostgreSQL, Solr, Redis/RQ and selected storage backend;
- Solid protocol and independent-client tests;
- end-to-end exchange/review/reconciliation tests;
- security tests for isolation, injection, SSRF, token replay and metadata leakage; and
- upgrade tests across the pinned CKAN support range.
