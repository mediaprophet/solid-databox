# Commercial: Telecommunications 

The telecommunications sector is a critical infrastructure layer that handles vast amounts of highly sensitive personal data, from identity documents to real-time location metadata. By integrating a Solid Databox, Telcos can shift from maintaining massive, vulnerable central databases (honey-pots) to a decentralized, trust-centric model that enhances consumer privacy and radically simplifies regulatory compliance.

## Core Telecommunications Data Payloads

In a Solid-enabled telco ecosystem, the databox serves as the secure exchange point for identity verification, billing, and highly sensitive metadata.

### 1. Identity & KYC (Know Your Customer) Onboarding
Telecommunications providers are legally obligated to verify a customer's identity before activating services to prevent fraud and criminal activity.
- **Instant Cryptographic KYC:** Instead of the customer uploading photos of their passport or driver's license—which the Telco must then securely store and protect—the customer grants the Telco temporary read-access to government-issued Verifiable Credentials (VCs) in their Databox.
- **Data Minimization:** Once the Telco verifies the cryptographic signature on the identity credential, they record the verification status in their system and immediately drop access. The Telco no longer holds the raw identity documents, significantly reducing their cyber-risk profile in the event of a breach.

### 2. Billing, Usage, & Proof of Address
The databox replaces the traditional customer portal, providing a secure, two-way pipeline for ongoing service management.
- **Verifiable Utility Bills (Proof of Address):** Monthly bills are deposited directly into the customer's Databox as Verifiable Credentials. These VCs serve as mathematically irrefutable "Proof of Address" documents, which the customer can instantly share with banks or government agencies, eliminating the need to download and email easily forged PDFs.
- **Usage & Metadata Control:** Call Data Records (CDRs), location metadata, and internet usage statistics are pushed to the Databox. This gives the consumer total visibility over their behavioral footprint and ensures the Telco cannot monetize this metadata to third parties without explicit, granular consent recorded on the Pod.

### 3. Service Management & Portability
- **Number Portability & eSIMs:** Cryptographic records of MSISDN (phone number) ownership and active eSIM profiles are stored in the Databox. When a customer decides to switch providers, they simply grant the new Telco read-access to their service credential. This completely automates and instantly executes the number porting process, eliminating legacy backend friction.
- **Anti-Smishing Support Channel:** Instead of sending unverified SMS messages for support tickets, billing reminders, or network outage alerts—which are highly vulnerable to phishing/smishing attacks—the Telco utilizes the Databox's secure messaging protocol. The customer knows with 100% certainty that the message is genuinely from their provider.

## The Solid Databox Workflow

1. **Secure Onboarding:** The customer initiates a new mobile plan. The Telco requests read-access to a verified identity credential (e.g., Digital Driver's License) in the customer's Solid Pod.
2. **Instant Activation:** The Telco verifies the credential's cryptographic signature, activates the eSIM, and immediately revokes its read-access to the raw identity data.
3. **Ongoing Egress:** Every month, the Telco deposits a mathematically signed invoice and usage summary directly into the customer's Databox.
4. **Seamless Porting:** When the customer leaves, they revoke the Telco's write-access and share their MSISDN credential with a competitor, taking their digital footprint and their phone number with them instantly.
