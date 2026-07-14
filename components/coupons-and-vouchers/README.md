# Components: Coupons & Vouchers

The traditional distribution of welfare, emergency relief, and corporate discounts often relies on recognizable physical cards, easily lost paper vouchers, or complex app ecosystems that mandate aggressive data harvesting. The Solid Databox replaces this with a secure, dignified, and cryptographically sound tokenization model.

## Core Mechanisms

- **Tokenized Verifiable Credentials:** A voucher is simply a specifically formatted Verifiable Credential (VC) containing an explicit value (e.g., "$50 Food Credit"), strict usage conditions (e.g., "Valid only at registered grocery retailers"), and a cryptographic expiration date.
- **Single-Use Cryptography:** To prevent double-spending, the Databox relies on revocation registries or linked state-ledgers. Once the voucher VC is presented and successfully redeemed at a Point of Sale (POS), the issuer automatically marks its cryptographic signature as spent.

## Key Use Cases

### 1. Welfare & Emergency Relief (Dignified Aid)
- **Food & Essential Needs:** NGOs and government welfare programs can issue digital food vouchers or essential supply credits directly to a vulnerable person's Databox.
- **Removing Stigma:** Because the voucher operates as just another digital credential on the user's phone, the individual can pay at a supermarket checkout exactly like a standard digital wallet transaction. This entirely removes the deep public stigma and shame associated with handing over recognizable physical welfare cards or physical food stamps.
- **Targeted Subsidies:** The voucher's VC metadata can restrict purchases to essentials at the POS level, ensuring funds are not spent on alcohol or gambling, while still providing the user with maximum agency and choice.

### 2. Commercial Loyalty & Retail Discounts
- **Cross-Brand Coupons:** Retail chains can issue targeted promotional discounts as Databox tokens. A customer might earn a coupon at a partner airline and redeem it at a supermarket chain without the two corporations needing to build a complex, centralized backend integration—the consumer's Pod acts as the secure transport layer.
- **Zero-Party Data Exchange:** A retailer might offer a high-value discount voucher specifically in exchange for the consumer granting temporary, granular read-access to their clothing sizing preferences or past purchase history, ensuring a fair exchange of value for data.
