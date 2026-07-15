# CSS compliance framework

Status: implemented decision-support baseline; all Australian legal mappings
remain `proposed` until human legal review.

The implementation is in `C:\Projects\CommunitySolidServer`:

| Capability | Implementation |
|---|---|
| Instrument and provision registry | `src/databox/compliance/AustralianComplianceRegistry.ts` |
| Applicability profiles | `ComplianceEngine.evaluate` with three-valued outcomes |
| Obligation/control/evidence mappings | `AU_CONTROL_MAPPINGS` |
| Deadlines, triggers, exceptions, remedies | typed mapping metadata |
| Executable control assessment | `ComplianceEngine.evaluate` |
| Human review and effective period | time-bounded `LegalAttestation` pinned to corpus digests |
| Legal-change impact | `legalChangeImpact` |
| Consumer-facing obligations | `consumerObligations` |
| Audit and attestation export | deterministic `createAuditExport` with SHA-256 digest |
| Forge publication gate | `MappingForge.registerProgram` blocks claimed compliance unless the gate passes |
| Ontology and schema | `databox/compliance/compliance.ttl` and `compliance-profile.schema.json` |
| Executable tests | `test/unit/databox/compliance/ComplianceEngine.test.ts` |

## Operating procedure

1. Complete organization facts. `isAppEntity` and `isCdrParticipant` are legal
   classification inputs, not facts the server should guess from turnover or
   industry labels. Record the source and reviewer for each classification.
2. Select the profiles whose predicates evaluate to `applicable`. Resolve every
   `indeterminate` outcome before seeking publication.
3. Review each source directly at the Federal Register URL. The local corpus is
   an indexing and machine-processing aid with `cml:Proposed` curation status.
4. Run each mapped control test. Store immutable evidence identifiers, media
   types, observation times, verification state and expiry.
5. Have a qualified reviewer approve or reject the mapping set. An approval is
   time bounded and pins every applicable mapping plus the exact corpus hashes.
6. Run the Forge gate. A failed gate is a release blocker for any claim of legal
   compliance; it is not converted to a warning.
7. Publish the consumer view and audit export from the assessed mapping set.
8. On an instrument/corpus update, run change-impact analysis, invalidate stale
   attestations and repeat review for affected controls.

## Initial controls

The baseline covers privacy governance and consumer information, collection
notice, purpose-limited use/disclosure, data quality/security, access and
correction, eligible-data-breach assessment/notification, CDR correction and a
CDR consumer dashboard. The 30-calendar-day NDB item is represented specifically
as the suspected-breach assessment period. The CDR correction item is represented
as 10 business days. Qualification, trigger and exception text remains visible
because a duration alone is unsafe.

## Deliberate limits and next review work

- The registry does not yet cover every Privacy Act, Australian Consumer Law,
  state/territory, employment, health, credit, telecommunications or sector rule.
- It does not infer APP-entity status, CDR role or statutory exceptions.
- It does not treat an ODRL policy decision as proof that a legal duty was met.
- Legal attestations are typed records; production deployments still need a
  signature profile, qualified reviewer registry and durable append-only store.
- The consumer view is a JSON projection ready for an HTTP/UI adapter; production
  presentation, accessibility and multilingual content remain to be built.
- Corpus digest changes detect review impact, not semantic legal change. Human
  comparison of the official instruments remains mandatory.

## AI-agent use

An agent may read the local corpus, propose citations, generate mappings, run
control tests and assemble evidence. It must preserve `proposed` status, identify
official and derived sources separately, disclose uncertainty, and stop at the
human-review gate. Ollama or another local model may assist classification or
summarization, but model output is never an attestation or authoritative legal
text.
