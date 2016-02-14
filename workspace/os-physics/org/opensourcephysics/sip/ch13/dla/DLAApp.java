package org.opensourcephysics.sip.ch13.dla;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * DLAApp displays Diffusion Limited Aggregation (DLA) in a frame.
 *
 * Add code to plot the mass distribution in the stopRunning method.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 */
public class DLAApp extends AbstractSimulation {

   DLA model;
   // uncomment the next line to create a plot.
   //PlotFrame plotFrame = new PlotFrame("ln r", "ln M", "Mass Distribution");
   DisplayFrame displayFrame = new DisplayFrame("DLA Model");
   long startTime=0;

   /**
    * Constructs the DLAApp.
    */
   public DLAApp() {
      model = new DLA();
      displayFrame.addDrawable(model);
   }

   public void initialize() {
      model.L = control.getInt("L");
      model.initialize();
      displayFrame.setPreferredMinMax(-5, model.L+5, -5, model.L+5);
      //plotFrame.showDataTable(true);  uncomment to display table by default
   }

   public void doStep() {
      model.step();
   }

   public void startRunning(){
      delayTime = control.getInt("delay time (ms)");
      startTime = System.currentTimeMillis();
   }


   public void stopRunning() {
      int counter=model.numberOfParticles;
      control.println("Number of particles = "+model.numberOfParticles);
      float dt = (float) (System.currentTimeMillis()-startTime)/counter;
      control.println("ms per walker="+dt);
      // add code to compute the mass distribution here
   }

   public void reset() {
      control.setValue("L", 50);
      enableStepsPerDisplay(true);
      initialize();
   }

   public static void main(String[] args) {
      SimulationControl.createApp(new DLAApp());
   }
}
