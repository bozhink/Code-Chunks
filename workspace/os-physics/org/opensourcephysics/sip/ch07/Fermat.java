package org.opensourcephysics.sip.ch07;

/**
 * Light ray in media with different index of refraction
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class Fermat {

   double y[];      // y coordinate of light ray, index is x coordinate
   double v[];      // light speed of ray for medium starting at index value
   int N;           // number of media
   double dn;       // change in index of refraction from one region to the next
   double dy = 0.1; // maximum change in y position
   int steps;

   /**
    * Initializes  arrays
    */
   public void initialize() {
      y = new double[N+1];
      v = new double[N];
      double indexOfRefraction = 1.0;
      for(int i = 0; i<=N; i++) {
         y[i] = i; // initial path is a straight line
      }
      for(int i = 0; i<N; i++) {
         v[i] = 1.0/indexOfRefraction;
         indexOfRefraction += dn;
      }
      steps = 0;
   }

   /**
    *  Random change in path
    */
   public void step() {
      int i = 1+(int) (Math.random()*(N-1));
      double yTrial = y[i]+2.0*dy*(Math.random()-0.5);
      double previousTime = Math.sqrt(Math.pow(y[i-1]-y[i], 2)+1)/v[i-1]; // left medium
      previousTime += Math.sqrt(Math.pow(y[i+1]-y[i], 2)+1)/v[i]; // right medium
      double trialTime = Math.sqrt(Math.pow(y[i-1]-yTrial, 2)+1)/v[i-1]; // left medium
      trialTime += Math.sqrt(Math.pow(y[i+1]-yTrial, 2)+1)/v[i]; // right medium
      if(trialTime<previousTime) {
         y[i] = yTrial;
      }
      steps++;
   }
}
