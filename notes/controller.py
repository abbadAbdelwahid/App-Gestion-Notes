import pandas as pd
import xml.etree.ElementTree as ET
import os
from xml.dom import minidom


def prettify_xml(element):
    """Returns a pretty-printed XML string with indentation and line breaks."""
    rough_string = ET.tostring(element, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")


def convert_notes_to_xml(excel_path, output_path, module):
    """Converts notes from an Excel file to an XML file for a given module with a structured format."""

    # Load Excel file
    df = pd.read_excel(excel_path, dtype={'CNE': str})  # Ensure CNE remains a string

    # Check if the module exists in the Excel file
    if module not in df.columns:
        print(f"❌ Error: Module '{module}' not found in the Excel file.")
        return

    # Filter relevant columns
    required_columns = ['CNE', 'FirstName', 'LastName', module]
    df = df[required_columns].dropna(subset=[module])  # Remove students with no note

    # Compute module average (moyenne)
    moyenne = df[module].astype(float).mean() if not df.empty else 0.0

    # Create XML root <Notes> with module_code attribute
    root = ET.Element("Notes", module_code=module)

    # Create <Students> element
    students_element = ET.SubElement(root, "Students")

    # Add student data to XML
    for _, row in df.iterrows():
        student_element = ET.SubElement(students_element, "Student")
        ET.SubElement(student_element, "CNE").text = row["CNE"]
        ET.SubElement(student_element, "FirstName").text = row["FirstName"]
        ET.SubElement(student_element, "LastName").text = row["LastName"]
        ET.SubElement(student_element, "ModuleNote").text = str(row[module])

    # Add <Moyenne> element
    ET.SubElement(root, "Moyenne").text = str(round(moyenne, 2))

    # Convert XML structure to a formatted string
    formatted_xml = prettify_xml(root)

    # Ensure the output directory exists
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Notes_avant_ratt.xsl"?>\n'
    xml_lines = formatted_xml.split("\n")

    if xml_lines[0].startswith('<?xml'):  # Ensure the XML declaration is first
        xml_lines.insert(1, xslt_reference.strip())  # Insert in the second line
    else:
        xml_lines.insert(0, xslt_reference.strip())  # If no declaration, add at the top

    updated_xml = "\n".join(xml_lines)

    # Save the final XML file
    with open(output_path, "w", encoding="utf-8") as xml_file:
        xml_file.write(updated_xml)

    print(f"✅ Well-formatted XML file created: {output_path}")






def convert_resulting_notes_to_xml(excel_path, output_path, module):
    """Converts resulting notes after rattrapage from an Excel file to an XML file, including validation results."""

    # Load Excel file
    df = pd.read_excel(excel_path, dtype={'CNE': str})  # Ensure CNE remains a string

    # Check if the module exists in the Excel file
    if module not in df.columns:
        print(f"❌ Error: Module '{module}' not found in the Excel file.")
        return

    # Filter relevant columns
    required_columns = ['CNE', 'FirstName', 'LastName', module]
    df = df[required_columns].dropna(subset=[module])  # Remove students with no note

    # Compute module average (moyenne)
    moyenne = df[module].astype(float).mean() if not df.empty else 0.0

    # Create XML root <Notes> with module_code attribute
    root = ET.Element("Notes", module_code=module)

    # Create <Students> element
    students_element = ET.SubElement(root, "Students")

    # Add student data to XML
    for _, row in df.iterrows():
        # Determine validation result
        result = "V" if float(row[module]) >= 12 else "NV"

        # Create <Student> element with `Result` as an attribute
        student_element = ET.SubElement(students_element, "Student", Result=result)
        ET.SubElement(student_element, "CNE").text = row["CNE"]
        ET.SubElement(student_element, "FirstName").text = row["FirstName"]
        ET.SubElement(student_element, "LastName").text = row["LastName"]
        ET.SubElement(student_element, "ModuleNote").text = str(row[module])

    # Add <Moyenne> element
    ET.SubElement(root, "Moyenne").text = str(round(moyenne, 2))

    # Convert XML structure to a formatted string
    formatted_xml = prettify_xml(root)

    # Remove `<?xml version="1.0"?>` and replace it with `<?xml version="1.1"?>`
    formatted_xml = formatted_xml.replace('<?xml version="1.0" ?>', '<?xml version="1.1" ?>', 1)

    # Ensure the output directory exists
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    # Insert XSLT reference **only after XML declaration**
    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Notes_apres_ratt.xsl"?>\n'
    xml_lines = formatted_xml.split("\n")

    if xml_lines[0].startswith('<?xml'):  # Ensure the XML declaration is first
        xml_lines.insert(1, xslt_reference.strip())  # Insert in the second line
    else:
        xml_lines.insert(0, xslt_reference.strip())  # If no declaration, add at the top

    updated_xml = "\n".join(xml_lines)

    # Save the final XML file
    with open(output_path, "w", encoding="utf-8") as xml_file:
        xml_file.write(updated_xml)

    print(f"✅ Well-formatted XML file created: {output_path}")



#
# def generate_final_results_in_xml(notes_path, output_path):
#     """
#     Converts a single Excel file (Note_final_detaillees.xlsx) into an XML file.
#
#     - Uses module codes directly.
#     - Modules are those with two digits at the end.
#     - Submodules are those with three digits at the end.
#     """
#     # Load the Excel file
#     notes_df = pd.read_excel(notes_path)
#
#     # Create the root XML element
#     root = ET.Element("resultats")
#
#     # Process each student's notes
#     for _, row in notes_df.iterrows():
#         student = ET.SubElement(root, "student", CNE=str(row['CNE']))
#         ET.SubElement(student, "FirstName").text = str(row['FirstName'])
#         ET.SubElement(student, "LastName").text = str(row['LastName'])
#
#         notes = ET.SubElement(student, "notes")
#         module_data = {}
#
#         # Process each column after CNE, FirstName, LastName
#         for col in notes_df.columns[3:]:
#             code = str(col).strip()
#             note = str(row[col]) if not pd.isna(row[col]) else "N/A"
#
#             if len(code) == 6:  # Sub-module (e.g., GINF311)
#                 parent_code = code[:5]  # Extract parent module code (e.g., GINF31)
#                 if parent_code in module_data:
#                     module_element = module_data[parent_code]
#                     ET.SubElement(module_element, "submodule", code=code, note=note)
#
#             elif len(code) == 5:  # Main module (e.g., GINF31)
#                 module_element = ET.SubElement(notes, "module", code=code, note=note)
#                 module_data[code] = module_element  # Store reference for sub-modules
#
#     # Generate the pretty XML string
#     pretty_xml_str = prettify_xml(root)
#
#     # Write to the output file
#     with open(output_path, "w", encoding="utf-8") as f:
#         f.write(pretty_xml_str)
#
#
#
# generate_final_results_in_xml("../Excel_files/Note_final_detaillees.xlsx","../Xml_files/notes/resultats.xml")