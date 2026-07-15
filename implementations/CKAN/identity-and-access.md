# Identity and Access

## Separate identity domains

The extension has three identity domains that must not collapse into one another.

| Domain | Examples | Authentication | Purpose |
|---|---|---|---|
| CKAN workforce | sysadmin, organization admin, editor, reviewer | CKAN session, API token, enterprise SSO | Catalogue and programme administration |
| Institutional services | source adapter, worker, signer, review connector | dedicated service credential and workload identity | Automated institutional operations |
| Consumer side | person, guardian, consumer agent | Solid-OIDC or adopted profile plus relationship credential | Databox retrieval and submission |

A person does not need a CKAN account to use their Databox. CKAN login is not a consumer login ceremony.

## Workforce authorization

CKAN organization roles are a useful first gate but are too broad to define Databox powers. Add extension roles such
as:

- programme profile drafter;
- programme approver;
- source-binding administrator;
- relationship support officer;
- submission reviewer;
- evidence auditor; and
- key/security administrator.

Use `IAuthFunctions` for every extension Action API action. Views and templates may hide controls for usability but
must not enforce authorization. High-impact actions require step-up authentication and, where feasible, separation
of duties.

An organization editor must not automatically activate a source binding. A CKAN sysadmin must use an explicit,
audited emergency or administration route for protected extension state rather than an ordinary consumer endpoint.

## Institutional service identity

Do not reuse a human CKAN API token for workers. Each service identity is bound to:

- CKAN site and programme;
- allowed extension actions;
- allowed source datasets/resources or external systems;
- token audience and expiry;
- deployment/workload identity;
- signing or encryption key reference; and
- rotation and revocation policy.

The source adapter calls the CKAN logic layer using the minimum service context required. Direct database access is
not a substitute for action authorization.

## Consumer relationship

Onboarding proves the relationship between a person and programme, then binds it to a pairwise consumer identifier
and consumer-controlled key. The protected mapping is:

```text
publisher + programme + source namespace + source subject identifier
    <-> opaque relationship identifier
    <-> pairwise consumer identifier and active holder key
```

None of these values is stored in a CKAN dataset or Solr document.

The extension issues a portable, signed, revocable Databox Connection Credential that describes discovery, the
programme, relationship-specific grant reference and holder binding. It is not a CKAN API token and is not accepted
as a bearer access token. The consumer agent proves possession of its bound key to obtain short-lived,
audience-bound data-plane access.

## Assurance

Each programme supplies a signed mapping from trusted issuer claims to normalized assurance dimensions:

- identity proofing;
- authenticator strength;
- federation confidence;
- authentication freshness;
- represented-party/delegation confidence; and
- required step-up conditions.

Each record class has a minimum access grade. Source classification, CKAN visibility and Databox access grade are
different values and must all be evaluated.

## Authorization composition

An institutional delivery is allowed only when:

```text
active programme profile
AND authorized service identity
AND source CKAN authorization
AND allow-listed source binding
AND valid subject selection
AND relationship active
AND record class and purpose permitted
AND policy preconditions satisfied
```

A consumer operation is allowed only when:

```text
valid consumer authentication and holder proof
AND correct programme/relationship audience
AND active access grant
AND sufficient assurance and freshness
AND resource/operation permission
AND Databox policy permits the action
```

All missing or ambiguous inputs fail closed with safe reason codes.

## Guardians and representatives

Record actor, represented person, authority source, scope, start/end time and revocation state separately. A guardian
does not replace the person's identity, and a workforce reviewer does not impersonate either. Delegated scope is
evaluated per record and submission class.

## Revocation and recovery

Support independent revocation of:

- CKAN workforce session/API token;
- service identity;
- programme profile;
- source binding;
- consumer connection credential;
- access grant;
- holder key; and
- guardian delegation.

Recovery creates an audited key/credential transition. It never reveals or copies the previous private key. Existing
accepted records and evidence remain verifiable through retained key history and status material.
