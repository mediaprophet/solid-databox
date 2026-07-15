import json
import re
from pathlib import Path

from export_resources import load_dataset


OUTPUT_PATH = Path(__file__).with_name("solid-databox-resources-data.ttl")


def turtle_literal(value):
    return json.dumps(str(value), ensure_ascii=False)


def resource_uri(record):
    if record["link"].startswith(("http://", "https://")):
        return f"<{record['link'].replace(' ', '%20')}>"
    slug = re.sub(r"[^a-zA-Z0-9]+", "-", record["title"]).strip("-").lower()
    return f"<urn:solid-databox:resource:{slug}>"


def rdf_classes(record):
    classes = ["sdr:Resource"]
    mappings = {
        "Vocabulary": "sdr:Vocabulary",
        "Server": "sdr:Server",
        "App": "sdr:App",
        "Library": "sdr:Library",
        "Platform": "sdr:Platform",
        "Developer": "sdr:Developer",
        "Luminary": "sdr:Developer",
    }
    for category in record["categories"]:
        rdf_class = mappings.get(category)
        if rdf_class and rdf_class not in classes:
            classes.append(rdf_class)
    if any(category in record["categories"] for category in ("Server", "App", "Library", "Platform", "Utility")):
        classes.append("sdr:SoftwareResource")
    return classes


def write_record(output, record):
    properties = []
    properties.extend(f"    sdr:sourceFile {turtle_literal(source)}" for source in record["sourceFiles"])
    properties.append(f"    dct:title {turtle_literal(record['title'])}")
    if record["description"]:
        properties.append(f"    dct:description {turtle_literal(record['description'])}")
    if record["link"].startswith(("http://", "https://")):
        properties.append(f"    schema:url <{record['link'].replace(' ', '%20')}>")
    properties.extend(f"    sdr:csvCategory {turtle_literal(category)}" for category in record["categories"])

    field_predicates = {
        "type": "sdr:csvType",
        "subCategory": "sdr:csvSubCategory",
        "language": "sdr:implementationLanguage",
        "maintenanceStatus": "sdr:maintenanceStatus",
        "licenseType": "sdr:licenseType",
    }
    for field, predicate in field_predicates.items():
        if record[field]:
            properties.append(f"    {predicate} {turtle_literal(record[field])}")

    output.write(f"{resource_uri(record)}\n")
    output.write(f"    a {', '.join(rdf_classes(record))} ;\n")
    output.write(" ;\n".join(properties))
    output.write(" .\n\n")


def main():
    dataset = load_dataset()
    with OUTPUT_PATH.open("w", encoding="utf-8", newline="\n") as output:
        output.write("@prefix sdr: <https://w3id.org/solid-databox/resources#> .\n")
        output.write("@prefix schema: <https://schema.org/> .\n")
        output.write("@prefix dct: <http://purl.org/dc/terms/> .\n")
        output.write("@prefix doap: <http://usefulinc.com/ns/doap#> .\n")
        output.write("@prefix foaf: <http://xmlns.com/foaf/0.1/> .\n\n")
        for record in dataset:
            write_record(output, record)
    print(f"Wrote {len(dataset)} unique resources to {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
