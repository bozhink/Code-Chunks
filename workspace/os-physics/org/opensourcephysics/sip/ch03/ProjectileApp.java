package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * ProjectileApp solves and displays the time evolution of a projectile by stepping a projectile model.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class ProjectileApp extends AbstractSimulation {

   PlotFrame plotFrame = new PlotFrame("Time", "x,y", "Position versus time");
   Projectile projectile = new Projectile();
   PlotFrame animationFrame = new PlotFrame("x", "y", "Trajectory");
   public ProjectileApp() {
      animationFrame.addDrawable(projectile);
      plotFrame.setXYColumnNames(0, "t", "x");
      plotFrame.setXYColumnNames(1, "t", "y");
   }

   /**
    * Initializes the simulation.
    */
   public void initialize() {
      double dt = control.getDouble("dt");
      double x = control.getDouble("initial x");
      double vx = control.getDouble("initial vx");
      double y = control.getDouble("initial y");
      double vy = control.getDouble("initial vy");
      projectile.setState(x, vx, y, vy);
      projectile.setStepSize(dt);
      double size = (vx*vx+vy*vy)/10; // estimate of size needed for display
      animationFrame.setPreferredMinMax(-1, size, -1, size);
   }

   /**
    * Does a time step.
    */
   public void doStep() {
      plotFrame.append(0, projectile.state[4], projectile.state[0]);      // x vs time data added
      plotFrame.append(1, projectile.state[4], projectile.state[2]);      // y vs time data added
      animationFrame.append(0, projectile.state[0], projectile.state[2]); // trajectory data added
      projectile.step();                                                  // advance the state by one time step
   }

   /**
    * Resets the simulation.
    */
   public void reset() {
      control.setValue("initial x", 0);
      control.setValue("initial vx", 10);
      control.setValue("initial y", 0);
      control.setValue("initial vy", 10);
      control.setValue("dt", 0.01);
      enableStepsPerDisplay(true);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new ProjectileApp());
   }
}
