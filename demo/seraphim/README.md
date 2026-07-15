# Seraphim

[![Live Demo](https://img.shields.io/badge/Live-Demo-brightgreen)](https://dev.linkeddata.au/seraphim.html)

A consumer-controlled Solid client Flutter application.

## Data Architecture Notice
> **Note:** Following the architectural pattern of the ANU Software Innovation Institute (`anusii`), this application does NOT use a local offline database (like sqflite or isar). Instead, it relies entirely on a remote, decentralized "online-first" model. The app reads and writes encrypted data directly to the user's Solid Pod via `solidpod` and `solidui`, keeping structured user data securely in user-controlled remote vaults rather than on the local device.
> 
> **Future Roadmap:** Future implementations to support human rights are intended to be supported by a `qualia-db` license for natural persons.

## Architecture
Built with Domain-Driven Design (DDD), `flutter_riverpod`, and `solidui` (for WebID, DPoP, and PKCE Auth). 
