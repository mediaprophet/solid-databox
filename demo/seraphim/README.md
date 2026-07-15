# Seraphim

[![Live Demo](https://img.shields.io/badge/Live-Demo-brightgreen)](https://dev.linkeddata.au/seraphim.html)

Seraphim is a consumer-controlled Solid client Flutter application designed to prioritize the warmth of humanity, human rights, and data sovereignty. It acts as a comprehensive dashboard and data vault manager for individuals interacting with the Solid ecosystem.

## Core Philosophy & Data Architecture

> **Note:** Following the architectural pattern established by the ANU Software Innovation Institute (`anusii`), this application is built with a strict **online-first, decentralized model**.

Unlike traditional mobile applications, Seraphim **does NOT use a local offline database** (like SQFlite or Isar). All user data is securely read from and written to a remote, user-controlled Solid Pod. By utilizing `solidpod` and `solidui`, structured data (such as budgets, receipts, case plans, and verifiable credentials) remains exclusively in the user's custody within their remote data vault. 

### Future Roadmap: Qualia-DB
Future implementations are explicitly designed to support human rights initiatives and will be integrated with a `qualia-db` license framework for natural persons. This ensures that the ontological representation of human experience remains protected and under the strict control of the individual.

## Features

Seraphim implements a rich suite of Domain-Driven features designed for personal data management:

* **Authentication:** Secure OIDC login (WebID, DPoP, PKCE) powered by `solidui`.
* **Budget Manager:** Track expenses and manage financial health securely.
* **Credential Wallet:** Store and present W3C Verifiable Credentials (VCs).
* **Document & Receipt Capture:** Scan physical documents and receipts directly into your Pod.
* **QR Code Scanner & Generator:** 
  * Generate dynamic QR codes to present verifiable evidence.
  * Scan external QR codes to securely resolve remote RDF endpoints and append data to your Pod.
* **Case Plans & Referrals:** Manage care networks, case files, and external referrals.
* **Consent Manager:** Granular control over who can access your Pod resources.

## Architecture

The application is structured using **Domain-Driven Design (DDD)** principles and utilizes `flutter_riverpod` for state management. 

* **Presentation Layer:** UI components and state controllers (`StatefulShellRoute` via `go_router` for bottom navigation).
* **Application Layer:** Providers and orchestration logic.
* **Domain Layer:** Models and business rules.
* **Infrastructure Layer:** Remote Pod communication (`readPod`, RDF parsing).

## Getting Started

### Prerequisites
- Flutter SDK (stable)
- A Solid Pod account (e.g., Inrupt, CSS, or a self-hosted Solid Server)

### Running Locally
```bash
cd demo/seraphim
flutter pub get
flutter run -d chrome
```

### Authentication Flow
When the app launches, it automatically checks your local secure storage for an existing Solid session. If none is found, you will be redirected to the SolidLogin screen to authenticate against your chosen Solid Identity Provider. Upon successful authentication, the app routes you directly to your secure dashboard.
