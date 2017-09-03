package samples.xmlworker;

import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.test.annotations.WrapToTest;

import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by bozhin on 6/10/17.
 */
@WrapToTest
public class S01 implements contracts.PdfSample {

    public static final String DESTINATION = "results/loremipsum.pdf";

    public void createPdf(String destination) throws IOException {

        try {

            FileOutputStream outputStream = new FileOutputStream(destination);

            WriterProperties writerProperties = new WriterProperties();
            writerProperties.addXmpMetadata();

            PdfWriter pdfWriter = new PdfWriter(outputStream, writerProperties);

            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            pdfDocument.getCatalog().setLang(new PdfString("en-US"));

            // Set the document to be tagged
            pdfDocument.setTagged();
            pdfDocument.getCatalog().setViewerPreferences(new PdfViewerPreferences().setDisplayDocTitle(true));

            // Set meta tags
            PdfDocumentInfo pdfDocumentInfo = pdfDocument.getDocumentInfo();
            pdfDocumentInfo.setAuthor("Samuel Huylebroeck");
            pdfDocumentInfo.addCreationDate();
            pdfDocumentInfo.getProducer();
            pdfDocumentInfo.setCreator("iText Software");
            pdfDocumentInfo.setKeywords("example, accessibility");
            pdfDocumentInfo.setSubject("PDF accessibility");
            // Title is derived from html

            // pdf conversion
            FontProvider fontProvider = new FontProvider();
            fontProvider.addStandardPdfFonts();
            fontProvider.addDirectory("");

            // TODO: reference is needed

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
