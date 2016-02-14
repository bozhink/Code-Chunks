package org.opensourcephysics.sip.ch07;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.PlotFrame;

/**
 * Simulates use of Fermat's principle to find light path that minimizes time
 *
 *  @author Jan Tobochnik, Wolfgang Christian,  Harvey Gould
 *  @version 1.0  revised 04/21/05
 */
public class FermatApp extends AbstractSimulation {

   Fermat medium = new Fermat();
   PlotFrame path = new PlotFrame("x", "y", "Light path");

   /**
    * Sets path frame properties
    */
   public FermatApp() {
      path.setAutoscaleX(true);
      path.setAutoscaleY(true);
      path.setConnected(true); // draw lines between points
   }

   /**
    * Gets parameters and initializes medium
    */
   public void initialize() {
      medium.dn = control.getDouble("Change in index of refraction");
      medium.N = control.getInt("Number of media segments");
      medium.initialize();
      path.clearData();
   }

   /**
    * Makes one change in path at a time
    */
   public void doStep() {
      medium.step();
      path.clearData();
      for(int i = 0; i<=medium.N; i++) {
         path.append(0, i, medium.y[i]);
      }
      path.setMessage(medium.steps+" steps");
   }

   /**
    * Resets to default values
    */
   public void reset() {
      control.setValue("Change in index of refraction", 0.5);
      control.setValue("Number of media segments", 2);
      path.clearData();
      enableStepsPerDisplay(true);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new FermatApp());
   }
}
