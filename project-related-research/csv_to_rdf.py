import csv
import json
import os
import re
import urllib.parse

def clean_string(s):
    if not s:
        return ""
    return str(s).strip()

def turtle_literal(s):
    if not s:
        return None
    # json.dumps safely escapes quotes, newlines, etc. and surrounds with double quotes
    return json.dumps(str(s))

def make_uri(link, title, prefix="local"):
    if link and link.startswith("http"):
        # simple cleanup for ttl (no spaces)
        return "<" + link.replace(" ", "%20") + ">"
    elif title:
        # Generate a slug
        slug = re.sub(r'[^a-zA-Z0-9]+', '-', title).strip('-').lower()
        if not slug:
            import uuid
            slug = str(uuid.uuid4())
        return f"<urn:{prefix}:{slug}>"
    else:
        import uuid
        return f"<urn:uuid:{uuid.uuid4()}>"

def process_csv(filepath, filename_base, rows, out_file):
    with open(filepath, 'r', encoding='utf-8-sig', errors='replace') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Common normalisation
            row_clean = {k.strip() if k else '': clean_string(v) for k, v in row.items()}
            if not any(row_clean.values()):
                continue # Skip empty rows

            # Determine Title, Description, Link
            title = row_clean.get('Title') or row_clean.get('Name') or row_clean.get('Title ') or ""
            desc = row_clean.get('Description') or row_clean.get('Comments') or row_clean.get('PURPOSE') or ""
            link = row_clean.get('Link') or row_clean.get('Project Link') or row_clean.get('URI') or row_clean.get('Source Link') or row_clean.get('companyLink') or ""
            
            uri = make_uri(link, title)

            # Determine classes
            classes = ["sdr:Resource"]
            category = row_clean.get('Category', '').lower()
            
            if 'commonvocab' in filename_base.lower():
                classes = ["sdr:Vocabulary"]
            elif category == 'server':
                classes.append("sdr:Server")
            elif category == 'app':
                classes.append("sdr:App")
            elif category == 'library':
                classes.append("sdr:Library")
            elif category == 'platform':
                classes.append("sdr:Platform")
            elif category == 'luminary':
                classes.append("sdr:Developer")
                classes.append("foaf:Person")
                classes.append("schema:Person")
            
            if category in ['server', 'app', 'library', 'platform', 'utility']:
                if "sdr:SoftwareResource" not in classes:
                    classes.append("sdr:SoftwareResource")
            
            # Start writing triple
            out_file.write(f"{uri}\n")
            out_file.write(f"    a {', '.join(classes)} ;\n")
            
            props = []
            props.append(f"    sdr:sourceFile {turtle_literal(filename_base)}")
            
            if title:
                if 'commonvocab' in filename_base.lower() or 'luminary' in category:
                    if 'luminary' in category:
                        props.append(f"    foaf:name {turtle_literal(title)}")
                    else:
                        props.append(f"    dct:title {turtle_literal(title)}")
                else:
                    props.append(f"    dct:title {turtle_literal(title)}")
            
            if desc:
                if 'commonvocab' in filename_base.lower():
                    props.append(f"    sdr:purpose {turtle_literal(desc)}")
                else:
                    props.append(f"    dct:description {turtle_literal(desc)}")
            
            if link and link.startswith('http'):
                props.append(f"    schema:url <{link.replace(' ', '%20')}>")
                
            csv_type = row_clean.get('Type')
            if csv_type:
                props.append(f"    sdr:csvType {turtle_literal(csv_type)}")
                
            csv_cat = row_clean.get('Category')
            if csv_cat:
                props.append(f"    sdr:csvCategory {turtle_literal(csv_cat)}")
                
            csv_subcat = row_clean.get('Sub-Category')
            if csv_subcat:
                props.append(f"    sdr:csvSubCategory {turtle_literal(csv_subcat)}")
                
            language = row_clean.get('Language')
            if language:
                props.append(f"    sdr:implementationLanguage {turtle_literal(language)}")
                
            maint_status = row_clean.get('Maintainence Status')
            if maint_status:
                props.append(f"    sdr:maintenanceStatus {turtle_literal(maint_status)}")
                
            lic_type = row_clean.get('License Type')
            if lic_type:
                props.append(f"    sdr:licenseType {turtle_literal(lic_type)}")

            prefix = row_clean.get('PREFIX')
            if prefix:
                props.append(f"    sdr:prefix {turtle_literal(prefix)}")
                
            vocab_uri = row_clean.get('URI')
            if vocab_uri and 'commonvocab' in filename_base.lower():
                props.append(f"    sdr:namespaceURI <{vocab_uri.replace(' ', '%20')}>")

            # Join props
            out_file.write(" ;\n".join(props))
            out_file.write(" .\n\n")

def main():
    dev_res_dir = r"C:\Projects\webcivics\solid-databox\dev-resources"
    out_path = r"C:\Projects\webcivics\solid-databox\project-related-research\solid-databox-resources-data.ttl"
    
    with open(out_path, 'w', encoding='utf-8') as out_file:
        out_file.write("@prefix sdr: <https://w3id.org/solid-databox/resources#> .\n")
        out_file.write("@prefix schema: <https://schema.org/> .\n")
        out_file.write("@prefix dct: <http://purl.org/dc/terms/> .\n")
        out_file.write("@prefix doap: <http://usefulinc.com/ns/doap#> .\n")
        out_file.write("@prefix foaf: <http://xmlns.com/foaf/0.1/> .\n\n")
        
        for filename in os.listdir(dev_res_dir):
            if filename.endswith(".csv"):
                filepath = os.path.join(dev_res_dir, filename)
                print(f"Processing {filename}...")
                process_csv(filepath, filename, [], out_file)
                
    print(f"Data successfully written to {out_path}")

if __name__ == "__main__":
    main()
