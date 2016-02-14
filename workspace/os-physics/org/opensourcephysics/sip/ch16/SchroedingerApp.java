package org.opensourcephysics.sip.ch16;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * SchroedingerApp displays a solution to the time-independent Schroedinger equation.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class SchroedingerApp extends AbstractCalculation {
   PlotFrame frame = new PlotFrame("x", "phi", "Wave function");
   Schroedinger schroedinger = new Schroedinger();

   /**
    * Constructs SchroedingerApp and sets plotting frame parameters.
    */
   public SchroedingerApp() {
      frame.setConnected(0, true);
      frame.setMarkerShape(0, Dataset.NO_MARKER);
   }

   /**
    * Calculates the wave function.
    */
   public void calculate() {
      schroedinger.xmin = control.getDouble("xmin");
      schroedinger.xmax = control.getDouble("xmax");
      schroedinger.stepHeight = control.getDouble("step height at x = 0");
      schroedinger.numberOfPoints = control.getInt("number of points");
      schroedinger.energy = control.getDouble("energy");
      schroedinger.initialize();
      schroedinger.solve();
      frame.append(0, schroedinger.x, schroedinger.phi);
   }

   /**
    * Resets the calculation parameters.
    */
   public void reset() {
      control.setValue("xmin", -5);
      control.setValue("xmax", 5);
      control.setValue("step height at x = 0", 1);
      control.setValue("number of points", 500);
      control.setValue("energy", 1);
   }

   /**
    * The main method starts the Java application.
    * @param args[]  the input parameters
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new SchroedingerApp(), args);
   }
}
