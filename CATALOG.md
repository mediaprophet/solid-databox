# Solid-Databox Comprehensive Catalog

This catalog serves as a structured database of all the Industry Applications, Components, Contexts, Implementations, and Ontologies within the Solid-Databox ecosystem.

## 1. Industry Applications
Use cases and workflows tailored for specific sectors.

### Commercial
- **[Retail Chains](industry-applications/commercial/retail-chains/README.md):** FMCG and grocery workflows. Consumers maintain verified dietary profiles and accessibility needs, granting temporary read-access without sharing a persistent profile.
- **[Take-Away](industry-applications/commercial/take-away/README.md):** QSR workflows. Includes health and dietary flag systems (allergies, preferences) and logistics handoffs using scoped delivery credentials for third-party couriers.

*(Note: Other commercial use cases, education, government, NGOs, and sporting applications are in active development within the `industry-applications/` directory.)*

## 2. Components & Building Blocks
Modular functionalities and architectural bridges within the Databox ecosystem.

- **[IoT & Web of Things (WoT)](components/iot-web-of-things/README.md):** Connects physical hardware and sensors to user-controlled data pods instead of centralized clouds, enabling seamless telemetry data exchange.
- **[Strong Identity](components/strong-identity/README.md):** Bridges enterprise identity providers (e.g., Microsoft Entra ID) to the Solid ecosystem.
- **[Micro-credentials](components/micro-credentials/README.md):** Mechanisms for issuing and verifying scoped skills and attestations.
- **[GS1 Provenance](components/gs1-provenance/README.md):** Supply chain tracking and verifiability using GS1 standards.
- **[Coupons & Vouchers](components/coupons-and-vouchers/README.md):** Privacy-preserving discount management and loyalty rewards.
- **[Platform Integrations](components/platform-integrations/README.md):** Connecting legacy systems, including Enterprise IAM and open data portals like CKAN.

## 3. Contexts & Domains
Specific data domains and regulatory environments.

- **[Compliance](contexts/compliance/README.md):** Audit trails and legal basis tracking.
- **[CRM](contexts/crm/README.md):** Customer Relationship Management workflows powered by two-way data exchange.
- **[ESG](contexts/esg/README.md):** Environmental, Social, and Governance reporting frameworks.
- **[Guardianship & Relations](contexts/guardianship-relations/README.md):** Managing delegated access, such as parent-child relationships or Power of Attorney.
- **[Health & Welfare](contexts/health-and-welfare/README.md):** Specialized handling for highly sensitive medical telemetry and human-services records.

## 4. Ontologies & Vocabularies
The semantic foundation ensuring data interoperability.

- **[Solid-Databox Vocabulary](solid-databox-vocabulary.html):** The core record and party ontology governing transcript fidelity, participants, oversight, and legal instruments.
- **[WoT and SOSA/SSN](ontologies/wot-sosa-ssn/README.md):** Ontologies for translating collected IoT and hardware data into standardized RDF (Resource Description Framework) for pod storage.

## 5. Implementations & Tooling
Practical server targets and software bridges.

- **[Community Solid Server (CSS)](implementations/css/README.md):** Notes and deployment guides for the reference Solid storage target.
- **[CKAN](implementations/CKAN/README.md):** Bridging open government data portals with citizen Databoxes.
