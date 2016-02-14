package org.opensourcephysics.sip.ch14.sandpile;
import org.opensourcephysics.frames.*;

/**
 * SandpileApp models an idealized sandpile.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */
public class Sandpile {
   int[] distribution;  // distribution of number of sites toppling
   int[] toppleSiteX, toppleSiteY;
   LatticeFrame height;
   int L, numberToppledMax;
   int numberToppled, numberOfSitesToTopple, numberOfGrains;


   public void initialize(LatticeFrame height) {
      this.height = height;
      height.resizeLattice(L,L);   // create new lattice
      numberToppledMax = 2*L*L+1;  // size of distribution array
      distribution = new int[numberToppledMax];  // should use histogramframe
      toppleSiteX = new int[L*L];
      toppleSiteY = new int[L*L];
      numberOfGrains = 0;
      resetAverages();
    }

   public void step() {
      numberOfGrains++;
      numberToppled = 0;
      int x = (int)(Math.random()*L);
      int y = (int)(Math.random()*L);
      int h = height.getValue(x,y) + 1;
      height.setValue(x,y,h);         // add grain to random site
      height.render();
      if(h == 4) {                    // topple grain
         numberOfSitesToTopple = 1;
         boolean unstable = true;
         
         int[] siteToTopple = {x,y};
         while(unstable) {
            unstable = toppleSite(siteToTopple);
         }
       }
      distribution[numberToppled]++;
   }

   public boolean toppleSite(int siteToTopple[]) { // topple site
      numberToppled++;
      int x = siteToTopple[0];
      int y = siteToTopple[1];
      numberOfSitesToTopple--;
      height.setValue(x,y,height.getValue(x,y) - 4);  // remove grains from site
      height.render();
      // add grains to neighbors
      // if (x,y) is on the border of the lattice, then some grains will be lost.
      if(x+1 < L) {
         addGrain(x+1,y);
      }
      if(x > 0) {
         addGrain(x-1,y);
       }
      if(y+1 < L) {
         addGrain(x,y+1);
      }
      if(y > 0) {
         addGrain(x,y-1);
      }
      if(numberOfSitesToTopple > 0) {
         siteToTopple[0] = toppleSiteX[numberOfSitesToTopple-1];  // next site to topple
         siteToTopple[1] = toppleSiteY[numberOfSitesToTopple-1];
         return true;
      }
      else {
         return false;
      }
   }

   public void addGrain(int x, int y) {
      int h = height.getValue(x,y) + 1;
      height.setValue(x,y,h);   // add grain to site
      height.render();
      if(h == 4) {   // new site to topple
         toppleSiteX[numberOfSitesToTopple] = x;
         toppleSiteY[numberOfSitesToTopple] = y;
         numberOfSitesToTopple++;
       }
   }



   public void resetAverages() {
      distribution = new int[numberToppledMax];
      numberOfGrains = 0;
   }
}
