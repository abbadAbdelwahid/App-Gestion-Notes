import pandas as pd
import xml.etree.ElementTree as ET
import os
from xml.dom import minidom

def prettify_xml(element):
    """Returns a pretty-printed XML string with indentation and line breaks."""
    rough_string = ET.tostring(element, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")

import os
import pandas as pd
import xml.etree.ElementTree as ET
from xml.dom import minidom

def prettify_xml(elem):
    """Return a pretty-printed XML string."""
    rough_string = ET.tostring(elem, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")

def convert_students_excel_to_xml(excel_path, output_dir, class_name="GINF2"):
    """Convert students' Excel file to XML with XSLT reference."""

    df = pd.read_excel(excel_path, dtype=str)

    if df.empty:
        print("Error: Excel file is empty. No XML generated.")
        return

    first_col = df.columns[0]  # First column (CNE) becomes an attribute
    other_cols = df.columns[1:]  # Other columns remain as nested elements

    root = ET.Element("Students")

    for _, row in df.iterrows():
        # Create Student element with CNE as an attribute
        student = ET.Element("Student", {"CNE": str(row[first_col])})

        # Add only non-empty fields as child elements
        for column in other_cols:
            if pd.notna(row[column]):  # Only add non-empty fields
                element = ET.SubElement(student, column.replace(" ", "_"))
                element.text = str(row[column])

        # Append student to root
        root.append(student)

    # Format XML for readability
    formatted_xml = prettify_xml(root)

    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Save the XML file
    xml_filename = f"Students_{class_name}.xml"
    xml_path = os.path.join(output_dir, xml_filename)

    # **Modify formatted XML to insert XSLT reference on the second line**
    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Students.xsl"?>\n'

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

    print(f"✅ Well-formatted XML file created with XSLT: {xml_path}")


