package org.opensourcephysics.sip.ch07;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * Simulates approach to equilibrium for particles in a partioned box.
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class BoxApp extends AbstractSimulation {

   Box box = new Box();
   PlotFrame plotFrame = new PlotFrame("time", "number on left", "Box data");
   DisplayFrame displayFrame = new DisplayFrame("Partitioned box");

   /**
    * Gets parameters and initializes model
    */
   public void initialize() {
      displayFrame.clearDrawables();
      displayFrame.addDrawable(box);
      box.N = control.getInt("Number of particles");
      box.initialize();
      plotFrame.clearData();
      displayFrame.setPreferredMinMax(0, 1, 0, 1);
   }

   /**
    * Draws particles after each move, and plots data.
    */
   public void doStep() {
      box.step();
      plotFrame.append(0, box.time, box.nleft);
   }

   /**
    *  Resets to default values
    */
   public void reset() {
      // clicking reset should erase positions of particles
      control.setValue("Number of particles", 64);
      plotFrame.clearData();
      enableStepsPerDisplay(true);
      setStepsPerDisplay(10);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new BoxApp());
   }
}
