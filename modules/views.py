import os
from django.http import HttpResponse
from .controller import *  # Import function

# Create your views here.
from lxml import etree


def validate_xml(xml_path, xsd_path=None, dtd_path=None):
    """
    Validates an XML file against an XSD or DTD.

    :param xml_path: Path to the XML file.
    :param xsd_path: Path to the XSD file (optional).
    :param dtd_path: Path to the DTD file (optional).
    :return: (bool, error_message) - True if valid, False if invalid.
    """
    try:
        # Load XML
        with open(xml_path, "rb") as xml_file:
            xml_tree = etree.parse(xml_file)

        # Validate against XSD
        if xsd_path:
            with open(xsd_path, "rb") as xsd_file:
                xsd_schema = etree.XMLSchema(etree.parse(xsd_file))
            xsd_schema.validate(xml_tree)
            if not xsd_schema.validate(xml_tree):
                return False, xsd_schema.error_log.last_error

        # Validate against DTD
        if dtd_path:
            with open(dtd_path, "rb") as dtd_file:
                dtd = etree.DTD(dtd_file)
            if not dtd.validate(xml_tree):
                return False, dtd.error_log.filter_from_errors()  # Return validation error

        return True, "Validation Successful"  # XML is valid ✅

    except Exception as e:
        return False, str(e)  # Return validation failure


def get_modules_xml(request):
    """Generate XML, validate it, inject XSLT, and return as HTTP response."""

    # Paths
    excel_file = "Excel_files/Modules.xlsx"
    output_folder = "Xml_files/modules"
    class_name = "GINF2"
    xml_filename = f"Modules_{class_name}.xml"
    xml_path = os.path.join(output_folder, xml_filename)

    # Validation files (replace with correct paths)
    xsd_path = "Xml_files/modules/Modules.xsd"  # XSD Schema file
    dtd_path = "Xml_files/modules/Modules.dtd"  # DTD file (if applicable)

    # Generate XML dynamically
    convert_excel_module_to_xml(excel_file, output_folder, class_name)

    # Validate XML before serving it
    is_valid, validation_message = validate_xml(xml_path, xsd_path=xsd_path, dtd_path=dtd_path)

    if not is_valid:
        return HttpResponse(f"❌ XML Validation Failed: {validation_message}", status=500)

    # Read XML and inject the correct XSLT reference
    if os.path.exists(xml_path):
        with open(xml_path, "r", encoding="utf-8") as file:
            xml_content = file.read().strip()

        # Ensure XML declaration is at the top
        xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
        if not xml_content.startswith("<?xml"):
            xml_content = xml_declaration + "\n" + xml_content

        # Inject XSLT reference after XML declaration
        xslt_reference = '<?xml-stylesheet type="text/xsl" href="/static/modules/Modules.xsl"?>'
        if xslt_reference not in xml_content:
            xml_lines = xml_content.split("\n")
            xml_lines.insert(1, xslt_reference)  # Insert in second line
            xml_content = "\n".join(xml_lines)

        # Return XML response
        response = HttpResponse(xml_content, content_type="application/xml")
        return response

    return HttpResponse("Error: XML file not found", status=500)
