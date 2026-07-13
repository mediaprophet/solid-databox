# Solid Core Standards Guide for Agents

This document provides technical instructions on implementing the core W3C Solid Technical Reports (TRs).

## 1. Solid Protocol (LDP & CRUD)
The [Solid Protocol](https://solidproject.org/TR/protocol) defines how clients interact with Pods using RESTful HTTP. Data is organized into LDP Containers (directories) and LDP Resources (files).

### Rules for Agents:
- **HTTP Methods:** Use standard `GET`, `PUT`, `POST`, `PATCH`, and `DELETE`.
- **Content Types:** Always use `text/turtle` for structured data, or `application/ld+json`.
- **Creating Containers:** Send a `POST` request to the parent container with `Link: <http://www.w3.org/ns/ldp#BasicContainer>; rel="type"` and `Slug: desired-folder-name`.
- **Creating Resources:** Send a `POST` or `PUT`. Use `Slug: desired-file-name` with a `POST`.
- **Patching:** Use `PATCH` with `Content-Type: application/sparql-update` or `text/n3` to update existing resources without overwriting the whole file. 

## 2. WebID Profile & Discovery
A [WebID](https://solidproject.org/TR/webid-profile) is a URL that identifies a user or agent, which resolves to an RDF document containing their public profile.

### Rules for Agents:
- **Never Hardcode Endpoints:** Do not assume a Pod is located at `https://user.inrupt.net/` or `https://user.solidcommunity.net/`.
- **Discovery Flow:** 
  1. Fetch the user's WebID.
  2. Parse the RDF graph.
  3. Look for the `pim:storage` predicate (`http://www.w3.org/ns/pim/space#storage`) to find the root of their Pod.
  4. Look for `solid:oidcIssuer` (`http://www.w3.org/ns/solid/terms#oidcIssuer`) to discover where to authenticate them.

## 3. Solid-OIDC (Authentication)
Solid uses [Solid-OIDC](https://solidproject.org/TR/oidc), an extension of OpenID Connect that uses WebIDs and DPoP (Demonstrating Proof-of-Possession).

### Rules for Agents:
- **Client Libraries:** Rely on `@inrupt/solid-client-authn-browser` (for React/SPA) or `@inrupt/solid-client-authn-node` (for servers). Do not attempt to write custom Solid-OIDC flows from scratch; DPoP token generation is complex.
- **The `fetch` function:** Always pass the authenticated `fetch` function provided by the auth library session to your data requests. Otherwise, requests to private resources will result in `401 Unauthorized`.

## 4. Access Control (WAC vs. ACP)
Solid Pods secure data using either [Web Access Control (WAC)](https://solidproject.org/TR/wac) or [Access Control Policies (ACP)](https://solidproject.org/TR/acp).

### Rules for Agents:
- **WAC (Legacy/Standard):** Uses `.acl` (Access Control List) files. It defines `acl:Authorization` blocks granting `acl:Read`, `acl:Write`, `acl:Append`, or `acl:Control` to specific `acl:agent` (WebIDs) or `acl:agentClass` (like `foaf:Agent` for public access).
- **ACP (Modern):** Uses `.acr` files and is policy-based. It separates *rules* (who) from *policies* (what they can do). 
- **Implementation:** Use `@inrupt/solid-client`'s universal access APIs (`getUniversalAccess`, `setUniversalAccess`) which abstract away the differences between WAC and ACP, rather than manually writing `.acl` or `.acr` files directly via raw HTTP.

## 5. Solid Notifications Protocol
The [Notifications Protocol](https://solidproject.org/TR/notifications) allows apps to subscribe to real-time changes on Pod resources.

### Rules for Agents:
- Do not use long-polling. 
- Look for the `Link` header with `rel="http://www.w3.org/ns/solid/terms#storageDescription"` or inspect the resource's metadata to find the Subscription endpoint.
- Common channel types are WebSockets and WebHooks.
