package org.opensourcephysics.sip.ch16;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.PlotFrame;

/**
 * QMWalkApp computes and displays the ground state of a quantum mechanical
 * system using the random walk Monte Carlo algorithm.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class QMWalkApp extends AbstractSimulation {
   PlotFrame phiFrame = new PlotFrame("x", "Phi_0", "Phi_0(x)");
   QMWalk qmwalk = new QMWalk();

   /**
    * Calculates the ground state wave function and displays the result.
    */
   public void initialize() {
      qmwalk.N = control.getInt("initial number of walkers"); 
      qmwalk.ds = control.getDouble("step size ds");
      qmwalk.numberOfBins = control.getInt("number of bins for wavefunction"); 
      qmwalk.initialize();
   }

   /**
    * One Monte Carlo step
    */
   public void doStep() {
      qmwalk.doMCS();
      phiFrame.clearData();
      phiFrame.append(0, qmwalk.xv, qmwalk.phi0);
      phiFrame.setMessage("E = "+decimalFormat.format(qmwalk.eAccum/qmwalk.mcs) + " N = " + qmwalk.N);
   }

   /**
    * Resets the calculation.
    */
   public void reset() {
      control.setValue("initial number of walkers", 50);
      control.setValue("step size ds", 0.1);
      control.setValue("number of bins for wavefunction", 100);
      enableStepsPerDisplay(true);
   }
   
   /**
    * Resets the accumulated data.
    */
   
   public void resetData() {
      qmwalk.resetData();
      phiFrame.clearData();
      phiFrame.repaint();
   }


   /**
    * Comand line entry point.
    * @param args
    */
   public static void main(String[] args) {
      SimulationControl control = SimulationControl.createApp(new QMWalkApp());
      control.addButton("resetData","Reset Data");
   }
}
