# Primary Schools: Solid Databox Integration Architecture

Extending the Solid Databox ecosystem to primary schools (K-6 or K-8) completes the educational lifecycle. While the foundational IT architecture remains nearly identical to secondary schools—operating under the same district or state-level umbrellas—the shift to early childhood education introduces massive changes in data governance, parental delegation, and the types of Verifiable Credentials issued. 

This document outlines how to establish a secure egress bridge that allows parents to legally and securely capture the very beginning of their child's digital, educational footprint.

## 1. The Architectural Split: Identity vs. Data

### The Gatekeeper & The Parental Proxy
Identity management is where the primary school architecture diverges significantly from high schools or universities, strictly due to the age of the user.

- **The Sync:** Microsoft Entra ID still manages the student identities, and school districts continue to use tools like Microsoft School Data Sync (SDS), Clever, or ClassLink to automate provisioning from the Student Information System.
- **The Delegation:** A seven-year-old is not authenticating their own Microsoft Entra ID token to pull records into a personal inforg. Therefore, the Solid Databox architecture must heavily account for **delegated access**. 
- **Middleware Interaction:** The parent or legal guardian authenticates via the institutional gateway. The middleware validates this parental proxy relationship and pulls the child's verifiable data payload into a familial or parent-managed Solid Pod, holding the data in trust until the child comes of age.

### The Source of Truth (The K-12 SIS)
Primary schools use the exact same enterprise Student Information Systems (SIS) as secondary schools.
- **Common Platforms:** Global market leaders like PowerSchool, Infinite Campus, Skyward, Aspen, and regional systems like Compass and SEQTA.
- **Role:** Instead of GPAs and vocational credits, the primary school SIS tracks foundational metrics: daily attendance, literacy and numeracy progression milestones, behavioral reports, and critical health or immunization records.

---

## 2. Semantic Transformation & Foundational Payloads

When the enterprise middleware intercepts raw SIS data and shapes it into JSON-LD Verifiable Credentials (VCs), the payloads represent early developmental milestones rather than employability skills. 

The primary payloads include:

*   **Foundational Progression Records:** Cryptographic proofs of reaching state-standardized reading, writing, or mathematics levels. 
*   **Participation Micro-credentials:** Formatted natively as **Open Badges v3.0**, these represent early extracurricular involvement (e.g., "School Play Participation", "Junior Science Fair", "Basic Water Safety").
*   **Transition Portfolios:** Formatted as a **Comprehensive Learner Record (CLR)**, this packages the child's complete academic and behavioral history. This ensures a smooth, verified transition from primary school into secondary school, completely immune to proprietary platform lock-in.

---

## 3. The Delegated Deposit Box Workflow

To handle the complexities of early childhood data, the egress workflow operates as a proxy system:

1. **Parental Authentication:** The parent or legal guardian logs into the school district portal via Entra ID using their delegated access credentials. The middleware binds this secure session to the parent's (or familial) Solid WebID.
2. **Data Extraction:** The middleware queries the K-12 SIS APIs to pull the child's foundational progression, health, and participation records.
3. **Transformation & Signing:** Records are mapped into W3C standard schemas (Open Badges v3.0 for milestones, CLR for transition portfolios) and cryptographically signed using the school district's Decentralized Identifier (DID).
4. **Deposit:** The middleware executes an HTTP POST to deposit the Verifiable Credential into the parent-managed institutional Solid Pod slot.
5. **Egress (In Trust):** The parent pulls the cryptographic proofs of their child’s early development into a personal or familial knowledge vault. They safeguard this digital footprint until it is ready to be transferred to the child's sovereign control in their teenage years.
