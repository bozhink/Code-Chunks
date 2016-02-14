package org.opensourcephysics.sip.ch15;
import org.opensourcephysics.controls.*;

/**
 * IdealDemonApp simulates the microcanonical Monte Carlo of the ideal classical gas in one dimension.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class IdealDemonApp extends AbstractSimulation {
   IdealDemon idealGas = new IdealDemon();

   public void initialize() {
      idealGas.N =  control.getInt("number of spins N");
      idealGas.systemEnergy = control.getDouble("desired total energy");
      idealGas.delta = control.getDouble("maximum velocity change");
      idealGas.initialize();
   }

   public void doStep() {
      idealGas.doOneMCStep();
   }

   public void stop() {
      double norm = 1.0/(idealGas.mcs*idealGas.N);
      control.println("mcs = " + idealGas.mcs);
      control.println("<Ed> = " + idealGas.demonEnergyAccumulator*norm);
      control.println("<E> = " + idealGas.systemEnergyAccumulator*norm);
      control.println("acceptance ratio = " + idealGas.acceptedMoves*norm);
   }

   public void reset() {
      control.setValue("number of spins N", 40);
      control.setValue("desired total energy", 40);
      control.setValue("maximum velocity change", 2.0);
   }

   public void resetData() {
      idealGas.resetData();
      idealGas.delta = control.getDouble("delta");
      control.clearMessages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new IdealDemonApp());
      control.addButton("resetData","Reset Data"); //
   }
}
