package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.numerics.*;

/**
 * FallingParticleODE models a falling particle by implementing the ODE interface.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class FallingParticleODE implements ODE {

   final static double g = 9.8;
   double[] state = new double[3];

   /**
    * Constructs the FallingParticleODE model with the given intial postion and velocity.
    *
    * @param y double
    * @param v double
    */
   public FallingParticleODE(double y, double v) {
      state[0] = y;
      state[1] = v;
      state[2] = 0;             // initial time
   }

   /**
    * Gets the state array.  Required to implement ODE interface
    *
    * @return double[]
    */
   public double[] getState() { // required to implement ODE interface
      return state;
   }

   /**
    * Gets the rate array.  Required to implement ODE interface
    * The rate is computed using the given state, not the object's state.
    *
    * @param state double[]
    * @param rate double[]
    */
   public void getRate(double[] state, double[] rate) {
      rate[0] = state[1]; // rate of change of y is v
      rate[1] = -g;
      rate[2] = 1;        // rate of change of time is 1
   }
}
