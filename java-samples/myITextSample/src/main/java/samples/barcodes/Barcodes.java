package samples.barcodes;

import com.itextpdf.barcodes.BarcodeEAN;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Table;
import com.itextpdf.test.annotations.type.SampleTest;
import org.junit.experimental.categories.Category;

import java.io.File;
import java.io.IOException;

/**
 * Created by bozhin on 6/10/17.
 */
@Category(SampleTest.class)
public class Barcodes implements contracts.PdfSample{

    public static final String DESTINATION = "results/barcodes.pdf";

    public static void main(String[] args) throws IOException {
        File file = new File(DESTINATION);
        file.getParentFile().mkdirs();
        new Barcodes().createPdf(DESTINATION);
    }

    public void createPdf(String destination) throws IOException {

        PdfWriter pdfWriter = new PdfWriter(destination);
        PdfDocument pdfDocument = new PdfDocument(pdfWriter);
        Document document = new Document(pdfDocument);

        Table table = new Table(4);
        for (int i = 0; i < 12; i++) {
            table.addCell(createBarcode(String.format("%08d", i), pdfDocument));
        }

        document.add(table);

        document.close();
    }

    public static Cell createBarcode(String code, PdfDocument pdfDocument) {
        BarcodeEAN barcode = new BarcodeEAN(pdfDocument);
        barcode.setCodeType(BarcodeEAN.EAN8);
        barcode.setCode(code);
        Image image = new Image(barcode.createFormXObject(null, null, pdfDocument));
        Cell cell = new Cell().add(image);
        cell.setPaddings(10, 10, 10, 10);
        return cell;
    }

}
