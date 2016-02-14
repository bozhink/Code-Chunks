package org.opensourcephysics.sip.ch15;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * IsingApp simulates a two-dimensional Ising model.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class IsingApp extends AbstractSimulation {
   Ising ising = new Ising();
   LatticeFrame displayFrame = new LatticeFrame("Ising Model");
   PlotFrame plotFrame = new  PlotFrame("time", "E and M", "Ising model"); ;

   public IsingApp() {
      plotFrame.setXYColumnNames(0,"mcs","M","magnetization");
      plotFrame.setXYColumnNames(1,"mcs","E","energy");
   }

   public void initialize() {
      ising.temperature = control.getDouble("temperature");
      ising.initialize(control.getInt("L"), displayFrame);
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
      control.println("acceptance probability = " + ising.acceptedMoves*norm);
      control.println("<E> = " + ising.energyAccumulator*norm);
      control.println("specific heat = " + ising.specificHeat());
      control.println("<M> = " + ising.magnetizationAccumulator*norm);
      control.println("susceptibility = " + ising.susceptibility());
   }

   public void startRunning(){
      ising.temperature = control.getDouble("temperature");
   }

   public void reset() {
      control.setValue("L", 32);
      control.setAdjustableValue("temperature", Ising.criticalTemperature);
      enableStepsPerDisplay(true);   // allow user to speed up simulation
   }

   public void resetData() {
      ising.resetData();
      plotFrame.clearData();
      plotFrame.repaint();
      control.clearMessages();
   }

   /**
 * Returns an XML.ObjectLoader to save and load data for this program.
 *
 * LJParticle data can now be saved using the Save menu item in the control.
 *
 * @return the object loader
 */
public static XML.ObjectLoader getLoader() {
   return new IsingLoader();
}


   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new IsingApp());
      control.addButton("resetData","Reset Data");
   }
}
