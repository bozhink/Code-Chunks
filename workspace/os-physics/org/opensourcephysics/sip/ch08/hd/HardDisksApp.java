package org.opensourcephysics.sip.ch08.hd;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.display.GUIUtils;

/**
 * HardDisksApp simulates a two-cimensional system of colliding hard disks.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0 revised 03/28/05
 */
public class HardDisksApp extends AbstractSimulation {

   HardDisks hd = new HardDisks();
   PlotFrame pressureData = new PlotFrame("time", "PA/NkT", "Pressure");
   DisplayFrame display = new DisplayFrame("x", "y", "Lennard-Jones Particles");
   double timeToPlot;

   /**
    * Initializes the model by reading the number of particles.
    */
   public void initialize() {
      hd.N = control.getInt("N");
      hd.Lx = control.getDouble("Lx");
      hd.Ly = control.getDouble("Ly");
      String configuration = control.getString("initial configuration");
      hd.initialize(configuration);
      display.addDrawable(hd);
      display.setPreferredMinMax(0, hd.Lx, 0, hd.Ly);
      display.setSquareAspect(true);
      control.println("Temperature = "+decimalFormat.format(hd.temperature));
      timeToPlot = 1;
   }

   /**
    * Does a simulation step and appends data to the views.
    */
   public void doStep() {
      while(hd.t<timeToPlot) { // plot at roughly equal time intervals
         hd.step();
      }
      timeToPlot++;
      pressureData.append(0, hd.t, hd.pressure());
      display.setMessage("Number of Collisions =  "+hd.numberOfCollisions);
   }

   /**
    * Resets the hard disks model to its default state.
    */
   public void reset() {
      enableStepsPerDisplay(true);
      control.setValue("N", 16);
      control.setValue("Lx", 8.0);
      control.setValue("Ly", 8.0);
      control.setValue("initial configuration", "regular");
      initialize();
   }

   /**
    * Resets the hard disks model and the data graphs.
    *
    * This method is invoked using a custom button.
    */
   public void resetData() {
      hd.resetAverages();
      GUIUtils.clearDrawingFrameData(false); // clears old data from the plot frames
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {  // set up animation control structure using this class
      SimulationControl control = SimulationControl.createApp(new HardDisksApp());
      control.addButton("resetData", "Reset Data");
   }
}
