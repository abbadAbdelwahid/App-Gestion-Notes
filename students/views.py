from django.shortcuts import render

# Create your views here.


import os
from django.http import HttpResponse
from .controller import *  # Import function

def get_students_xml(request):
    """Generate XML, inject correct XSLT reference, and return as HTTP response."""

    # Paths
    excel_file = "Excel_files/Students.xlsx"
    output_folder = "Xml_files/students"
    class_name = "GINF2"
    xml_filename = f"Students_{class_name}.xml"
    xml_path = os.path.join(output_folder, xml_filename)

    # Generate XML dynamically
    convert_students_excel_to_xml(excel_file, output_folder, class_name)

    # Read XML and inject the correct XSLT reference
    if os.path.exists(xml_path):
        with open(xml_path, "r", encoding="utf-8") as file:
            xml_content = file.read().strip()  # Remove extra spaces

        # Ensure XML declaration is at the top
        xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
        if not xml_content.startswith("<?xml"):
            xml_content = xml_declaration + "\n" + xml_content

        # **FORCE** XSLT reference after XML declaration
        xslt_reference = '<?xml-stylesheet type="text/xsl" href="/static/students/Students.xsl"?>'

        # If XSLT reference is missing, add it right after XML declaration
        if xslt_reference not in xml_content:
            xml_lines = xml_content.split("\n")
            if xml_lines[0].startswith("<?xml"):
                xml_lines.insert(1, xslt_reference)  # Insert **right after** XML declaration
            else:
                xml_lines.insert(0, xslt_reference)  # Insert at the top if no XML declaration

            xml_content = "\n".join(xml_lines)

        # Return XML response
        response = HttpResponse(xml_content, content_type="application/xml")
        return response

    return HttpResponse("Error: XML file not found", status=500)

