import csv
import json
import os
import re

def clean_string(s):
    if not s:
        return ""
    return str(s).strip()

def process_csv(filepath, filename_base, dataset):
    with open(filepath, 'r', encoding='utf-8-sig', errors='replace') as f:
        reader = csv.DictReader(f)
        for row in reader:
            row_clean = {k.strip() if k else '': clean_string(v) for k, v in row.items()}
            if not any(row_clean.values()):
                continue

            title = row_clean.get('Title') or row_clean.get('Name') or row_clean.get('Title ') or ""
            desc = row_clean.get('Description') or row_clean.get('Comments') or row_clean.get('PURPOSE') or ""
            link = row_clean.get('Link') or row_clean.get('Project Link') or row_clean.get('URI') or row_clean.get('Source Link') or row_clean.get('companyLink') or ""
            
            category = row_clean.get('Category', 'Other')
            if not category:
                category = 'Other'
            
            if 'commonvocab' in filename_base.lower():
                category = 'Vocabulary'
                
            csv_type = row_clean.get('Type', '')
            subcat = row_clean.get('Sub-Category', '')
            language = row_clean.get('Language', '')
            maint_status = row_clean.get('Maintainence Status', '')
            license_type = row_clean.get('License Type', '')
            
            if not title and not link:
                continue

            dataset.append({
                "title": title,
                "description": desc,
                "link": link,
                "category": category,
                "type": csv_type,
                "subCategory": subcat,
                "language": language,
                "maintenanceStatus": maint_status,
                "licenseType": license_type,
                "sourceFile": filename_base
            })

def main():
    dev_res_dir = r"C:\Projects\webcivics\solid-databox\dev-resources"
    ghpages_dir = r"C:\Projects\webcivics\solid-databox\ghpages"
    md_out_path = r"C:\Projects\webcivics\solid-databox\project-related-research\solid-databox-resources-data.md"
    
    if not os.path.exists(ghpages_dir):
        os.makedirs(ghpages_dir)
        
    json_out_path = os.path.join(ghpages_dir, "data.json")
    
    dataset = []
    
    for filename in os.listdir(dev_res_dir):
        if filename.endswith(".csv"):
            filepath = os.path.join(dev_res_dir, filename)
            process_csv(filepath, filename, dataset)
            
    # Sort dataset by title
    dataset = sorted(dataset, key=lambda x: x['title'].lower() if x['title'] else x['link'])
    
    # Write JSON
    with open(json_out_path, 'w', encoding='utf-8') as f:
        json.dump(dataset, f, indent=2)
        
    print(f"JSON data successfully written to {json_out_path}")
    
    # Write Markdown
    categories = {}
    for item in dataset:
        cat = item['category']
        if cat not in categories:
            categories[cat] = []
        categories[cat].append(item)
        
    with open(md_out_path, 'w', encoding='utf-8') as f:
        f.write("# Solid-Databox Resources\n\n")
        
        for cat in sorted(categories.keys()):
            f.write(f"## {cat}\n\n")
            f.write("| Title | Description | Link | Type | Language |\n")
            f.write("| --- | --- | --- | --- | --- |\n")
            
            for item in categories[cat]:
                title = item['title'].replace('|', '&#124;')
                desc = item['description'].replace('|', '&#124;').replace('\n', ' ')
                link = f"[Link]({item['link']})" if item['link'] and item['link'].startswith('http') else item['link']
                ctype = item['type'].replace('|', '&#124;')
                lang = item['language'].replace('|', '&#124;')
                
                f.write(f"| {title} | {desc} | {link} | {ctype} | {lang} |\n")
            
            f.write("\n")
            
    print(f"Markdown data successfully written to {md_out_path}")

if __name__ == "__main__":
    main()
