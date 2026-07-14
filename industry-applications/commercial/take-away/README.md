# Commercial: Take-Away Applications

Take-away and quick-service restaurants are characterized by speed, order accuracy, and increasingly, the need to manage food safety and sustainability. Solid Databoxes streamline this process by providing a secure, instant-access ledger for customer preferences and transaction histories.

## Core Take-Away Data Payloads

### 1. Customer Preferences & Loyalty
In a high-volume, quick-service environment, remembering specific customer preferences or loyalty tiers is often difficult. The Databox solves this by providing instant access to:
- **Order History & Personalization:** A cryptographic history of past orders, enabling the POS system to instantly recognize favorite items and suggest personalized recommendations (e.g., "Would you like your usual large cappuccino with oat milk?").
- **Loyalty & Discount Integration:** A secure token representing the customer's loyalty status or active discounts. This can be scanned at the point of sale to automatically apply rewards, eliminating the need for physical loyalty cards or manual coupon entry.

### 2. Order Verification & Receipts
Ensuring the correct order reaches the correct customer is paramount in a busy take-away environment. The Solid Databox can be used to generate cryptographically signed receipts that serve as proof of purchase and order verification:
- **Digital Receipts & Warranty:** Upon payment, a Verifiable Credential (VC) is issued to the customer's Pod, serving as an immutable proof of purchase. This is particularly useful for tracking warranties on purchased goods (e.g., electronics or appliances) or for expense claims.
- **Order Accuracy:** In apps that link directly to the Databox, the customer can verify the accuracy of their order against the digital receipt, reducing disputes and improving customer satisfaction.

### 3. Data Minimization for Privacy
Even in quick, transactional interactions, customer privacy is essential. The Solid Databox ensures that personal data is only shared for the duration of the transaction:
- **Scoped Access Control:** Customers can grant temporary read-access to their Databox for order history or loyalty verification, and revoke that access immediately after the transaction is complete. This ensures that sensitive personal information is not retained by the business longer than necessary, complying with privacy regulations.

## The Solid Databox Workflow

1. **Order Placement & Verification:** The customer places an order via an app or in-person. The POS system scans a QR code from the customer's Solid Pod to instantly retrieve their loyalty status and order history, personalizing the service.
2. **Payment & Digital Receipt:** Upon payment, the POS generates a cryptographically signed digital receipt (Verifiable Credential) and pushes it to the customer's Databox. This receipt contains details of the purchase, warranty information, and any loyalty points earned.
3. **Data Minimization Post-Transaction:** After the receipt is stored, the customer can revoke access to their Databox, ensuring their data is not unnecessarily retained by the business.

This workflow ensures a fast, personalized, and secure experience for the customer while maintaining the speed and efficiency required for the take-away industry.
