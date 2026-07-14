# Solid Databox & Architectural Integration Considerations

This document distills the architectural, compliance, and technological considerations for integrating enterprise data systems (like CKAN) with Solid Pods.

## 1. Enterprise-to-Consumer Data Routing (CKAN & Solid Pods)

To meet modern data portability mandates (such as GDPR Article 20 and the Consumer Data Right in Australia), data integration must shift from Enterprise-to-Enterprise (e.g., the Data Transfer Project) to a Hub-to-Edge topology: **Enterprise to Consumer Solid Pod (Databox)**.

A proposed CKAN extension (`ckanext-solid`) acts as the routing and transformation broker, transforming CKAN from a central repository into a privacy-respecting compliance gateway.

### Core Modules of `ckanext-solid`
*   **Authentication & Credential Management (Solid-OIDC):** Consumers authenticate using their Solid WebID. The extension maps internal enterprise identifiers to the consumer's cryptographic identifier, ensuring password-less and secure routing.
*   **Semantic Data Translation:** The extension acts as a bridge, translating standard enterprise data (CSV, JSON, SQL) into interoperable Semantic Web formats (RDF, Turtle, JSON-LD) using predefined ontologies (e.g., FOAF, schema.org) and validating via SHACL/ShEx.
*   **Permission & Consent Engine:** Interfacing with Solid's Web Access Control (WAC) or Access Control Policies (ACP), the system requires the enterprise to request scoped write-access to dedicated Pod containers, respecting consumer autonomy.
*   **The Portability Action API:** Exposes endpoints like `databox_export_request` to manage and queue large historical data exports without timing out.

### Compliance & Security
*   **Immutable Audit Trails:** When data is pushed to a consumer's Databox, the system writes an immutable log (hashing the transaction, timestamp, and DID) to prove legal fulfillment of the portability request.
*   **Handling Sensitive Data:** While CKAN can store sensitive PII, the most secure enterprise pattern is using CKAN strictly for cataloging metadata and API routing, keeping raw sensitive data isolated in external systems until it is pushed to the user's edge device.

---

## 2. Identity Mapping Strategies

To route enterprise data to decentralized Pods, the organization must link its internal user identities to cryptographic identifiers (WebIDs/DIDs). Two distinct strategies emerge:

1.  **Relational Database Mapping (The Bridge):**
    *   For traditional SQL systems (e.g., PostgreSQL, Oracle), a secure binding/look-up table must be maintained as an intermediate microservice.
    *   This table pairs the internal primary key (e.g., `customer_id = 98765`) to the consumer's public WebID, facilitating resolution during a portability request.
2.  **Microsoft Entra ID (The Native Advantage):**
    *   Organizations utilizing Microsoft's modern Entra ID can leverage **Microsoft Entra Verified ID**.
    *   This natively supports required decentralized standards, including W3C Decentralized Identifiers (DIDs) (specifically `did:web`) and Verifiable Credentials, offering streamlined and cryptographically secure mapping.


