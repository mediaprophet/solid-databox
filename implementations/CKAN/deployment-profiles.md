# Deployment Profiles

## Common components

Every profile includes:

- a pinned CKAN deployment;
- `ckanext-databox` web/action plugin;
- extension database migrations;
- a worker and durable outbox;
- protected relationship and payload storage;
- policy/assurance enforcement;
- programme signing and secret management;
- evidence ledger and reconciliation;
- notification delivery; and
- a Solid-compatible consumer surface.

## Profile A — Small institution

Suitable for a council, small NGO or research unit with a bounded programme and modest volume.

```text
CKAN web + extension blueprint
PostgreSQL (separate extension schema/role)
Redis/RQ worker
protected object/filesystem storage
external KMS or managed secret store
```

The embedded gateway may be used after its protocol scope is pinned. Separate process identities are retained even
when components share a host. Start with one low/medium sensitivity programme and synthetic data.

## Profile B — Multi-agency government portal

Suitable for national, state or regional CKAN portals hosting many publisher organizations.

```text
CKAN web tier
ckanext-databox control API
programme-scoped worker queues
separate Databox gateway tier
tenant/programme-scoped storage and keys
central evidence service with segregated projections
agency source connectors and review systems
```

Use verified publisher bindings, programme-specific service identities, origins/audiences and keys. The central site
operator is not automatically principal for agency programmes. Cross-agency administration and analytics are denied
by default.

## Profile C — Federated/harvesting portal

Suitable for aggregators that harvest from upstream CKAN or other catalogues.

The local extension provides discovery and routing by default. An actionable local Databox programme requires an
out-of-band verified service agreement with the upstream principal. Harvest jobs never import credentials, activate
profiles or confer issuance authority.

Where the upstream publisher operates its own Databox, the local catalogue links to the public onboarding route and
retains harvest provenance. Where the aggregator is appointed as processor, its signed local profile names the
principal and processor chain explicitly.

## Profile D — High-sensitivity institution

Suitable for health, justice, social services, humanitarian protection or fine-grained utility data.

Require:

- separate gateway and worker security zones;
- separately credentialed source access with row/field constraints;
- external key custody and envelope encryption;
- no payloads in the CKAN database or Redis;
- high-assurance staff and consumer authentication with step-up;
- dual control for source binding, profile activation and emergency access;
- egress filtering and content quarantine;
- immutable or independently protected evidence storage;
- audited break-glass procedure;
- tested backup/restore isolation; and
- formal privacy, security and legal review.

Do not claim that CKAN organization roles or the private-dataset flag alone provide these controls.

## Profile E — Enterprise internal catalogue

Suitable for organisations using CKAN as an internal data catalogue.

Integrate enterprise workforce SSO for staff while keeping consumer identities and credentials separate. A CKAN
dataset's internal visibility may help protect source metadata but does not authorize delivery to a customer,
employee or supplier. Programmes remain purpose-bound and cross-business-unit correlation is denied.

## Capacity and queue isolation

Dimension independently:

- CKAN catalogue traffic;
- source extraction volume;
- large-file processing;
- relationship provisioning;
- consumer retrieval;
- notification fan-out;
- submission/review traffic; and
- reconciliation/audit queries.

Backpressure in one class must not drop evidence or block correction deadlines. Use explicit limits and dead-letter
review rather than unbounded retries.

## Availability

CKAN catalogue availability and Databox availability are related but not identical. A split deployment should allow
consumers to retrieve previously accepted records while CKAN administration is down. An embedded deployment must
document the coupled failure domain and recovery objective.

## Upgrade policy

Before a CKAN, extension, database, Solr, Redis/RQ or storage upgrade:

1. run migration and rollback rehearsals on representative protected state;
2. rerun auth and cross-subject tests;
3. verify source adapter and plugin-interface compatibility;
4. verify Solid compatibility and independent-client tests;
5. verify evidence signatures and retained key history;
6. reconcile all outbox and exchange state; and
7. publish the updated compatibility manifest and known deviations.
