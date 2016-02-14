package org.opensourcephysics.sip.ch15;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * IsingDemonApp simulates a one-dimensional IsingDemon model.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class IsingDemonApp extends AbstractSimulation {
   LatticeFrame displayFrame = new LatticeFrame("1D Ising Model");
   IsingDemon ising1D = new IsingDemon(displayFrame);
   PlotFrame plotFrame = new PlotFrame("E", "ln P", "Boltzmann distribution");

   public void initialize() {
      ising1D.systemEnergy = control.getInt("Desired energy of system");
      ising1D.initialize(control.getInt("N"));
      resetData();
      displayFrame.setPreferredMinMax(0,ising1D.N,-1,2);
   }

   public void doStep() {
      ising1D.doOneMCStep();
   }

   public void stop() {
      plotFrame.clearData();
      double norm = 1.0/(ising1D.mcs*ising1D.N);
      for(int i = 0; i < ising1D.N; i++) {
         if(ising1D.demonEnergyDistribution[i] > 0) {
            plotFrame.append(0,i,Math.log(norm*ising1D.demonEnergyDistribution[i]));
         }
      }
      plotFrame.render();
      control.println("mcs = " + ising1D.mcs);
      control.println("<Ed> = " + ising1D.demonEnergyAccumulator*norm);
      control.println("acceptance probability = " + ising1D.acceptedMoves*norm);
      control.println("<E> = " + ising1D.systemEnergyAccumulator*norm);
      control.println("Temperature = " + ising1D.temperature());
      control.println("<M> = " + ising1D.mAccumulator*norm);
      control.println("<M^2> = " + ising1D.m2Accumulator*norm);
   }

   public void reset() {
      control.setValue("N", 100);
      control.setValue("Desired energy of system", -20);
   }

   public void resetData() {
      ising1D.resetData();
      control.clearMessages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new IsingDemonApp());
      control.addButton("resetData","Reset Data");
   }
}
