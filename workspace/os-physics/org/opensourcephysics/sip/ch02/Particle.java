package org.opensourcephysics.sip.ch02;

/**
 * Particle models a one-dimensional trajectory that can be computed analytically and numerically.
 *
 * This class is abstract because the dynamics of the particle's motion is not yet known.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 05/07/05
 */
abstract public class Particle {
   double y, v, t;  // instance variables
   double dt;  // time step

   /**
    * Constructs a Particle.
    */
   public Particle() {  // constructor
      System.out.println("A new Particle is created.");
   }

   /**
    * Steps (advances) the dynamical variables using a numeric method.
    */
   abstract protected void step();

   /**
    * Computes the position at the current time using the analytic solution.
    *
    * @return double
    */
   abstract protected double analyticPosition();

   /**
    * Computes the velocity at the current time using the analytic solution.
    *
    * @return double
    */
   abstract protected double analyticVelocity();
}
