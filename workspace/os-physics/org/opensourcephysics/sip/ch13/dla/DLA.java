package org.opensourcephysics.sip.ch13.dla;
import java.awt.Graphics;
import org.opensourcephysics.display.Drawable;
import org.opensourcephysics.display.DrawingPanel;

/**
 * DLAApp models Diffusion Limited Aggregation (DLA).
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 */
public class DLA implements Drawable {

   int s[][];                    // lattice on which cluster lives
   int xOccupied[], yOccupied[]; // location of occupied sites
   int L;                        // linear lattice dimension
   int halfL;                    // L/2
   int ringSize;                 // ring size in which walkers can move
   int numberOfParticles;        // number of particles in cluster
   int startRadius;              // radius of cluster where walkers are started
   int maxRadius;                // maximum radius walker can go to before a new walk is started

   public void initialize() {
      s = new int[L][L];
      halfL = L/2;
      ringSize = L/10;
      xOccupied = new int[L*halfL];
      yOccupied = new int[L*halfL];
      s[halfL][halfL] = 1;
      xOccupied[0] = halfL;
      yOccupied[0] = halfL;
      numberOfParticles = 1;
      startRadius = 3;
      maxRadius = startRadius+ringSize;
   }

   public void step() {
      int x = 0, y = 0;
      if(startRadius<halfL) {
         // find random initial position of new walker
         do {
            double theta = 2*Math.PI*Math.random();
            x = halfL+(int) (startRadius*Math.cos(theta));
            y = halfL+(int) (startRadius*Math.sin(theta));
         } while(walk(x, y)); // random walk, returns true if new walk is needed
      }
   }

   /**
    * Walk until next to perimeter site
    *  @param x,y initial walker location
    *
    */
   public boolean walk(int x, int y) {
      do {
         double rSquared = (x-halfL)*(x-halfL)+(y-halfL)*(y-halfL);
         int r = 1+(int) Math.sqrt(rSquared);
         if(r>maxRadius) {
            return true;  // start walk over
         }
         if((r<halfL)&&(s[x+1][y]+s[x-1][y]+s[x][y+1]+s[x][y-1]>0)) {
            s[x][y] = 1;
            xOccupied[numberOfParticles] = x;
            yOccupied[numberOfParticles] = y;
            numberOfParticles++;
            if(r>=startRadius) {
               startRadius = r+2;
            }
            maxRadius = startRadius+ringSize;
            return false; // walk is finished
         } else {         // take a step
            double random = Math.random();
            if(random<0.25) {
               x++;
            } else if(random<0.5) {
               x--;
            } else if(random<0.75) {
               y++;
            } else {
               y--;
            }
         }                // end else if
      } while(true);      // end do loop
   }

   public void draw(DrawingPanel myWorld, Graphics g) {
      if(s==null) {
         return;
      }
      int sizeX = Math.abs(myWorld.xToPix(0.8)-myWorld.xToPix(0));
      int sizeY = Math.abs(myWorld.yToPix(0.8)-myWorld.yToPix(0));
      for(int i = 0; i<numberOfParticles; i++) {
         int xpix = myWorld.xToPix(xOccupied[i])-sizeX;
         int ypix = myWorld.yToPix(yOccupied[i])-sizeY;
         g.fillRect(xpix+sizeX/2, ypix+sizeY/2, sizeX, sizeY);
      }
   }
}
