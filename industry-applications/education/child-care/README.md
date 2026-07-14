# Child-Care (Ages 0-4): Solid Databox Integration Architecture

While the general public often lumps child-care and pre-school together, from an enterprise IT and data compliance perspective, they are two entirely different worlds.

This is the point in the educational timeline where the architecture steps outside the heavy, Microsoft Entra ID-dominated enterprise bubble. 

## 1. The Care & Subsidy Layer

Child-care (Long Day Care, Early Learning Centers) is a highly fragmented market composed of private operators, corporate chains, and non-profits. The systems running these centers are vastly different from K-12 schools.

### The Source of Truth (The CCMS)
Child-care providers do not use standard Student Information Systems (SIS). Instead, they rely on **Child Care Management Systems (CCMS)**.
- **Common Platforms:** Xplor, Storypark, Procare, or Famly.
- **Role:** These systems track daily physiological and developmental care, alongside complex billing and government subsidy calculations.

### The Gatekeeper (Identity)
Microsoft Entra ID is rarely used here. Because the primary user of the software is the parent—not a student or an enterprise employee—these platforms typically use consumer-grade identity providers.
- **Common Providers:** Auth0, Firebase, or bespoke JWT email/password setups.
- **Middleware Interaction:** The Solid Databox middleware must interface with these consumer-grade auth gateways, binding the parent's consumer login to their sovereign Solid WebID.

---

## 2. Semantic Transformation & Verifiable Payloads

The data extracted from a CCMS and packaged into Verifiable Credentials (VCs) for the Solid Pod is heavily skewed toward health, safety, and finance rather than pure academic achievement:

*   **Daily Care Logs:** Cryptographic proofs of daily routines, feeding times, sleep schedules, and diaper/nappy changes.
*   **Health & Immunization:** Verifiable Credentials of immunization records, which are critical for legal enrollment and public health compliance.
*   **Financial/Subsidy Data:** Immutable receipts and attendance logs that prove eligibility for government support (like the Child Care Subsidy in Australia, which interfaces directly with government services).

---

## 3. The Sovereign Parent: Delegated Access Workflow

An infant or toddler is not managing a decentralized identifier (DID) or a WebID. The entire Solid egress architecture for child-care relies absolutely on the **Parental Proxy/Delegation model**.

1. **Parental Authentication:** The parent logs into the CCMS portal using consumer-grade credentials.
2. **Guardianship Verification:** The middleware verifies their legal guardianship status (often cross-referenced with government or enrollment data).
3. **Data Extraction & Signing:** The middleware queries the CCMS for care, health, and subsidy records, packaging them into standardized VCs cryptographically signed by the care provider's DID.
4. **Deposit & Egress (In Trust):** The child's data is deposited into a familial Solid Pod managed by the parent, holding their earliest digital footprint in trust.
