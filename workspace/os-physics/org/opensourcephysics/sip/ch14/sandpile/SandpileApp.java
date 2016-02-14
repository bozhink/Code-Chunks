package org.opensourcephysics.sip.ch14.sandpile;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * SandpileApp simulates and displays an idealized 2D model of a sandpile.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */
public class SandpileApp extends AbstractSimulation {
   Sandpile sandpile = new Sandpile();
   LatticeFrame height = new LatticeFrame("x", "y","Sandpile");
   PlotFrame plotFrame = new PlotFrame("ln s", "ln N", "Distribution of toppled sites");

   public SandpileApp() {
      height.setIndexedColor(0, java.awt.Color.WHITE);
      height.setIndexedColor(1, java.awt.Color.BLUE);
      height.setIndexedColor(2, java.awt.Color.GREEN);
      height.setIndexedColor(3, java.awt.Color.RED);
      height.setIndexedColor(4, java.awt.Color.BLACK);
   }

   public void initialize() {
      sandpile.L = control.getInt("L");
      height.setPreferredMinMax(0,sandpile.L,0,sandpile.L);
      sandpile.initialize(height);
   }

   public void doStep() {
      sandpile.step();
   }

   public void stop() {
      super.stop();
      plotFrame.clearData();
      for(int s = 1; s < sandpile.distribution.length;s++) {
       if(sandpile.distribution[s] > 0) {   plotFrame.append(0,Math.log(s),Math.log(sandpile.distribution[s]*1.0/sandpile.numberOfGrains));
       }
      }
      plotFrame.render();
   }

   public void reset() {
      control.setValue("L", 10);
      enableStepsPerDisplay(true);
   }

   public void resetAverages() {
      sandpile.resetAverages();
   }

   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new SandpileApp());
      control.addButton("resetAverages","resetAverages");
   }
}
