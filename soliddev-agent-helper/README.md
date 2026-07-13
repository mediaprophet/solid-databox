# W3C Solid Agent Helper

A project to provide the necessary information, links, and **comprehensive AI agent instructions** to help developers and AI agents build W3C Solid related applications. 

## What is W3C Solid?
Solid (Social Linked Data) is a specification that lets people store their data securely in decentralized data stores called Pods. Pods are like secure personal web servers for data. When data is stored in someone's Pod, they control which people and applications can access it.

## The Agent Knowledge Base

To ensure your AI coding assistant (GitHub Copilot, Cursor, Claude, or Gemini) actually understands how to implement Solid and Semantic Web standards, this repository provides a dedicated knowledge base. 

Provide these files to your agent depending on what you are building:

* [agents.md](./agents.md) - **Start Here.** The root system prompt that tells your agent to read the detailed knowledge files.
* [claude.md](./claude.md) - An alternative root prompt formatted specifically for Claude Projects.
* [.cursorrules](./.cursorrules) - The root rule file for the Cursor IDE.

### Detailed Knowledge Files
The `knowledge/` folder contains deep technical guides for the agent:
* [solid-core.md](./knowledge/solid-core.md) - Solid Protocol, WebID, WAC/ACP, Auth, and Notifications.
* [semantic-web.md](./knowledge/semantic-web.md) - RDF, Turtle, Blank Nodes, and Linked Data principles.
* [ecosystem-standards.md](./knowledge/ecosystem-standards.md) - ODRL, Verifiable Credentials, and DIDs.
* [ontologies.md](./knowledge/ontologies.md) - Standard vocabularies (FOAF, VCARD, Schema.org, WebACL).
* [implementation-guide.md](./knowledge/implementation-guide.md) - Code examples, library selection, and patterns.

## Important Links

### Specifications & Core Documentation (Technical Reports)
* [Solid Technical Reports (TR)](https://solidproject.org/TR/)
* [Solid Community Forum](https://forum.solidproject.org/)

### Developer Tools & Libraries
* [Inrupt Documentation](https://docs.inrupt.com/)
* [Community Solid Server (CSS)](https://github.com/CommunitySolidServer/CommunitySolidServer)
