package org.opensourcephysics.sip.ch02;
import org.opensourcephysics.controls.AbstractSimulation;
import org.opensourcephysics.controls.SimulationControl;

/**
 * SimulationApp demonstrates a SimulationControl.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/07/05
 */
public class SimulationApp extends AbstractSimulation {
  int counter = 0;

  /**
   * Does a simulation step by decrementing the counter.
   */
  public void doStep() {  // does a simulation step
    control.println("Counter = "+(counter--));
  }

  /**
   * Initializes the simulation by setting the counter variable
   */
  public void initialize() {
    counter = control.getInt("counter");
  }

  /**
   * Resets the simulation parameters to their intial state.
   */
  public void reset() {  // invoked when reset button is pressed
    control.setAdjustableValue("counter", 100);  // allows dt to be changed after initializaton
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main(String[] args) {
    // creates a simulation structure using this class
    SimulationControl.createApp(new SimulationApp());
  }
}
