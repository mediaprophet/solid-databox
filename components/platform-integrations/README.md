# Components: Platform Integrations

The Solid Databox ecosystem does not exist in a vacuum; it must bridge legacy enterprise systems and existing open data portals into the decentralized web.

## 1. Microsoft Entra ID (Enterprise IAM)
In many enterprise environments (especially in the Education, Commercial, and Government sectors), Microsoft Entra ID serves as the definitive Identity and Access Management (IAM) layer. The Databox middleware acts as a broker:
- It authenticates the user via Entra ID (OIDC/SAML).
- It queries the backend System of Record (e.g., a Student Information System or HR database) using the Entra ID token.
- It translates the heavy enterprise payload into granular Verifiable Credentials (VCs) and pushes them to the Solid Pod.

## 2. CKAN (Open Data Portals)
CKAN is the world's leading open-source data portal platform used by governments globally. 
- The Databox can integrate with CKAN to securely ingress public datasets (e.g., localized crime stats, environmental hazard zones, public transport schedules) directly into the citizen's Pod context. 
- This allows the citizen's personal AI agents to make localized decisions and provide advice based on official, real-time government data without sending the citizen's location or context back to the government.
