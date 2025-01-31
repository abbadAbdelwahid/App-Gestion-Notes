from pathlib import Path

from django.shortcuts import render
from django.http import HttpResponse
from .controller import *  # Import function
from django.http import FileResponse


def generate_relevee_note(request, CNE):
    output_filename = find_student_by_cne(CNE)
    pdf_filename = str(Path(output_filename).with_suffix(".pdf"))

    # Generate the PDF file
    generate_releve_pdf(output_filename, "Releve_de_Notes.xsl", pdf_filename)

    # Open the PDF and return it as a response
    pdf_path = os.path.join(settings.BASE_DIR, "Xml_files", "releve_note", pdf_filename)
    response = FileResponse(open(pdf_path, "rb"), as_attachment=True, filename=pdf_filename)

    return response
