package org.opensourcephysics.sip.ch13.cca;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * CCAApp models Cluster-Cluster Aggregation
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 06/21/05
 */
public class CCAApp extends AbstractSimulation {

   CCA model = new CCA();
   DisplayFrame displayFrame = new DisplayFrame("x", "y", "Cluster-Cluster Aggregation");
   PlotFrame plotFrame = new PlotFrame("ln r", "ln M(r)", "Mass Distribution");

   /**
    * initialize animation
    *
    */
   public void initialize() {
      displayFrame.addDrawable(model);
      model.L = control.getInt("L");
      displayFrame.setPreferredMinMax(0, model.L, 0, model.L);
      model.numberOfParticles = control.getInt("N");
      model.initialize();
   }

   /**
    * Does a simulation step.
    */
   public void doStep() {
      if(model.numberOfClusters>1) {
         model.step();
      }
      displayFrame.setMessage("Number of clusters = "+model.numberOfClusters);
   }

   /**
    * Computes the distribution.
    */
   public void distribution() {
      plotFrame.clearData();
      model.boxCount();
      for(int cell = 1; cell<model.L; cell++) {
         if(model.box[cell]>0) {
            // use logarithmic scale
            plotFrame.append(0, Math.log(cell), Math.log(model.box[cell]));
         }
      }
      plotFrame.render();
   }

   /**
    * Resets the simulation.
    *
    */
   public void reset() {
      control.setValue("L", 50);
      control.setValue("N", 500);
   }

   /**
    * start application
    * @param args
    */
   public static void main(String[] args) {
      // set up animation control structure using this class
      SimulationControl control = SimulationControl.createApp(new CCAApp());
      control.addButton("distribution", "Distribution");
   }
}
