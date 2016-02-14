package org.opensourcephysics.sip.ch02;
import org.opensourcephysics.controls.*;

/**
 * FallingParticleCalcApp computes the time for a particle to fall to the ground and displays the variables.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 05/07/05
 */
public class FallingParticleCalcApp extends AbstractCalculation { // beginning of class definition

  /**
   * Calculates the time it takes a ball to fall to the ground and displays the variables.
   */
  public void calculate() {
    // gets initial conditions
    double y0 = control.getDouble("Initial y");
    double v0 = control.getDouble("Initial v");
    // sets initial conditions
    Particle ball = new FallingParticle(y0, v0);
    // reads parameters and sets dt
    ball.dt = control.getDouble("dt");
    while(ball.y>0) {
      ball.step();
    }
    control.println("final time = "+ball.t);
    control.println("y = "+ball.y+" v = "+ball.v);  // displays numerical results
    control.println("analytic y = "+ball.analyticPosition());  // displays analytic position
    control.println("analytic v = "+ball.analyticVelocity());  // displays analytic velocity
  }

  /**
   * Resets the program to its initial state.
   */
  public void reset() {
    control.setValue("Initial y", 10);  // sets default input values
    control.setValue("Initial v", 0);
    control.setValue("dt", 0.01);
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main(String[] args) { // creates a calculation control structure using this class
    CalculationControl.createApp(new FallingParticleCalcApp());
  }
}  // end of class definition

