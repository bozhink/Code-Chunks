package org.opensourcephysics.sip.ch02;

/**
 * FallingBall models a falling ball using the Euler algorithm.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 05/07/05
 */
public class FallingBall {
   double y, v, t;    // instance variables
   double dt;         // default package protection
   final static double g = 9.8; // constant (note non-use of Java convention)

   /**
    * Constructs a FallingBall at x=0 with v=0;
    */
   public FallingBall() { // constructor
      System.out.println("A new FallingBall object is created.");
   }

   /**
    * Steps (advances) the postion of the ball using the Euler algorithm.
    */
   public void step() {
      y = y + v*dt;   // Euler algorithm for numerical solution
      v = v - g*dt;
      t = t + dt;
   }

   /**
    * Computes the position of the ball using the analytic solution of the equation of motion.
    * @param y0 double
    * @param v0 double
    * @return double
    */
   public double analyticPosition(double y0, double v0) {
      return y0 + v0*t - 0.5*g*t*t;
   }

   /**
    * Computes the velocity of the ball using the analytic solution of the equation of motion.
    * @param v0 double
    * @return double
    */
   public double analyticVelocity(double v0) {
      return v0 - g*t;
   }
}
