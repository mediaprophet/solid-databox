# Components: Strong Identity

A foundational requirement of the Solid Databox architecture is the ability to cryptographically prove exactly who an actor is, without resorting to vulnerable, centralized honey-pots of physical identity documents.

## Core Mechanisms

- **Decentralized Identifiers (DIDs):** Every entity (Citizen, NGO, Retailer, Federal Agency) utilizes DIDs. This removes reliance on centralized certificate authorities and traditional DNS registries for core identity resolution, preventing single points of failure.
- **Verifiable Credentials (VCs):** The atomic unit of data exchange in the Databox ecosystem. Every claim (a university degree, a driver's license, a medical allergy) is cryptographically signed by the authoritative issuer.
- **Zero-Knowledge Proofs (ZKPs):** Advanced cryptographic protocols allowing an individual to prove a statement (e.g., "I am over 18", "My income is below the welfare threshold", or "I do not have a conflict of interest") without revealing the underlying data (e.g., their exact date of birth or their actual identity).
- **Biometric Binding:** Where required for high-assurance credentials (like a digital passport or security clearance), the VC can be mathematically bound to biometric factors stored securely on the user's local device (e.g., in a smartphone's Secure Enclave).
