

import os
import subprocess
import xml.etree.ElementTree as ET
try:
    from django.conf import settings

    PROJECT_ROOT = settings.BASE_DIR
except:
    PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))


def generate_releve_pdf(xml,fo,pdf_filename):
    print(f"📂 Using project root: {PROJECT_ROOT}")

    fop_home = os.path.join(PROJECT_ROOT, "fop")
    xml_file = os.path.join(PROJECT_ROOT, "Xml_files", "releve_note", xml)
    xslt_file = os.path.join(PROJECT_ROOT, "Xml_files", "releve_note", fo)
    pdf_output_dir = os.path.join(PROJECT_ROOT, "Xml_files", "releve_note")
    pdf_file = os.path.join(pdf_output_dir, pdf_filename)

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


def generate_student_card(xml_path, xslfo_path, output_dir, fop_path="fop"):
    """
    Génère un fichier PDF dans un répertoire spécifique.

    :param xml_path: Chemin du fichier XML contenant les données de l'étudiant.
    :param xslfo_path: Chemin du fichier XSL-FO pour la mise en page.
    :param output_dir: Répertoire où enregistrer le PDF.
    :param fop_path: Chemin du dossier contenant fop.bat (défaut = "fop").
    :return: Chemin absolu du fichier PDF généré.
    """
    # Vérifier si le répertoire de sortie existe, sinon le créer
    os.makedirs(output_dir, exist_ok=True)

    # Construire le chemin du fichier de sortie
    output_pdf = os.path.join(output_dir, "Student_Card.pdf")

    # Construire le chemin de fop.bat
    fop_path = os.path.abspath("../fop")
    fop_executable = os.path.join(fop_path, "fop.bat")

    # Vérifier si fop.bat existe
    if not os.path.exists(fop_executable):
        raise FileNotFoundError(f"Le fichier {fop_executable} n'existe pas. Vérifiez le chemin.")

    # Construire la commande pour exécuter FOP
    command = [fop_executable, "-xml", xml_path, "-xsl", xslfo_path, "-pdf", output_pdf]

    try:
        # Exécuter la commande pour générer le PDF
        subprocess.run(command, check=True, shell=True)
        print(f"✅ PDF généré avec succès : {output_pdf}")
        return os.path.abspath(output_pdf)

    except subprocess.CalledProcessError as e:
        print(f"❌ Erreur lors de la génération du PDF : {e}")
        return None


# 📌 Exemple d'utilisation
output_directory = "result"  # Dossier où stocker les PDFs

generate_student_card(
    xml_path="students/StudentExtracted.xml",
    xslfo_path="students/student_card.fo",
    output_dir=output_directory,  # Spécifier le répertoire de sortie
    fop_path="fop"
)


def clean_xml_content(xml_str):
    """Removes unwanted BOM characters and ensures clean XML."""
    return xml_str.lstrip("\ufeff").strip()

def find_student_by_cne(CNE):
    """Runs an XQuery script inline in BaseX to extract a student by CNE and saves it to an XML file."""

    # Get the absolute path to the project root
    project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

    # Define BaseX executable path
    basex_path = os.path.join(project_root, "BaseX", "bin", "basex.bat")  # Windows
    if not os.path.exists(basex_path):
        basex_path = os.path.join(project_root, "BaseX", "bin", "basex")  # Linux/macOS

    # Ensure BaseX executable exists
    if not os.path.exists(basex_path):
        print(f"❌ ERROR: BaseX executable not found at {basex_path}")
        return

    print(f"🔍 Running BaseX from: {basex_path}")

    # Paths for XML file
    xml_file = os.path.join(project_root, "Xml_files", "notes", "resultats.xml").replace("\\", "/")
    output_dir = os.path.join(project_root, "Xml_files", "releve_note")

    # Ensure XML file exists
    if not os.path.exists(xml_file):
        print(f"❌ ERROR: File not found: {xml_file}")
        return

    # Ensure output directory exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # XQuery formatted as a single-line string (important for Windows CMD)
    xquery_inline = (
        'declare option output:method "xml"; '
        'declare option output:encoding "UTF-8"; '
        f'for $student in doc("{xml_file}")//student[@CNE="{CNE}"] return $student'
    )

    # Construct BaseX command
    command = [basex_path, "-q", xquery_inline]

    print(f"🔍 Running command: {' '.join(command)}")

    # Run BaseX XQuery
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, encoding="utf-8")

    if result.stderr:
        print(f"❌ ERROR: {result.stderr}")
        return

    student_xml = clean_xml_content(result.stdout.strip())

    if not student_xml:
        print(f"⚠️ No student found with CNE: {CNE}")
        return

    # Parse XML to extract FirstName & LastName
    try:
        student_tree = ET.ElementTree(ET.fromstring(student_xml))
        root = student_tree.getroot()

        first_name = root.find("FirstName").text if root.find("FirstName") is not None else "Unknown"
        last_name = root.find("LastName").text if root.find("LastName") is not None else "Unknown"

        # Generate output file path
        output_filename = f"releve_note_{first_name}_{last_name}.xml"
        output_path = os.path.join(output_dir, output_filename)

        # Save extracted XML with proper UTF-8 encoding
        with open(output_path, "w", encoding="utf-8") as file:
            file.write(student_xml)

        print(f"✅ Student XML saved at: {output_path}")
        return output_filename

    except ET.ParseError as e:
        print(f"❌ XML Parsing Error: {e}")
        return

# Example usage
# find_student_by_cne("21010395")

# generate_releve_pdf()
# generate_releve_pdf("releve_note_ABDELOUAHED_ABBAD.xml","Releve_de_Notes.xsl")
