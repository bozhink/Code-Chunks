package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.numerics.ODE;

/**
 * DampedDrivenPendulum models a damped driven pendulum.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class DampedDrivenPendulum implements ODE {

   double state[] = new double[3]; // [theta, angular velocity,time]
   double gamma;                   // damping constant
   double A;                       // amplitude of external force

   /**
    * Initializes the state by copying the given array into the state array.
    * The state array variables are: [theta, angular velocity,time].
    *
    * @param newState double[]
    */
   void initializeState(double[] newState) {
      System.arraycopy(newState, 0, state, 0, 3);
   }

   /**
    * Gets the rate using the given state.
    * @param state double[]
    * @param rate double[]
    */
   public void getRate(double state[], double rate[]) {
      rate[0] = state[1]; // state[1] = angular velocity
      rate[1] = -gamma*state[1]-(1.0+2.0*A*Math.cos(2*state[2]))*Math.sin(state[0]);
      rate[2] = 1;        // rate of change of time
   }

   /**
    * Gets the state.
    *
    * @return double[]
    */
   public double[] getState() {
      return state;
   }
}
