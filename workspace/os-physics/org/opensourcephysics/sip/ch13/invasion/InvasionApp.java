package org.opensourcephysics.sip.ch13.invasion;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * InvasionApp models a cluster formed by invasion percolation on a lattice.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 06/21/05
 */
public class InvasionApp extends AbstractSimulation {
    LatticeFrame latticeFrame = new LatticeFrame("x","y","Invasion Percolation");
    PlotFrame  plotFrame = new PlotFrame("r","P(r)","Site Distribution");
    Invasion model = new Invasion(latticeFrame);

   public void initialize() {
     int Ly = control.getInt("Ly");
     model.Ly = Ly;
     latticeFrame.resizeLattice(2*Ly,Ly);
     model.initialize();
   }

   public void doStep() {
      model.step();
    }


   public void reset() {
      control.setValue("Ly", 20);
   }

   public void distribution() {
     plotFrame.clearData();
     model.computeDistribution(plotFrame);
     plotFrame.repaint();
   }


   public static void main (String[] args) {
      // set up animation control structure using this class
      SimulationControl control = SimulationControl.createApp(new InvasionApp());
      control.addButton("distribution","Distribution");
   }
}
