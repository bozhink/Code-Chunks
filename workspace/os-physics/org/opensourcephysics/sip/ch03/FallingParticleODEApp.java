package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.*;

/**
 * FallingParticleODEApp demonstrates how to use an ODE solver to model a falling particle.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class FallingParticleODEApp extends AbstractCalculation {

   /**
    * Calculates the time required for an falling particle to reach the ground and prints the result.
    */
   public void calculate() {
      // gets initial conditions
      double y0 = control.getDouble("Initial y");
      double v0 = control.getDouble("Initial v");
      // creates ball with initial conditions
      FallingParticleODE ball = new FallingParticleODE(y0, v0);
      // creates ODE solver
      ODESolver solver = new Euler(ball); // note how particular algorithm is chosen
      // sets time step dt in the solver
      solver.setStepSize(control.getDouble("dt"));
      while(ball.state[0]>0) {
         solver.step();
      }
      control.println("final time = "+ball.state[2]);
      control.println("y = "+ball.state[0]+" v = "+ball.state[1]);
   }

   /**
    * Resets the program to its initial state.
    */
   public void reset() {
      control.setValue("Initial y", 10);    // sets default input values
      control.setValue("Initial v", 0);
      control.setValue("dt", 0.01);
   }

   /**
    *
    * Starts the Java application.
    *
    * @param args  command line parameters
    *
    */
   public static void main(String[] args) { // creates a calculation control structure for this class
      CalculationControl.createApp(new FallingParticleODEApp());
   }
}
