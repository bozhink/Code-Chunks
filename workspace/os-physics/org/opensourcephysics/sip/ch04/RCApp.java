package org.opensourcephysics.sip.ch04;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.numerics.*;

/**
 * RCApp solves and plots the voltage across a capacitor in an RC circuit driven
 * by a sinusoidal driving voltage.
 *
 * This application demonstrates:
 * <ol>
 *   <li>how to use the ODE interface.</li>
 *   <li>how to use the ODESolver interface.</li>
 *   <li>how to use the Animation control to run and single-step a differential equation.</li>
 *   <li>how to display the ODE solution in a graph.</li>
 * </ol>
 * Students should test other ODESolvers in the Numerics package.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class RCApp extends AbstractSimulation {
   PlotFrame plottingFrame = new PlotFrame("Time(s)", "Charge", "RC Circuit");
   RC rc;
   Euler odeSolver;

   /**
    * Constructs the RCApp
    */
   public RCApp() {
      rc = new RC(0, 0, 0);
      odeSolver = new Euler(rc);  // create numerical method
   }

   /*
    * Initializes the animation using the values in the control
    */
   public void initialize() {
      rc.r = control.getDouble("r");
      rc.c = control.getDouble("c");
      rc.omega = control.getDouble("omega");
      odeSolver.setStepSize(control.getDouble("dt"));
      plottingFrame.append(0, rc.state[1], rc.getSourceVoltage(rc.state[1]));  // voltage data
      plottingFrame.append(1, rc.state[1], rc.state[0]);  // charge data
      plottingFrame.setMessage("time ="+decimalFormat.format(rc.state[1]));
      plottingFrame.setMessage("charge="+decimalFormat.format(rc.state[0]), 0);
   }

   /**
    * Does an animation step
    */
   public void doStep() {
      odeSolver.step();  // advance state by current step size
      plottingFrame.append(0, rc.state[1], rc.getSourceVoltage(rc.state[1]));  // voltage data
      plottingFrame.append(1, rc.state[1], rc.state[0]);  // charge data
      plottingFrame.setMessage("time ="+decimalFormat.format(rc.state[1]));
      plottingFrame.setMessage("charge="+decimalFormat.format(rc.state[0]), 0);
   }

   /**
    * Resets animation to a predefined state
    */
   public void reset() {
      control.setValue("r", 1.0);  // initial decay constant
      control.setValue("c", 1.0);  // initial decay constant
      control.setValue("omega", 1.0);  // initial decay constant
      control.setValue("dt", 0.1);  // initial step size
      odeSolver.setStepSize(0.1);  // initial step size
      rc.state[1] = 0;  // initial time
      rc.state[0] = 0;  // initial charge
      initialize();
   }

   /**
    * Start Java application
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      Control control = SimulationControl.createApp(new RCApp());
   }
}
