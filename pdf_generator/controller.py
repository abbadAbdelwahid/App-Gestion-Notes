import os
import subprocess

try:
    from django.conf import settings

    PROJECT_ROOT = settings.BASE_DIR
except:
    PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))


def generate_releve_pdf():
    print(f"📂 Using project root: {PROJECT_ROOT}")

    fop_home = os.path.join(PROJECT_ROOT, "fop")
    xml_file = os.path.join(PROJECT_ROOT, "Xml_files", "releve_note", "Notes_GINF2.xml")
    xslt_file = os.path.join(PROJECT_ROOT, "Xml_files", "releve_note", "Notes_apres_ratt.xsl")
    pdf_output_dir = os.path.join(PROJECT_ROOT, "pdf_generator", "result")
    pdf_file = os.path.join(pdf_output_dir, "releve_notes.pdf")

    os.makedirs(pdf_output_dir, exist_ok=True)

    # Ensure Apache FOP exists
    if not os.path.exists(fop_home):
        print(f"❌ ERROR: Apache FOP not found at {fop_home}")
        return

    # Ensure required XML and XSLT files exist
    for file in [xml_file, xslt_file]:
        if not os.path.exists(file):
            print(f"❌ ERROR: Missing file: {file}")
            return

    # Build classpath with BOTH `lib/` and `build/`
    lib_dir = os.path.join(fop_home, "lib")
    build_dir = os.path.join(fop_home, "build")

    jar_files = []

    # Add JARs from lib/
    if os.path.exists(lib_dir):
        jar_files += [os.path.join(lib_dir, jar) for jar in os.listdir(lib_dir) if jar.endswith(".jar")]

    # Add JARs from build/
    if os.path.exists(build_dir):
        jar_files += [os.path.join(build_dir, jar) for jar in os.listdir(build_dir) if jar.endswith(".jar")]

    classpath = ";".join(jar_files)  # Use `;` for Windows, `:` for Linux/macOS

    # Apache FOP Command
    fop_command = f'java -cp "{classpath}" org.apache.fop.cli.Main -xml "{xml_file}" -xsl "{xslt_file}" -pdf "{pdf_file}"'

    try:
        subprocess.run(fop_command, shell=True, check=True)
        print(f"✅ PDF successfully generated: {pdf_file}")
    except subprocess.CalledProcessError as e:
        print(f"❌ ERROR: PDF generation failed: {e}")

    return pdf_file


generate_releve_pdf()
