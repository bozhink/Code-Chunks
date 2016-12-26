package btwrecursiveavalanche;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author Bozhin Karaivanov
 * Sep 29, 2012
 */
public class ImageExporter implements Runnable {

    static Color color[] = {
        Color.white,
        Color.cyan, 
        Color.blue,
        Color.green, 
        Color.black,
        Color.yellow,
        Color.orange,
        Color.red,
        Color.magenta
    };
    
    public int counter;
    public Thread thread;
    
    private String fileName;
    private int matrix[][];
    private int nx, ny;
    private int width, height;
    private BufferedImage bi;
    private Graphics2D g;
    
    
    public ImageExporter(int nx, int ny, int matrix[][]) {
        this.nx = nx;
        this.ny = ny;
        this.matrix = matrix;
        width = 600;
        height = 600;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        thread = new Thread(this);
        thread.start();
    }
    
    public ImageExporter(int nx, int ny, int matrix[][], int counter) {
        this.counter = counter;
        this.nx = nx;
        this.ny = ny;
        this.matrix = matrix;
        width = 600;
        height = 600;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        thread = new Thread(this, "ImageExporter #"+counter);
        thread.start();
    }
    
    public ImageExporter(int nx, int ny, int matrix[][], int width, int height) {
        this.nx = nx;
        this.ny = ny;
        this.matrix = matrix;
        this.width = width;
        this.height = height;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        thread = new Thread(this);
        thread.start();
    }
    
    public ImageExporter(int nx, int ny, int matrix[][], int width, int height, int counter) {
        this.counter = counter;
        this.nx = nx;
        this.ny = ny;
        this.matrix = matrix;
        this.width = width;
        this.height = height;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        thread = new Thread(this, "ImageExporter #"+counter);
        thread.start();
    }
    
    public void Export() {
        fileName = String.format("btwav-%1$08d.png", counter);
        try {
            int w = width / ny;
            int h = height / nx;
            
            for (int i=0; i<nx; i++) {
		for (int j=0; j<ny; j++) {
                    g.setColor(color[matrix[i][j] % color.length]);
                    g.fillRect(j*w, i*h, w, h);
		}
            }            
            ImageIO.write(bi, "PNG", new File(fileName));
            System.err.print("\r"+fileName+" is written.");
        } catch (IOException ie) {
            ie.printStackTrace();
        }
    }

    @Override
    public void run() {
        Export();
    }
}
