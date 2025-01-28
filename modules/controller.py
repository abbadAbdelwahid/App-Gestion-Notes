from xml.dom import minidom

import pandas as pd
import xml.etree.ElementTree as ET
import os


def prettify_xml(element):
    """Returns a pretty-printed XML string with indentation and line breaks."""
    rough_string = ET.tostring(element, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")

def convert_excel_module_to_xml(excel_path,output_dir,class_name="GINF2"):

    df = pd.read_excel(excel_path)

    if df.empty:
        print("Error: Excel file is empty. No XML generated.")
        return

    first_col = df.columns[-1]  # First column becomes the last attribute 'code_module'
    other_cols = df.columns[:-2]  # Other columns remain as nested elements

    root = ET.Element("Modules")

    for _, row in df.iterrows():
        # Create Module element first without attributes
        module = ET.Element("Module")

        # Module name as an element (only if it has a value)
        if "ModuleName" in df.columns and pd.notna(row["ModuleName"]):
            module_name = ET.SubElement(module, "ModuleName")
            module_name.text = str(row["ModuleName"])

        # Group elements inside <Elements> if they exist
        elements_container = ET.SubElement(module, "Elements")
        has_elements = False  # To check if <Elements> should be added

        for column in other_cols:
            if "Element" in column:  # Place Element-related fields inside <Elements>
                if pd.notna(row[column]):  # Only add non-empty elements
                    element = ET.SubElement(elements_container, "Element")
                    element.text = str(row[column])
                    has_elements = True  # Mark that at least one element exists
            else:  # Other fields directly under <Module>
                if pd.notna(row[column]):  # Only add non-empty fields
                    element = ET.SubElement(module, column.replace(" ", "_"))
                    element.text = str(row[column])

        # Remove <Elements> container if no elements were added
        if not has_elements:
            module.remove(elements_container)

        # Now add the last attribute: 'code_module'
        module.set("code_module", str(row[first_col]))

        # Append the module to the root
        root.append(module)

    # Format XML for readability
    formatted_xml = prettify_xml(root)

    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Save the XML file
    xml_filename = f"Modules_{class_name}.xml"
    xml_path = os.path.join(output_dir, xml_filename)

    # **Modify formatted XML to insert XSLT reference on the second line**
    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Modules.xsl"?>\n'

    # Split formatted XML into lines
    xml_lines = formatted_xml.split("\n")

    # Insert the XSLT reference **after the first line** (XML declaration)
    if len(xml_lines) > 1:
        xml_lines.insert(1, xslt_reference.strip())  # Insert in second line

    # Join lines back into a single string
    updated_xml = "\n".join(xml_lines)

    # Save the XML file with the correctly positioned XSLT reference
    with open(xml_path, "w", encoding="utf-8") as xml_file:
        xml_file.write(updated_xml)

    print(f"✅ Well-formatted XML file created: {xml_path}")

