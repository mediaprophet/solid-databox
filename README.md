# Solid-Databox

> Secure, two-way data exchange between organisations and the people they serve — built on [Solid](https://solidproject.org/).

**▶ [Project presentation](https://docs.google.com/presentation/d/e/2PACX-1vSdodCn2WtQz8uH9PY16YX-iUHu8fhQ-SJ7AgZw7GTTlQcBwXvt7YOd3uhS2ZHw1xJlYcLqPfe6DqMY/pub?start=true&loop=false&delayms=15000)**

**Live demos** — **person side:** [Seraphim consumer agent](https://dev.linkeddata.au/seraphim.html) ·
**organisation side:** [Admin console](https://mediaprophet.github.io/Solid-CSS-Databox/admin/) ·
[Forge control panel](https://mediaprophet.github.io/Solid-CSS-Databox/forge/) ·
[CSS-Databox landing](https://mediaprophet.github.io/Solid-CSS-Databox/)

**Working name.** "Solid-Databox" is provisional — it echoes an earlier Read-Write-Web *databox* (since decommissioned) and carries its intent forward.

**Solid-Databox** lets an organisation run a *databox* for each customer, client, or citizen: a
secure, standards-based exchange point, tied to that one person, through which data flows **in both
directions** — not only *out* to the person, but *back* from them, with the same security either way.

This matters because both directions are broken today. People are denied a timely, verifiable copy of
the records held about them; and when they *submit* something to an institution — a form, a document,
a change of address, a dispute — they get no provenance, no proof of receipt, and no usable record
that they did so. A databox fixes both.

---

## What this project is

Solid-Databox is a **specification-and-tooling project**. Its aim is to produce a **draft
recommendation** for the databox, the **definitions** — vocabulary and protocol — that sit beneath it,
and the **tooling and implementation supports** that let an organisation of any kind stand one up: a
government agency, bank, insurer, university, hospital, utility, telco, employer, NGO, or small business
alike.

The purpose is to help organisations of every form **strengthen their digital relationships with the
people they serve** — and to do so on two fronts that happen to point the same way:

- **Because the law requires it.** Access, correction, notification, provenance, and redress duties
  already bind most organisations that hold data about people. Solid-Databox turns those duties into one
  standard, auditable channel instead of an ad-hoc, per-request scramble — and makes the discharge of
  each duty provable.
- **Because it is simply better practice.** The same channel lifts **data hygiene and accuracy** —
  corrections flow back *with* provenance rather than decaying silently in a call-centre note — raises
  **productivity** by replacing re-keying, chasing, and "did you receive it?" disputes with verifiable
  exchange, and deepens **trust**: a relationship in which either party can prove what passed between
  them is a sturdier one.

Compliance and advantage converge. The organisation that can show its records to the people they
concern, take their corrections cleanly, and prove what was sent and received is at once **more lawful
and more efficient**. Solid-Databox aims to be the shared, reusable plumbing that makes that the ordinary
case rather than a bespoke effort each time.

---

## What it carries

- **Organisation → person.** Records, Verifiable Credentials, determinations, correspondence, and
  receipts held about the person — delivered as a verifiable copy they can keep, curate, and rely on.
- **Person → organisation.** Applications, documents, updated details, consent, evidence, and
  corrections the person provides back — delivered with proof of what was sent and when.

Both directions are **authenticated, integrity-protected, access-controlled, provenance-tracked, and
audited**. Built on the Solid Protocol: the Linked Data Platform, Linked Data Notifications,
WebID / Solid-OIDC, and W3C Verifiable Credentials.

It is a **habeas-data** building block — grounded in the right to access *and correct* the records held
about you — extended to the person's equal right to *be heard*: to submit, respond, and provide, and to
hold verifiable proof that they did.

---

## Why it exists

Institutions create and hold records that decide a person's access to services, legal standing,
employment, and health. The harm is not merely inconvenience — it is *false claims acted upon*, from
wrongful automated debts to determinations made on incomplete information, by people who hold no copy
with which to verify or contest. The other direction is just as unaccountable: a person who tells an
agency their circumstances changed, or lodges a document, usually cannot later *prove* they did.

Solid-Databox puts the engineering burden where the data, the budgets, and the legal obligations
already sit — the organisation runs the databox inside its own environment, bridging its existing SQL
and directory systems — so that a verifiable two-way channel to the people it serves becomes standard,
auditable practice. Once that plumbing exists, consumer software (personal agents and knowledge vaults
such as **Webizen** and **QualiaDB**) can build on the person's side of it.

---

## Both directions, secured the same way

### Organisation → person — your records, verifiably
The organisation deposits a record into the person's databox; a Linked Data Notification announces it;
the person's agent authenticates and retrieves it. The copy the person holds is **independent of the
organisation** — later alteration or deletion on the organisation's side cannot invalidate the copy
already delivered, and where a derivative (say, a call transcript) disagrees with its source, the
original governs and stays retrievable.

### Person → organisation — your submissions, verifiably
The person deposits a submission — a form, a document, a corrected detail, a dispute — into the return
channel. It is **not** applied blindly to the organisation's system of record: it is staged for human
review, with the person's identity, the time, and the content cryptographically bound. Crucially, the
person keeps a **verifiable record that they submitted it** — non-repudiation runs *both* ways, so
"I did tell you" and "we never received it" are no longer unfalsifiable.

---

## What every databox guarantees (the invariants)

These hold in every conforming deployment, and are what a conformance check tests:

1. **Machine proposes, human disposes** — automated systems may only *propose* (`cml:Proposed`); only
   a signed, authoritative human attests. No auto-attestation.
2. **Assurance gates access** — a record's access grade sets a minimum level of assurance; a
   self-asserted account never reaches high-stakes records.
3. **No destructive writes** — neither a person's submission nor a correction is applied straight to a
   system of record; it is staged for human review.
4. **No anonymous institutional actors** — every operator and software actor, across transfers, is
   logged by a resolvable identifier; pseudonymity is allowed, anonymity is not; automated actors
   self-disclose.
5. **Outsourcing does not launder accountability** — records name the delivering party, the principal,
   and who remains accountable.
6. **Evidence is preserved both ways** — deposits, submissions, deletions, and non-responses are
   logged; each party can prove what it sent and when.
7. **Redress travels with the record** — a determination names the competent review body and the
   statutory time limit.
8. **Obligations cite their law** — each record type is bound to the instrument and provision that
   require it.

---

## Standards foundation

Solid-Databox reuses rather than reinvents: the **Solid Protocol** and **Linked Data Platform** for
storage and transport; **Linked Data Notifications** for delivery in both directions; **Verifiable
Credentials** for the payloads; **WebID / Solid-OIDC** bridged to institutional identity (Microsoft
Entra ID, myID) for authentication; **ELI** for legislation identity and the WebCivics
`cml:` / `values:` corpus for the human-rights and deontic layer; and the **GovStack** building-block
model for Digital Public Infrastructure alignment.

---

## From specification to running code

Solid-Databox is a specification-and-tooling project, but it is not only paper. **Both sides of the two-way
channel now have working reference implementations**, developed alongside the specs and organised toward the
same Solid 2026 Hackathon demonstration: the organisation runs the databox; the person holds the agent that
receives and answers it.

### Organisation side — Solid-CSS-Databox (the Forge)

**[Solid-CSS-Databox](https://github.com/mediaprophet/Solid-CSS-Databox)** builds the organisation-hosted
databox as an extension of the [Community Solid Server](https://github.com/CommunitySolidServer/CommunitySolidServer)
(CSS 7.1.9) — the plumbing an institution runs inside its own environment. It provisions opaque,
program-scoped databoxes over the ordinary Solid HTTP / LDP / Solid-OIDC / WAC path, adds a **Forge** control
plane that turns organisation source-events into signed institutional records, issues holder-bound connection
credentials, keeps an append-only evidence ledger with signed receipts, and carries versioned ODRL
rights/obligations with every record.

**Live:** [landing](https://mediaprophet.github.io/Solid-CSS-Databox/) ·
[admin console](https://mediaprophet.github.io/Solid-CSS-Databox/admin/) ·
[Forge control panel](https://mediaprophet.github.io/Solid-CSS-Databox/forge/) ·
[developer guide](https://github.com/mediaprophet/Solid-CSS-Databox/tree/main/databox/guide)

What has landed — a 28-prompt build plan, **DBX-01…DBX-24 complete**, DBX-25 (live-server integration) active:

- **Design corpus** — 26 architecture decision records, a threat model (58 threats/tests), a reference
  architecture, and a conformance matrix.
- **Runtime** — opaque provisioning with tenant isolation; authenticated context with assurance grading;
  Verifiable-Credential connection credentials; a composed authorizer; the deposit/submission gateway;
  record-proof validation; append-only supersession and tombstoning; signed receipts; the evidence ledger;
  an ODRL evaluator + duty engine; and an SSRF-guarded notification outbox with cursor recovery. Every
  subsystem is fail-closed and unit-tested.
- **Live CSS integration (DBX-25, active)** — the Forge is mounted in Components.js, provisions
  WAC-protected databox resources, commits the exact accepted bytes before issuing a receipt, and proves
  authenticated DPoP retrieval through the normal Solid route.
- **Forge Admin console** — a Refine / React operator control plane (`forge-admin/`) to onboard programs,
  provision relationship mappings, dispatch events, declare an organisation's information-provision
  obligations against an ANZSIC-tailored taxonomy viewable through an **AU / multi-jurisdiction / standards
  (DPV · GDPR · ODRL)** lens, run a data-portability registry across ~345 platforms, and handle inbound
  access and correction requests.

It is a **reference implementation**, not yet a hardened product: the live preset's registries, keys and
outbox are still process-local, and its control token is a demonstration boundary rather than organisation
IAM. See its [Databox design corpus](https://github.com/mediaprophet/Solid-CSS-Databox/blob/main/databox/README.md)
and the deployment notes under [`implementations/css/`](implementations/css/README.md).

### Person side — Seraphim (the consumer agent)

**[Seraphim](demo/seraphim/)** is the person's side of the same channel: a consumer-controlled Solid client,
built in Flutter on `solidpod` / `solidui`, that receives an organisation's records and lodges the person's
submissions back — holding the independent verifiable copy and the proof-of-submission the databox
guarantees. **[Live web demo →](https://dev.linkeddata.au/seraphim.html)**

It is deliberately **online-first and custody-preserving** (the ANU `anusii` pattern): no local offline
database — structured data lives only in the person's remote Pod. Authentication is Solid-OIDC (WebID, DPoP,
PKCE) via `solidui`. Its feature areas map directly onto the databox's record and rights vocabulary — a
credential wallet for W3C VCs; receipt and document capture; corrections, evidence, cost-disclosure and
communications; referrals and case plans; a consent manager; and a QR scan/generate flow (`mobile_scanner` /
`qr_flutter`) for resolving a databox connection and appending data to the Pod. The warm, high-contrast
design is a deliberate stance — *"the warmth of humanity, human rights, and data sovereignty"* — and its
roadmap ties into the **QualiaDB** license framework for natural persons.

Seraphim is in **active development**: the domain screens are scaffolded across the feature set above, with
a live web build; it is the demonstration client, not yet a finished product.

---

## Repository contents

**Looking for a specific component, use case, or ontology?** Start with the **[Comprehensive Project Catalog](CATALOG.md)** for a categorized database of all building blocks, industry applications, and semantic domains in this repository.

**The specification (ReSpec).** The normative and explanatory core.

| File | What it is |
|---|---|
| [`solid-databox-overview.html`](solid-databox-overview.html) | **Start here** — the project front door. |
| [`solid-databox-primer.html`](solid-databox-primer.html) | Architecture & rationale, non-normative. |
| [`solid-databox-protocol.html`](solid-databox-protocol.html) | The normative core: identity, assurance, access grades, guardianship, accountability, jurisdiction & redress, legal basis, the deposit/submit/notify/retrieve/correct protocol, evidence & audit. |
| [`solid-databox-vocabulary.html`](solid-databox-vocabulary.html) | The record & party ontology: content categories, transcript fidelity, participants, organisations & delivery chains, jurisdiction & oversight, legal instruments, conduct/coercion/risk. |

**Implementation supports & tooling.** What an organisation's developers and coding agents build from.

| File / folder | What it is |
|---|---|
| [`solid-databox-kit-blueprint.md`](solid-databox-kit-blueprint.md) | The **Institutional Deployment Kit (Agent Edition)** — the databox-specific agent files + ontological factors so any institution's coding agent can scaffold a conforming databox and have a `conformance-checker` verify the invariants. |
| [`soliddev-agent-helper/`](soliddev-agent-helper/) | **Draft.** A general-purpose **W3C Solid agent knowledge base** — root prompts (`agents.md`, `claude.md`, `.cursorrules`) plus `knowledge/` guides for Solid core, the semantic web, ecosystem standards, ontologies, and implementation. This is the *general Solid layer* the databox-specific kit builds upon: it teaches an agent to write correct Solid/RDF at all, before the kit adds the databox invariants. *(Currently a nested Git repository — see Status.)* |

**Reference implementations, demo & building blocks.** The running code and the modular pieces it composes
(see [From specification to running code](#from-specification-to-running-code) above and the
[Comprehensive Project Catalog](CATALOG.md)).

| File / folder | What it is |
|---|---|
| [`implementations/css/`](implementations/css/README.md) | **Organisation side.** Notes and deployment guidance for the CSS-hosted databox — the design corpus the [Solid-CSS-Databox](https://github.com/mediaprophet/Solid-CSS-Databox) reference implementation is built from. |
| [`implementations/ckan/`](implementations/ckan/README.md) | Bridging open-government data portals (CKAN) with citizen databoxes (barely started). |
| [`demo/seraphim/`](demo/seraphim/) | **Person side.** The Seraphim consumer-agent Flutter app (`solidpod` / `solidui`). [Live web demo](https://dev.linkeddata.au/seraphim.html). |
| [`components/`](CATALOG.md#2-components--building-blocks) | Modular building blocks — strong identity, micro-credentials, GS1 provenance, IoT / Web of Things, coupons & vouchers, platform integrations. |
| [`contexts/`](CATALOG.md#3-contexts--domains) | Domain & regulatory contexts — compliance, CRM, ESG, guardianship & relations, health & welfare. |
| [`industry-applications/`](CATALOG.md#1-industry-applications) | Sector use cases — commercial, civics, community, education, government, sporting organisations. |
| [`ontologies/`](CATALOG.md#4-ontologies--vocabularies) | Supporting vocabularies (e.g. WoT + SOSA/SSN for translating IoT telemetry into RDF). |

**Background.**

| File | What it is |
|---|---|
| [`Solid_2026_Hackathon_Project_Proposal_v1.3.0.docx.md`](Solid_2026_Hackathon_Project_Proposal_v1.3.0.docx.md) | The long-form proposal: human-rights framing, prior work, use cases, and the Solid 2026 Hackathon (Canberra) scope. |
| [Project presentation](https://docs.google.com/presentation/d/e/2PACX-1vSdodCn2WtQz8uH9PY16YX-iUHu8fhQ-SJ7AgZw7GTTlQcBwXvt7YOd3uhS2ZHw1xJlYcLqPfe6DqMY/pub?start=true&loop=false&delayms=15000) | Google Slides walkthrough of the project (published). |

---

## Resources

Solid-Databox reuses established standards and vocabularies rather than reinventing them. The links below
are the working reference set; the [`soliddev-agent-helper/knowledge/`](soliddev-agent-helper/knowledge/)
guides document many of them for coding agents, and the ReSpec specs carry the authoritative citations.

### Solid & platform
- [Solid Project](https://solidproject.org/) · [Solid Technical Reports (TR)](https://solidproject.org/TR/)
- [Solid Protocol](https://solidproject.org/TR/protocol) · [Solid-OIDC](https://solidproject.org/TR/oidc)
- [Community Solid Server (CSS)](https://github.com/CommunitySolidServer/CommunitySolidServer) — the reference server the kit targets
- [Inrupt developer documentation](https://docs.inrupt.com/) · [Solid Community Forum](https://forum.solidproject.org/)

### Credentials, policy & assurance
- [W3C Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/) · [VC Data Integrity — BBS](https://www.w3.org/TR/vc-di-bbs/) (selective disclosure)
- [OpenID for Verifiable Credential Issuance (OpenID4VCI)](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html)
- [Decentralized Identifiers (DIDs)](https://www.w3.org/TR/did-core/)
- [ODRL](https://www.w3.org/TR/odrl-model/) — usage policies over records
- [NIST SP 800-63-3](https://pages.nist.gov/800-63-3/) · [eIDAS](https://eur-lex.europa.eu/eli/reg/2014/910/oj) — levels of assurance
- [GovStack](https://www.govstack.global/) — Digital Public Infrastructure building-block model

### Ontologies & vocabularies
Resolvable vocabularies the specs reuse:
- **Solid profiles & pods** — [FOAF](http://xmlns.com/foaf/0.1/), [vCard](http://www.w3.org/2006/vcard/ns#), [LDP](http://www.w3.org/ns/ldp#), [WebACL (`acl:`)](http://www.w3.org/ns/auth/acl#)
- **Records & provenance** — [PROV-O](http://www.w3.org/ns/prov#), [DC Terms](http://purl.org/dc/terms/), [Schema.org](https://schema.org/), [PREMIS](https://id.loc.gov/ontologies/premis-3-0-0.html), [DCAT](https://www.w3.org/TR/vocab-dcat-3/), [SKOS](http://www.w3.org/2004/02/skos/core#), [OWL-Time](http://www.w3.org/2006/time#), [Web Annotation (`oa:`)](http://www.w3.org/ns/oa#)
- **Organisations & law** — [Org](http://www.w3.org/ns/org#), [RegOrg (`rov:`)](https://www.w3.org/ns/regorg#), [ELI](https://op.europa.eu/en/web/eu-vocabularies/eli) (European Legislation Identifier)
- **This project's namespace** — `sop:` → [`https://w3id.org/solid-databox/ns#`](https://w3id.org/solid-databox/ns#)

### Government & Linked Data
- **[Australian Government Linked Data Working Group (AGLDWG)](https://www.linked.data.gov.au/)** — Guidelines, URI namespaces, and ontologies for Australian government linked data. ([AGLDWG GitHub](https://github.com/AGLDWG))


---

## Status

Unofficial draft, organised toward the **Solid 2026 Hackathon** (Canberra, July 2026). The specifications
render under ReSpec; the reference-implementation kit, the per-institution profile.
 Two reference implementations are further along: the
organisation-side **[Solid-CSS-Databox](https://github.com/mediaprophet/Solid-CSS-Databox)** has completed
DBX-01…DBX-24 of a 28-prompt build (with live-server integration, DBX-25, active), and the consumer-side
**[Seraphim](demo/seraphim/)** agent has a live web build — both fail-closed and experimental rather than
production. Open design questions (whether deposit is mandated at
record-creation or absence must be provable; retention versus a right to erasure; who custodies pseudonym
resolution; per-jurisdiction access-grade tables) are tracked as issue boxes in the protocol. This is a
specification and design effort, not yet a production system.

> **Note on `soliddev-agent-helper/`.** It currently carries its own `.git/`, so it is a **nested Git
> repository** the parent repo does not track. Decide whether to vendor it as a plain folder (remove its
> `.git/`) or wire it in as a proper Git submodule before relying on it here.

---

## Authorship

Timothy Charles Holborn — [WebCivics](https://webcivics.net/) · human-rights instruments and the
`cml:` / `values:` ontologies at [ns.webcivics.net](https://ns.webcivics.net/).

*License: [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE) — open,
implementable public-good infrastructure.*
