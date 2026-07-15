# Ontologies: WoT and SOSA/SSN

To ensure that data transitions seamlessly from a physical sensor to a decentralized Pod while remaining fully machine-readable, researchers rely on a combination of established Semantic Web ontologies. This is particularly relevant when integrating W3C Solid with the W3C Web of Things (WoT).

## WoT Thing Description (TD) Ontology
The WoT TD Ontology acts as the entry point and core semantic model of the WoT. 
- **Purpose:** It provides metadata and network-facing interfaces (Interaction Affordances) of physical devices.
- **Benefit:** It abstracts away underlying hardware protocols before data collection even occurs, presenting a unified semantic interface to software agents.

## SOSA/SSN (Sensor, Observation, Sample, and Actuator) Ontology
Once the WoT layer collects the data, it must be translated into a semantic structure suitable for a Solid Pod.
- **Purpose:** It translates collected data into a rich semantic structure suitable for storage in a Linked Data Platform.
- **Benefit:** It guarantees that an IoT metric (e.g., a heart-rate reading) is stored as standardized RDF, fully annotated with context like time and location, rather than a proprietary or application-specific JSON string.

## Integration Example
In projects like WoT-Solid, the raw output from wearable BLE devices (abstracted by the WoT TD ontology) is directly mapped into the SOSA/SSN ontology before being stored in the user's Solid server.
