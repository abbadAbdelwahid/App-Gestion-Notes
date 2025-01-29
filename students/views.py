from django.shortcuts import render

# Create your views here.
from lxml import etree

import os
from django.http import HttpResponse
from .controller import *  # Import function
def validate_xml(xml_path, xsd_path=None, dtd_path=None):

    try:

        with open(xml_path, "rb") as xml_file:
            xml_tree = etree.parse(xml_file)


        if xsd_path:
            with open(xsd_path, "rb") as xsd_file:
                xsd_schema = etree.XMLSchema(etree.parse(xsd_file))
            xsd_schema.validate(xml_tree)
            if not xsd_schema.validate(xml_tree):
                return False, xsd_schema.error_log.last_error


        if dtd_path:
            with open(dtd_path, "rb") as dtd_file:
                dtd = etree.DTD(dtd_file)
            if not dtd.validate(xml_tree):
                return False, dtd.error_log.filter_from_errors()

        return True, "Validation Successful"

    except Exception as e:
        return False, str(e)
def get_students_xml(request):

    excel_file = "Excel_files/Students.xlsx"
    output_folder = "Xml_files/students"
    class_name = "GINF2"
    xml_filename = f"Students_{class_name}.xml"
    xml_path = os.path.join(output_folder, xml_filename)

    xsd_path = "Xml_files/students/Students.xsd"
    dtd_path = "Xml_files/students/Students.dtd"

    convert_students_excel_to_xml(excel_file, output_folder, class_name)
    is_valid, validation_message = validate_xml(xml_path, xsd_path=xsd_path, dtd_path=dtd_path)

    if not is_valid:
        return HttpResponse(f"XML Validation Failed: {validation_message}", status=500)


    if os.path.exists(xml_path):
        with open(xml_path, "r", encoding="utf-8") as file:
            xml_content = file.read().strip()


        xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
        if not xml_content.startswith("<?xml"):
            xml_content = xml_declaration + "\n" + xml_content


        xslt_reference = '<?xml-stylesheet type="text/xsl" href="/static/students/Students.xsl"?>'


        if xslt_reference not in xml_content:
            xml_lines = xml_content.split("\n")
            if xml_lines[0].startswith("<?xml"):
                xml_lines.insert(1, xslt_reference)
            else:
                xml_lines.insert(0, xslt_reference)

            xml_content = "\n".join(xml_lines)


        response = HttpResponse(xml_content, content_type="application/xml")
        return response

    return HttpResponse("Error: XML file not found", status=500)

