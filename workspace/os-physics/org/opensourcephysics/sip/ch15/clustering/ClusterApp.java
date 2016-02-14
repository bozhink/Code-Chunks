/* Revised by JT 12/30/04 */

package org.opensourcephysics.sip.ch15.clustering;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class ClusterApp extends AbstractSimulation {
   Cluster potts = new Cluster();
   DisplayFrame displayFrame = new DisplayFrame("Potts cluster Model");
   PlotFrame plotFrame = new  PlotFrame("time", "M", "Potts cluster model"); ;

   public ClusterApp() {
       displayFrame.addDrawable(potts);
   }

   public void initialize() {
      enableStepsPerDisplay(true);   // allow user to speed up simulation
      potts.temperature = control.getDouble("temperature");
      potts.L = control.getDouble("L");
      potts.initialize();
      resetData();
      plotFrame.clearData();
      displayFrame.setPreferredMinMax(-5, (int)potts.L+5,-5,(int)potts.L+5);
      plotFrame.show();
     }

   public void doStep() {
      potts.doOneMCStep();
      plotFrame.append(0, potts.mcs, potts.magnetization*1.0);
   }

   public void stopAnimation() {
      super.stopAnimation();
      double norm = 1.0/(potts.mcs*potts.N);
      control.println("mcs = " + potts.mcs);
      control.println("acceptance ratio = " + potts.acceptedMoves*norm);
      control.println("<M> = " + potts.magnetizationAccumulator/potts.mcs);
      control.println("Susceptibility = " + potts.susceptibility());
   }

   public void reset() {
      control.setValue("L", 20);
      control.setAdjustableValue("temperature", 1.0);
   }
   
   public void startRunning() { // gets time step
         double temperature = control.getDouble("temperature"); 
         if(temperature != potts.temperature) {
            potts.temperature = temperature;
            potts.beta = 1.0/potts.temperature;
            resetData();
         }
   }


   public void resetData() {
      potts.resetData();
      plotFrame.clearData();
      control.clearMessages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new ClusterApp()); 
      control.addButton("resetData","resetData");
   }
}