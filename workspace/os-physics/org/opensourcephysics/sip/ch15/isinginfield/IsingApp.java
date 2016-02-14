/* Revised by JT 12/30/04 */

package org.opensourcephysics.sip.ch15.isinginfield;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class IsingApp extends AbstractSimulation {
   Ising ising = new Ising();
   DisplayFrame displayFrame = new DisplayFrame("Ising Model");
   PlotFrame plotFrame = new  PlotFrame("time", "E and M", "Ising model"); ;

   public IsingApp() {
       displayFrame.addDrawable(ising);
   }

   public void initialize() {
      enableStepsPerDisplay(true);   // allow user to speed up simulation
      ising.temperature = control.getDouble("temperature");
      ising.field = control.getDouble("field");
      ising.initialize(control.getInt("L"));
      resetData();
      displayFrame.setPreferredMinMax(-5, ising.L+5,-5,ising.L+5);
     }

   public void doStep() {
      ising.doOneMCStep();
      plotFrame.append(0, ising.mcs, ising.magnetization*1.0/ising.N);
      plotFrame.append(1, ising.mcs, ising.energy*1.0/ising.N);
   }

   public void stop() {
      double norm = 1.0/(ising.mcs*ising.N);
      control.println("mcs = " + ising.mcs);
      control.println("acceptance ratio = " + ising.acceptedMoves*norm);
      control.println("<E> = " + ising.energyAccumulator*norm);
      control.println("Specific heat = " + ising.specificHeat());
      control.println("<M> = " + ising.magnetizationAccumulator*norm);
      control.println("Susceptibility = " + ising.susceptibility());
   }

   public void reset() {
      control.setValue("L", 32);
      control.setValue("temperature", ising.criticalTemperature);
      control.setValue("field", 0);
      initialize();
   }

   public void resetData() {
      ising.resetData();
      plotFrame.clearData();
      control.clearMessages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new IsingApp());
      control.addButton("resetData","resetData");
   }
}
