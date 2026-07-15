# Exchange and Evidence

## Exchange modes

The extension supports three institutional source modes:

1. **CKAN event-driven** — an approved dataset/resource change or explicit institutional action creates a delivery
   event.
2. **CKAN query-driven** — an authorized scheduled or requested operation selects a subject-specific view from an
   approved CKAN source binding.
3. **External event-driven** — a source system event enters the extension outbox through a dedicated connector.

Public catalogue browsing never triggers a person-level delivery.

## CKAN-to-Databox deposit

```text
approved trigger
  -> write immutable outbox row in the same transaction as extension state change
  -> worker claims event using idempotency key
  -> authorize institutional service and source action
  -> resolve protected relationship mapping
  -> execute bounded source adapter and subject selector
  -> transform and validate record envelope
  -> sign with programme service key
  -> durably commit to relationship Databox
  -> append evidence and return signed receipt
  -> mark outbox result and schedule notification
```

Hooks such as `IPackageController.after_dataset_update` may detect relevant changes, but they are not by themselves a
durable transaction boundary and bulk actions may bypass some callbacks. Chained actions or explicit extension
actions must cover every adopted trigger, and reconciliation must detect omissions.

## Record envelope

Every accepted record includes or binds:

- immutable record and transaction identifiers;
- programme, principal, issuer and processor identities;
- represented relationship identifier without source PII;
- record class, schema and media type;
- source dataset/resource or system identifier and source version;
- source authorization decision reference;
- generation and acceptance times;
- payload digest and signature/proof;
- provenance and transformation version;
- legal basis and declared purpose;
- access grade and achieved assurance requirements;
- policy/profile identifiers and immutable digests;
- correction, access, complaint and redress routes; and
- any derivative/source fidelity relationship.

## Signed acceptance receipt

Issue a receipt only after durable record or submission commit and evidence append. It records:

- transaction and idempotency identifiers;
- accepted resource and payload digest;
- sender, receiver, principal and represented relationship;
- source/profile/policy versions and digests;
- acceptance time and status;
- activated duties;
- evidence-ledger reference; and
- signing key and verification material.

Acceptance proves receipt of bytes under a policy. It does not prove that a claim is true, that a correction has been
accepted substantively, or that a downstream system has applied it.

## Consumer submission

```text
consumer agent authenticates and submits
  -> validate relationship, class, media type, shape, size and policy
  -> quarantine unsafe binary evidence where required
  -> durably commit submission and append evidence
  -> return signed acceptance receipt
  -> create institutional-delivery outbox event
  -> source/review connector creates governed case
  -> reviewer records signed disposition
  -> extension publishes disposition and any superseding record
```

The extension must not translate a correction directly into `package_update`, `resource_update`,
`datastore_upsert` or a file overwrite. A source-specific reviewed disposition controls any later source change.

## Transactional outbox

CKAN background jobs use RQ and Redis, but executed job history is not retained as an evidence ledger. The extension
therefore uses an extension-owned durable outbox table containing payload references, not sensitive payloads.

Required states are:

```text
pending -> claimed -> delivered
   |          |
   |          `-> retryable-failure -> pending
   `-------------------------------> terminal-failure
```

Leases, attempts, next retry, result digest and reconciliation state are recorded. A worker crash after remote commit
is resolved by the same idempotency key; it must not create a duplicate record.

## Notifications

Notifications are minimal hints. They contain no subject name, source-row key, sensitive class label or payload.
Authoritative state is retrieved from the authenticated Databox surface. Missed hints are recoverable through a
cursor/event feed or state reconciliation.

## Evidence ledger

The ledger is append-only and independent of CKAN activity streams and RQ logs. It binds:

- verified actor, client, issuer, audience and assurance;
- represented party and delegation;
- CKAN authorization and Databox authorization decisions;
- source binding, selected source version and transformation;
- operation, record/submission/receipt digests and outcomes;
- active programme, policy and legal-corpus digests;
- notification attempts and delivery state;
- review/disposition and source reconciliation; and
- administrative access, export, key rotation and recovery.

Consumer-visible, staff-visible and auditor-visible projections are derived with independent authorization and data
minimisation.

## Reconciliation

At minimum reconcile:

- approved programme profiles against activated gateway profiles;
- source events against outbox events;
- delivered events against receipts and ledger entries;
- Databox records against source versions;
- submissions against institutional review cases;
- dispositions against source corrections or associated statements; and
- notification duties against their configured fulfilment condition.

Reconciliation reports must avoid placing person identifiers in CKAN metrics labels or public administrative pages.

## Deletion and retention

Do not silently delete accepted evidence when a CKAN dataset or resource is deleted. Apply the programme's legal and
retention policy, preserve required tombstones and proof, and distinguish:

- source deletion;
- catalogue withdrawal;
- authorization removal;
- relationship closure;
- Databox payload deletion; and
- evidence retention.

Each is a separate, auditable event.
