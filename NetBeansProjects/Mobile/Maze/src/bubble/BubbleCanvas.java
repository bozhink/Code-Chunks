package bubble;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Graphics;

/**
 *
 * @author bozhin
 */
public class BubbleCanvas extends Canvas implements Runnable 
{
    private boolean isRunning;
    private int sleep;
    private int x, y, w, h;

    
    public BubbleCanvas()
    {
        sleep = 50;
        int width = getWidth();
        int height = getHeight();
        w = 20;
        h = 20;
        y = height - h;
        java.util.Random rnd = new java.util.Random();
        x = width-w;
        x = Math.abs(rnd.nextInt()) % x + w;
    }
    
    public void start() 
    {
        isRunning = true;
        Thread t = new Thread(this);
        t.start();
    }
    
    public void stop()
    {
        isRunning = false;
    }
    
    public void paint(Graphics g) 
    {
        int width = getWidth();
        int height = getHeight();
        
        // Clear the Canvas.
        g.setGrayScale(255);
        g.fillRect(0, 0, width-1, height-1);
        g.setGrayScale(128);
        g.fillArc(x, y, w, h, 0, 360);
        
//        int x = mBorder;
//        int y = mBorder;
//        int w = width - mBorder * 2;
//        int h = height - mBorder * 2;
//        for (int i = 0; i < 8; i++)
//        {
//            g.setGrayScale((8 - i) * 32 - 16);
//            g.fillArc(x, y, w, h, mTheta + i * 10, 10);
//            g.fillArc(x, y, w, h, (mTheta + 180) % 360 + i * 10, 10);
//        }
    }
    
    public void run()
    {
        while (isRunning)
        {
            y--;
            java.util.Random rnd = new java.util.Random();
            x += rnd.nextInt() % 2;
            if (y < 0) { isRunning=false;}
            repaint();
            try { Thread.sleep(sleep); } catch (InterruptedException ie) {}
         }
    }
}