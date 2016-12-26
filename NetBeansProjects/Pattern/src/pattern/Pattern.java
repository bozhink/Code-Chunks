package pattern;

import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.awt.image.Raster;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author bozhin
 */
public class Pattern {

    static BufferedImage imgIn = null;
    static BufferedImage imgOut = null;
    static Raster img=null;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if (args.length < 2) {
            System.err.println("Ussage: Pattern <in image> <out image>");
            System.exit(1);
        }
        System.out.println("Hello.");

        try {
            imgIn = ImageIO.read(new File(args[0]));
        } catch (IOException e) {
            System.err.println("Cannot read input file: "+args[0]);
            System.exit(2);
        }

        img=imgIn.getData();

        int minx = img.getMinX();
        int miny = img.getMinY();
        int height = img.getHeight();
        int width = img.getWidth();

        int bands = img.getNumBands();

        System.out.println("Min X  = " + minx);
        System.out.println("Min Y  = " + miny);
        System.out.println("Height = " + height);
        System.out.println("Width  = " + width);
        System.out.println("Bands  = " + bands);

        int numDataElements = img.getNumDataElements();
        int transferType = img.getTransferType();

        System.out.println("NumDataElements = " + numDataElements);
        System.out.println("Transfer Type = " + transferType);


        DataBuffer buf = img.getDataBuffer();

        System.out.println("Number of banks = " + buf.getNumBanks());

        try {
            // retrieve image
            imgOut = imgIn;
            File outputfile = new File(args[1]);
            ImageIO.write(imgOut, "png", outputfile);
        } catch (IOException e) {
            System.err.println("Cannot write output file"+args[1]);
            System.exit(3);
        }
    }
}
