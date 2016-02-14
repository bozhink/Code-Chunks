package org.opensourcephysics.sip.ch13.dla;
import org.opensourcephysics.controls.*;
import java.awt.Color;
import org.opensourcephysics.frames.RasterFrame;

/**
 * DLAApp displays Diffusion Limited Aggregation (DLA) in a raster frame.
 *
 * Add code to plot the mass distribution in the stopRunning method.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 */
public class DLARasterApp extends AbstractSimulation {
   RasterFrame rasterFrame = new RasterFrame("DLA");
   byte s[][];                   // lattice on which cluster lives
   int xOccupied[], yOccupied[]; // location of occupied sites
   int L;                        // linear lattice dimension
   int halfL;                    // L/2
   int ringSize;                 // ring size in which walkers can move
   int numberOfParticles;        // number of particles in cluster
   int startRadius;              // radius of cluster where walkers are started
   int maxRadius;                // maximum radius walker can go to before a new walk is started


   /**
    * Initializes the DLA lattice.
    */
   public void initialize() {
      rasterFrame.setMessage(null);
      numberOfParticles = 1;
      L = control.getInt("raster size");
      startRadius = 3;
      halfL = L/2; // L/2
      ringSize = L/10;
      maxRadius = startRadius+ringSize;
      s = new byte[L][L];
      s[halfL][halfL] = Byte.MAX_VALUE;
      rasterFrame.setAll(s);
   }

   /**
    * Resets the DLA lattice size.
    */
   public void reset() {
      rasterFrame.setIndexedColor(0, Color.BLACK);
      control.setValue("raster size", 300);
      setStepsPerDisplay(100);
      enableStepsPerDisplay(true);
      initialize();
   }

   /**
    * Performs an action after the animation stops.
    */
   public void stopRunning() {
      control.println("Number of particles = "+numberOfParticles);
      // add code to compute the mass distribution here
   }

   /**
    * Does a simulation step by growing the DLA.
    *
    * Attempts no more than 100 walkers.
    */
   public void doStep() {
      int x = 0, y = 0;
      if(startRadius<halfL) {
         // find random initial position of new walker
         do {
            double theta = 2*Math.PI*Math.random();
            x = halfL+(int) (startRadius*Math.cos(theta));
            y = halfL+(int) (startRadius*Math.sin(theta));
         } while(walk(x, y)); // random walk, returns true if new walk is needed
      }
      if(startRadius>=halfL) { // stop the simulation
         control.calculationDone("Done");
         rasterFrame.setMessage("Done");
      }
   }

   /**
    * Walk until next to perimeter site.
    *
    * @param x,y initial walker location
    */
   public boolean walk(int x, int y) {
      do {
         double rSquared = (x-halfL)*(x-halfL)+(y-halfL)*(y-halfL);
         int r = 1+(int) Math.sqrt(rSquared);
         if(r>maxRadius) {
            return true;                      // start walk over
         }
         if((r<halfL)&&(s[x+1][y]+s[x-1][y]+s[x][y+1]+s[x][y-1]>0)) {
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

   public static void main(String[] args) {
      SimulationControl.createApp(new DLARasterApp());
   }
}
