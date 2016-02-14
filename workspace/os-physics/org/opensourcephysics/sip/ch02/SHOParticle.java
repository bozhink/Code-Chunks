package org.opensourcephysics.sip.ch02;

/**
 * SHOParticle models a simple harmonic oscillator by subclassing the Particle class.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/07/05
 */
public class SHOParticle extends Particle {

   final static double k = 1.0;               // spring constant
   final static double m = 1.0;
   final static double omega0 = Math.sqrt(k); // assume unit mass
   private double y0 = 0, v0 = 0;             // initial position and velocity

   /**
    * Constructs the simple harmonic oscillator model with the given position and velocity.
    *
    * @param y double
    * @param v double
    */
   public SHOParticle(double y, double v) {   // constructor
      System.out.println("A new SHO object is being created.");
      this.y = y; // sets instance value equal to passed value
      this.v = v;
      y0 = y;     // no need to use "this" because only one y0
      v0 = v;
   }

   /**
    * Steps (advances) the dynamical variables using the Euler-Cromer algorithm.
    */
   public void step() {
      v = v-((k/m)*dt); // Euler-Cromer algorithm for numerical solution
      y = y+(v*dt);     // uses new v
      t = t+dt;
   }

   /**
    * Computes the position at the current time using the analytic solution.
    *
    * @return double
    */
   public double analyticPosition() {
      return y0*Math.cos(omega0*t)+v0/omega0*Math.sin(omega0*t);
   }

   /**
    * Computes the velocity at the current time using the analytic solution.
    *
    * @return double
    */
   public double analyticVelocity() {
      return -y0*omega0*Math.sin(omega0*t)+v0*Math.cos(omega0*t);
   }
}
