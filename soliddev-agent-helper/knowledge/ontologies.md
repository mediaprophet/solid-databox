# Core Ontologies & Vocabularies for Solid Agents

When an agent writes data to a Solid Pod, it MUST use standard ontologies rather than inventing custom JSON-like schemas.

## 1. FOAF (Friend of a Friend)
**Prefix:** `@prefix foaf: <http://xmlns.com/foaf/0.1/> .`
**Use Case:** Profiles, names, relationships (knowing people).
**Common Terms:**
- `foaf:Person` - Class for a human.
- `foaf:name` - Full name.
- `foaf:knows` - Relationship to another WebID.
- `foaf:img` - Profile picture.

## 2. vCard
**Prefix:** `@prefix vcard: <http://www.w3.org/2006/vcard/ns#> .`
**Use Case:** Contact details, addresses, phone numbers (often used heavily in Solid Profiles).
**Common Terms:**
- `vcard:hasAddress` - Link to a structured address.
- `vcard:hasEmail` - Link to an email URI (e.g., `mailto:alice@example.com`).
- `vcard:role` - Job title or role.

## 3. LDP (Linked Data Platform)
**Prefix:** `@prefix ldp: <http://www.w3.org/ns/ldp#> .`
**Use Case:** Describing the structure of the Pod itself (Containers and Resources).
**Common Terms:**
- `ldp:BasicContainer` - A folder.
- `ldp:Resource` - A file.
- `ldp:contains` - Links a container to the files/folders inside it.

## 4. WebACL (Web Access Control)
**Prefix:** `@prefix acl: <http://www.w3.org/ns/auth/acl#> .`
**Use Case:** Defining permissions in `.acl` files (Legacy standard, still widely used).
**Common Terms:**
- `acl:Authorization` - The main class for a rule.
- `acl:accessTo` - The file/folder being protected.
- `acl:agent` - The WebID granted access.
- `acl:mode` - The permission granted (`acl:Read`, `acl:Write`, `acl:Control`, `acl:Append`).

## 5. Schema.org
**Prefix:** `@prefix schema: <http://schema.org/> .`
**Use Case:** General purpose data (Events, Recipes, Articles, Organizations).
**Common Terms:**
- `schema:Event` - An event with a start and end date.
- `schema:startDate` - ISO datetime.
- `schema:location` - Where it happens.

## Rule for Agents:
Always search for an existing vocabulary before creating a custom one. If you must create a custom vocabulary, ensure it is hosted at an HTTP URI and provides RDFS/OWL definitions when resolved.
