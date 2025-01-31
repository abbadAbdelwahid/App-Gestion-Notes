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



def generate_final_results_in_xml_with_names(notes_path, output_path):
    """
    Converts a single Excel file (Note_final_detaillees.xlsx) into an XML file.

    - Uses module codes directly.
    - Modules are those with exactly 6 characters (e.g., GINF31, GINF32, ... GINF46).
    - Submodules are those with exactly 7 characters (e.g., GINF311, GINF312, GINF461).
    - Ensures every student has correct <notes> populated with modules and submodules.
    - Adds 'name' attribute to each module and submodule based on modules_dict.
    """
    # Load the Excel file
    modules_dict = {
        'GINF31': 'Programmation Orientée objet & XML',
        'GINF311': 'Programmation Orientée Objet : java',
        'GINF312': 'xml & applications',

        'GINF32': 'Qualité & approche processus',
        'GINF321': 'Assurance controle qualité (ISO 9001)',
        'GINF322': 'Cycle de vie logiciel et méthodes agiles',
        'GINF323': 'Maitrise et optimisation des processus',

        'GINF33': 'Modélisation orientée objet et IHM',
        'GINF331': 'Modélisation orientée objet UML',
        'GINF332': 'Interaction homme machine',

        'GINF34': 'Bases de données avancées I',
        'GINF341': 'Optimisation et qualité des bases de données',
        'GINF342': 'Administration et sécurité des bases de données',
        'GINF343': 'Base de données NoSQL',

        'GINF35': 'Administration et programmation système',
        'GINF351': 'Administration système',
        'GINF352': 'Programmation système',

        'GINF36': 'Langues et communication 2',
        'GINF361': 'Espagnol II',
        'GINF362': 'Anglais professionnel',
        'GINF363': 'Techniques de communication',

        'GINF41': 'Technologies distribuées',
        'GINF411': 'Introduction à J2EE',
        'GINF412': 'Programmation en C#',

        'GINF42': 'Bases de données avancées II & cloud',
        'GINF421': 'Gestion des données complexes',
        'GINF422': 'Gestion des données distribuées',
        'GINF423': 'Cloud computing et infogérance',

        'GINF43': "Traitement d'image",
        'GINF431': "Traitement de l'image",
        'GINF432': 'Vision numérique',
        'GINF433': 'Processus stochastique',

        'GINF44': 'Programmation déclarative et TAV',
        'GINF441': 'Programmation déclarative',
        'GINF442': 'Technique algorithmique avancée',

        'GINF45': 'Sécurité et cryptographie',
        'GINF451': 'Sécurité des systèmes',
        'GINF452': 'Cryptographie',

        'GINF46': "Management de l'entreprise 2",
        'GINF461': 'Économie & comptabilité 2',
        'GINF462': 'Projets collectifs & stages',
        'GINF463': 'Management de projet'
    }
    notes_df = pd.read_excel(notes_path)

    # Create the root XML element
    root = ET.Element("resultats")

    # Process each student's notes
    for _, row in notes_df.iterrows():
        student = ET.SubElement(root, "student", CNE=str(row['CNE']))
        ET.SubElement(student, "FirstName").text = str(row['FirstName'])
        ET.SubElement(student, "LastName").text = str(row['LastName'])

        notes = ET.SubElement(student, "notes")
        module_elements = {}  # Dictionary to store created module elements

        # Process each column after CNE, FirstName, LastName
        for col in notes_df.columns[3:]:
            code = str(col).strip()
            note = str(row[col]) if not pd.isna(row[col]) else "N/A"
            module_name = modules_dict.get(code, "Unknown")  # Get name from dictionary

            if len(code) == 7:  # Sub-module (e.g., GINF311, GINF421)
                parent_code = code[:6]  # Extract parent module code (e.g., GINF31, GINF42)
                if parent_code not in module_elements:
                    # Create the module first if it doesn't exist
                    module_elements[parent_code] = ET.SubElement(
                        notes, "module", code=parent_code, name=modules_dict.get(parent_code, "Unknown"), note="N/A"
                    )
                # Add submodule inside the corresponding module
                ET.SubElement(module_elements[parent_code], "sous_module", code=code, name=module_name, note=note)

            elif len(code) == 6:  # Main module (e.g., GINF31, GINF32, ..., GINF46)
                module_elements[code] = ET.SubElement(notes, "module", code=code, name=module_name, note=note)

    # Generate the pretty XML string
    pretty_xml_str = prettify_xml(root)
    pretty_xml_str = pretty_xml_str.replace('<?xml version="1.0" ?>', '<?xml version="1.0" encoding="utf-8"?>', 1)
    # Write to the output file
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(pretty_xml_str)





def generate_final_results_in_xml_with_moyenne(notes_path, output_path):
    """
    Converts a single Excel file (Note_final_detaillees.xlsx) into an XML file.

    - Uses module codes directly.
    - Modules are those with exactly 6 characters (e.g., GINF31, GINF32, ... GINF46).
    - Submodules are those with exactly 7 characters (e.g., GINF311, GINF312, GINF461).
    - Ensures every student has correct <notes> populated with modules and submodules.
    - Adds 'name' attribute to each module and submodule based on modules_dict.
    - Calculates and adds 'moyenne' for each student based on module notes.
    """
    # Load the Excel file
    notes_df = pd.read_excel(notes_path)

    # Module dictionary (mapping codes to names)
    modules_dict = {
        'GINF31': 'Programmation Orientée objet & XML',
        'GINF311': 'Programmation Orientée Objet : java',
        'GINF312': 'xml & applications',

        'GINF32': 'Qualité & approche processus',
        'GINF321': 'Assurance controle qualité (ISO 9001)',
        'GINF322': 'Cycle de vie logiciel et méthodes agiles',
        'GINF323': 'Maitrise et optimisation des processus',

        'GINF33': 'Modélisation orientée objet et IHM',
        'GINF331': 'Modélisation orientée objet UML',
        'GINF332': 'Interaction homme machine',

        'GINF34': 'Bases de données avancées I',
        'GINF341': 'Optimisation et qualité des bases de données',
        'GINF342': 'Administration et sécurité des bases de données',
        'GINF343': 'Base de données NoSQL',

        'GINF35': 'Administration et programmation système',
        'GINF351': 'Administration système',
        'GINF352': 'Programmation système',

        'GINF36': 'Langues et communication 2',
        'GINF361': 'Espagnol II',
        'GINF362': 'Anglais professionnel',
        'GINF363': 'Techniques de communication',

        'GINF41': 'Technologies distribuées',
        'GINF411': 'Introduction à J2EE',
        'GINF412': 'Programmation en C#',

        'GINF42': 'Bases de données avancées II & cloud',
        'GINF421': 'Gestion des données complexes',
        'GINF422': 'Gestion des données distribuées',
        'GINF423': 'Cloud computing et infogérance',

        'GINF43': "Traitement d'image",
        'GINF431': "Traitement de l'image",
        'GINF432': 'Vision numérique',
        'GINF433': 'Processus stochastique',

        'GINF44': 'Programmation déclarative et TAV',
        'GINF441': 'Programmation déclarative',
        'GINF442': 'Technique algorithmique avancée',

        'GINF45': 'Sécurité et cryptographie',
        'GINF451': 'Sécurité des systèmes',
        'GINF452': 'Cryptographie',

        'GINF46': "Management de l'entreprise 2",
        'GINF461': 'Économie & comptabilité 2',
        'GINF462': 'Projets collectifs & stages',
        'GINF463': 'Management de projet'
    }

    # Create the root XML element
    root = ET.Element("resultats")

    # Process each student's notes
    for _, row in notes_df.iterrows():
        student = ET.SubElement(root, "student", CNE=str(row['CNE']))
        ET.SubElement(student, "FirstName").text = str(row['FirstName'])
        ET.SubElement(student, "LastName").text = str(row['LastName'])

        notes = ET.SubElement(student, "notes")
        module_elements = {}  # Dictionary to store created module elements
        module_sum = 0  # Sum of module notes
        module_count = 0  # Count of modules

        # Process each column after CNE, FirstName, LastName
        for col in notes_df.columns[3:]:
            code = str(col).strip()
            note = row[col] if not pd.isna(row[col]) else None
            module_name = modules_dict.get(code, "Unknown")  # Get name from dictionary

            if len(code) == 7:  # Sub-module (e.g., GINF311, GINF421)
                parent_code = code[:6]  # Extract parent module code (e.g., GINF31, GINF42)
                if parent_code not in module_elements:
                    # Create the module first if it doesn't exist
                    module_elements[parent_code] = ET.SubElement(
                        notes, "module", code=parent_code, name=modules_dict.get(parent_code, "Unknown"), note="N/A"
                    )
                # Add submodule inside the corresponding module
                ET.SubElement(module_elements[parent_code], "sous_module", code=code, name=module_name, note=str(note) if note is not None else "N/A")

            elif len(code) == 6:  # Main module (e.g., GINF31, GINF32, ..., GINF46)
                module_elements[code] = ET.SubElement(notes, "module", code=code, name=module_name, note=str(note) if note is not None else "N/A")
                if note is not None:  # Add to sum for moyenne calculation
                    module_sum += note
                    module_count += 1

        # Calculate moyenne
        moyenne_value = round(module_sum / module_count, 2) if module_count > 0 else "N/A"
        ET.SubElement(student, "moyenne").text = str(moyenne_value)

    # Generate the pretty XML string
    pretty_xml_str = prettify_xml(root)
    pretty_xml_str = pretty_xml_str.replace('<?xml version="1.0" ?>', '<?xml version="1.0" encoding="utf-8"?>', 1)

    # Write to the output file
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(pretty_xml_str)



generate_final_results_in_xml_with_moyenne("../Excel_files/Note_final_detaillees.xlsx","../Xml_files/notes/resultats.xml")