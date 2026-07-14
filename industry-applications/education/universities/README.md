# Universities: Solid Databox Integration Architecture

In the tertiary education sector, integrating with decentralized data architectures like the Solid Databox requires bridging the gap between legacy institutional systems and modern semantic web standards. This document outlines the architectural patterns needed to provide students with cryptographically secure, portable records of their academic achievements and micro-credentials.

## 1. The Architectural Split: Identity vs. Data

Enterprise IT in universities is typically split into two distinct functional layers. A successful Solid Databox middleware (the institutional "egress bridge") must interact with both layers independently to fulfill a citizen's data portability request.

### Microsoft Entra ID (The Gatekeeper)
Microsoft Entra ID (formerly Azure Active Directory) serves universally as the Identity and Access Management (IAM) layer in modern universities.
- **Role:** It handles Single Sign-On (SSO), Multi-Factor Authentication (MFA), and manages the student's institutional digital identity (e.g., their `@university.edu` account).
- **The Sync:** When a student officially enrolls, automated provisioning tools (like SCIM APIs or Microsoft School Data Sync) trigger Entra ID to create their identity, assign security groups, and grant access to resources like the LMS and library databases.
- **Middleware Interaction (The Who):** The student authenticates using their institutional credentials. The middleware intercepts the standard OIDC token and cryptographically binds it to the user's personal Solid WebID. 
- *Crucially, Entra ID knows absolutely nothing about academic records; it only proves that the user is authorized to request them.*

### The Student Management System (The Data Engine)
The Student Management System (SMS) or Student Information System (SIS) (e.g., Ellucian Banner, Oracle PeopleSoft, Workday Student, Tribal SITS) is the massive, heavy-duty relational database that acts as the absolute source of truth.
- **Role:** Stores enrollments, grades, course progress, financial data, and micro-credential achievements.
- **Academic Assets stored:** 
  - *Academic Results:* Direct outcomes of completed classes at the institution (e.g., passing "COMP101" with a Distinction).
  - *Recognition of Prior Learning (RPL):* Credit exemptions, advanced standing, or transferred credits flagged with specific codes indicating the learning happened elsewhere but is legally recognized by the institution.
- **Middleware Interaction (The What):** Once authenticated via Entra ID, the middleware queries the SMS (usually via an API gateway or an enterprise service bus) to extract the raw SQL/JSON academic records.

---

## 2. Semantic Data Translation & Verifiable Credentials

When a citizen requests their data—or when the institution pushes it out at graduation—the enterprise middleware performs the heavy lifting: **Semantic Data Translation**.

Instead of dumping raw CSV files into a Solid Pod, the middleware reshapes the SMS data into standard JSON-LD Verifiable Credentials (VCs). It maps the proprietary SMS data to globally established schemas:

### Open Badges v3.0 (1EdTech)
For micro-credentials, specific course completions, and RPL achievements, the architecture relies on the Open Badges v3.0 standard.
- **Native W3C Alignment:** Open Badges v3.0 are fully aligned with the W3C Verifiable Credentials Data Model. The middleware does not need to invent custom JSON-LD shapes; an Open Badge v3.0 *is* a Verifiable Credential.
- **Cryptographic Proof:** The middleware shapes the payload and signs it using the university's Decentralized Identifier (DID). This transforms the record from a simple text claim into a mathematically irrefutable proof of learning.

### Comprehensive Learner Record (CLR)
For exporting an entire transcript—encompassing standard grades, RPL, and extracurricular recognitions—the Comprehensive Learner Record (CLR) standard provides the appropriate VC schema.

---

## 3. The Solid Deposit Box Workflow

By aligning with how enterprise IT operates, the workflow for academic data portability follows this sequence:

1. **Authentication Binding:** The student logs into the university portal via Entra ID. The middleware binds this session to their Solid WebID.
2. **Data Extraction:** The middleware queries the SMS APIs to pull raw academic and RPL records.
3. **Transformation & Signing:** Records are mapped to the Open Badges v3.0 or CLR schemas and cryptographically signed with the institution's DID.
4. **Deposit:** The middleware performs a standard HTTP POST to deposit the Verifiable Credential payload into the institutional Solid Pod (the "deposit box") allocated for that user.
5. **Egress:** The citizen uses their personal desktop compatibility bridge to pull this globally recognized, structured data from the institutional Pod into their personal knowledge vault. 

This ensures they receive not just a text file, but a globally recognized, mathematically irrefutable micro-credential that they can use to prove their skills anywhere in the world.
