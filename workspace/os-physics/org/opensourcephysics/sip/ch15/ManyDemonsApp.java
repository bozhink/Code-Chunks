package org.opensourcephysics.sip.ch15;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * ManyDemonsApp simulates the ManyDemons model.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class ManyDemonsApp extends AbstractSimulation {
   ManyDemons manyDemons = new ManyDemons();
   DisplayFrame displayFrame = new DisplayFrame("Many Demons");
   PlotFrame plotFrame = new PlotFrame("x", "T", "Temperature vs x");;

   public ManyDemonsApp() {
       displayFrame.addDrawable(manyDemons);
   }

   public void initialize() {
      enableStepsPerDisplay(true);
      manyDemons.N =  control.getInt("N");
      manyDemons.systemEnergy = control.getInt("systemEnergy");
      manyDemons.timeToAddEnergy = control.getInt("timeToAddEnergy");
      manyDemons.initialize();
      resetData();
      displayFrame.setPreferredMinMax(-5,5 + manyDemons.N,-5,5);
   }


   public void doStep() {
      manyDemons.step();
      plotFrame.clearData();
      for (int i = 1; i < manyDemons.N - 1; i++) {
         plotFrame.append(0, i, manyDemons.temperature(i));
      }
    }

   public void stop() {
      double norm = 1.0/(manyDemons.mcs*manyDemons.N);
      control.println("mcs = " + manyDemons.mcs + " Q = " + manyDemons.demonEnergyAccumulator[0]/manyDemons.mcs);
      control.println("acceptance ratio = " + manyDemons.acceptedMoves*norm
+ " System Energy = " + manyDemons.systemEnergyAccumulator*norm);
   }

   public void reset() {
      control.setValue("N", 52);
      control.setValue("systemEnergy", -20);
      control.setValue("timeToAddEnergy", 1);
   }

   public void resetData() {
      manyDemons.resetData();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new ManyDemonsApp());
      control.addButton("resetData","resetData");
   }
}
