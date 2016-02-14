package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.controls.*;

/**
 * IterateMapApp calculates and plots multiple trajectories of the logistic equation.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 05/17/05
 */
public class IterateMapApp extends AbstractCalculation {

   int datasetIndex = 0;
   PlotFrame plotFrame = new PlotFrame("iterations", "x", "trajectory");

   /**
    * Constructs the IterateMapApp.
    */
   public IterateMapApp() {
      plotFrame.setAutoclear(false); // keep data between calls to calculate
   }

   /**
    * Resets all parameters to their defaults.
    */
   public void reset() {
      control.setValue("r", 0.2);
      control.setValue("x", 0.6);
      control.setValue("iterations", 50);
      datasetIndex = 0;
   }

   /**
    * Calculates and plots the trajectory of the map.
    */
   public void calculate() {
      double r = control.getDouble("r");
      double x = control.getDouble("x");
      int iterations = control.getInt("iterations");
      for(int i = 0; i<=iterations; i++) {
         plotFrame.append(datasetIndex, i, x);
         x = map(r, x);
      }
      plotFrame.setMarkerSize(datasetIndex, 1);
      plotFrame.setXYColumnNames(datasetIndex, "iteration", "calc #"+datasetIndex);
      datasetIndex++;
   }

   /**
    * Computes the return map for the given parameters.
    *
    * @param x double
    * @param r double
    * @return double
    */
   double map(double r, double x) {
      return 4*r*x*(1-x); // iterate map
   }

   /**
    * The main method starts the Java applicaiton.
    * @param args String[] command line parameters
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new IterateMapApp());
   }
}
