package btwrecursiveavalanche;
/**
 * @author Bozhin Karaivanov
 * @version 0.3
 * September, 2012
 * 
 * This class contains the matrix and the most important
 * methods of the implementation of the Bak–Tang–Wiesenfeld (BTW) 
 * sandpile model.
 */

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class BTWModel {
    
    private Color color[] = {
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
    
    private String fileName;
    private String fmt, type;
    private int width, height;
    private BufferedImage bi;
    private Graphics2D g;
    
    public int nx; // x-dimension
    public int ny; // y-dimension
    public int matrix[][];
    public int THRESHOLD = 4;
    
    private java.util.Random rand = new java.util.Random();
    /**
     * 
     * @param nx X-dimension of the matrix.
     * @param ny Y-dimension of the matrix.
     */
    public BTWModel(int nx, int ny) {
        this.counter = 0;
        this.nx = nx;
        this.ny = ny;
        matrix = new int[nx][ny];
        width = 600;
        height = 600;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        fmt = "btw-%1$08d.png";
        type = "PNG";
    }
    /**
     * 
     * @param nx X-dimension of the matrix.
     * @param ny Y-dimension of the matrix.
     * @param width Width of the canvas.
     * @param height Height of the canvas;
     */
    public BTWModel(int nx, int ny, int width, int height) {
        this.counter = 0;
        this.nx = nx;
        this.ny = ny;
        matrix = new int[nx][ny];
        this.width = width;
        this.height = height;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        fmt = "btw-%1$08d.png";
        type = "PNG";
    }
    /**
     * 
     * @param nx X-dimension of the matrix.
     * @param ny Y-dimension of the matrix.
     * @param fmt Format for output file name.
     * @param type Output file type.
     */
    public BTWModel(int nx, int ny, String fmt, String type) {
        this.counter = 0;
        this.nx = nx;
        this.ny = ny;
        matrix = new int[nx][ny];
        width = 600;
        height = 600;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        this.fmt = fmt;
        this.type = type;
    }
    /**
     * 
     * @param nx X-dimension of the matrix.
     * @param ny Y-dimension of the matrix.
     * @param width Width of the canvas.
     * @param height Height of the canvas;
     * @param fmt Format for output file name.
     * @param type Output file type.
     */
    public BTWModel(int nx, int ny, int width, int height, String fmt, String type) {
        this.counter = 0;
        this.nx = nx;
        this.ny = ny;
        matrix = new int[nx][ny];
        this.width = width;
        this.height = height;
        bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g = bi.createGraphics();
        this.fmt = fmt;
        this.type = type;
    }
    /**
     * Limitation for the recursion depth.
     * This parameter is used to avoid the stack overflow error.
     */
    private int maxRecursionOrder = 600;
    /**
     * Recursive method to recalculate the matrix.
     */
    private void update(int x, int y, int recursionOrder) {
        if (recursionOrder < maxRecursionOrder) {
            if (matrix[x][y] > THRESHOLD) {
                int xp1 = (x+1+nx) % nx;
                int xm1 = (x-1+nx) % nx;
                int yp1 = (y+1+ny) % ny;
                int ym1 = (y-1+ny) % ny;
                matrix[x][y] -= THRESHOLD;
                matrix[x][yp1]++;
                matrix[x][ym1]++;
                matrix[xp1][y]++;
                matrix[xm1][y]++;
                Export(counter++);
                
                update(x, yp1, recursionOrder+1);
                update(x, ym1, recursionOrder+1);
                update(xp1, y, recursionOrder+1);
                update(xm1, y, recursionOrder+1);
            }
        } else {
            System.err.println("update: Maximum recursion order exeeded.");
        }
    }
    /**
     * Initialization for the 'update' recursive method.
     */
    public void Update() {
        int x = rand.nextInt(nx);
        int y = rand.nextInt(ny);
        matrix[x][y]++;
        Export(counter++);
        update(x, y, 0);
    }
    
    
    public void Export(int currentNumber) {
        fileName = String.format(fmt, currentNumber);
        try {
            int w = width / ny;
            int h = height / nx;
            // First canvas will be cleared
            g.setColor(color[0]);
            g.fillRect(0, 0, width-1, height-1);
            // then rectngles will be plotted
            for (int i=0; i<nx; i++) {
		for (int j=0; j<ny; j++) {
                    g.setColor(color[matrix[i][j] % color.length]);
                    g.fillRect(j*w, i*h, w, h);
		}
            }            
            ImageIO.write(bi, type, new File(fileName));
            System.err.print("\r"+fileName+" is written.");
        } catch (IOException ie) {
            ie.printStackTrace();
        }
    }
}
