package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.controls.*;


/**
 * RigidBodyApp displays rigid body dynamics using quaternions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class FreeRotationApp extends AbstractSimulation {
  FreeRotation rigidBody = new FreeRotation();

  /**
   * Initializes the simulation by reading the parameters and initial conditions in the rigid body.
   */
  public void initialize () {
    double a = control.getDouble("ellipsoid a");
    double b = control.getDouble("ellipsoid b");
    double c = control.getDouble("ellipsoid c");
    double wx = control.getDouble("initial body wx");
    double wy = control.getDouble("initial body wy");
    double wz = control.getDouble("initial body wz");
    rigidBody.setSize(a, b, c);                 //sets size of ellipsoid
    rigidBody.setBodyFrameOmega(new double[] {
      wx, wy, wz
    });
  }

  /**
   * Does an simulation step by advancing the time and updating the space view.
   */
  protected void doStep () {
    rigidBody.advanceTime();
  }

  /**
   * Resets the simulation.
   */
  public void reset () {
    control.setValue("ellipsoid a", 4.0);
    control.setValue("ellipsoid b", 4.0);
    control.setValue("ellipsoid c", 1.0);
    control.setValue("initial body wx", 0.5);
    control.setValue("initial body wy", 0.0);
    control.setValue("initial body wz", 2.0);
    initialize();
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    SimulationControl.createApp(new FreeRotationApp());
  }
}



