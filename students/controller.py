import os
import pandas as pd
import xml.etree.ElementTree as ET
from xml.dom import minidom

from django.http import HttpResponse


def prettify_xml(elem):

    rough_string = ET.tostring(elem, encoding="utf-8")
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")


def convert_students_excel_to_xml(excel_path, output_dir, class_name="GINF2"):

    df = pd.read_excel(excel_path, dtype=str)

    if df.empty:
        print("Error: Excel file is empty. No XML generated.")
        return

    first_col = df.columns[0]
    other_cols = df.columns[1:]

    root = ET.Element("Students")

    for _, row in df.iterrows():

        cne = str(row[first_col]) if pd.notna(row[first_col]) else ""

        student = ET.Element("Student", {"CNE": cne})


        for column in other_cols:
            value = str(row[column]).strip() if pd.notna(row[column]) else ""
            element = ET.SubElement(student, column.replace(" ", "_"))
            element.text = value


        root.append(student)

    formatted_xml = prettify_xml(root)


    os.makedirs(output_dir, exist_ok=True)


    xml_filename = f"Students_{class_name}.xml"
    xml_path = os.path.join(output_dir, xml_filename)


    xslt_reference = '<?xml-stylesheet type="text/xsl" href="Students.xsl"?>\n'
    xml_lines = formatted_xml.split("\n")

    if len(xml_lines) > 1:
        xml_lines.insert(1, xslt_reference.strip())

    updated_xml = "\n".join(xml_lines)


    with open(xml_path, "w", encoding="utf-8") as xml_file:
        xml_file.write(updated_xml)

    print(f"✅ Well-formatted XML file created with XSLT: {xml_path}")


def generate_tp_groups(filePath):
    tree = ET.parse(filePath)
    root = tree.getroot()

    students = root.findall("Student")
    total_students = len(students)
    group_size = 24
    num_groups = total_students // group_size

    tp_root = ET.Element("TPGroups")

    for i in range(num_groups):
        group = ET.SubElement(tp_root, "TPGroup")
        group_number = ET.SubElement(group, "GroupNumber")
        group_number.text = str(i + 1)

        for student in students[i * group_size: (i + 1) * group_size]:
            group.append(student)

    tree = ET.ElementTree(tp_root)
    tree.write("../Xml_files/students/TPGroups.xml", encoding="utf-8", xml_declaration=True)


generate_tp_groups("../Xml_files/students/Students_GINF2.xml")