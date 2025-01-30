import org.apache.xerces.xni.parser.XMLInputSource;
import org.apache.xerces.xni.parser.XMLParseException;
import org.apache.xerces.impl.xs.XMLSchemaLoader;
import org.apache.xerces.xs.XSModel;
import org.apache.xerces.xs.XSImplementation;
import org.apache.xerces.xs.XSLoader;
import org.apache.xerces.dom.DOMInputImpl;
import org.apache.xerces.jaxp.validation.XMLSchemaFactory;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;

public class XMLValidator {

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java XMLValidator <XML file> <XSD file>");
            System.exit(1);
        }

        String xmlFile = args[0];
        String xsdFile = args[1];

        try {
            // Use Xerces to validate XML against XSD 1.1
            SchemaFactory factory = XMLSchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new File(xsdFile));
            Validator validator = schema.newValidator();
            validator.validate(new StreamSource(new File(xmlFile)));

            System.out.println("✅ XML is valid.");
            System.exit(0);
        } catch (IOException e) {
            System.err.println("❌ I/O Error: " + e.getMessage());
            System.exit(1);
        } catch (Exception e) {
            System.err.println("❌ XML Validation Failed: " + e.getMessage());
            System.exit(1);
        }
    }
}
