# W3C Solid Servers

> A survey of available Solid server implementations and hosted Pod providers,
> compiled for the **solid-databox** project research.
>
> Solid is a W3C-style specification project (led by Tim Berners-Lee) for
> decentralising the Web through user-controlled **Pods** — personal online data
> stores that adhere to the [Solid Protocol](https://solidproject.org/TR/protocol),
> [Linked Data Platform (LDP)](https://www.w3.org/TR/ldp/), [Web Access Control (WAC)](https://www.w3.org/wiki/WebAccessControl),
> [WebID](https://www.w3.org/2005/Incubator/webid/spec/identity/) identity, and
> [Solid OIDC](https://solidproject.org/TR/oidc/) authentication.
>
> Sources: [solidproject.org](https://solidproject.org/), the
> [solid-platform](https://github.com/solid-contrib/solid-platform) registry,
> and individual project repositories. Last reviewed: 2026-07-14.

---

## 1. Solid Server Implementations

The official list maintained at [solidproject.org/users/get-a-pod](https://solidproject.org/users/get-a-pod)
currently recognises the following Solid server implementations:

| Server | Language / Stack | License | Maintainer | Status |
|---|---|---|---|---|
| **Community Solid Server (CSS)** | TypeScript / Node.js | MIT | Inrupt & imec | ✅ Actively maintained |
| **Node Solid Server (NSS)** | JavaScript / Node.js + Express | MIT | nodeSolidServer org | ✅ Actively maintained |
| **Enterprise Solid Server (ESS)** | Kubernetes / microservices | Commercial | Inrupt Inc. | ✅ Actively maintained |
| **Trinpod (TwinPod™)** | Proprietary | Commercial | Graphmetrix | ✅ Actively maintained |
| **Manas** | Rust | Open source | Manomayam | 🟡 Early / experimental |
| **PHP Solid Server (PSS)** | PHP | Open source | PDS Interop | 🟡 In development |
| **OpenLink Virtuoso** | C / C++ | Commercial (open-source edition available) | OpenLink Software | ✅ Solid-capable via ODS layer |

---

### 1.1 Community Solid Server (CSS)

- **Repository:** <https://github.com/CommunitySolidServer/CommunitySolidServer>
- **Docs:** <https://communitysolidserver.github.io/CommunitySolidServer/>
- **npm package:** `@solid/community-server` (latest v7.1.x)
- **License:** MIT — © Inrupt Inc. & imec
- **Language:** TypeScript (≈97%)
- **Runtime:** Node.js ≥ 18

The CSS is the **reference open-source implementation** of the current Solid
specifications. It is open and modular, designed for:

- 🧑🏽 People who want to try out having their own Pod
- 👨🏿‍💻 Developers who want to quickly create and test Solid apps
- 👩🏻‍🔬 Researchers who want to design new features for Solid

**Quick start:**

```bash
npx @solid/community-server
# Visit http://localhost:3000/

# Persist Pod contents between restarts:
npx @solid/community-server -c @css:config/file.json -f data/
```

Configuration is driven by [Components.js](https://componentsjs.readthedocs.io/)
JSON files; recipes live at [CommunitySolidServer/recipes](https://github.com/CommunitySolidServer/recipes),
and a [configuration generator](https://communitysolidserver.github.io/configuration-generator/)
is available. The server is highly extensible — custom modules can be plugged
in without modifying the base source.

> 📑 Cite: Van Herwegen, J. & Verborgh, R. (2024). *The Community Solid Server:
> Supporting research & development in an evolving ecosystem.* Semantic Web
> 15(6), 2597–2611. <https://doi.org/10.3233/SW-243726>

---

### 1.2 Node Solid Server (NSS)

- **Repository:** <https://github.com/nodeSolidServer/node-solid-server>
- **Docs:** <https://solidproject.org/for-developers/pod-server>
- **npm package:** `solid-server` (latest v6.0.0)
- **License:** MIT
- **Language:** JavaScript (≈85%) + Handlebars views
- **Runtime:** Node.js

NSS is the **original Solid server**, written in Node.js/Express and serving
Pods directly from the file system. It can be used as a CLI tool or embedded
as a library in an existing Express app.

**Solid features supported:**

- [Linked Data Platform](https://www.w3.org/TR/ldp/) (LDP)
- [Web Access Control](https://www.w3.org/wiki/WebAccessControl) (WAC)
- [WebID+TLS Authentication](https://www.w3.org/2005/Incubator/webid/spec/tls/)
- Real-time live updates via WebSockets
- Identity provider for WebID
- CORS proxy for cross-site data access
- Group members in ACL
- Email account recovery

**Quick start:**

```bash
npm install -g solid-server
solid init      # interactive wizard → creates config.json
solid start    # runs the server (default https://localhost:8443)
```

Supports **single-user** and **multi-user** (subdomain-per-user) modes, Docker
images (`nodesolidserver/node-solid-server`), and reverse-proxy deployment
(e.g. behind NGINX). The Solid test suite runs in CI to keep NSS spec-compliant.

---

### 1.3 Enterprise Solid Server (ESS)

- **Product page:** <https://www.inrupt.com/products/enterprise-solid-server>
- **Docs:** <https://docs.inrupt.com/ess/> (current: ESS 2.7)
- **License:** Commercial (Inrupt Inc.)
- **Deployment:** Kubernetes-based microservices architecture

ESS is Inrupt's **commercial, production-grade** Solid server, designed for
organisations that need high availability, auditing, and enterprise identity
integration. It is composed of many independently deployable services, including:

- **Access Grant Service** — issues/verifies Verifiable Credential–based access grants
- **Auditing Service** + Audit Enricher
- **Authorization Service**
- **Notification Services** — Delivery, Gateway, and WebSocket notification
- **Solid OIDC Broker Service** — application registration & token issuance
- **Pod Provisioning / Pod Storage Services**
- **Platform Management API** + Purger Service
- **Query Service** + Indexer
- **Start Service**, **UMA Service**, **Wallet Service**, **WebID Service**

ESS supports high-availability deployments, Prometheus metrics, OpenTelemetry,
Kafka event streaming, and extensive customisation (logging, security, Pod
maintenance, scaling). It is the engine behind **Inrupt Pod Spaces**.

---

### 1.4 Trinpod / TwinPod™

- **Sites:** <https://trinpod.us/>, <https://trinpod.eu/>
- **Vendor:** [Graphmetrix, Inc.](https://graphmetrix.com/)
- **Product info:** <https://graphmetrix.com/trinpod-server>
- **License:** Commercial / proprietary

Trinpod is an **"industrial-strength" Solid Pod** server with built-in
conceptual computing through *Trinity AI*. It is designed to handle very large
volumes of data and is offered as a hosted TwinPod™ service in both the US
(`trinpod.us`) and EU (`trinpod.eu`). Registration is performed via the
[SystemTwin™ Accelerator](https://systemtwin.com/).

---

### 1.5 Manas

- **Docs:** <https://manomayam.github.io/manas/introduction.html>
- **Language:** Rust
- **License:** Open source

Manas is an emerging **Rust-based** Solid server implementation focused on
performance and memory safety. It is still in an early/experimental stage and
is primarily a research and community project.

---

### 1.6 PHP Solid Server (PSS)

- **Project page:** <https://pdsinterop.org/php-solid-server/>
- **Language:** PHP
- **License:** Open source
- **Maintainer:** [PDS Interop](https://pdsinterop.org/)

PSS is a community-driven effort to deliver a Solid server in PHP, lowering the
barrier for deployment on common PHP-hosting environments. It is under active
development as part of the PDS Interop family of interoperability tools.

---

### 1.7 OpenLink Virtuoso (with ODS)

- **Product page:** <http://virtuoso.openlinksw.com/>
- **Vendor:** [OpenLink Software](https://github.com/OpenLinkSoftware)
- **License:** Commercial (Open-Source Edition also available)
- **Language:** C / C++

OpenLink Virtuoso is a high-performance **RDF store, SPARQL endpoint, and
Linked Data platform**. Solid support is delivered through the
**WebDAV File System Module** a/k/a **OpenLink Data Spaces (ODS)** layer,
which adheres to Solid conventions for:

- **Identity** — via WebID
- **Authentication** — via WebID+TLS or WebID-OIDC (OIDC still a work-in-progress)
- **Authorization** — via WebACLS or WAC
- **Read-Write Operations** — via HTTP PATCH using `application/sparql-update` payloads

The minimum Solid-capable installation atop Virtuoso (Enterprise Edition)
comprises the **Virtuoso Authentication Layer (VAL)**, **ODS-Framework**, and
**ODS-Briefcase** VADs. Virtuoso supports Basic Containers, file storage,
SEARCH, and PATCH operations.

---

## 2. Legacy / Historical Servers

These servers are listed in the original `solid-platform` registry but are
**no longer actively maintained**.

### 2.1 gold

- **Repository:** <https://github.com/linkeddata/gold>
- **Language:** Go
- **Status:** Bugfix/maintenance mode only — the team moved focus to LDNode.

The original reference Solid platform server written in Go. An example instance
ran at `databox.me`. Supports Basic Containers, file storage, and a CORS proxy.

### 2.2 rww-play

- **Repository:** <https://github.com/read-write-web/rww-play>
- **Language:** Scala / Play / Akka
- **Status:** Not actively maintained

An LDP-compliant Read-Write-Web server. Supports Basic Containers, file
storage, and SEARCH.

### 2.3 ldphp

- **Repository:** <https://github.com/linkeddata/ldphp>
- **Language:** PHP
- **Status:** Legacy

An early LDP PHP server implementing LDP Basic Containers and file serving.
Did **not** implement WAC, WebID-RSA, or WebID-Delegation.

---

## 3. Hosted Pod Providers

For users who want a Pod without running their own server, the Solid community
operates a number of hosted Pod services. The official list
([solidproject.org/users/get-a-pod](https://solidproject.org/users/get-a-pod))
includes the following providers — each with different SLAs, support levels, and
guarantees:

| Provider | Get a Pod | Organisation | Hosting |
|---|---|---|---|
| **Data Pod** | <https://igrant.io/datapod.html> | iGrant.io Sweden | EU |
| **Inrupt Pod Spaces** | <https://start.inrupt.com/profile> | Inrupt Inc. | US & EU / Asia-Pacific |
| **redpencil.io** | <https://solid.redpencil.io/> | redpencil.io | EU |
| **solidcommunity.net** | <https://solidcommunity.net/> | Solid Project | UK |
| **solidcommunity.au** | <https://pods.solidcommunity.au/> | Solid Community AU | Australia |
| **solidweb.me** | <https://solidweb.me/> | Meisdata | EU |
| **solidweb.org** | <https://solidweb.org/> | Solid Grassroots | EU |
| **teamid.live** | <https://teamid.live/> | Meisdata | EU |
| **trinpod.eu** | <https://trinpod.eu/> | Graphmetrix | EU |
| **trinpod.us** | <https://trinpod.us/> | Graphmetrix | USA |
| **use.id** | <https://get.use.id/people> | Digita | EU |
| **solidweb.app** *(experimental)* | <https://solidweb.app/> | Meisdata | EU |

---

## 4. Feature Comparison (Actively Maintained Servers)

| Feature | CSS | NSS | ESS | Trinpod | OpenLink Virtuoso |
|---|---|---|---|---|---|
| Language | TypeScript | JavaScript | K8s microservices | Proprietary | C/C++ |
| License | MIT (open source) | MIT (open source) | Commercial | Commercial | Commercial + OSS edition |
| LDP Basic Containers | ✅ | ✅ | ✅ | ✅ | ✅ |
| File storage | ✅ | ✅ | ✅ | ✅ | ✅ |
| WAC / ACP authorization | ✅ | ✅ (WAC) | ✅ (ACP) | ✅ | ✅ (WebACLS / WAC) |
| WebID+TLS auth | ✅ | ✅ | ✅ | ✅ | ✅ |
| Solid OIDC auth | ✅ | ✅ | ✅ | ✅ | 🟡 In progress |
| WebSocket notifications | ✅ | ✅ | ✅ | ✅ | — |
| SPARQL PATCH (`application/sparql-update`) | ✅ | ✅ | ✅ | ✅ | ✅ |
| SEARCH | 🟡 Configurable | — | ✅ (Query Service) | ✅ | ✅ |
| High availability / scaling | 🟡 Via deployment | 🟡 Via deployment | ✅ Built-in | ✅ | ✅ |
| Auditing / metrics | 🟡 | — | ✅ (Prometheus, OpenTelemetry) | ✅ | ✅ |
| Target audience | Devs / researchers / users | Devs / users | Enterprises | Industrial / heavy data | Linked Data / RDF users |

---

## 5. References

- Solid Project — <https://solidproject.org/>
- Solid Protocol specification — <https://solidproject.org/TR/protocol>
- Solid Technical Reports Index — <https://solidproject.org/TR/>
- Get a Pod (hosted providers + server list) — <https://solidproject.org/users/get-a-pod>
- For Developers — <https://solidproject.org/for-developers>
- solid-platform registry (archived) — <https://github.com/solid-contrib/solid-platform>
- Community Solid Server — <https://github.com/CommunitySolidServer/CommunitySolidServer>
- Node Solid Server — <https://github.com/nodeSolidServer/node-solid-server>
- Inrupt ESS docs — <https://docs.inrupt.com/ess/>
- Trinpod — <https://graphmetrix.com/trinpod-server>
- Manas — <https://manomayam.github.io/manas/introduction.html>
- PHP Solid Server — <https://pdsinterop.org/php-solid-server/>
- OpenLink Virtuoso — <http://virtuoso.openlinksw.com/>
