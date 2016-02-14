package org.opensourcephysics.sip.ch07;

/**
 * Random Walk simulation in 1D
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class Walker {

   int xAccum[], xSquaredAccum[]; // accumulated data on displacement of walkers, index is time
   int N;                         // maximum number of steps
   double p;                      // probability of step to the right
   int position;                  // position of walker

   /**
    * Initializes walker array
    */
   public void initialize() {
      xAccum = new int[N+1];
      xSquaredAccum = new int[N+1];
   }

   /**
    *  Does random walk for one walker
    */
   public void step() {
      position = 0;
      for(int t = 0; t<N; t++) {
         if(Math.random()<p) {
            position++;
         } else {
            position--;
         }
         xAccum[t+1] += position; // determine displacement of walker after each step
         xSquaredAccum[t+1] += position*position;
      }
   }
}
