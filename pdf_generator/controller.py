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


import subprocess
import os

import subprocess
import os


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





