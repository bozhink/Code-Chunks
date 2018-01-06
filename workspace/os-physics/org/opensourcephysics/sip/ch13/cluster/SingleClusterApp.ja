package org.opensourcephysics.sip.ch13.cluster;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;
import java.awt.Color;

/**
 * Creates percolation cluster with probability p and computes mass distribution.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 06/21/05
 */
public class SingleClusterApp extends AbstractSimulation {

   SingleCluster cluster = new SingleCluster();
   PlotFrame plotFrame = new PlotFrame("ln r", "ln M", "Mass distribution");
   LatticeFrame latticeFrame = new LatticeFrame("Percolation cluster");
   int steps;
   public void initialize() {
      latticeFrame.setIndexedColor(0, Color.BLACK);   // not occupied or tested
      latticeFrame.setIndexedColor(1, Color.BLUE);    // occupied
      latticeFrame.setIndexedColor(2, Color.GREEN);   // perimeter or growth site
      latticeFrame.setIndexedColor(-1, Color.YELLOW); // permanently not occupied
      cluster.L = control.getInt("L");
      cluster.p = control.getDouble("p");
      cluster.initialize();
      latticeFrame.setAll(cluster.site);
   }

   public void doStep() {
      cluster.step();
      latticeFrame.setAll(cluster.site);
      latticeFrame.setMessage("n = "+cluster.occupiedNumber);
      if(cluster.perimeterNumber==0) {
         control.calculationDone("Computation done");
      }
   }

   public void stopRunning() {
      plotFrame.clearData();
      cluster.massDistribution();
      double massEnclosed = 0;
      int rPrint = 2;
      for(int r = 2; r<cluster.L/2; r++) {
         massEnclosed += cluster.mass[r];
         if(r==rPrint) { // use logarithmic scale
            plotFrame.append(0, Math.log(r), Math.log(massEnclosed));
            rPrint *= 2;
         }
      }
      plotFrame.setVisible(true);
   }

   public void reset() {
      control.setValue("L", 61);
      control.setValue("p", 0.5927);
      setStepsPerDisplay(10);
      enableStepsPerDisplay(true);
   }

   public static void main(String[] args) {
      SimulationControl.createApp(new SingleClusterApp());
   }
}
