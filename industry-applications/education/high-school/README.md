# Secondary Schools (High School): Solid Databox Integration Architecture

In the K-12 and secondary school sector, integrating with decentralized data architectures like the Solid Databox follows a foundational pattern similar to higher education: the strict separation of identity management and the academic data record. However, the software vendors, synchronization methods, and the nature of the credentials issued differ significantly. 

This document outlines how a Solid egress bridge empowers students to graduate with a cryptographically verifiable "digital backpack" of their K-12 achievements.

## 1. The Architectural Split: Identity vs. Data

Just like universities, K-12 IT architectures are built on two distinct functional layers. The Solid Databox middleware must interface with both layers independently to issue Verifiable Credentials securely.

### The Gatekeeper (Identity & Access)
Microsoft Entra ID is incredibly dominant in K-12 districts (frequently operating alongside Google Workspace). 
- **Role:** It manages student and staff identities, device management (e.g., via Microsoft Intune), and access controls for all school resources.
- **The Sync:** School districts typically employ a middle-layer automation platform—such as Microsoft School Data Sync (SDS), Clever, or ClassLink. These systems read roster data directly from the Student Information System and automatically provision the correct Entra ID accounts and permissions.
- **Middleware Interaction (The Who):** The middleware uses Entra ID to authenticate the student, mapping their institutional identity OIDC token to a personal Solid WebID. Entra ID acts solely as the cryptographic gatekeeper.

### The Source of Truth (The K-12 SIS)
The heavy-duty database in secondary education is the Student Information System (SIS).
- **Common Platforms:** Global systems like PowerSchool, Infinite Campus, Skyward, Aspen, and region-specific enterprise platforms like Compass and SEQTA (prominent in Australia).
- **Role:** The SIS holds the definitive record of the student's journey: daily attendance, behavioral records, state-standardized test scores, vocational competencies, and final graduation grades. 
- **Middleware Interaction (The What):** Once the student is authenticated via Entra ID, the middleware queries the SIS APIs to extract the evidence of what they have achieved.

---

## 2. Semantic Transformation & The Digital Backpack

The core function of the enterprise middleware in a secondary school is to intercept the raw data from the SIS, perform semantic translation, and package it into JSON-LD Verifiable Credentials (VCs).

These payloads represent major life milestones and early-career stepping stones for teenagers:

*   **The High School Diploma:** A verifiable cryptographic proof of graduation. This is typically formatted as a **Comprehensive Learner Record (CLR)**, which the student can instantly and securely share with university admissions departments or prospective employers.
*   **Vocational & Extracurricular Micro-credentials:** Formatted as **Open Badges v3.0** (which are native Verifiable Credentials), these payloads represent specific, tangible achievements. Examples include First Aid certifications, Vocational Education and Training (VET) modules, or digital citizenship courses—credentials highly valuable for a teenager securing their first part-time job.
*   **State Assessment Scores:** Official standardized test results securely packaged and delivered directly to the student's (and legally authorized guardians') data stores.

---

## 3. The Solid Deposit Box Workflow

By aligning with K-12 IT standards, the workflow for data portability follows this sequence:

1. **Authentication Binding:** The student logs into the district portal via Entra ID. The middleware binds this secure session to their personal Solid WebID.
2. **Data Extraction:** The middleware queries the K-12 SIS (e.g., Compass, PowerSchool) via API to pull raw grade, attendance, and certification records.
3. **Transformation & Signing:** Records are shaped into standard W3C VC schemas (Open Badges v3.0 for micro-credentials, CLR for the diploma) and cryptographically signed using the school district's Decentralized Identifier (DID).
4. **Deposit:** The middleware executes a standard HTTP POST to deposit the Verifiable Credential into the institutional Solid Pod allocated to the student.
5. **Egress:** The student pulls this mathematically irrefutable "digital backpack" of achievements into their personal knowledge vault. When they walk out of the secondary school gates on their final day, they retain total autonomy and portable proof of their K-12 history.
