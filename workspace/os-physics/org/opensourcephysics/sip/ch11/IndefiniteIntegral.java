package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.numerics.Function;
import org.opensourcephysics.numerics.ODE;

/**
 * IndefiniteIntegral defines a rate equation in order to
 * evaluate the indefinite integral of the given function.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0  revised 04/21/05
 */
public class IndefiniteIntegral implements ODE {

   double[] state = new double[2];
   Function f;
   public IndefiniteIntegral(Function _f, double start) {
      state[0] = 0;     // integral
      state[1] = start; // independent variable
      f = _f;
   }

   public double[] getState() {
      return state;
   }

   public void getRate(double[] state, double rate[]) {
      rate[0] = f.evaluate(state[1]); // integral
      rate[1] = 1;                    // independent variable
   }
}
