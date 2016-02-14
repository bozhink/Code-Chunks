package org.opensourcephysics.sip.ch02;

/**
 * FallingParticleApp computes the time for a particle to fall 10 meters and displays the variables.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/07/05
 */
public class FallingParticleApp { // beginning of class definition

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // beginning of method definition
      Particle ball = new FallingParticle(10, 0); // declaration and instantiation
      ball.t = 0;
      ball.dt = 0.01;
      while (ball.y > 0) {
         ball.step();
      }
      System.out.println("Results");
      System.out.println("final time = " + ball.t);
      System.out.println("y = " + ball.y + " v = " + ball.v); // numerical result
      System.out.println("y analytic = " + ball.analyticPosition()); // analytic result
   } // end of method definition
} // end of class definition
