package tutorial.chaper01;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.test.annotations.WrapToTest;

import java.io.File;
import java.io.IOException;

/**
 * Created by bozhin on 6/10/17.
 * This example is part of the iText 7 tutorial.
 * Simple Hello World example.
 */
@WrapToTest
public class C01E01_HelloWorld implements contracts.PdfSample {

    public static final String DESTINATION = "results/chapter01/hello_world.pdf";

    public static void main(String[] args) throws IOException {
        File file = new File(DESTINATION);
        file.getParentFile().mkdirs();
        new C01E01_HelloWorld().createPdf(DESTINATION);
    }

    public void createPdf(String destination) throws IOException {
        // Initialize PDF writer
        PdfWriter writer = new PdfWriter(destination);

        // Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);

        // Initialize document
        Document document = new Document(pdf);

        // Add paragraph to the document
        document.add(new Paragraph("Hello World!"));

        // Close document
        document.close();

        if (!pdf.isClosed()) {
            pdf.close();
        }
    }
}
