import csv
import json
import re
from pathlib import Path
from urllib.parse import parse_qs, unquote, urlsplit, urlunsplit


ROOT_DIR = Path(__file__).resolve().parents[1]
DEV_RESOURCES_DIR = ROOT_DIR / "dev-resources"
PAGE_DIR = ROOT_DIR / "dev-linkeddata-au"
MARKDOWN_PATH = Path(__file__).with_name("solid-databox-resources-data.md")


def clean_string(value):
    return str(value).strip() if value else ""


def canonical_link(link):
    """Return a stable link for identity checks without changing its semantics."""
    link = clean_string(link)
    if not link:
        return ""

    parts = urlsplit(link)
    if parts.scheme.lower() not in {"http", "https"}:
        return link

    path = re.sub(r"/{2,}", "/", parts.path)
    if path != "/":
        path = path.rstrip("/")
    return urlunsplit((parts.scheme.lower(), parts.netloc.lower(), path, parts.query, parts.fragment))


def link_identity(link):
    """Apply provider-specific URL equality rules used only for deduplication."""
    parts = urlsplit(link)
    path = parts.path.casefold() if parts.netloc.casefold() == "github.com" else parts.path
    return urlunsplit((parts.scheme, parts.netloc.casefold(), path, parts.query, parts.fragment))


def humanize_identifier(value):
    value = unquote(value).removesuffix(".git")
    value = re.sub(r"[-_]+", " ", value).strip()
    if not value:
        return ""
    return value.title() if value.islower() else value


def title_from_link(link):
    """Derive a readable label when the inventories contain only a URL."""
    parts = urlsplit(link)
    host = parts.netloc.lower().removeprefix("www.")
    segments = [segment for segment in parts.path.split("/") if segment]

    if host == "github.com":
        if len(segments) >= 3 and segments[0].lower() == "orgs" and segments[-1].lower() == "repositories":
            return humanize_identifier(segments[1])
        if len(segments) >= 2 and segments[0].lower() == "topics":
            return f"{humanize_identifier(segments[1])} (GitHub topic)"
        if segments:
            return humanize_identifier(segments[-1])
        query = parse_qs(parts.query).get("q", [])
        if query:
            return humanize_identifier(query[0])

    if segments:
        candidate = segments[-1]
        if candidate.lower() not in {"index.html", "index.htm", "home", "about", "spec"}:
            candidate = re.sub(r"\.(?:html?|php|aspx?)$", "", candidate, flags=re.IGNORECASE)
            title = humanize_identifier(candidate)
            if title:
                return title

    domain_label = host.split(".")[0] if host else ""
    return humanize_identifier(domain_label) or "Untitled resource"


def source_category(filename):
    lowered = filename.lower()
    if "commonvocab" in lowered:
        return "Vocabulary"
    if "semweb" in lowered:
        return "Semantic Web Resource"
    if "rww_solid" in lowered:
        return "Solid / RWW Resource"
    if "solid resources" in lowered:
        return "Solid Resource"
    return "Resource"


def record_from_row(row, filename):
    row = {clean_string(key): clean_string(value) for key, value in row.items() if key}
    if not any(row.values()):
        return None

    title = row.get("Title") or row.get("Name")
    description = row.get("Description") or row.get("Comments") or row.get("PURPOSE") or ""
    link = (
        row.get("Link")
        or row.get("Project Link")
        or row.get("URI")
        or row.get("Source Link")
        or row.get("companyLink")
        or row.get("ServiceLink")
        or row.get("specificationLink")
        or row.get("W3 Wiki Link")
        or ""
    )
    if not title and not link:
        return None

    raw_category = row.get("Category", "")
    categories = [] if not raw_category or raw_category.casefold() == "other" else [raw_category]
    categories.append(source_category(filename))

    return {
        "title": title,
        "description": description,
        "link": canonical_link(link),
        "categories": list(dict.fromkeys(categories)),
        "type": row.get("Type", ""),
        "subCategory": row.get("Sub-Category", ""),
        "language": row.get("Language", ""),
        "maintenanceStatus": row.get("Maintainence Status", ""),
        "licenseType": row.get("License Type", ""),
        "sourceFiles": [filename],
    }


def prefer_text(current, candidate, *, longest=False):
    if not current:
        return candidate
    if not candidate:
        return current
    if current.startswith(("http://", "https://")) and not candidate.startswith(("http://", "https://")):
        return candidate
    return max((current, candidate), key=len) if longest else current


def merge_record(target, candidate):
    target["title"] = prefer_text(target["title"], candidate["title"])
    target["description"] = prefer_text(target["description"], candidate["description"], longest=True)
    for field in ("type", "subCategory", "language", "maintenanceStatus", "licenseType"):
        target[field] = prefer_text(target[field], candidate[field], longest=True)
    for field in ("categories", "sourceFiles"):
        target[field] = list(dict.fromkeys([*target[field], *candidate[field]]))


def load_dataset(dev_resources_dir=DEV_RESOURCES_DIR):
    merged = {}
    for path in sorted(dev_resources_dir.glob("*.csv")):
        with path.open("r", encoding="utf-8-sig", errors="replace", newline="") as csv_file:
            for row_number, row in enumerate(csv.DictReader(csv_file), start=2):
                record = record_from_row(row, path.name)
                if not record:
                    continue
                identity = ("link", link_identity(record["link"])) if record["link"] else (
                    "title",
                    record["title"].casefold(),
                    path.name,
                    row_number,
                )
                if identity in merged:
                    merge_record(merged[identity], record)
                else:
                    merged[identity] = record

    dataset = list(merged.values())
    for record in dataset:
        if not record["title"] or record["title"].startswith(("http://", "https://")):
            record["title"] = title_from_link(record["link"])
        record["category"] = record["categories"][0]

    return sorted(dataset, key=lambda item: item["title"].casefold())


def write_markdown(dataset, output_path=MARKDOWN_PATH):
    categories = {}
    for item in dataset:
        categories.setdefault(item["category"], []).append(item)

    with output_path.open("w", encoding="utf-8", newline="\n") as output:
        output.write("# Solid-Databox Resources\n\n")
        for category in sorted(categories):
            output.write(f"## {category}\n\n")
            output.write("| Title | Description | Categories | Link | Type | Language |\n")
            output.write("| --- | --- | --- | --- | --- | --- |\n")
            for item in categories[category]:
                values = {
                    key: clean_string(value).replace("|", "&#124;").replace("\r", " ").replace("\n", " ")
                    for key, value in item.items()
                    if isinstance(value, str)
                }
                categories_text = ", ".join(item["categories"]).replace("|", "&#124;")
                link = f"[Link]({item['link']})" if item["link"].startswith(("http://", "https://")) else values["link"]
                output.write(
                    f"| {values['title']} | {values['description']} | {categories_text} | "
                    f"{link} | {values['type']} | {values['language']} |\n"
                )
            output.write("\n")


def main():
    dataset = load_dataset()
    PAGE_DIR.mkdir(parents=True, exist_ok=True)
    with (PAGE_DIR / "data.json").open("w", encoding="utf-8", newline="\n") as output:
        json.dump(dataset, output, indent=2, ensure_ascii=False)
        output.write("\n")
    write_markdown(dataset)
    print(f"Wrote {len(dataset)} unique resources to {PAGE_DIR / 'data.json'}")


if __name__ == "__main__":
    main()
