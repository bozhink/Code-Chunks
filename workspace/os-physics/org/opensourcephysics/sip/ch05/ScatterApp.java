package org.opensourcephysics.sip.ch05;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * ScatterApp displays the scattering trajectories of particles and computes differential cross sections.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class ScatterApp extends AbstractSimulation {
   PlotFrame frame = new PlotFrame("x", "y", "Trajectories");
   ScatterAnalysis analysis = new ScatterAnalysis();
   Scatter trajectory = new Scatter();
   double vx;  // speed of the incident particle
   double b, db;  // impact parameter and increment
   double bmax;  // maximum impact parameter

   /**
    * Constructs ScatterApp.
    */
   public ScatterApp() {
      frame.setPreferredMinMax(-5, 5, -5, 5);
      frame.setSquareAspect(true);
   }

   /**
    * Does a scattering computation for a single impact parameter.
    */
   public void doStep() {
      if(trajectory.calculateTrajectory(frame, b, vx)) {
         analysis.detectParticle(b, trajectory.getAngle());
      } else {
         control.println("Trajectory did not converge at b = "+b);
      }
      frame.setMessage("b = "+decimalFormat.format(b));
      b += db;  // increases the impact parameter
      frame.repaint();
      if(b>bmax) {
         control.calculationDone("Maximum impact parameter reached");
         analysis.plotCrossSection(b);
      }
   }

   /**
    * Initializes the animation after reading the values in the control.
    */
   public void initialize() {
      vx = control.getDouble("vx");
      bmax = control.getDouble("bmax");
      db = control.getDouble("db");
      b = db/2;  // starts b at average value of first interval 0->db
      // b will increment to 3*db/2, 5*db/2, 7*db/2, ...
      frame.setMessage("b = 0");
      frame.clearDrawables();  // removes old trajectories
      analysis.clear();
   }

   /**
    * Resets the scatter program its default state.
    */
   public void reset() {
      control.setValue("vx", 3);
      control.setValue("bmax", 0.25);
      control.setValue("db", 0.01);
      initialize();
   }

   /**
    * Start Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new ScatterApp());
   }
}
