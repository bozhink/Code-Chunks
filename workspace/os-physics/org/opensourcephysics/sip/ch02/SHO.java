package org.opensourcephysics.sip.ch02;

/**
 * SHO models a simple harmonic oscillator.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/07/05
 */
public class SHO {

   double x, v, t;               // the dynamical variables
   double dt;
   double k = 1.0;               // spring constant
   double omega0 = Math.sqrt(k); // assume unit mass

   /**
    * Creates a simple harmonic oscillator at x = 0 with v = 0.
    */
   public SHO() {                // constructor
      System.out.println("A new harmonic oscillator object is created.");
   }

   /**
    * Steps (advances) the dynamical variables using the Euler algorithm.
    */
   public void step() {
      // modified Euler algorithm
      v = v-k*x*dt;
      x = x+v*dt; // note that updated v is used
      t = t+dt;
   }

   /**
    * Computes the position using the given initial position and initial velocity.
    *
    * @return double
    */
   public double analyticPosition(double y0, double v0) {
      return y0*Math.cos(omega0*t)+v0/omega0*Math.sin(omega0*t);
   }

   /**
    * Computes the velocity using the given initial position and initial velocity.
    *
    * @return double
    */
   public double analyticVelocity(double y0, double v0) {
      return -y0*omega0*Math.sin(omega0*t)+v0*Math.cos(omega0*t);
   }
}
