package org.opensourcephysics.sip.ch07;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * Simulates random walkers in one dimension
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class WalkerApp extends AbstractSimulation {

   Walker walker = new Walker();
   PlotFrame plotFrame = new PlotFrame("time", "<x>,<x^2>", "Averages");
   HistogramFrame distribution = new HistogramFrame("x", "H(x)", "Histogram");
   int trials; // number of trials

   /**
    *   Sets column names for data table
    */
   public WalkerApp() {
      plotFrame.setXYColumnNames(0, "t", "<x>");
      plotFrame.setXYColumnNames(1, "t", "<x^2>");
   }

   /**
    *   Gets parameters and initializes model
    */
   public void initialize() {
      walker.p = control.getDouble("Probability p of step to right");
      walker.N = control.getInt("Number of steps N");
      walker.initialize();
      trials = 0;
   }

   /**
    * Does one walker at a time
    */
   public void doStep() {
      trials++;
      walker.step();
      distribution.append(walker.position);
      distribution.setMessage("trials = "+trials);
   }

   /**
    *  Plots data when user stops the simulation.
    */
   public void stopRunning() {
      plotFrame.clearData();
      for(int t = 0; t<=walker.N; t++) {
         plotFrame.append(0, 1.0*t, walker.xAccum[t]*1.0/trials);
         plotFrame.append(1, 1.0*t, walker.xSquaredAccum[t]*1.0/trials-Math.pow(walker.xAccum[t]/trials, 2));
      }
      plotFrame.repaint();
   }

   /**
    *  Resets to default values
    */
   public void reset() {
      control.setValue("Probability p of step to right", 0.5);
      control.setValue("Number of steps N", 100);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new WalkerApp());
   }
}
