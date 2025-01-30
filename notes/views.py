import os
from django.http import HttpResponse
from .controller import *  # Import function

import os
from lxml import etree
# Create your views here.


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

def validate_xml_DTD(xml_path, dtd_path=None):
    try:
        with open(xml_path, "rb") as xml_file:
            xml_tree = etree.parse(xml_file)

        if dtd_path:
            with open(dtd_path, "rb") as dtd_file:
                dtd = etree.DTD(dtd_file)
            if not dtd.validate(xml_tree):
                return False, dtd.error_log.filter_from_errors()

        return True, "Validation Successful"

    except Exception as e:
        return False, str(e)


def get_notes_before_ratt(request,module_code):
    excel_path = "Excel_files/Notes.xlsx"
    output_path = f"Xml_files/notes/avant_ratt/Notes_Module_{module_code}.xml"


    xsd_path = "Xml_files/notes/avant_ratt/Notes.xsd"
    dtd_path = "Xml_files/notes/avant_ratt/Notes.dtd"


    convert_notes_to_xml(excel_path, output_path, module_code)


    is_valid, validation_message = validate_xml(output_path, xsd_path=xsd_path, dtd_path=dtd_path)

    if not is_valid:
        return HttpResponse(f"XML Validation Failed: {validation_message}", status=500)


    if os.path.exists(output_path):
        with open(output_path, "r", encoding="utf-8") as file:
            xml_content = file.read().strip()


        xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
        if not xml_content.startswith("<?xml"):
            xml_content = xml_declaration + "\n" + xml_content


        xslt_reference = '<?xml-stylesheet type="text/xsl" href="/static/notes/avant_ratt/Notes_avant_ratt.xsl"?>'
        if xslt_reference not in xml_content:
            xml_lines = xml_content.split("\n")
            xml_lines.insert(1, xslt_reference)  # Insert in second line
            xml_content = "\n".join(xml_lines)


        response = HttpResponse(xml_content, content_type="application/xml")
        return response

    return HttpResponse("Error: XML file not found", status=500)


def get_notes_after_ratt(request, module_code):


    excel_path = "Excel_files/Notes_final.xlsx"
    output_path = f"Xml_files/notes/apres_ratt/Notes_Module_{module_code}.xml"

    dtd_path = "Xml_files/notes/apres_ratt/Notes_Ing.dtd"

    convert_resulting_notes_to_xml(excel_path, output_path, module_code)

    is_valid, validation_message = validate_xml_DTD(output_path, dtd_path=dtd_path)

    if not is_valid:
        return HttpResponse(f" XML Validation Failed: {validation_message}", status=500)

    if os.path.exists(output_path):
        with open(output_path, "r", encoding="utf-8") as file:
            xml_content = file.read().strip()

        xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
        if not xml_content.startswith("<?xml"):
            xml_content = xml_declaration + "\n" + xml_content

        xslt_reference = '<?xml-stylesheet type="text/xsl" href="/static/notes/apres_ratt/Notes_apres_ratt.xsl"?>'
        if xslt_reference not in xml_content:
            xml_lines = xml_content.split("\n")
            xml_lines.insert(1, xslt_reference)  # Insert in second line
            xml_content = "\n".join(xml_lines)

        response = HttpResponse(xml_content, content_type="application/xml")
        return response

    return HttpResponse("Error: XML file not found", status=500)

