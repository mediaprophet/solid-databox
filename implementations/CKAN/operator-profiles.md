# CKAN Operator Profiles

## Priority operators

CKAN installations vary from public national catalogues to private enterprise data inventories. The Databox profile
must be selected by the accountable programme, not inferred from the presence of CKAN.

| Operator profile | Typical CKAN role | Suitable Databox role | Initial record classes | Principal risk |
|---|---|---|---|---|
| National or federal government | Cross-agency open-data catalogue and harvesting hub | Catalogue rights-bearing services and route people to agency-operated Databox programmes | notices, licences, determinations, applications, access/correction requests | Mistaking the central portal operator for the source agency or legal principal |
| State, territory or regional government | Multi-department publication portal | Shared control plane with department-specific programmes and isolated data planes | permits, education, health correspondence, service records | Cross-department correlation and excessive platform administration |
| Local government | Council data portal with limited operating capacity | Managed Databox service with council profile and external provider | rates notices, permits, service requests, consultation submissions | Small-team role overlap and weak separation of duties |
| Intergovernmental or humanitarian body | Aggregated and often federated data exchange | Publish programme metadata and provide protected participant/beneficiary exchange outside CKAN | eligibility evidence, assistance decisions, referrals, corrections | Exposure of vulnerable populations or locations through metadata |
| NGO or civic-data organisation | Community catalogue, research hub or data intermediary | Operate bounded member/client programmes or catalogue services operated by others | membership, case correspondence, referrals, consent receipts | Unclear controller/processor status and volunteer access |
| University or research institution | Research data catalogue and institutional repository | Participant return-of-results, consent and research-record access channel | consent history, participant results, credentials, correction statements | Reidentification and confusing research datasets with participant records |
| Public utility or regulated enterprise | Public reporting portal or internal data catalogue | Customer-facing records linked to regulated service programmes | bills, usage summaries, outage claims, hardship submissions | Publishing fine-grained usage or account identifiers |
| Enterprise internal catalogue | Discovery and governance for internal data assets | Employee, customer or supplier exchange where a separate lawful programme exists | employment records, compliance credentials, supplier evidence | Treating internal catalogue access as consumer authorization |
| Federated catalogue operator | Harvests metadata from many publishers | Discovery and routing only unless separately appointed as processor | programme descriptions and public schemas | Issuing records based only on harvested claims |

## Recommended first demonstrations

### 1. Local-government permits and correspondence

A council CKAN organization publishes a public dataset describing its building-permit Databox service, including the
record classes, responsible council unit, applicable legal instrument, retention and review route. Synthetic permit
holders receive determinations and can return corrections or supporting evidence. The source permit system remains
authoritative; CKAN contains only programme and schema metadata.

This is the best general demonstration because it exercises public-sector accountability without requiring a
national identity integration or genuinely sensitive health data.

### 2. Research participant return of results

A university CKAN catalogue describes a research programme and its participant record classes. A synthetic
participant receives an individual result, consent-history record and study notice through their Databox, then
submits a correction. Aggregate research data may be published through CKAN, but the participant-level exchange is
isolated and never indexed.

### 3. Humanitarian assistance decision

A humanitarian portal publishes public programme metadata while a separate Databox provides a synthetic applicant
with an eligibility decision, reasons and redress path. This demonstrates processor chains and careful metadata
minimisation. It should follow, not precede, the lower-risk council demonstration.

## Organisational mapping

### Site operator

The site operator runs CKAN and may also host shared extension services. It is a processor or platform operator
unless a programme profile explicitly establishes another role. It does not become the principal merely because its
sysadmins can technically administer the site.

### Publisher

A CKAN organization normally represents a publishing body. Before enabling Databox functions, bind it to:

- a resolvable legal entity identifier;
- accountable and operational contacts;
- jurisdiction and service area;
- processor/subcontractor chain;
- trusted institutional service identities;
- permitted programme administrators; and
- a review and redress authority.

Do not derive this binding from the organization title or URL slug.

### Programme

A programme is narrower than a CKAN organization. One government department may operate many programmes with
different legal bases, record classes, systems of record, assurance thresholds and redress pathways. Give each
programme a stable identifier, versioned profile and distinct service authority.

### Consumer

The consumer is the person served by the programme or their lawful representative. They are not required to have a
CKAN user account. If a person is also a CKAN employee or publisher, the two roles and credentials remain distinct.

## Profile selection questions

Before implementation, every operator must answer:

1. Is the CKAN operator the principal, a processor, an aggregator or only a catalogue host?
2. Which CKAN organizations are legally verified publishers?
3. Which bounded programmes will offer Databox exchange?
4. Which systems are authoritative for each record class?
5. Which records are already public, restricted, confidential or person-specific?
6. Which identity providers and assurance mappings are accepted for consumers and staff?
7. Who reviews submissions, corrections and disputes?
8. Which entity issues records and signs receipts?
9. Which entity operates the Solid data plane and evidence ledger?
10. Are datasets harvested, and if so how is publisher and issuance authority verified independently?
11. Which catalogue fields may be public, and could combinations expose a small or vulnerable cohort?
12. What complaint, regulator and judicial review pathways apply?

## Explicit exclusions

The initial target does not cover:

- publishing personal data as CKAN datasets;
- bulk export of a DataStore table to every row subject without a source-specific authorization design;
- treating all private CKAN datasets as Databox assets;
- consumer login through ordinary CKAN local accounts;
- issuing records on behalf of an upstream publisher merely because its metadata was harvested; or
- cross-programme identity resolution, profiling or analytics.
