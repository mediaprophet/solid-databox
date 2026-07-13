# Solid-Databox

> Secure, two-way data exchange between organisations and the people they serve — built on [Solid](https://solidproject.org/).

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

## Repository contents

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
| [`legis2cml.py`](legis2cml.py) | Tooling — transforms legislation into the `cml:` concept layer; the basis of the planned legal corpus (see Resources). |

**Background.**

| File | What it is |
|---|---|
| [`Solid_2026_Hackathon_Project_Proposal_v1.3.0.docx.md`](Solid_2026_Hackathon_Project_Proposal_v1.3.0.docx.md) | The long-form proposal: human-rights framing, prior work, use cases, and the Solid 2026 Hackathon (Canberra) scope. |

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

### WebCivics human-rights corpus
- **[ns.webcivics.net](https://ns.webcivics.net/)** — the WebCivics ontology namespace: the `cml:` / `values:`
  corpus (human-rights instruments; jural, jurisdiction, and agency vocabularies) that carries
  Solid-Databox's rights-and-deontic layer. The vocabulary currently defers to it under the `wc:` prefix.
  Machine output in this layer is always `cml:Proposed`, never attested — a human must sign to make it
  authoritative.

### Legal corpus (planned)
A machine-readable **archive of Australian federal legislation** is to be prepared, in time, to support the
work — codified via [`legis2cml.py`](legis2cml.py) into the `cml:` / `values:` concept layer and identified
with [ELI](https://op.europa.eu/en/web/eu-vocabularies/eli). Its purpose is to ground each record type's
obligations in the instrument and provision that require it — the *"obligations cite their law"* invariant —
and to let the project define fit-for-purpose solutions **per vertical and per organisation type**: the
legal basis a bank, an insurer, a hospital, a university, or an agency must each satisfy differs, and a
codified corpus makes those differences explicit, comparable, and implementable.

---

## Status

Unofficial draft, organised toward the **Solid 2026 Hackathon** (Canberra, July 2026). The specifications
render under ReSpec; the reference-implementation kit, the per-institution profile, and the
`soliddev-agent-helper/` knowledge base are all in **draft**, and the Australian federal **legal corpus is
planned** (to be codified via `legis2cml.py`). Open design questions (whether deposit is mandated at
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

*License: to be confirmed — intended as open, implementable public-good infrastructure. A `LICENSE`
file should be added before wider distribution.*
