package org.opensourcephysics.sip.ch02;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * FallingParticlePlotApp computes the time for a particle to fall to the ground and plots the position as a funciton of time.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/07/05
 */
public class FallingParticlePlotApp extends AbstractCalculation {
   PlotFrame plotFrame = new PlotFrame("t", "y", "Falling Ball");

   /**
    * Calculates the trajectory of a falling particle and plots the position as a function of time.
    */
   public void calculate() {
      plotFrame.setAutoclear(false); // data not cleared at beginning of each calculation
      // gets initial conditions
      double y0 = control.getDouble("Initial y");
      double v0 = control.getDouble("Initial v");
      // sets initial conditions
      Particle ball = new FallingParticle(y0, v0);
      // gets parameters
      ball.dt = control.getDouble("dt");
      while (ball.y > 0) {
         ball.step();
         plotFrame.append(0, ball.t, ball.y);
         plotFrame.append(1, ball.t, ball.analyticPosition());
      }
   }

   /**
    * Resets the program to its initial state.
    */
   public void reset() {
      control.setValue("Initial y", 10);
      control.setValue("Initial v", 0);
      control.setValue("dt", 0.01);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // sets up calculation control structure using this class
      CalculationControl.createApp(new FallingParticlePlotApp());
   }
}
