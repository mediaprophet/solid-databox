# CKAN Sources

## Status

Reviewed 2026-07-15. Implementation must pin documentation to the selected stable CKAN release rather than relying
on the moving `latest` pages below.

## Project and operator context

- [CKAN project](https://ckan.org/) — government and enterprise use, showcase and project positioning.
- [CKAN 20-year project history](https://ckan.org/20-years-of-ckan/) — government, research, NGO and global portal
  use; CKAN 2.12/3.0 project direction.
- [CKAN Ecosystem Catalog](https://ecosystem.ckan.org/) — installations and extension ecosystem.

## Core technical references

- [CKAN API guide](https://docs.ckan.org/en/latest/api/) — Action API and core dataset/organization actions.
- [Organizations and authorization](https://docs.ckan.org/en/latest/maintaining/authorization.html) — organization
  roles, private datasets, collaborators and extension authorization.
- [Extending guide](https://docs.ckan.org/en/latest/extensions/) — extension structure and supported practices.
- [Plugin interfaces](https://docs.ckan.org/en/latest/extensions/plugin-interfaces.html) — `IConfigDeclaration`,
  `IConfigurer`, `IActions`, `IAuthFunctions`, `IBlueprint`, `IDatasetForm`, `IPackageController`,
  `IResourceController` and related interfaces.
- [CKAN code architecture](https://docs.ckan.org/en/latest/contributing/architecture.html) — Flask blueprints, logic
  actions and authorization boundary.
- [Custom dataset fields](https://docs.ckan.org/en/latest/extensions/adding-custom-fields.html) — `IDatasetForm`
  schemas and validation.
- [Extension best practices](https://docs.ckan.org/en/2.9/extensions/best-practices.html) — plugins toolkit,
  extension-owned tables and migrations. Verify the corresponding page for the pinned release.

## Data and execution references

- [DataStore extension](https://docs.ckan.org/en/latest/maintaining/datastore.html) — structured data storage and
  Data API, authorization integration and security-sensitive database setup.
- [FileStore and uploads](https://docs.ckan.org/en/latest/maintaining/filestore.html) — configured storage, file
  access checks and storage backends.
- [Background jobs](https://docs.ckan.org/en/latest/maintaining/background-tasks.html) — RQ execution model and the
  fact that executed jobs are discarded rather than retained as an evidence history.

## Interpretation used by this target

The design conclusions in this folder are project decisions, not claims made directly by CKAN documentation:

- CKAN-held public and sensitive data can be a Databox source when the extension composes CKAN source authorization
  with narrower subject/field and Databox controls.
- CKAN's background job queue is execution infrastructure, not a legal/evidentiary ledger.
- CKAN sysadmin authority must be treated as a deployment threat for high-sensitivity programmes.
- harvested metadata requires a separate trust ceremony before it can activate person-level issuance.
- consumer Solid identity must remain separate from CKAN workforce identity and API tokens.
