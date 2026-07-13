# Related Ecosystem Standards for Agents

Beyond the core Solid specifications, modern decentralized apps often integrate with broader ecosystem standards.

## 1. ODRL (Open Digital Rights Language)
[ODRL](https://www.w3.org/TR/odrl-model/) is a W3C standard used for expressing policies regarding data usage. While WAC/ACP defines *who* can access a file, ODRL can define *how* they can use it (e.g., "you can read this medical data for research, but you cannot commercialize it").

### Rules for Agents:
- ODRL policies consist of `Permissions`, `Prohibitions`, and `Duties`.
- Use the ODRL vocabulary `http://www.w3.org/ns/odrl/2/`.
- In Solid, ODRL policies are often attached to datasets as metadata.

## 2. Verifiable Credentials (VCs)
[Verifiable Credentials](https://www.w3.org/TR/vc-data-model/) provide a cryptographically secure way to assert claims (e.g., a university issuing a degree to a WebID).

### Rules for Agents:
- VCs map perfectly to Solid. A user can store a VC in their Pod (e.g., in an `/identity/credentials/` container).
- When validating a user's access, an app might challenge the user to present a VC (via Verifiable Presentation) rather than just relying on their WebID identity.
- Data format is typically JSON-LD or JWT.

## 3. Decentralized Identifiers (DIDs)
While Solid natively uses HTTP URIs (WebIDs) for identity, the ecosystem increasingly supports [DIDs](https://www.w3.org/TR/did-core/) (e.g., `did:key:xyz`).

### Rules for Agents:
- A WebID profile document can state that the user is also identified by a DID using `owl:sameAs`.
- If requested to implement DIDs, look for `did:web` which aligns closely with Solid's HTTP-based nature.
