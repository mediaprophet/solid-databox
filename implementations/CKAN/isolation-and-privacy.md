# Isolation and Privacy

## Objective

Adding Databox functionality must not create a weaker path to data already protected by CKAN, and must not leak
relationship information into CKAN's public catalogue machinery.

## CKAN-specific trust surfaces

| Surface | Risk | Required control |
|---|---|---|
| PostgreSQL core database | Broad application/sysadmin access | Extension-owned migrated tables, least privilege and encryption for protected mappings |
| Solr | Flattened metadata, permission labels and search enumeration | Never index relationship state, payloads, credentials or protected existence facts |
| DataStore PostgreSQL | Row/field overexposure and powerful queries | Dedicated read identity, reviewed parameterized selectors and field allow-lists |
| FileStore/object storage | Whole-file disclosure and predictable links | Source authorization, bounded extraction and separate protected delivery copy |
| Redis/RQ | Job arguments, retries and operator visibility | Opaque event IDs only; no sensitive payloads or tokens |
| CKAN activity streams | Public or broadly visible change details | Do not emit person-level extension events |
| Action API | Powerful automation and CKAN API tokens | Extension auth functions, scoped service identities and no consumer-token reuse |
| Templates/previews | XSS, third-party loading and accidental rendering | Treat harvested/source content as untrusted; no protected payload preview |
| Logs/APM/metrics | Correlation and credential leakage | Structured redaction, safe event IDs and bounded labels |
| Harvesters | Malicious or false upstream metadata | Provenance, sanitization and separate activation trust ceremony |

## Source access rule

For sensitive CKAN-held data, the extension must satisfy both source and destination policy:

```text
permitted source access
AND exact subject/field selection
AND permitted Databox delivery
AND sufficient consumer assurance
```

The extension must never use a platform-wide sysadmin context merely for convenience. If an operation genuinely
requires such authority, isolate it in a dedicated connector, document why narrower authority is impossible, require
explicit programme approval and audit every use.

## Relationship isolation

Use opaque random identifiers for relationships, boxes, records, submissions and receipts. Storage namespaces,
token audiences and encryption context are programme- and relationship-bound. A valid token for one relationship
cannot query or infer another.

No global consumer key is exposed to CKAN organizations. A site-wide protected resolution service, if unavoidable,
must be independently governed and must release only a programme-local mapping.

## Search and existence leakage

Negative tests must cover:

- `package_search`, `resource_search` and facets;
- organization and group pages;
- activity streams and feeds;
- Solr direct or administrative queries;
- autocomplete and suggestion endpoints;
- DataStore search and dump endpoints;
- FileStore download redirects;
- job-list and administrative status APIs;
- error messages, timing and status-code differences; and
- aggregate dashboards for small cohorts.

Record-existence visibility and payload access are separate decisions. Neither is implemented through public CKAN
search.

## Data minimisation

Extract only the rows and fields required for the declared record class. Do not copy an entire dataset or file into
each relationship box. Prefer a signed derived assertion where it satisfies the purpose, while retaining source
provenance and enough evidence to audit the transformation.

Public data can become sensitive through linkage. A notification that a public recall applies to a person can expose
their purchase or medical context even though the recall dataset itself is public.

## Encryption and keys

- Keep programme signing keys outside CKAN configuration files and database fields.
- Use a secret manager or workload-bound key service.
- Encrypt protected relationship mappings and Databox storage with programme/tenant context.
- Separate encryption, signing, token and credential-status keys.
- Record rotation and retain verification history.
- Never pass keys or bearer tokens in RQ arguments, URLs or logs.

## Administrative reality

CKAN sysadmins can ordinarily perform all CKAN actions. The deployment documentation must not claim that CKAN role
configuration alone protects data from host or database administrators. High-sensitivity profiles require controls
below the CKAN logic layer, such as separately credentialed storage, external key custody, audited break-glass
access and infrastructure separation.

This does not stop the functionality being provided through CKAN; it defines the controls needed behind the
extension's institutional surface.

## Analytics

Operational analytics use coarse programme-level measures and thresholded counts. Do not export relationship IDs,
record classes for tiny cohorts, source subject keys or correction details to CKAN stats, third-party analytics or
shared observability systems.

## Threat cases

Conformance testing should attempt:

- calling a source adapter with another subject's identifier;
- changing a DataStore filter, field list, resource or organization;
- using a CKAN editor token against consumer endpoints;
- using a consumer token against the CKAN Action API;
- replaying an outbox event or connection credential;
- bypassing extension actions through bulk CKAN actions;
- extracting protected fields through search, preview, dump or file download;
- injecting malicious RDF/JSON-LD contexts or harvested HTML;
- reading payloads from Redis, logs, metrics or failed-job details;
- abusing sysadmin, support, backup or database access;
- correlating a consumer across CKAN organizations; and
- causing a profile or dataset update to rewrite historical policy/evidence.
