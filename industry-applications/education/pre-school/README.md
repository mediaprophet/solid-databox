# Pre-School / Kindergarten (Ages 4-5): Solid Databox Integration Architecture

Pre-school serves as the critical bridge between early childhood care and formal schooling. From an IT architecture and data governance perspective, it exists in a unique hybrid zone depending on how the institution is structured.

## 1. The Readiness Layer: A Hybrid Architecture

Depending on the jurisdiction, pre-schools are often attached to primary schools or run independently by state education departments or private operators. This structural variance dictates the IT layer.

### The Source of Truth (SIS vs. CCMS)
*   **Attached to Primary Schools:** If the pre-school operates under a K-12 school umbrella, they will likely use standard **Student Information Systems (SIS)** (e.g., PowerSchool, Compass, or SEQTA).
*   **Independent Operators:** If independent, they might use the same **Child Care Management Systems (CCMS)** as day-care centers (e.g., Xplor, Storypark).

### The Gatekeeper (Identity)
*   **Enterprise Identity:** If integrated into a state or district school system, identity management falls back into the Microsoft Entra ID ecosystem.
*   **Consumer Identity:** If independent, authentication relies on consumer app setups (Auth0, Firebase).

---

## 2. Semantic Transformation & The Readiness Payloads

In pre-school, the data payload shifts away from the physiological tracking (naps and feeding) of child-care, focusing entirely on foundational education standards and school readiness:

*   **Early Learning Milestones:** Formatted as **Open Badges v3.0**, these Verifiable Credentials represent key developmental achievements in social and emotional development, fine motor skills, and basic literacy/numeracy.
*   **School Readiness Portfolios:** A **Comprehensive Learner Record (CLR)** that acts as a verified "handover" document. This provides primary school teachers with a cryptographically verified developmental history, ensuring the child receives the right support on Day 1.

---

## 3. The Sovereign Parent: Delegated Access Workflow

Just like child-care, pre-school children cannot manage their own cryptographic keys. The Solid Databox architecture relies entirely on the **Parental Proxy/Delegation model**.

1. **Authentication:** The parent logs into the institutional portal (via Entra ID or consumer Auth, depending on the system).
2. **Verification & Binding:** The middleware verifies their legal guardianship and binds the session to the parent's Solid WebID.
3. **Data Extraction & Signing:** The middleware queries the SIS or CCMS for early learning milestones and shapes them into W3C Verifiable Credentials (OB v3.0 or CLR), signed by the pre-school's Decentralized Identifier (DID).
4. **Deposit & Egress (In Trust):** The readiness portfolio is deposited into the familial Solid Pod. The parent retains total control over this verified "handover" document and seamlessly shares it with the primary school during enrollment.
