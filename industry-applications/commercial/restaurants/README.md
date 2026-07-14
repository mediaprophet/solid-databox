# Commercial: Restaurant Applications

The restaurant industry is characterized by high volume, fragmented customer loyalty, and increasingly stringent health and safety regulations. A Solid Databox empowers both the business and the consumer by providing verified identity and transaction data, creating a foundation of trust for everything from table reservations to food safety.

## Core Restaurant Data Payloads

### 1. Customer Identity & Verification
Restaurants require secure and friction-less ways to verify customer identities for age-restricted items, loyalty programs, and VIP services. The Databox acts as the single source of truth for:
- **Verified Age:** Cryptographically verifiable proof of legal drinking/purchasing age, eliminating the need for physical ID checks for repeat customers.
- **Loyalty Membership:** A tamper-proof record of the customer's standing in various loyalty programs. This allows for instant application of discounts, points accrual, or VIP service, regardless of which specific restaurant brand or chain they are dining with.
- **Contact Information:** Verified phone numbers and emails, ensuring marketing opt-ins are legally compliant and accurate.

### 2. Health & Safety Compliance
From table service to ghost kitchens, restaurants are under increasing pressure to demonstrate and maintain high standards of food safety. The Solid Databox serves as a transparent ledger for:
- **Allergy & Dietary Requirements:** Explicit, self-asserted claims (e.g., "Gluten Intolerant," "Severe Nut Allergy") that are shared with kitchen staff upon order entry. This dramatically reduces the risk of cross-contamination and allergic reactions.
- **Food Handler Certifications:** Verified credentials for chefs, servers, and other staff, confirming they hold current Food Handler's Licenses or Safe Food Handling certifications. This proves regulatory compliance and boosts customer confidence.

## The Solid Databox Workflow in Restaurants

1. **Reservation & Check-In:** A customer reserves a table via a third-party app or directly. At check-in, they grant temporary read-access to their Databox to verify their age or scan a QR code displaying a Verifiable Credential for their loyalty status.
2. **Order Entry with Dietary Compliance:** The customer places an order. The POS system reads their dietary requirements from the Databox and flags potential allergens in the kitchen, ensuring the dish is prepared safely.
3. **Billing & Receipt Archival:** Upon payment, the POS generates a cryptographically signed digital receipt (Verifiable Credential) that is immediately pushed to the customer's Solid Pod. This provides an immutable record of the transaction for expense tracking or warranty claims.
4. **Data Minimization Post-Service:** After the meal, the customer revokes access to their Databox, ensuring their private information is not retained by the restaurant longer than necessary.