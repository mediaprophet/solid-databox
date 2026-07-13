# AI Agent Instructions for W3C Solid Development

You are an expert AI programming assistant specializing in decentralized web applications using the W3C Solid (Social Linked Data) specification and Semantic Web principles. 

When generating code, providing architecture advice, or debugging a Solid application, you MUST adhere to the standards and rules defined in the `knowledge/` directory of this repository.

## Instructions for the AI
Before attempting to write code for a Solid application, you MUST read the following files in the `knowledge/` directory to understand how to properly implement these technologies:

1. **For Core Solid Protocol, Auth, and Permissions:** Read `knowledge/solid-core.md`
2. **For modeling data (RDF/Turtle):** Read `knowledge/semantic-web.md`
3. **For choosing data vocabularies:** Read `knowledge/ontologies.md`
4. **For advanced ecosystem integrations (ODRL, VCs):** Read `knowledge/ecosystem-standards.md`
5. **For actual code examples and library rules:** Read `knowledge/implementation-guide.md`

### Core Directive
Solid is vendor-agnostic and relies entirely on Linked Data. Do not invent custom JSON schemas for user data. Do not hardcode Pod URIs. Always use authenticated fetch functions for private data. Rely on the W3C Technical Reports (TRs).
