package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.DisplayFrame;

/**
 * OscillatorsApp displays a system of coupled oscillators in a drawing panel.
 *
 * The separation between oscillators is one in the current model.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class OscillatorsApp extends AbstractSimulation {

   DisplayFrame displayFrame = new DisplayFrame("Position", "Displacement", "Oscillators");
   Oscillators oscillators;
   double dt;

   /**
    * Initializes the simulation by creating a system of oscillators.
    */
   public void initialize() {
      dt = control.getDouble("dt"); // time step
      int mode = control.getInt("mode");
      int N = control.getInt("number of particles");
      oscillators = new Oscillators(mode, N);
      displayFrame.setPreferredMinMax(0, N+1, -1.5, 1.5);
      displayFrame.clearDrawables(); // remove old oscillators
      displayFrame.setSquareAspect(false);
      displayFrame.addDrawable(oscillators);
   }

   /**
    * Does a time step
    */
   public void doStep() {
      oscillators.step(dt); // advance the state by dt
      displayFrame.setMessage("t = "+decimalFormat.format(oscillators.time));
   }

   /**
    * Resets the oscillator program to its default values.
    */
   public void reset() {
      control.setValue("number of particles", 16);
      control.setValue("mode", 1);
      control.setValue("dt", 0.5);
      initialize();
   }

   /**
    * Creates the oscillator program from the command line
    *
    * @param args
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new OscillatorsApp());
   }
}
