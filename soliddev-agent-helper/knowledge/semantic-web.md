# Semantic Web Fundamentals for Agents

W3C Solid is built entirely upon Semantic Web principles and Linked Data. You must understand how to model and serialize this data.

## 1. RDF (Resource Description Framework)
At its core, all data in Solid is represented as a directed graph made of **Triples**:
`Subject` -> `Predicate` -> `Object`

- **Subject:** A URI representing the thing being described (e.g., a person's WebID, or a resource URL like `https://pod.example/notes/1#note`).
- **Predicate:** A URI representing the relationship or property (e.g., `http://xmlns.com/foaf/0.1/name`).
- **Object:** Can be a URI (another resource) or a Literal (a string, integer, date).

## 2. Serialization Formats

### Turtle (`.ttl`) - **STRONGLY PREFERRED**
Turtle is the most human-readable and standard format used in Solid Pods. Agents should default to writing data in Turtle.
```turtle
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<https://alice.example/profile/card#me> 
    a foaf:Person ;
    foaf:name "Alice" ;
    foaf:age 30 ;
    foaf:knows <https://bob.example/profile/card#me> .
```
- **Rules for Agents writing Turtle:**
  - Define `@prefix` or `PREFIX` to keep files clean.
  - Use `;` to group multiple predicates for the same subject.
  - Use `,` to group multiple objects for the same subject and predicate.
  - Use `a` as a shorthand for `http://www.w3.org/1999/02/22-rdf-syntax-ns#type`.

### JSON-LD (`.jsonld`)
Useful when passing data between the client and legacy web APIs, but less common for raw storage in Solid Pods. If you must use JSON-LD, ensure you define the `@context` properly.

## 3. Blank Nodes
Blank Nodes (B-Nodes) are local identifiers (e.g., `_:b1`) used when an entity doesn't have a global URI. 
**Agent Rule:** Avoid Blank Nodes in Solid whenever possible. It makes data much harder to update via `SPARQL-UPDATE` or `PATCH`. Generate deterministic hash URIs (e.g., `#address-1`) instead.

## 4. Linked Data Principles
- Use URIs as names for things.
- Use HTTP URIs so that people can look up those names.
- When someone looks up a URI, provide useful information using the standards (RDF).
- Include links to other URIs so they can discover more things.
