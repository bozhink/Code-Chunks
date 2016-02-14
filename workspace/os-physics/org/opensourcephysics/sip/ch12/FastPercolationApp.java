package org.opensourcephysics.sip.ch12;
import org.opensourcephysics.controls.AbstractSimulation;
import org.opensourcephysics.controls.SimulationControl;
import org.opensourcephysics.frames.PlotFrame;

/**
 * FastPercolationApp is the main class for the Newman class.
 * It calls all the methods in the newmanclass that will occupy a site at random
 * and then check to see if the cluster the sitewas added to spans the lattice for periodic boundary conditions.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 03/29/05
 */
public class FastPercolationApp extends AbstractSimulation {

   FastPercolation model = new FastPercolation();
   PlotFrame plotFrame = new PlotFrame("p", "average", "Percolation");
   public FastPercolationApp() {
      plotFrame.setXYColumnNames(0, "p", "Span Prob.");
      plotFrame.setXYColumnNames(1, "p", "Prob in Span Cl");
      plotFrame.setXYColumnNames(2, "p", "Mean Size");
      plotFrame.setXYColumnNames(3, "p", "Connect. length");
   }

   public void initialize() {
      model.L = control.getInt("L");                  //tells the program to look for L in control
      model.pMin = control.getDouble("Minimum p");    //minimum value of p for which data is taken
      model.pMax = control.getDouble("Maximum p");    //maximum value of p for which data is taken
      model.dp = control.getDouble("Increment in p"); //increment of p for which data is taken
      model.initialize();
   }

   public void doStep() {
      model.newLattice(); // changes the positions of the values in order randomly
      plotFrame.setMessage("trial="+model.numberOfTrials);
   }

   public void stop() {
      model.calculateAverages(plotFrame);
   } //resets the control to default values

   public void reset() {
      control.setValue("L", 20);
      control.setValue("Minimum p", 0.5);
      control.setValue("Maximum p", 0.7);
      control.setValue("Increment in p", 0.01);
   }

   public static void main(String[] args) {
      SimulationControl.createApp(new FastPercolationApp());
   }
}
