package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display3d.simple3d.*;
import org.opensourcephysics.frames.Display3DFrame;

/**
 * LorenzApp models the Lorenz attractor by extending AbstractAnimation
 * and implementing the doStep method.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/06/05
 */
public class LorenzApp extends AbstractSimulation {

   Display3DFrame frame = new Display3DFrame("Lorenz Attractor");
   Lorenz lorenz = new Lorenz();

   /**
    * Constructs Ball3dApp and in initializes the drawing and the plot.
    */
   public LorenzApp() {
      frame.setPreferredMinMax(-15.0, 15.0, -15.0, 15.0, 0.0, 50.0);
      frame.setDecorationType(VisualizationHints.DECORATION_AXES);
      frame.addElement(lorenz);
   }

   /**
    * Initializes the animation.
    */
   public void initialize() {
      double x = control.getDouble("initial x");
      double y = control.getDouble("initial y");
      double z = control.getDouble("initial z");
      double dt = control.getDouble("dt");
      lorenz.initialize(x, y, z);
      lorenz.ode_solver.initialize(dt);
      frame.setVisible(true);
   }

   /**
    * Resets the animation.
    */
   public void reset() {
      control.setValue("initial x", 2);
      control.setValue("initial y", 5);
      control.setValue("initial z", 20);
      control.setValue("dt", 0.01);
      initialize();
   }

   /**
    * Does an animation step.
    */
   protected void doStep() {
      lorenz.doStep();
      frame.setMessage("t="+decimalFormat.format(lorenz.state[3]));
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new LorenzApp());
   }
}
