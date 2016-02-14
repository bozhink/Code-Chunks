package org.opensourcephysics.sip.ch07;

/**
 * Nuclei simulates decay of unstable nuclei
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class Nuclei {

   int n[];  // accumulated data on number of unstable nuclei, index is time
   int tmax; // maximum time to record data
   int n0;   // initial number of unstable nuclei
   double p; // decay probability

   /**
    * Initializes unstable nuclei array
    */
   public void initialize() {
      n = new int[tmax+1];
   }

   /**
    *  Nuclei decay
    */
   public void step() {
      n[0] += n0;
      int nUnstable = n0;
      for(int t = 0; t<tmax; t++) {
         for(int i = 0; i<nUnstable; i++) {
            if(Math.random()<p) {
               nUnstable--;
            }
         }
         n[t+1] += nUnstable;
      }
   }
}
