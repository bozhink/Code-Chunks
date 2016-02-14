package org.opensourcephysics.sip.ch07;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.PlotFrame;

/**
 * Simulates nuclear decay
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class NuclearDecayApp extends AbstractSimulation {

   Nuclei nuclei = new Nuclei();
   PlotFrame plotFrame = new PlotFrame("Time", "Number of unstable nuclei", "Nuclear decay data");
   int trials;                                                                                     // number of trials

   /**
    *   Gets parameters and initializes model
    */
   public void initialize() {
      nuclei.n0 = control.getInt("Initial number of unstable nuclei");
      nuclei.p = control.getDouble("Decay probability");
      nuclei.tmax = control.getInt("Maximum time to collect data");
      nuclei.initialize();
      plotFrame.clearData();
      trials = 0;
   }

   /**
    *   Does nuclear decay trials
    */
   public void doStep() {
      trials++;
      nuclei.step();
      plotFrame.setMessage("trials = "+trials);
   }

   /**
    *  Plots data when user stops thread
    */
   public void stop() {
      plotFrame.clearData();
      for(int t = 0; t<=nuclei.tmax; t++) {
         plotFrame.append(0, 1.0*t, nuclei.n[t]*1.0/trials);
      }
      plotFrame.render();
   }

   /**
    *  Resets to default values
    */
   public void reset() {
      control.setValue("Initial number of unstable nuclei", 10000);
      control.setValue("Decay probability", 0.001);
      control.setValue("Maximum time to collect data", 100);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new NuclearDecayApp());
   }
}
