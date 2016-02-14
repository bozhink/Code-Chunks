package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.controls.*;


/**
 * FeynmanPlateApp displays rigid body dynamics using quaternions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class FeynmanPlateApp extends AbstractSimulation {
  FeynmanPlate plate = new FeynmanPlate();

  /**
   * Initializes the simulation by reading  parameters and passing them to the rigid body model.
   */
  public void initialize () {
    plate.dt = control.getDouble("dt");
    plate.spaceL[0] = control.getDouble("Lx");
    plate.spaceL[1] = control.getDouble("Ly");
    plate.spaceL[2] = control.getDouble("Lz");
    plate.setInertia(1, 1, 2);                  // sets angular momentum of the place
  }

  /**
   * Does an simulation step by advancing the time and updating the space view.
   */
  protected void doStep () {
    plate.advanceTime();
  }

  /**
   * Resets the simulation.
   */
  public void reset () {
    control.setValue("Lx", 0.1);
    control.setValue("Ly", 0.0);
    control.setValue("Lz", 1.0);
    control.setValue("dt", 0.1);
    enableStepsPerDisplay(true);
    initialize();
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    SimulationControl.createApp(new FeynmanPlateApp());
  }
}



