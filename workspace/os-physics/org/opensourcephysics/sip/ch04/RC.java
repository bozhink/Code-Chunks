package org.opensourcephysics.sip.ch04;
import org.opensourcephysics.numerics.ODE;

/**
 * RC demonstrates how to implement the ODE interface for an RC circuit.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class RC implements ODE {
   double r, c;  // resistance and capacitance
   double omega;  // angular frequency of oscillator
   double[] state = new double[2];  // [charge, time] state array

   /**
    * Construct an RC circuit with the given values.
    */
   public RC(double _r, double _c, double _omega) {
      r = _r;
      c = _c;
      omega = _omega;
      state[0] = 0;  // charge
      state[1] = 0;  // time
   }

   /**
    * Get state array. Implementation of ODE interface.
    *
    * @return state array
    */
   public double[] getState() {
      return state;
   }

   /**
    * Get the source voltage at given time.
    * @param t
    * @return
    */
   public double getSourceVoltage(double t) {
      return 10*Math.sin(omega*t);
   }

   /**
    * Get the rate array. Implementation of ODE interface.
    * This method may be invoked many times with different intermediate states
    * as an ODESolver is carrying out the solution.
    *
    * @param state the state array
    * @param rate the rate array
    */
   public void getRate(double[] state, double[] rate) {
      rate[0] = (-state[0]/r/c)+(getSourceVoltage(state[1])/r);  //  dQ/dt
      rate[1] = 1;  // dt/dt = 1
   }
}
