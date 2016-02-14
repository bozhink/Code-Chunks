package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * BifurcateApp demonstrates chaos in the logistic equation by plotting the
 * return map for different values of r.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class BifurcateApp extends AbstractSimulation {

   double r;       // control parameter
   double dr;      // incremental change of r, suggest dr <= 0.01
   int ntransient; // number of iterations not plotted
   int nplot;      // number of iterations plotted
   PlotFrame plotFrame = new PlotFrame("r", "x", "Bifurcation diagram");

   /**
    * Constructs the Bifurcate model.
    */
   public BifurcateApp() {
      plotFrame.setMarkerSize(0, 0); // small size gives better resolution
      plotFrame.setMarkerSize(1, 0);
   }

   /**
    * Initializes the bifrucation diagram.
    */
   public void initialize() {
      plotFrame.clearData();
      r = control.getDouble("initial r");
      dr = control.getDouble("dr");
      ntransient = control.getInt("ntransient");
      nplot = control.getInt("nplot");
   }

   /**
    * Does a step by adding to the diagram using the current value of r.
    *
    * Increments the value of r at the end of the step in preparation for
    * the next set.
    */
   public void doStep() {
      if(r<1.0) {
         double x = 0.5;
         for(int i = 0; i<ntransient; i++) {    // x values not plotted
            x = map(x, r);
         }
         for(int i = 0; i<nplot/2; i++) {       // plot half the points in dataset zero
            x = map(x, r);
            plotFrame.append(0, r, x);          // shows different x values for given value of r
         }
         for(int i = nplot/2+1; i<nplot; i++) { // plot remaining points in dataset one
            x = map(x, r);
            plotFrame.append(1, r, x);          // dataset one has a different color
            i++;
         }
         r += dr;
      }
   }

   /**
    * Resets all parameters to their defaults.
    */
   public void reset() {
      control.setValue("initial r", 0.2);
      control.setValue("dr", 0.005);
      control.setValue("ntransient", 200);
      control.setValue("nplot", 50);
   }

   /**
    * Computes the return map for the given parameters.
    *
    * @param x double
    * @param r double
    * @return double
    */
   double map(double x, double r) {
      return 4*r*x*(1-x);
   }

   /**
    * The main method starts the Java applicaiton.
    * @param args String[] command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new BifurcateApp());
   }
}
