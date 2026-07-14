# NGOs & Commercial: Housing Providers Applications

The housing sector—spanning private rentals, share-housing, and welfare-driven accommodation—is notoriously burdensome and invasive for applicants. Renters are forced to repeatedly surrender highly sensitive identity, financial, and behavioral data to disparate real estate agents and landlords, creating massive data-breach honey-pots. 

Integrating a Solid Databox transforms this ecosystem into a privacy-preserving, verifiable trust network where the renter retains total sovereignty over their data.

## Core Housing Data Payloads

A Solid-enabled housing ecosystem replaces the vulnerable "100-point ID check" and the insecure emailing of PDF bank statements with instant, cryptographically verifiable claims.

### 1. Identity & Financial Solvency
- **Verified Digital Identity:** Cryptographic proofs of identity (eID or Digital Driver's Licenses) verify exactly who the applicant is, without the housing provider needing to photocopy, store, or protect raw passports or licenses.
- **Income & Employment Verification:** Instead of submitting raw bank statements (which expose irrelevant and highly private spending habits), applicants provide a Verifiable Credential (VC) issued by their employer (proving tenure and salary) or their bank (proving solvency). This guarantees absolute data minimization.
- **Rental History & References:** A verifiable ledger of past tenancies. A previous landlord or property manager can issue a VC confirming on-time rent payments and the return of a full bond/deposit, entirely eliminating the need for manual, easily forged reference checks.

---

## Application Workflows by Sector

### 1. Private Rental Applications
In the highly competitive private rental market, speed, security, and trust are paramount.
- **The Application:** The prospective tenant applies for a property by granting the real estate agency a temporary, scoped read-access token to their Solid Pod. 
- **Instant Verification:** The agency's software instantly validates the cryptographic signatures on the applicant's identity, income, and rental history VCs. No manual background checks or third-party data broker services (like Equifax) are required.
- **Revocation & Data Minimization:** Once the lease is signed (or the application is rejected), the tenant revokes the read-access. The agency retains only what is legally required, strictly adhering to privacy laws and minimizing their cyber-risk.

### 2. Share-Housing Applications (Co-Tenancy)
Share-housing introduces complex multi-party trust dynamics, often involving head-tenants, sub-letters, and landlords.
- **Peer-to-Peer Trust:** Prospective housemates can exchange scoped VCs (e.g., employment verification, or basic background checks) directly with each other or the head-tenant to establish trust before moving in together, without giving up copies of their physical IDs.
- **Landlord Visibility:** The landlord can require all co-tenants to submit their verified identity and income credentials directly to the landlord's system via the Databox. This ensures all occupants are legally verified without relying on the head-tenant to insecurely handle their roommates' sensitive documents.

### 3. Welfare, Social Housing, & Emergency Accommodation
NGOs and government bodies managing social housing face entirely different challenges, heavily focused on vulnerability, entitlements, and complex care.
- **Vulnerability & Priority Flags:** Applicants can store verified medical or social worker assessments (e.g., proof of domestic violence risk, or physical disabilities requiring wheelchair-accessible housing) as highly encrypted VCs. These are shared strictly with the NGO to calculate priority allocation without forcing the applicant to repeatedly recount their trauma.
- **Government Subsidy Integration:** Leveraging cross-context integrations, the applicant provides a VC proving their eligibility for government housing subsidies (e.g., Section 8, Commonwealth Rent Assistance). This allows the NGO to instantly verify funding without forcing the vulnerable applicant to repeatedly interface with slow government bureaucracies.

### 4. Short-Term & Holiday Rentals (e.g., Airbnb, Stayz)
The short-term rental market requires high-trust verification to prevent property damage and fraud, but currently relies on insecurely uploading passports to third-party tech platforms.
- **Verified Guest Identity & Reputation:** Guests grant the host or platform temporary read-access to their verified digital ID and a "Good Guest" VC (compiled from previous successful short-term stays). This proves identity and reliability without handing over raw biometric or passport data to the platform.
- **Digital Keys & Access Codes:** Upon booking confirmation, the host deposits a time-bound Verifiable Credential acting as a digital key (or smart-lock access code) directly into the guest's Databox. This credential automatically expires the moment checkout time passes.
- **Incident & Deposit Resolution:** If a dispute occurs, time-stamped, cryptographically signed condition reports (photos taken by the guest upon arrival and deposited into their Pod) can be instantly shared to resolve bond/deposit disputes fairly.

---

## The Solid Databox Lifecycle

1. **Application:** The tenant grants scoped read-access to identity, income, and rental history VCs.
2. **Approval & Lease:** The landlord deposits a cryptographically signed lease agreement and condition report directly into the tenant's Databox.
3. **Tenancy Lifecycle:** Routine inspection reports, maintenance requests, and rent receipts are exchanged via the Databox's secure, anti-phishing messaging protocol.
4. **End of Lease:** Upon move-out, the landlord issues a "Successful Tenancy" VC and a bond release form. The tenant adds this to their digital backpack, making their next rental application even stronger.
