import pandas as pd
import xml.etree.ElementTree as ET
import os
from xml.dom import minidom


def prettify_xml(element):
    """Returns a pretty-printed XML string with indentation and line breaks."""
    rough_string = ET.tostring(element, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")


def convert_excel_module_to_xml(excel_path, output_dir, class_name="GINF2"):
    """Convert Excel data to XML while ensuring clean formatting."""

    df = pd.read_excel(excel_path, dtype=str)  # Ensure values are strings, avoid NaN issues

    if df.empty:
        print("❌ Error: Excel file is empty. No XML generated.")
        return

    first_col = df.columns[-1]  # Last column becomes 'code_module'

    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)

    root = ET.Element("Modules")

    for _, row in df.iterrows():
        has_data = any(pd.notna(row[col]) and str(row[col]).strip() for col in df.columns)

        if has_data:
            module = ET.Element("Module")  # Create module only if it has data

            # Add the 'code_module' attribute
            if pd.notna(row[first_col]) and str(row[first_col]).strip():
                module.set("code_module", str(row[first_col]))

            # 🛠 **Always add `<ModuleName>`** (NO CONDITION!)
            if pd.notna(row["ModuleName"]) and str(row["ModuleName"]).strip():
                module_name = ET.SubElement(module, "ModuleName")
                module_name.text = str(row["ModuleName"])  # ❌ Remove `html.escape()`

            # Group elements inside <Elements>
            elements_container = ET.SubElement(module, "Elements")
            has_elements = False

            for column in df.columns:
                if "Element" in column:  # Elements go under <Elements>
                    if pd.notna(row[column]) and str(row[column]).strip():
                        element = ET.SubElement(elements_container, "Element")
                        element.text = str(row[column])  # ❌ Remove `html.escape()`
                        has_elements = True
                else:  # Other fields (Dept_Attachement, ClasseName, Chef, etc.)
                    if column not in ["ModuleName", "code_module"]:  # 🔥 **Exclude ModuleName here**
                        if pd.notna(row[column]) and str(row[column]).strip():
                            element = ET.SubElement(module, column.replace(" ", "_"))
                            element.text = str(row[column])  # ❌ Remove `html.escape()`

            if not has_elements:
                module.remove(elements_container)  # Remove empty <Elements> container

            root.append(module)  # Append only valid modules

    # Format XML for readability
    formatted_xml = prettify_xml(root)

    # Save the XML file
    xml_filename = f"Modules_{class_name}.xml"
    xml_path = os.path.join(output_dir, xml_filename)

    # Insert XSLT reference **only after XML declaration**
    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Modules.xsl"?>\n'
    xml_lines = formatted_xml.split("\n")

    if xml_lines[0].startswith('<?xml'):  # Ensure the XML declaration is first
        xml_lines.insert(1, xslt_reference.strip())  # Insert in the second line
    else:
        xml_lines.insert(0, xslt_reference.strip())  # If no declaration, add at the top

    updated_xml = "\n".join(xml_lines)

    # Save the final XML file
    with open(xml_path, "w", encoding="utf-8") as xml_file:
        xml_file.write(updated_xml)

    print(f"✅ Well-formatted XML file created: {xml_path}")
