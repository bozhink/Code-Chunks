// package statement appears before beginning of class definition
package org.opensourcephysics.sip.ch02;

/**
 * FallingBallApp computes the time for a ball to fall 10 meters and prints the variables.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FallingBallApp {               // beginning of class definition

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // beginning of method definition
      FallingBall ball = new FallingBall(); // declaration and instantiation
      double y0 = 10;                       // example of declaration and assignment statement
      double v0 = 0;
      ball.t = 0; // note use of dot operator to access instance variable
      ball.dt = 0.01;
      ball.y = y0;
      ball.v = v0;
      while(ball.y>0) {
         ball.step();
      }
      System.out.println("Results");
      System.out.println("final time = "+ball.t);
      // displays numerical results
      System.out.println("y = "+ball.y+" v = "+ball.v);
      // displays analytic results
      System.out.println("analytic y = "+ball.analyticPosition(y0, v0));
      System.out.println("analytic v = "+ball.analyticVelocity(v0));
      System.out.println("acceleration = "+FallingBall.g);
   } // end of method definition
} // end of class definition

