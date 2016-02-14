package org.opensourcephysics.sip.ch13.dla;
import java.awt.Color;
import javax.swing.JFrame;
import org.opensourcephysics.frames.*;

/**
 * DLA models diffusion limited aggregation using a byte raster,
 *
 * @author       Wolfgang Christian
 * @version 1.0
 */
public class FastDLAApp implements Runnable {
   static final int SIZE = 300;        // one half the DLA image size in pixels
   static final int HALFSIZE = SIZE/2; // one half the DLA image size in pixels
   RasterFrame rasterFrame = new RasterFrame("DLA");
   byte[][] s;
   int startRadius=3;
   int numberOfParticles = 1;
   int ringSize = SIZE/10;
   int maxRadius = startRadius+ringSize;

   /**
    * Constructs the DLA.
    */
   FastDLAApp() {
      rasterFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      s = new byte[SIZE][SIZE];
      s[HALFSIZE][HALFSIZE] = Byte.MAX_VALUE;
      rasterFrame.setAll(s);
      rasterFrame.setIndexedColor(0, Color.BLACK);
      rasterFrame.setVisible(true);
      Thread thread = new Thread(this);
      thread.start();
   }

   /**
    * Walk until next to perimeter site.
    *
    * @param x,y initial walker location
    */
   public boolean walk(int x, int y) {
      do {
         double rSquared = (x-HALFSIZE)*(x-HALFSIZE)+(y-HALFSIZE)*(y-HALFSIZE);
         int r = 1+(int) Math.sqrt(rSquared);
         if(r>maxRadius) {
            return true;                      // start walk over
         }
         if((r<HALFSIZE-2)&&(s[x+1][y]+s[x-1][y]+s[x][y+1]+s[x][y-1]>0)) {
            numberOfParticles++;
            s[x][y] = 1;
            rasterFrame.setValue(x, y, Byte.MAX_VALUE);
            if(r>=startRadius) {
               startRadius = r+2;
            }
            maxRadius = startRadius+ringSize;
            return false;                     // walk is finished
         } else {                             // take a step
            switch((int) (4*Math.random())) { // select direction randomly
               case 0 :
                  x++;
                  break;
               case 1 :
                  x--;
                  break;
               case 2 :
                  y++;
                  break;
               case 3 :
                  y--;
            }
         }                                    // end else if
      } while(true);                          // end do loop
   }

   /**
    * The run method for the thread.  DO NOT invoke this method.
    */
   public void run(){
      int x = 0, y = 0;
      while(startRadius<HALFSIZE-1){
         // find random initial position of new walker
         do{
            double theta = 2*Math.PI*Math.random();
            x = HALFSIZE+ (int) (startRadius*Math.cos(theta));
            y = HALFSIZE+ (int) (startRadius*Math.sin(theta));
         } while (walk(x, y)); // random walk, returns true if new walk is needed
         try{
            if (numberOfParticles%100==0){ // repaint the screen after every 20th particle
               rasterFrame.render();
               Thread.sleep(1);  //sleep to let other threads run
            }
         } catch (Exception e){}
      }
      rasterFrame.repaint();
      rasterFrame.setMessage("Done");
   }

   /**
    * Start the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      new FastDLAApp();
   }
}
