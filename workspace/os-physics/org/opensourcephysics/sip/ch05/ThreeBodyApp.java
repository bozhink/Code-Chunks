package org.opensourcephysics.sip.ch05;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * ThreeBodyApp models the three body problem by extending
 * AbstractSimulation and implementing the doStep method.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class ThreeBodyApp extends AbstractSimulation {

   PlotFrame frame = new PlotFrame("x", "y", "Three-Body Orbits");
   ThreeBody trajectory = new ThreeBody();

   /**
    * Constructs ThreeBodyApp and initializes the drawing.
    */
   public ThreeBodyApp() {
      frame.addDrawable(trajectory);
      frame.setSquareAspect(true);
      frame.setSize(450, 450);
   }

   /**
    * Initializes the simulation;
    */
   public void initialize() {
      trajectory.odeSolver.setStepSize(control.getDouble("dt"));
      trajectory.initialize(ThreeBodyInitialConditions.MONTGOMERY);
      frame.setPreferredMinMax(-1.5, 1.5, -1.5, 1.5);
   }

   /**
    * Resets the animation into a predefined state.
    */
   public void reset() {
      control.setValue("dt", 0.1);
      enableStepsPerDisplay(true);
      initialize();
   }

   /**
    * Does an animation step.
    */
   protected void doStep() {
      trajectory.doStep();
      frame.setMessage("t="+decimalFormat.format(trajectory.state[4]));
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new ThreeBodyApp());
   }
}
