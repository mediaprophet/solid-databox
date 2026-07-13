**SOLID 2026 HACKATHON**

**Institutional Verifiable Data Egress Layer**

*Enabling Human Rights-Grounded Knowledge Systems for Access to Justice*

*Identity · Dignity · Liberté (Self-determination)*

Project Proposal & Planning Document – Version 1.3.0

# **Executive Summary**

For over twenty-five years I have worked on the development of web standards, knowledge systems, and credentials infrastructure with a single core purpose: to give natural persons a verifiable, usable copy of the information recorded about them. This is not a technical preference. It is a fundamental requirement for access to justice and the meaningful exercise of human rights in an increasingly digital society.

Despite decades of effort, engagement with key figures in the web community (including Vint Cerf and Tim Berners-Lee), and the entrustment of significant projects such as the original CSAIL Read-Write Web search engine, those fundamental purposes have not been delivered at scale. Standards have advanced, yet individuals still lack practical, human-rights-grounded control over records that directly affect their lives, their rights, and their ability to seek redress when those records are false, incomplete, or harmful.

This project proposes a pragmatic, standards-aligned approach for the Solid 2026 Hackathon: an institutional "post-box" layer using Solid Pods that allows government, education, and other institutions to deposit verifiable claims and data packages in a controlled, auditable manner. Citizens can then retrieve that data via a compatibility bridge and curate it into a personal knowledge system (Qualia-DB) under their own control.

The hackathon therefore serves two purposes. First, it is an opportunity to build the missing technical interfaces that make human rights agency for citizens practically achievable. Second, and equally important, it provides institutions with a clear, lawful pathway to deliver information to the people it concerns — or to make visible where they are choosing not to do so.

This proposal (v1.3.0) incorporates key insights from over two decades of prior work, including: the iBank/Knowledge Banking concept (2000–present), the Post Office Systems hybrid mail platform (2012), the LocPoc authentication and card services platform (2012), the Sailing Digital/SafeHarbour knowledge banking infrastructure (2012–2013), the Liberal Arts Association civic vehicle (2013), the RWW decentralised cloud storage proposal (2014), the WebCivics knowledge banking industry establishment plan (2015), the Community IT Support Program (2016), the Fixing Fake News / Web of Trust framework (2017), Project Dignity for vulnerable persons (2018), the Re:Inventing Kindness community inclusion framework (2019), and the Safe-T-net worker safety concept (2022). Each of these contributes to a coherent, long-standing vision: building practical infrastructure for human rights and access to justice in the digital age.

Version 1.3.0 sharpens the delivery strategy in one decisive way. Earlier decentralised-web efforts asked natural persons to run their own infrastructure — to become their own systems administrators in order to defend their own rights. That was a structural miscalculation: the parties that hold the data, the budgets, and the legal obligations are the institutions, not the individuals harmed by them. This version therefore places the engineering burden where the resources already sit. It specifies enterprise- and government-deployable egress tooling that institutions run inside their own environments — bridging existing SQL databases and Microsoft Entra ID (formerly Active Directory) to the Solid Linked Data Platform — so that verifiable data flows out to the people it concerns as a matter of standard, auditable practice. Once that plumbing exists, a consumer market for personal knowledge software (offline-first vaults, compatibility bridges, and personal AI agents) can finally form on the far side of the pipe. This is a realignment of method, not of purpose: the goal remains human rights and access to justice; the change is to stop requiring the most vulnerable people to be systems administrators for their own dignity.

# **Historical Context: A Consistent Vision Across 25+ Years**

The current project is not a new idea. It is the latest practical expression of a long-standing body of work that has evolved from intellectual property protection concepts through to standards-based infrastructure for human rights and access to justice:

* **\~2000:** iBank — early conception of a personal secure knowledge/information bank with ownership, consent, and IP protection mechanisms. The foundational idea: individuals should have a "bank account" for their knowledge capital, not merely their financial capital.

* **2003:** "Sailing Digital" name and framing coined — navigating the digital ocean with a crew, ensuring people survive the journey and the purpose is achieved. A collective, personable, protective approach rather than purely individualistic or extractive models.

* **2005–2009:** Structured communications systems, metadata architectures, and early credentials thinking. The 2009 Telstra Education pitch explored mobile personal devices and credentials infrastructure for lifelong learning, gap analysis, and Recognition of Prior Learning (RPL) — years before micro-credentials became mainstream.

* **2011:** Hybrid Card and related projects exploring physical-digital credential systems and practical infrastructure for verifiable claims.

* **2012:** Direct engagement with Vint Cerf on the information banking concept, proposing authenticated accounts using FOAF+SSL/WebID, instruments (credentials/keys), and products (applications/APIs). Explicit framing around human rights (UDHR), IP protection, fair economic rationalization for the "works of the people", and preventing plutocracy through defenceless exploitation of creators and communities.

* **2012:** Post Office Systems — practical citizen-facing structured communications platform with address books, templates, smart addresses, digital stamps, and fulfilment routing. A wholesale services platform enabling secure digital-to-physical mail with multi-factor authentication and certificate-based personal accounts.

* **2012:** LocPoc — an Innovative Authentication and Card Services Platform. An information banking solution providing secure authentication between individuals and their retail/online relationships using NFC, smart cards, SSL certificates, and digital receipts. Explored medical industry, community loyalty, and staff relationship applications.

* **\~2012–2013:** Detailed technical specification work on secure authenticated identity systems and hybrid mail applications — certificate-based personal accounts, multi-device authentication, encryption of transactional data, and traceable hybrid physical-digital mail workflows with postage accounting and verifiable delivery. Patent specification prepared for secure communications methodology.

* **2013:** Liberal Arts Association — a 76-page civic/business proposal for establishing an Australian Liberal Arts Association as the vehicle for building and supporting a digital Knowledge Banking Platform. Explicitly framed around three core values: Identity, Dignity, and Liberté (Self-determination). Positioned the knowledge banking platform as a civic project addressing how digital works, content, data, and personal information are protected, attributed, and economically rationalised.

* **2013–2015:** Family separation, children, and accountability work. Attempts to obtain detailed data from the Australian Bureau of Statistics (Family Characteristics Survey) on children with a parent living elsewhere revealed systemic information suppression. In 2010, approximately 24% of children in separated families (\~253,000 children) saw their non-resident parent less than once a year or never. Official data was subject to confidentiality suppression, hindering research, accountability, and justice efforts.

* **2014:** RWW: World Wide Web Network Services Infrastructure — proposal to apply RWW/LDP cloud server technology for decentralised content distribution and knowledge economics. Active contributions to the W3C Web Payments working group, proposing the shift from "Web Identity" to "Web Credentials" and advocating for verifiable, cryptographically secured credentials that individuals could hold and control — foundational thinking that fed directly into the later Credentials Community Group and Open Badges work in education.

* **2015:** Australian Knowledge Banking Industry Establishment — comprehensive information package presented to Harold Mitchell, outlining the establishment of knowledge banking infrastructure via WebCivics, Media Prophet, and Trust Factory. Proposed a corporate structure where a non-profit (WebCivics) controls a media technology business (Media Prophet) and a credentials commercialisation entity (Trust Factory), with an alliancing methodology for international cooperation.

* **2016:** Community IT Support Program — a proposal for an e-learning and service delivery management platform bridging the digital divide. Connected unemployed/under-employed IT workers with seniors needing support, using credentials technology (Open Badges) for skills verification, recognition of prior learning, and reputation building. Demonstrated practical application of verifiable credentials for employment and community engagement.

* **2017:** Fixing Fake News — a detailed analysis of why false claims are a difficult problem to solve, and how to make progress. Proposed connecting every active actor to systems of digital identity, making actors accountable, producing reputation systems, and establishing a Web of Trust via an ISOC Special Interest Group. Framed the problem as not merely "fake news" but false claims used to prosecute and cause harm in divorce, law-making, and disputes worldwide.

* **2018:** Project Dignity — a framework for protecting vulnerable persons, particularly sex industry workers, using privacy-preserving electronic credentials. Proposed a "safety card" enabling workers to demonstrate mental health certification and consent capacity, with pathways for identifying and supporting victims of human trafficking and modern slavery. Showed how credentials infrastructure can serve the most vulnerable.

* **2019:** Detailed Knowledge Banking Infrastructure vision — industry and regulatory models for personal vaults holding credentials, legal information, relational data, and economic participation mechanisms, with explicit attention to AI agents and socio-economic accountability.

* **2022:** Safe-T-net — a concept outline for protecting vulnerable workers in retail and on-site service environments using regulated surveillance technology, safety pendants, ID scanners, and A/V capture devices. Emphasised symmetry of rights (protecting both workers and consumers), standardised alert signals, local jurisdiction for data governance, and access to justice without expense.

* **2024:** Professional Digital Identity Wallets and rich metadata ecosystems for probity, cybersecurity, evidence containers (including HDF5), and individual accountability — directly addressing failures such as Robodebt-style systemic harms.

Throughout this work, the consistent thread has been the development of systems that support human dignity, agency, and access to justice through human-rights-grounded personal knowledge infrastructure — not as an abstract technical goal, but as a practical necessity for individuals navigating complex institutions. The framing has consistently been grounded in Identity, Dignity, and Liberté (Self-determination) — not in abstract identity models that assume all persons are fully autonomous adults, but in real-world systems that protect people in all their circumstances, including dependency, guardianship, and vulnerability. An infant cannot be "self-sovereign"; human rights apply to all natural persons regardless of capacity.

# **Human Rights Framework: Identity, Dignity, Liberté**

The project is explicitly grounded in international human rights instruments, particularly the Universal Declaration of Human Rights (UDHR) and the UN Convention on the Rights of the Child. The framing deliberately avoids terms like "self-sovereign identity" that have been popularised in ways that obscure the original focus on provenance, consequence, human rights (including children's rights), and accountability for institutional harm. The status of an infant — who cannot be "self-sovereign" — demonstrates why human rights, not sovereignty, must be the atomic unit of any identity system.

Three core values underpin the entire body of work:

* **Identity:** The right to have a digital identity, to communicate, and to participate in commerce in a lawful manner. Digital identity is not simply a card or identifier; it is the means by which recordings are made about a person that are in turn relied upon by others. If humans have the right to self-determination, they must be provided the fundamental right to self-ownership as the foundation to any other right. Technically, this entails modelling identity not as a single sovereign identifier but as an enumerated set of cryptographically supported identifiers and related datasets, distinguishing the acting agent from the subject entity (see Technical Architecture — Identity as an Enumerated Cryptographic State).

* **Dignity:** The innate right to respect and ethical treatment. Systems must be designed to protect people in all their circumstances — including children, vulnerable workers, victims of exploitation, and those navigating family separation — not merely idealised autonomous adults.

* **Liberté (Self-determination):** The ability of individuals to have agency and control over their own actions, communications, and data. The right to freedom of thought, freedom of expression, and freedom from arbitrary interference with privacy, family, home, or correspondence. Liberté — drawn from the French Declaration of the Rights of Man and of the Citizen (1789) — is used here as the predicate, with Self-determination as its internationally recognized expression under the UDHR.

The concept of "knowledge capital" — the intrinsic value of information created by individuals and organisations — is central. In a digital economy, the systemic disenfranchisement of individuals from capital-worth in affiliation to their works, without agreement, could be perceived as a form of slavery. The proposed knowledge banking infrastructure seeks to provide the means for individuals to be beneficial owners of their own "inforg" — the informationally embodied organism that is all the information about a person, whether or not it is curated by them.

# **The Core Problem**

Institutions (government agencies, educational providers, corporations, and others) routinely create and hold records about natural persons. These records directly affect people's lives — their access to services, their legal standing, their employment, their health, and their ability to seek redress when harmed.

Yet individuals are routinely denied practical, timely, and complete access to the records held about them. Even when standards exist that could enable secure, verifiable data exchange, institutions have largely failed to implement them in ways that genuinely serve the people the data concerns.

The result is a structural asymmetry: institutions possess the data and the power to act on it; individuals are left without the means to verify, challenge, or use that same data in defence of their rights. This is not merely a technical shortfall. It is a failure of the standards project to deliver on its most fundamental promise — that the web would empower individuals, not merely entrench institutional control.

## **False Claims and Their Consequences**

The underlying problem is not simply data access — it is false claims. False claims are used to prosecute and cause harm to others in a myriad of ways: divorce proceedings involving children, the practice and process of making laws, and the means by which people undertake disputes of many forms worldwide. When institutions hold or generate records that are false, incomplete, or misleading, and individuals lack the means to obtain and challenge those records, the consequences can be devastating.

## **Information Asymmetry: The Family Separation Case**

A concrete example: in 2013–2015, attempts to obtain detailed, usable data from the Australian Bureau of Statistics (Family Characteristics Survey) on children with a parent living elsewhere revealed that official data cells were subject to confidentiality suppression. In 2010, approximately 24% of children in separated families (\~253,000 children) saw their non-resident parent less than once a year or never. The practical effect: detailed, granular information that could illuminate the scale, patterns, and consequences of the problem was not made readily available in usable form. This demonstrates a structural information asymmetry where the problem is known to exist at significant scale, official agencies hold relevant data, yet the information is suppressed or limited in ways that hinder research, accountability, policy development, and justice efforts.

## **The Internet is Not Free**

A persistent myth is that the internet is "free." In reality, energy is not free, devices are not free, and infrastructure is not free. About the only thing considered "free" about the internet are the terms to which individuals provide data to it. Platforms acquire non-exclusive intellectual property rights to user-contributed content, accumulating value without consideration for moral rights or fair economic rationalisation. The proposed infrastructure seeks to rebalance this dynamic by enabling individuals to be beneficial owners of their own data and to participate economically in its use.

In 2026, after more than two decades of sustained work, the gap between standards progress and real-world human rights outcomes remains unacceptable.

## **Robodebt: A Case Study in Systemic Harm**

The consequences of information asymmetry are not abstract. Over 2000 people died after receiving Centrelink Robodebt notices — a system that used automated data matching to raise debts against individuals who lacked the means to challenge the calculations. This is a direct example of what happens when institutions hold and act on data about people, and those people have no verifiable copy, no ability to verify, and no practical means of redress. The proposed institutional egress layer would have allowed affected individuals to retrieve the verifiable records being used to make determinations about them, and to curate evidence for legal challenge.

## **Incomplete and Poor Data Quality in Official Records**

The Re:Inventing Kindness framework identified that people are routinely "improperly branded" in official records systems, and that correcting these records is "very inconvenient" for institutional agents. When someone is wrongly characterised in an institutional system, the burden of proof falls on the disaffected person — often someone in severely undermined circumstances — to correct the record. This is a structural injustice that human-rights-grounded personal knowledge infrastructure directly addresses.

# **Proposed Solution: Institutional Egress Layer \+ Human Rights Layer**

This project proposes a clean separation of concerns that respects both institutional realities and individual human rights and agency. The architecture builds upon the long-standing Post Office Systems concept (2012) — a structured communications platform with secure identities, smart addresses, and verifiable delivery — updated for the Solid protocol era:

## **1\. Institutional Solid "Post-Box" Egress Layer**

Institutions host Solid Pods configured as controlled egress points ("digital post-boxes"). Verifiable Credentials, claims, and structured data packages are deposited into designated slots. The institution retains control over what is issued and when, while the protocol provides auditability, provenance, and standardised access mechanisms. This mirrors the Post Office Systems wholesale platform model, where institutions act as authenticated issuers depositing verifiable payloads into citizen-accessible slots.

## **2\. Human Rights Retrieval & Curation Layer (Solid Compatible \- ie: Qualia-DB)**

The individual, acting in their private capacity, uses a personal agent (webizen-desktop / compatibility bridge) to authenticate, retrieve the payload, and import it into their own personal information management systems, such as Qualia-DB — a human-rights-grounded, offline-first, high-performance semantic graph database designed specifically for personal knowledge management, consent logic, provenance tracking, and privacy-preserving operation. This is a modern expression of the iBank/Knowledge Banking concept: a personal vault for the individual's "inforg" — all the information about them, curated under their control.  It is expected other solid compatible solutions will emerge.

This architecture cleanly separates roles: institutions act as issuers and hosts of verifiable data; individuals act as holders and curators of their own knowledge systems. It leverages Solid for what it does well (standardised, interoperable data transport) while preserving the heavy lifting of personal data agency for a system purpose-built for that task.

## **3\. Evidence Preservation Layer (The Defensive Pipeline)**

Framed correctly, the egress layer is not merely a convenience for citizens or a compliance feature for institutions — it is an evidence-preservation mechanism. The recurring harm in the cases this work addresses (Robodebt, family court, improper "branding" in official systems) is not only that people cannot see their records, but that the record of an institution's own conduct can be revised or quietly erased before it can be used to seek redress. Without evidence, the rule of law becomes an abstraction that cannot be executed.

When every official determination, credential, or notification is automatically mirrored into a standardised LDP egress slot and delivered to the citizen's inbox, that deposit becomes a point of no return: the institution no longer holds a monopoly on the narrative, and the citizen holds a cryptographically verifiable, independently stored copy. The architecture should also record the absence of expected action — logging institutional non-response and data-deletion events — so that obstruction and erasure themselves become part of the auditable record. This is the modern, protocol-level expression of the 2012 Post Office Systems "open letters" function, in which registered correspondence made it impossible for a department to credibly deny knowledge of a matter.

# **Technical Architecture**

## **Standards Foundation**

The project builds upon a foundation of open web standards developed through the W3C and related bodies:

* **Solid Protocol:** Solid Pods as institutional egress points, providing standardised, interoperable data storage with access control.

* **WebID / WebID-TLS:** X.509v3 certificate-based authentication for both institutional and citizen-side identity, building on the FOAF+SSL/WebID approach proposed in the 2012 Vint Cerf engagement.

* **Verifiable Credentials:** W3C Verifiable Credentials standard for cryptographically secured claims that individuals can hold and control — the evolution of the "Web Credentials" concept proposed in the 2014 W3C Web Payments working group.

* **Linked Data / RDF / JSON-LD:** Semantic web technologies for machine-readable, interoperable data representation — the same technologies explored in the 2014 RWW proposal and central to the knowledge banking vision.

* **Open Badges:** Credentials technology for skills verification and recognition of prior learning, as demonstrated in the 2016 Community IT Support Program.

* **Solid-OIDC:** The current Solid authentication layer, complementing the earlier WebID-TLS approach. Solid-OIDC is the integration point for institutional identity providers — it allows an institution's existing OpenID Connect infrastructure (notably Microsoft Entra ID) to issue tokens that are bound to a WebID.

* **Linked Data Notifications (LDN):** W3C Recommendation for decentralised, machine-readable notifications. When an institution deposits a record, an LDN is delivered to the citizen's inbox, alerting their personal agent that a new payload is available — replacing brittle email notification with an auditable protocol, and providing the return channel for citizen-initiated corrections.

* **OpenID for Verifiable Credential Issuance (OpenID4VCI):** The issuance flow adopted across emerging Digital Public Infrastructure stacks (e.g., MOSIP / Inji). Supporting it demonstrates international interoperability for credential issuance beyond a bespoke Solid POST.

## **Data Flow**

The end-to-end data flow is designed to be simple, auditable, and standards-compliant:

1. Institution issues a Verifiable Credential or structured data package and deposits it into a designated slot on a Solid Pod configured as an institutional egress point.

2. The citizen's personal agent (webizen-desktop) authenticates via WebID and retrieves the payload through the Solid protocol.

3. The compatibility bridge transforms the retrieved data into Qualia-DB's internal semantic graph format, preserving provenance metadata.

4. The citizen curates, annotates, and manages the imported data within their own Qualia-DB instance, with full consent logic and privacy controls.

5. The citizen can selectively share verifiable claims from Qualia-DB with third parties (courts, employers, service providers) as needed, maintaining a complete audit trail of all disclosures.

The flow above describes the outbound (institution → citizen) happy path. Access to records is, however, meaningless without the ability to correct them, so the architecture is deliberately bi-directional: a return channel carries citizen-initiated appends and disputes back toward the institution under human review (see The Bi-Directional Middleware Sync Agent, below).

## **Reference Implementation & Low-Barrier Deployment**

Not every institution that owes people their records is a large agency with a systems-administration team. Non-profits, community legal centres, small education providers, and local services must be able to stand up an egress point with minimal effort; large agencies must be able to run the same software under enterprise orchestration. The architecture therefore targets a single reference engine with two deployment profiles.

The **Community Solid Server (CSS)** is the reference engine: a Node.js Solid implementation that runs from the local filesystem, requires no heavy database backend, and can host the static citizen-facing portal (a single-page application) directly at the server root. An institution can thus serve both the data (via the Linked Data Platform) and the "post-box portal" that citizens log into, without operating a separate website.

* **Non-profit / low-IT profile:** a secure-by-default `docker-compose` bundle that spins up a pre-configured egress point with a single command, requiring no advanced administration.

* **Enterprise / government profile:** Helm charts for Kubernetes defining multi-replica deployments, internal network routing, and integration with existing secure API gateways.

Both profiles expose the same protocol surface, so a payload deposited by a two-person non-profit and one deposited by a national agency are retrievable by exactly the same citizen software.

## **Enterprise Integration: Microsoft Entra ID & Legacy Systems**

Most institutions in scope already run their authentication through Microsoft Entra ID (the current name for Azure Active Directory) and hold their records in SQL databases. The design does not ask them to replace either; a middleware layer bridges these existing systems to the Solid egress point.

* **Authentication bridging (Entra ID → Solid-OIDC):** Entra ID issues standard OAuth 2.0 / OpenID Connect tokens; Solid expects Solid-OIDC. The middleware maps validated Entra claims (for example the directory Object ID or a verified email) to a persistent WebID URI, so that an institutional actor authenticated through Microsoft acts against the Pod as a bound, auditable identity. Unattended machine-to-machine deposit uses an Entra **service principal** under the standard client-credentials flow.

* **No rip-and-replace:** the institution keeps its SQL system of record and its directory. The bridge is additive — it reads from, and writes back to, systems that already exist.

## **The Bi-Directional Middleware Sync Agent**

The bridge is bi-directional because a right to access without a right to correct is hollow.

**Outbound (institution → citizen).** The middleware queries the institution's SQL system for new records (micro-credentials, determinations, correspondence, receipts), transforms each row into a JSON-LD Verifiable Credential that preserves provenance, performs a standard HTTP `POST` / `PUT` into the citizen's designated LDP container, and fires a Linked Data Notification to the citizen's inbox.

**Inbound (citizen → institution).** When a citizen appends a document or disputes a false claim, their personal agent sends an LDN — or opens a Solid chat thread bound to the specific data object in question. The Community Solid Server's internal event emitters (its `MonitoringStore`) surface resource changes; the middleware listens, verifies the request against the citizen's WebID and cryptographic proof, and then — critically — does not execute a destructive update on the legacy database. It translates the correction into a staged change placed on a **staff-review queue**, so that a human authorises any alteration to the system of record. This preserves institutional control while making the citizen's right to correction real, traceable, and safe.

A simple internal dashboard (for example an Express.js application served alongside the middleware) lets non-specialist staff read incoming notifications and chat threads in human-readable form, approve or reject corrections, and trigger credential issuance without ever touching raw Linked Data.

## **Government-Scale Egress**

Large agencies — Services Australia, health departments, and equivalents — do not expose their systems through a single container. They sit behind API gateways and strict machine-to-machine frameworks. In the Australian context this includes **PRODA (Provider Digital Access)** and its B2B device pattern, in which each installation that calls the web-services APIs is registered as a B2B device and authenticates using PKI certificates and signed JWTs.

At this scale the middleware becomes an enterprise gateway rather than a lightweight sync agent: it polls the agency's REST endpoints through the API gateway, transforms the internal data model into JSON-LD Verifiable Credentials, and deposits them into egress slots. Inbound corrections are placed on a durable event bus and routed to staff-review or failure queues rather than executed directly — the same human-in-the-loop discipline as the low-IT profile, hardened for regulated infrastructure. The invariant holds across every scale: the agency gives citizens a verifiable copy of their own data without ripping out its SQL and directory systems.

## **Deployment Tooling: The Institutional Deployment Kit**

The prototype is packaged as an "Institutional Deployment Kit" so that the same artefacts serve both ends of the size spectrum: Infrastructure-as-Code templates (the `docker-compose` and Helm profiles above); an **Egress Configuration SDK** with helper functions that map internal database rows to W3C Verifiable Credentials and script their deposit into designated slots; and built-in auditability — telemetry that logs exactly when a package was deposited, and protocol listeners for LDN and Solid chat that flag citizen communications for staff review. The institution runs the software, manages the infrastructure, and discharges its obligations through a uniform protocol.

## **Identity as an Enumerated Cryptographic State**

Across every integration point, identity is handled with deliberate precision. Identity is not a single identifier to be minted, owned, and pointed at a person. It is treated as an *enumerated state* — an explicit, inspectable set of multiple cryptographically supported identifiers (WebIDs, X.509 certificates, keys, and, where appropriate, DIDs) together with their related datasets, organised on an **agent-and-entity-centric basis** that distinguishes the acting agent from the subject entity.

This is not pedantry; it is the technical expression of the human-rights position stated earlier. A single all-purpose identifier collapses guardian into child, caseworker into claimant, and software agent into the natural person it acts for — precisely the collapses that "self-sovereign" framings smuggle in, and precisely the ones that harm people who are not idealised autonomous adults. Modelling identity as an enumerated set of cryptographic identifiers keyed to agents and entities keeps those relationships explicit and auditable, and makes the provenance of every deposited or corrected record irrefutable.

# **Use Cases**

The following use cases illustrate how the institutional egress layer and citizen human rights layer address real-world problems identified across the body of work:

## **Education / Recognition of Prior Learning (RPL)**

Educational institutions deposit verifiable credentials (qualifications, micro-credentials, skills assessments) into Solid Pod egress points. Individuals retrieve and curate these in Qualia-DB, building a portable, verifiable learning portfolio. This directly addresses the 2009 Telstra Education pitch vision and the 2016 Community IT Support Program's use of Open Badges for skills verification and RPL. Unemployed and under-employed workers can accumulate verified references and credentials from community service work, improving employment outcomes.

## **Health Records**

Health providers and government agencies (e.g., My Health Record) deposit verifiable health records, prescriptions, and test results into egress points. Individuals retrieve and manage these in Qualia-DB with enhanced privacy controls. This addresses the e-health initiatives explored in the 2012 LocPoc platform and the 2015 WebCivics proposal, where health data was identified as a critical use case for knowledge banking infrastructure.

## **Legal / Probity Evidence**

Courts, law enforcement, and regulatory bodies deposit verifiable legal documents, evidence packages, and probity records. Individuals can retrieve court orders, evidence containers, and legal correspondence in verifiable form. This directly addresses the 2012 Post Office Systems patent specification's concern that email cannot be reliably introduced as evidence in court, and the broader need for provenance and consequence visibility in legal proceedings.

The 2012 Post Office Systems concept included an "open letters" function — where citizens could make complaints public, and government departments would be incapable of denying knowledge of a specified subject where multiple letters had been registered. This democratic spirit — making institutional non-response visible — is directly served by the egress layer architecture.

## **Government Service Delivery**

Government agencies deposit official correspondence, benefit determinations, tax records, and service notifications into egress points. Citizens retrieve and manage these in Qualia-DB, creating a verifiable personal record of all government interactions. This addresses the Robodebt-style systemic harms where individuals lacked access to the records being used to make determinations about them, and the broader MyGov vision of citizens having a safe place to store official data.

## **Family Separation & Children's Rights**

Family courts, child protection agencies, and related institutions deposit verifiable records of proceedings, determinations, and outcomes. Parents and guardians can retrieve and maintain their own complete record of legal processes affecting their families. This addresses the information asymmetry identified in the 2013–2015 ABS Family Characteristics Survey work, where \~253,000 children were effectively invisible in official statistics. Making provenance and consequence visible supports accountability when institutional decisions affect children's lives and human rights.

The 2013 Liberal Arts Association document provided detailed economic analysis: approximately 24% of children whose parents are not in a relationship do not have a meaningful relationship with one parent (\~254,000 children, \~5% of all Australian children). Approximately 45% of children in these circumstances see the non-resident parent less than once per fortnight (\~475,000 children). The child support system acquires more than 40% of the non-resident parent's gross income regardless of debts, costs of seeking access, or circumstances. 

Legal Aid was once available only to sole parents (now neither party is eligible in Victoria). 

The mandatory mediation process takes months, unduly harming attachment relationships if a parent is excluded without legal due process. The economic structure creates stimulus for the state through job creation in childcare and professional services, while both parents struggle financially. This systemic architecture is designed to be economically advantageous to the state rather than to serve the best interests of children — making it a profound accountability failure that verifiable records and statistical transparency could help address.

## **Vulnerable Persons & Worker Safety**

Credentials infrastructure can support vulnerable persons, as demonstrated by Project Dignity (2018) and Safe-T-net (2022). Privacy-preserving electronic credentials can enable workers to demonstrate certification status, mental health checks, or safety qualifications without exposing unnecessary personal information. Regulated safety systems can deposit verifiable incident reports and evidence packages that support access to justice for vulnerable workers. The system respects that not all persons are idealised autonomous adults — it must support people in dependency, guardianship, and vulnerability.

## **Digital Receipts & Economic Participation**

Retailers and service providers deposit verifiable digital receipts into citizen egress points. Individuals curate their transaction history in Qualia-DB, enabling machine-readable household finance management, warranty tracking, and spending analysis. This addresses the digital receipts concept from the 2012 LocPoc platform, the knowledge capital/economic participation framework from the 2013 Sailing Digital proposal, and the broader goal of enabling individuals to be beneficial owners of their transactional data.

## **Homelessness & Social Support**

The Re:Inventing Kindness framework identified that people are dying on the streets, young persons are being preyed upon by criminals, and the systems meant to support vulnerable persons are failing. The proposed infrastructure could support: case management with verifiable records of interactions with social services, mental health providers, and legal support; accommodation services with verifiable credentials for emergency access; employment pathways with verified references from community service work; and statistical accountability by making visible the data that is currently suppressed or absent.

## **Heritage Systems & Digital Literacy**

The 2013 Liberal Arts Association proposal included a detailed heritage systems use case where historical societies digitise assets to preservation quality, add metadata, and create searchable collections. The program simultaneously supports digital literacy skills for seniors — who often have poor digital technology literacy but hold the most knowledge about local history — by engaging them in meaningful, purpose-driven digitisation work. A test-bed was established in Mansfield, Victoria. The system supports duplicate identification across providers, genealogical research with unique identity assignment, curated exhibits, and e-book publishing for revenue creation. This demonstrates how knowledge banking infrastructure serves both civic purpose (preserving community heritage) and practical purpose (building digital skills, creating employment pathways).

## **Community Health & Activity (Life Be In It)**

The 2015 WebCivics information package included a proposal to rejuvenate the "Life. Be In It." brand through mobile and web applications using credentials/badges for sports participation. Users could discover activities, join clubs, track participation, and earn digital badges that linked to their social media presence. The system supported disability information (e.g., epileptics advised against water sports), club membership management, and social marketing through referrals. This demonstrates how verifiable credentials can support community health outcomes while building a user's verified activity profile — connecting physical and social wellbeing to the knowledge banking infrastructure.

## **Small Business E-Commerce & Regional Development**

The 2013 Liberal Arts Association proposal included a small business e-commerce platform using NFC-based POS integration and digital receipts. Customers could tap their card at point of sale to receive a verifiable digital receipt in their knowledge bank, with permissions controlling whether they receive marketing from that supplier. The system supported supplier loyalty programs, online shop creation synchronised with POS, and web-to-print services. A "Tourist" application concept connected regional service providers (accommodation, tours, equipment hire) with visitors through a marketplace platform — supporting economic development in regional areas where identifying relevant service providers is difficult.

## **Community Media & Content Attribution**

The 2015 WebCivics plan proposed community media as the initial go-to-market vehicle for knowledge banking infrastructure. Community TV, radio, and local media platforms would use linked-data technologies to enable content producers to collaborate with provenance and value attribution. Credentials would manage licensing, approvals, and economics. This model demonstrated how knowledge banking infrastructure could be built incrementally, starting with "low-stakes" data in community media before extending to higher-stakes applications.

## **Community IT Support & Digital Inclusion**

The 2016 WebCivics Community IT Support Program proposed bridging the digital divide by connecting unemployed or underemployed IT-skilled people with seniors who need affordable IT support. The program used credentialing technology (Open Badges, Canvas LMS) to verify training and skills, enabling service providers to accumulate verified references from customers. 

A service discovery platform (similar to Uber or Airbnb) matched skilled providers with those needing help — from basic device setup and internet connection to photo digitisation and digital literacy training. The program addressed multiple social issues simultaneously: seniors' digital isolation, unemployed persons' need for reputation and references, and the trust gap in in-home IT services. Police checks and working-with-children checks were required for credentialing. This demonstrates how verifiable credentials can support both digital inclusion and employment pathways — creating a reputation economy that serves vulnerable people on both sides of the transaction.

# **Knowledge Banking & The Inforg**

The concept of an "inforg" — an informationally embodied organism, an entity made up of information that exists in the infosphere — provides a useful framing for the citizen human rights layer. An inforg is all the information about a person, whether or not it is curated by them. If a person does not control their inforg, their inforg can control them in ways they may never know.

A "knowledge banking" industry — analogous to financial banking but for intellectual capital — would provide regulated, independently operated infrastructure where individuals are beneficial owners of their own inforg. Knowledge fiduciaries would not be entitled to take beneficial ownership over a person's data. The system would be regulated by government but independently operated, with portability between providers ensured through open standards.

The history of banking provides a model. The Monte di Pietà (1539) was founded as a non-profit organisation to lend money ethically. Stockholms Banco (1657) introduced banknotes. The Bank of England (1694) was established to fund national infrastructure through subscription. Each of these innovations created new economic infrastructure. Knowledge banking seeks to do the same for intellectual capital — creating the infrastructure for individuals to store, transact, and derive value from their knowledge assets.

The 2014 RWW (Read-Write Web) paper extended this vision technically, proposing that RWW cloud server technology — using WebID-TLS, SPARQL, JSON-LD, and RDF — could be deployed as a decentralised content distribution platform within ISP infrastructure. 

Rather than centralised CDN providers paying ISPs for rack space, ISPs could run open-source linked-data platforms that provide access-controlled cloud storage at the content layer rather than the equipment layer. This would virtualise web storage, enabling authenticated users to store data decentralisedly while optimising content delivery through local network nodes. The paper connected this infrastructure vision to the W3C Web Payments and Credentials Community Groups, recognising that economic infrastructure and identity infrastructure must develop together.

The Solid 2026 Hackathon project serves as a practical step toward this vision: demonstrating the institutional egress interface that allows verifiable data to flow from institutions to the people it concerns, and the citizen human rights layer (Qualia-DB) that allows individuals to curate and control their own inforg. The hackathon tests whether institutions will enable this flow — or whether they will continue patterns of information control that obscure consequence and protect institutional interests over those of the people they serve.

## **The Inforg and AI**

As the infosphere develops, AI systems will increasingly make decisions about people based on their inforg — about their reputation, their trustworthiness, their socioeconomic participation. An inforg that is not controlled by the person it describes becomes a tool that can be used against them — by institutions, by AI agents, and by bad actors — in ways that are increasingly opaque and difficult to challenge.

The proposed architecture ensures that:

* The individual is the beneficial owner of their inforg

* AI agents working on behalf of the individual operate within consent frameworks defined by the individual

* Institutional AI systems must interact through verifiable, auditable channels

* The individual can inspect, challenge, and correct the data that constitutes their inforg

Tim Berners-Lee's call for a "Magna Carta for the web" reinforces this framing: the web needs foundational principles that protect people, not just platforms. The inforg concept makes clear that the question is not merely about data ownership but about personhood itself in the infosphere. As the 2016 Knowledge Banking SIG document asked: "What percentage of your income and your expenses pass through the Internet? What percentage of that revenue goes into your pocket?" — highlighting that the internet was never free, and that the cost of not being the beneficial owner of one's inforg is borne by the individual.

# **Social Context: Re:Inventing Kindness**

The Re:Inventing Kindness framework (2019) provides essential social context for why this technical infrastructure matters. The framework was posted as an open collaborative document addressing problems that "get to the heart of our society and its purpose."

## **The Real-World Consequences**

* **People are dying on the streets.** Homelessness is not merely a housing issue — it is a consequence of systemic failures in mental health support, access to justice, economic participation, and institutional accountability.

* **Young persons are being preyed upon.** The "sugar daddy" phenomenon affects a significant  proportion of Australian university aged persons. Most often young women, often from economically disadvantaged backgrounds, are driven into transactional relationships by the cost of living, the cost of study, and limited entry-level wage growth. Without mental health checks, without safety nets, and without the ability to verify their circumstances, they become targets for criminal actors.

* **Over 2000 people died after receiving Centrelink Robodebt notices.** This is a direct consequence of institutional data systems operating without citizen oversight or challenge mechanisms.

* **Access to justice is economically determined.** Community legal services are often incapable of providing material support for complex issues. Lawyers are "generally less than willing to provide accessible advice to those who are economically limited." The result is that vulnerable persons carry both the burden of proof and severely undermined circumstances.

##  **The Pathway Out**

The Re:Inventing Kindness framework emphasised that support must be focused on "the pathway out" — from dire need to contributing members of society, should individuals elect to seek to do so. 

This requires: rule of law and access to professional legal input; coordinated case management to get people back on their feet with dignity; economic participation with the ability to accumulate reputational benefits; Housing First programs that have proven cheaper and more effective than crisis response; and national approaches enabling relocation to safer climates with employment opportunities.

The proposed institutional egress layer and citizen human rights layer directly support these goals by giving individuals verifiable copies of the records they need for case management, legal support, employment verification, and accommodation access — curated under their own control, not scattered across institutional silos that may be inaccessible, incomplete, or hostile.

## **Statistical Accountability**

The Re:Inventing Kindness framework identified critical gaps in statistical data: accountability of institutional providers where vulnerable persons have been exploited; convenient statistics that contrast with vast issues that have none; differing definitions of homelessness that render some people statistically invisible; accumulative harm costs that are never evaluated; and the absence of statistics on post-separation mediation outcomes. 

The proposed infrastructure would make these gaps visible by providing a mechanism for individuals to hold verifiable records of their interactions with institutions — creating a distributed evidence base that could support statistical analysis and accountability, subject to appropriate privacy and consent controls.

# **Why This Matters Now**

The Solid protocol and related standards (Verifiable Credentials, WebID, Linked Data) have reached a level of maturity where practical deployment is feasible. At the same time, public trust in institutional data handling remains low, and the consequences of individuals lacking access to records about them continue to manifest in systemic failures — from Robodebt to family court proceedings conducted on the basis of incomplete or false information.

The rise of artificial intelligence adds urgency. AI systems increasingly make decisions about people based on data those people have never seen, let alone verified or consented to. An inforg that is not controlled by the person it describes becomes a tool that can be used against them — by institutions, by AI agents, and by bad actors — in ways that are increasingly opaque and difficult to challenge.

This hackathon project offers a concrete test: can we build the interfaces that allow institutions to deliver verifiable data to citizens in a way that genuinely supports human rights and accountability? If the answer is yes, we have a pathway forward. If the answer is no — or if institutions refuse to participate even when the technical means exist — then the gap between standards rhetoric and reality becomes impossible to ignore.

Either outcome serves the broader purpose. The project is designed to make progress visible and to make obstruction visible.

# **Risk Analysis & Mitigation**

## **Technical Risks**

* **Solid Pod compatibility:** Different Solid Pod implementations may have varying levels of compliance. Mitigation: target a well-supported reference implementation and document compatibility requirements.

* **Verifiable Credential schema alignment:** Institutional data formats may not map cleanly to VC schemas. Mitigation: use synthetic data for the hackathon prototype and document schema transformation requirements.

* **Qualia-DB integration complexity:** The compatibility bridge must handle semantic graph transformations. Mitigation: focus on a minimal viable data flow for the hackathon, with clear extension points for production.

## **Institutional & Social Risks**

* **Institutional non-participation:** Institutions may refuse to deposit data into egress points. This is itself a meaningful outcome — it makes obstruction visible. Mitigation: simulate institutional deposit for the hackathon and document the participation requirements.

* **Privacy and security of citizen-side data:** Qualia-DB must protect sensitive personal data. Mitigation: offline-first architecture, local encryption, and no external data sharing without explicit consent.

* **Identity fraud and misuse:** As identified in the Safe-T-net concept, identity systems can be misused by bad actors. Mitigation: multi-factor authentication, certificate-based identity, and regulated use frameworks that protect both individuals and institutions.

* **Improper branding in official records:** The Re:Inventing Kindness framework identified that people are routinely "improperly branded" in institutional systems. Mitigation: the citizen human rights layer provides individuals with a verifiable copy of records, enabling challenge and correction.

* **Economic exploitation of vulnerable users:** The system must not create new vectors for exploitation. Mitigation: knowledge fiduciary model, regulated providers, and no beneficial ownership of user data by platform operators.

* **Algorithmic curation and filter bubbles:** As Eli Pariser warned in his 2011 TED talk, algorithms that curate the world for us must also show things that are uncomfortable, challenging, or important. Facebook's "echo chamber" effect on elections and secret psychological experiments on users demonstrate the danger of algorithmic curation without transparency. Mitigation: the citizen human rights layer gives individuals access to their own data, enabling independent verification and challenge of algorithmic decisions.

* **Terms of service and jurisdictional capture:** Major platforms (Facebook, Google, DropBox, Apple, Twitter) have selected California as their choice of law, with implications for copyright and data rights of users worldwide. Mitigation: local jurisdiction governance, knowledge fiduciary model, and portability of data between providers under user control.

# 

# 

# **Digital Public Infrastructure (DPI) Alignment & Commercialisation**

Internationally, the pattern this project implements is being funded and specified under the banner of **Digital Public Infrastructure (DPI)** — through programmes such as the UN's 50-in-5 campaign, the World Bank's DPI programme, and the **GovStack** initiative, and through open reference stacks such as **MOSIP** (with its Inji credentialing components). DPI architectures are assembled from modular, interchangeable "Building Blocks." The institutional egress layer maps directly onto three of them:

* **Credential management:** DPI ecosystems are standardising on W3C Verifiable Credentials. The institutional Solid Pod is the decentralised deposit box for those credentials — academic micro-credentials, entitlements, vouchers, legal records — issued by institutions and held by citizens.

* **Identity:** DPI requires strong, privacy-respecting authentication. Solid-OIDC and WebID, treated as an enumerated cryptographic state (see Technical Architecture), satisfy this without reintroducing a single centralised identifier that becomes a point of surveillance or failure.

* **Information mediator / data exchange:** rather than forcing every agency to integrate point-to-point through a central hub, the Solid LDP acts as an edge-dominant exchange in which the citizen is the authorised conduit for their own data.

Framing the hackathon output as a **GovStack-compatible egress Building Block** — and demonstrating interoperability with a DPI issuance flow such as **OpenID4VCI** — positions the work for DPI-focused grants, government tenders, and institutional partnerships, and provides a credible pathway to international scale rather than a single-jurisdiction prototype.

## **Commercialisation Pathway**

In a DPI model the core standards (Solid, JSON-LD, Verifiable Credentials, LDN) remain open-source public goods; sustainable revenue accrues at the integration and tooling layers — the same shape as Red Hat around Linux, or managed cloud around open primitives. Three honest revenue surfaces follow directly from the architecture:

* **Enterprise egress middleware.** Agencies and large non-profits lack the internal capability to map legacy SQL and directory systems to W3C Linked Data. The middleware gateway — Entra / AD bridging, SQL-to-VC transformation, and the staff-review workflow — can be delivered as supported, SLA-backed software.

* **High-assurance auditing.** Because the system operates in the domain of access to justice, institutions require tamper-evident audit logs and telemetry that prove a data request was fulfilled lawfully and on time. That observability layer is a product in its own right.

* **Citizen-side tooling.** On the far side of the pipe, personal knowledge software — Qualia-DB, compatibility bridges, and locally hosted personal agents ("nquins") that parse complex legal or medical credentials and help draft disputes — can be offered as consumer products, without exposing the individual's data to external clouds.

This is the commercial realignment that makes the human-rights outcome durable: the parties with budgets pay to run the plumbing they are already obliged to provide, and a genuine consumer market forms downstream once the data can flow.

# **Regulatory & Standards Alignment**

The project aligns with and supports the following regulatory and standards frameworks:

* **W3C Solid Protocol:** Primary standards foundation for the institutional egress layer.

* **W3C Verifiable Credentials:** Standard for cryptographically secured claims.

* **Solid-OIDC & OAuth 2.0 / OpenID Connect:** Standard authentication bridging between institutional identity providers (Microsoft Entra ID / Active Directory) and the Solid egress layer.

* **W3C Linked Data Notifications (LDN):** Decentralised, auditable notification of deposits and citizen-initiated corrections.

* **GovStack & Digital Public Infrastructure (DPI):** The egress layer is designed as a GovStack-compatible Building Block, aligning with the modular building-block model promoted by GovStack, the World Bank DPI programme, and the UN 50-in-5 campaign.

* **MOSIP / OpenID4VCI:** Interoperability with open-source DPI credentialing stacks (such as MOSIP and its Inji components) and the OpenID for Verifiable Credential Issuance flow, demonstrating international interoperability for credential issuance.

* **PRODA (Provider Digital Access):** For Australian government-scale deployment, alignment with the PRODA B2B device pattern for machine-to-machine authentication to agency web services.

* **Universal Declaration of Human Rights:** Articles 1–17 provide the human rights framework — dignity, liberty, security of person, freedom from discrimination, effective remedy, privacy, and property rights.

* **UN Convention on the Rights of the Child:** Special consideration for the rights of children and their guardians in all system design decisions.

* **Australian Privacy Act / My Health Record:** Alignment with Australian regulatory frameworks for personal data handling and health records.

* **Local Jurisdiction Governance:** As identified in the Safe-T-net concept, high-stakes information should consider support for local jurisdiction — data stored in high-security data-centres under local legal authority, with operators required to maintain security clearances.

* **Charter of the Commonwealth:** Objective principles that may act to serve our people, as referenced in the Re:Inventing Kindness framework.

* **Rule of Law principles:** Law should govern, not any one citizen. The system supports rule of law by giving individuals verifiable evidence for legal proceedings. As Aristotle wrote: "It is more proper that law should govern than any one of the citizens."

* **AusCivics 5 Pillars of Australian Democracy:** Shared values including care, compassion, fair go; doing your best; freedom; honesty, integrity, and trustworthiness; respect; responsibility; understanding, tolerance, and inclusion; informed judgment; and health, wellbeing, and safety. These shared values underpin the rule of law in a democracy and provide the social framework for knowledge banking.

* **UDHR Article 4 (Slavery):** The knowledge capital discussion paper argued that systemic disenfranchisement of individuals from the capital-worth of their works — without agreement and without recourse — could be perceived as a form of slavery. This connects the knowledge banking concept to the most fundamental human rights protections.

* **ISOC (Internet Society) governance:** The 2017 Fix Fake News paper proposed that the Internet Society is the only appropriately configured international internet governance organisation capable of facilitating the multidisciplinary cooperation needed to define human-centric solutions to digital identity, web of trust, and knowledge banking challenges. An ISOC Special Interest Group (SIG) was proposed to address these issues through both regional and technical chapters.

* **Magna Carta (1215) principles:** "To no one will we sell, to no one deny or delay right or justice" — the foundational principle that justice must be accessible to all, not only those with means. The W3C Web Payments framing paper (2015) explicitly connected this to the development of web standards for economic participation.

* **W3C Web Payments / Credentials Community Group:** The 2015 framing paper defined shared values for web standards development — economic participation as a human right, fair value for works, traceability through HTTP Signatures and Linked Data, and privacy-preserving sharing. These principles directly informed the Verifiable Credentials standard.

* **Creative Commons:** License frameworks for describing ownership and permissions for intellectual property on the web, applicable to data whether delivered from a database or a standalone file.

* **OECD Privacy Framework:** The 1980 OECD guidelines (updated 2013\) on protection of privacy and transborder flows of personal data, including the definition of "data controller" — a party competent to decide about the contents and use of personal data. The framework provides internationally agreed privacy principles directly relevant to the egress layer architecture.

* **Internet Society Values & Principles:** The ability to connect, speak, innovate, share, choose, and trust — reinforcing the edge-dominant end-to-end architecture essential for innovation, creativity, and economic opportunity. The Internet Society explicitly opposes efforts to establish standards that would make it difficult for some users to use the full range of Internet applications.

* **International Covenant on Economic, Social and Cultural Rights:** Reinforces economic participation as a fundamental right, including the right to work, free choice of employment, equal pay for equal work, and social security — principles directly served by the knowledge banking infrastructure.

* **Secretary Clinton's Internet Freedom speech (2010):** "The spread of information networks is forming a new nervous system for our planet" and "We need to synchronize our technological progress with our principles" — framing that aligns with the project's human-rights-grounded approach to web standards.

# **Next Steps & Iteration**

This document is Version 1.3.0. It incorporates key insights from over two decades of prior work. Key areas for further expansion include:

* Detailed technical architecture diagrams and data flow specifications for each use case

* Production hardening roadmap, including security audit, scalability planning, and multi-Pod federation

* Institutional engagement strategy — identifying pilot institutions willing to participate in post-hackathon trials

* Knowledge banking industry regulation framework — defining the role of knowledge fiduciaries, portability requirements, and governance structures

* AI agent integration — how personal AI agents interact with Qualia-DB to support (not undermine) individual human rights and agency

* Detailed alignment with Australian regulatory frameworks and international human rights instruments, including gap analysis and policy recommendations

* Economic model for knowledge banking services, building on the 2015 WebCivics cost structure and revenue model

* Community media pathway — using the 2015 WebCivics go-to-market strategy as an incremental path from "low-stakes" community media to higher-stakes institutional egress

* Social support integration — connecting the technical infrastructure to the Re:Inventing Kindness framework's goals for homelessness, mental health, access to justice, and the pathway out

* Statistical accountability framework — defining how distributed verifiable records can support aggregate analysis while preserving individual privacy

* Technology Fund model — a non-profit funding mechanism (as proposed in the 2013 Liberal Arts Association) where a percentage of platform transaction revenues supports distribution of technology and training programs for civic purpose, starting with heritage solutions for smaller institutions that cannot otherwise fund the cost

* Heritage systems pilot — building on the Mansfield, Victoria test-bed to demonstrate knowledge banking for community archives, senior digital literacy, and intergenerational knowledge transfer

* Community health integration — connecting the Life Be In It credential/badge model to the egress layer for verifiable health and activity participation records

* Microsoft Entra ID / Active Directory connector — production-grade Solid-OIDC bridging, service-principal deposit, and claim-to-WebID mapping, with a conformance test suite

* Institutional Deployment Kit packaging — hardened, secure-by-default `docker-compose` (low-IT) and Helm (enterprise) profiles for the Community Solid Server egress point, with the Egress Configuration SDK

* Bi-directional middleware SDK — SQL-to-Verifiable-Credential transformation helpers, the staff-review correction workflow, and event-bus adapters for government-scale gateways (including PRODA B2B patterns)

* DPI Building-Block conformance — alignment with GovStack Building-Block specifications and an OpenID4VCI issuance profile, positioning the work for international DPI programmes and commercialisation

* Evidence-preservation guarantees — specification of institutional non-response and data-deletion logging, so that obstruction and erasure are themselves recorded in the auditable trail

The goal is a living document that accurately reflects both the technical project and the deeper purpose it serves: building practical infrastructure for human rights and access to justice in the digital age — grounded in Identity, Dignity, and Liberté (Self-determination), and informed by 25+ years of consistent, purpose-driven work.

**Hackathon Project Scope (2 Days, Laptop \+ Agents)**

Given the two-day timeframe and laptop-only constraint, the project will focus on a tightly scoped, demonstrable end-to-end flow:

* **Day 1 — Institutional egress point.** Stand up a Community Solid Server instance (via the low-IT `docker-compose` profile) as the institutional post-box, and configure a mock Entra ID → WebID authentication bridge. Script the outbound path: transform a synthetic SQL row (an education / RPL micro-credential) into a JSON-LD Verifiable Credential, `POST` it into a designated egress slot, and fire a Linked Data Notification to the citizen inbox.

* **Day 2 — Citizen retrieval, correction, and demonstration.** Authenticate the personal agent (webizen-desktop) via WebID, retrieve the payload, and import it through the compatibility bridge into Qualia-DB's semantic graph, preserving provenance. Demonstrate the inbound correction path — an LDN-based dispute routed to a staff-review queue rather than a destructive database update. Finish with the UI/agent demonstration, documentation, and presentation preparation, using synthetic data across education / RPL and government service-delivery scenarios.

* **Deliverables:** a working end-to-end demonstration of institutional deposit → citizen retrieval → human-rights-grounded curation, with the inbound correction path shown; both deployment profiles documented (`docker-compose` for low-IT, a Helm chart stub for enterprise); clear articulation of the architecture's alignment with human-rights / access-to-justice goals and with the DPI Building-Block model; and an identified path to production hardening.

* **Development tooling.** The build is agent-assisted. Claude Code suits the infrastructure and shell-scripting work (standing up CSS, wiring the middleware, piping environment configuration and reading back error output); an in-editor agent such as Cursor suits protocol-accurate, multi-file edits where the Solid-OIDC ↔ Entra token mapping and the VC schemas must not drift from the standards. The discipline that matters is context control — the agent must not invent non-standard authentication flows or credential shapes, so W3C conformance is pinned in agent rules and every edit is reviewed as a diff before it lands.

*— End of Version 1.3.0 —*

Prepared by Timothy Holborn | July 2026 | Solid 2026 Hackathon, Canberra

*Consolidated from 14 prior versions and 20+ source documents spanning 2000–2024*