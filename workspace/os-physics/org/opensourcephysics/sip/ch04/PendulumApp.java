package org.opensourcephysics.sip.ch04;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * PendulumApp solves and displays the time evolution of a pendulum by stepping a pendulum model.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class PendulumApp extends AbstractSimulation {

   PlotFrame plotFrame = new PlotFrame("Time", "Theta", "Theta versus time");
   Pendulum pendulum = new Pendulum();
   DisplayFrame displayFrame = new DisplayFrame("Pendulum");

   /**
    * Constructs the PendulumApp and intializes the display.
    */
   public PendulumApp() {
      displayFrame.addDrawable(pendulum);
      displayFrame.setPreferredMinMax(-1.2, 1.2, -1.2, 1.2);
   }

   /**
    * Initializes the simulation.
    */
   public void initialize() {
      double dt = control.getDouble("dt");
      double theta = control.getDouble("initial theta");
      double thetaDot = control.getDouble("initial dtheta/dt");
      pendulum.setState(theta, thetaDot);
      pendulum.setStepSize(dt);
   }

   /**
    * Does a time step.
    */
   public void doStep() {
      plotFrame.append(0, pendulum.state[2], pendulum.state[0]); // angle vs time data added
      pendulum.step();                                           // advances the state by one time step
   }

   /**
    * Resets the simulation.
    */
   public void reset() {
      pendulum.state[2] = 0; // set time = 0
      control.setValue("initial theta", 0.2);
      control.setValue("initial dtheta/dt", 0);
      control.setValue("dt", 0.1);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // creates a simulation control structure using this class
      SimulationControl.createApp(new PendulumApp());
   }
}
