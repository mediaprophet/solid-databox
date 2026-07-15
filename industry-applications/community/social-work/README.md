# Community & Social Care: Social Work Applications

Social work and crisis intervention operate in some of the most sensitive, high-stakes data environments in society. Vulnerable individuals are frequently forced to repeatedly recount their trauma, medical history, and financial destitution to multiple disconnected agencies simply to receive holistic care. 

Integrating a Solid Databox transforms this fragmented ecosystem into a trauma-informed, privacy-preserving network where the client maintains absolute dignity and control over their narrative.

## Core Social Work Data Payloads

A Solid-enabled case management system replaces insecure emails, fragmented agency silos, and vulnerable paper files with highly encrypted, granular Verifiable Credentials (VCs).

### 1. Complex Case & Crisis Management
- **Holistic Case Files:** Cryptographically signed VCs representing ongoing care plans across various severe domains, including **homelessness, drug & alcohol rehabilitation, and family crisis management**. These files can be selectively shared by the client (or their authorized legal proxy) with new support workers, entirely removing the need for the client to verbally recount traumatizing histories.
- **Disability Support Services:** Verified diagnostic records, functional capacity assessments, and approved support budgets (e.g., NDIS plans in Australia). These credentials allow allied health professionals to instantly verify required care levels and funding eligibility.
- **Food & Essentials:** VCs representing emergency relief vouchers, food bank eligibility, or essential transit passes. These can be scanned and verified directly from the Databox via a smartphone, bypassing the public stigma often associated with carrying physical welfare cards.

### 2. Referrals & Inter-Agency Handovers
- **Trauma-Informed Referrals:** When a client is referred from a crisis triage center to a long-term housing provider, they grant temporary read-access to a specific "Transition VC." This securely packages their immediate needs, safety plans, and behavioral flags, ensuring the receiving agency is fully prepared to support them from Day 1 without redundant intake interviews.

---

## Agent Identity & ZKP Conflict Checking

In highly sensitive social work, the safety, privacy, and neutrality of the social worker (the agent) are just as critical as the client's.

- **Agent Verification:** Social workers, psychologists, and crisis responders issue their own professional VCs (e.g., active Working With Children Checks, clinical accreditations) to the client’s Databox to mathematically prove their legitimacy and qualifications before engaging in care.
- **Zero-Knowledge Proof (ZKP) Conflict Alignment:** In tight-knit communities or highly sensitive cases (e.g., domestic violence shelters, specialized drug rehabilitation), it is critical that a care agent does not have a hidden conflict of interest (e.g., they are a relative of an abuser, or share a dangerous social overlap with the client). 
  - By leveraging **ZKP protocols**, the Solid Databox can mathematically verify that the agent and the client do not have intersecting risk factors or conflicts of interest *without* either party having to explicitly disclose their actual identities, past addresses, or specific relationship graphs to each other. 
  - If the ZKP check flags a conflict, the system simply routes the referral to a different agent securely and anonymously.

---

## The Solid Databox Workflow

1. **Intake & Consent:** The client (or their legal guardian/guardianship proxy) logs into the social work portal. They grant scoped access to their existing identity and vulnerability VCs, bypassing traumatizing and redundant intake forms.
2. **ZKP Safety Check:** Before a specific case worker is assigned, the system executes a ZKP alignment check against the Databox to ensure absolute neutrality and no hidden conflicts of interest exist between the agent and the vulnerable client.
3. **Ongoing Care & Provisioning:** As care progresses, updated case notes, rehabilitation milestones, and digital emergency vouchers are deposited directly into the client's Pod as Verifiable Credentials.
4. **Empowered Egress:** If the client moves to a new jurisdiction, changes agencies, or transitions out of crisis, they take their entire cryptographically verified case history with them, ensuring continuous, unbroken, and dignified support.
