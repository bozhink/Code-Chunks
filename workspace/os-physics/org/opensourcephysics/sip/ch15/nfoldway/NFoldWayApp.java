/* Revised by JT 12/30/04 */

package org.opensourcephysics.sip.ch15.nfoldway;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class NFoldWayApp extends AbstractSimulation {
   NFoldWay ising = new NFoldWay();
   DisplayFrame displayFrame = new DisplayFrame("Ising Model");
   PlotFrame plotFrame = new  PlotFrame("time", "E and M", "Ising model"); ;

   public NFoldWayApp() {
       displayFrame.addDrawable(ising);
   }

   public void initialize() {
      enableStepsPerDisplay(true);   // allow user to speed up simulation
      ising.temperature = control.getDouble("temperature");
      ising.field = control.getDouble("magnetic field");
      ising.initialize(control.getInt("L"));
      resetData();
      displayFrame.setPreferredMinMax(-5, ising.L+5,-5,ising.L+5);
     }

   public void doStep() {
      ising.doOneMCStep();
      plotFrame.append(0, ising.totalTime, ising.magnetization*1.0/ising.N);
      plotFrame.append(1, ising.totalTime, ising.energy*1.0/ising.N);
   }

   public void stop() {
      double norm = 1.0/(ising.totalTime*ising.N);
      control.println("<E> = " + ising.energyAccumulator*norm);
      control.println("Specific heat = " + ising.specificHeat());
      control.println("<M> = " + ising.magnetizationAccumulator*norm);
      control.println("Susceptibility = " + ising.susceptibility());
      control.println("mcs = " + ising.mcs + " time = " + ising.totalTime);
   }

   public void reset() {
      control.setValue("L", 32);
      control.setValue("temperature", ising.criticalTemperature);
      control.setValue("magnetic field", 0);
   }

   public void resetData() {
      ising.resetData();
      plotFrame.clearData();
      control.clearMessages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new NFoldWayApp());
      control.addButton("resetData","resetData");
   }
}
