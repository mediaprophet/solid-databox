# Solid-Databox Institutional Deployment Kit (Agent Edition) — Blueprint

**Hackathon deliverable.** Not a running server, but the **agent-drivable kit** that lets any
institution implement a conforming Solid-Databox "databox" for its customers/consumers. The kit is
the reproducible, delegable form of the v1.3.0 strategy: put the implementation burden on the
institution, and make it cheap by handing their coding agent everything it needs.

**What the hackathon demonstrates.** Give the kit + one filled example profile (a synthetic agency)
to a coding agent → it scaffolds a conforming Community-Solid-Server databox → the
`conformance-checker` subagent verifies the invariants. The demo is *reproducible institutional
implementation*, not one bespoke server.

---

## 1. The core split — the real engineering challenge

| | **Universal** (spec defines once) | **Per-institution** (a config profile) |
|---|---|---|
| Nature | identical for every deployment | varies per institution |
| Contents | vocabulary, protocol, invariants, factor definitions | record types held, jurisdiction, identity provider (Entra tenant / myID), access-grade thresholds, legal instruments, systems of record |
| Owner | the standard | the institution's dev fills it in |

The agent files consume **universal + profile** and generate a conforming server. Defining this
split precisely — what is fixed vs what each institution supplies — *is* the ontological engineering
challenge. Get it right and implementation is a fill-in-the-profile-then-run-the-agent exercise.

---

## 2. The invariants — the agent's constitution (MUST hold in every implementation)

These are the hard rules the agent may never violate, and what `conformance-checker` tests:

1. **Curation Prime Directive** — a machine may only *propose* (`cml:Proposed`); only a signed human
   attests (`cml:Attested` / `skos:exactMatch`). No auto-attestation, ever.
2. **Access grade ≥ record minimum** — never release a high-grade record to a low-assurance
   requester; a self-asserted account is confined to the floor.
3. **No destructive correction** — citizen corrections go to a staff-review queue, never a direct
   `UPDATE` on the system of record.
4. **Institutional actors are non-anonymous** — every operator/software actor and transfer is logged
   by a stable identifier; pseudonymity allowed, anonymity forbidden; automated actors self-disclose.
5. **Accountable party named** — for outsourced/subcontracted delivery, both delivering party and
   principal, and who remains accountable.
6. **Evidence preservation** — deposits, deletions, and non-responses are logged; a delivered copy is
   independent of the egress point; where a derivative (transcript) and its source disagree, the
   original governs and stays retrievable.
7. **Redress is in the record** — a determination names the competent review body and the statutory
   time limit.
8. **Legal basis cited** — each record type exposed is `sop:mandatedBy` the instrument/provision that
   requires it.

---

## 3. Ontological factors — inventory & status

The "factors an institution exposes via its databox." Most are already defined; the gap column is the
work to close for the kit.

| # | Factor | Defined in | Status |
|---|---|---|---|
| 1 | Record categories (modality × function) | vocabulary | ✅ built |
| 2 | Derivatives / transcript fidelity | vocabulary | ✅ built |
| 3 | Access grades ↔ level of assurance | protocol + vocabulary | ⚠ mechanism built; **per-jurisdiction grade table = profile** |
| 4 | Identity (enumerated cryptographic state; WebID + Entra/myID) | protocol | ✅ built |
| 5 | Parties: actors, orgs, sectors, delivery chains, oversight | vocabulary | ✅ built |
| 6 | Jurisdiction + redress pathways | both | ✅ built |
| 7 | Legal grounding (`mandatedBy` / `dischargedBy`) | both | ⚠ built; **AU instruments to codify (via legis2cml)** |
| 8 | Per-record deontic/CML logic | cml:/values: + legis2cml | ✅ built |
| 9 | Evidence & audit logging | protocol | ✅ built |
| 10 | Deposit → notify → retrieve → correct protocol | protocol | ✅ built |
| 11 | Attestations / ZK / risk (coercion, insurable/uninsurable) | both | ✅ built |

**Kit-specific gaps to close:**
- `sop:` vocabulary as a **loadable `.ttl`** (today it lives only inside the ReSpec HTML).
- The **per-institution profile schema** (`institution.schema.json` + example).
- The **conformance checklist** (the invariants + factor requirements as MUST-level tests).
- The **AU legal instruments** codified (`legis2cml` on the Privacy Act etc.).
- The ReSpec docs **validated/rendered** (still outstanding) and the `wc:` → `cml:`/`values:` prefix
  correction applied.

---

## 4. Kit file structure

```
solid-databox-kit/
  README.md                      # what this is; the fill-profile-then-run flow
  AGENTS.md                      # agent constitution: the invariants + how to use the kit
  CLAUDE.md                      # Claude Code entry (may alias AGENTS.md)
  .cursor/rules/solid-databox.mdc  # Cursor equivalent
  spec/
    solid-databox-protocol.html  # normative context (from this repo)
    solid-databox-vocabulary.html
    solid-databox-primer.html
    conformance-profile.md       # the MUST-level checklist implementations satisfy
  ontology/
    sop.ttl                      # the sop: vocabulary, machine-loadable
    corpus-refs.md               # pointers to cml:/values: + ns.webcivics.net
  profile/
    institution.schema.json      # validates a per-institution profile
    institution.example.yaml     # a synthetic agency, filled in — the demo input
  agents/                        # subagent definitions (Claude Code .claude/agents style)
    pod-provisioner.md           #   stand up the CSS egress point + slots
    entra-bridge.md              #   Entra/AD -> Solid-OIDC -> WebID mapping
    vc-issuer.md                 #   SQL row -> JSON-LD Verifiable Credential deposit
    access-grade-enforcer.md     #   assurance >= record grade gate
    audit-logger.md              #   evidence/audit + non-response/deletion logging
    conformance-checker.md       #   verifies the §2 invariants
  tasks/                         # the implementation plan the agent works through
    00-bootstrap.md  01-egress-point.md  02-auth-assurance.md
    03-deposit-notify-retrieve.md  04-correction-audit.md  05-conformance.md
  tools/
    legis2cml.py                 # already built — legislation -> CML concept layer
```

---

## 5. The agent files, specifically

- **AGENTS.md** — the constitution: states the invariants (§2), the universal/per-institution split
  (§1), the reference stack (Community Solid Server, Solid-OIDC, LDP, LDN, VC), and the rule *read the
  institution profile before generating anything; never violate an invariant to satisfy a profile*.
- **agents/*.md** — one subagent per implementation surface, each with a tight brief + which invariant
  it owns. `conformance-checker` is adversarial: it tries to make the server leak a high-grade record
  to a low-assurance account, and fails the build if it can.
- **tasks/*.md** — an ordered, resumable plan (bootstrap → egress point → auth/assurance → the
  protocol flow → correction/audit → conformance), so a fresh agent can pick up mid-implementation.
- **profile/institution.schema.json** — the per-institution factors, validated: `jurisdiction`,
  `identityProvider` (entra|myid|…), `recordTypes[]` (category + minimum assurance grade + mandating
  instrument), `systemsOfRecord[]`, `oversightBodies[]`, `deploymentProfile` (docker-compose|helm).

---

## 6. Recommended build order

1. **`sop.ttl` + `conformance-profile.md`** — the machine-loadable ontology + the MUST checklist.
   These crystallise the factors into implementable requirements; everything else references them.
2. **`AGENTS.md` + `institution.schema.json` + `institution.example.yaml`** — the constitution + the
   per-institution profile and a filled synthetic agency (the demo input).
3. **`agents/*.md` + `tasks/*.md`** — the subagents and the ordered plan.
4. **Demo** — run a coding agent against the kit + example profile; `conformance-checker` verifies.

*Prepared as the definition of the hackathon engineering challenge: defining the ontological factors
an institutional Solid databox exposes, packaged so any institution's coding agent can implement it.*
