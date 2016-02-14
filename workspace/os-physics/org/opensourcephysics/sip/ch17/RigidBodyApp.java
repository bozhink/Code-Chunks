package org.opensourcephysics.sip.ch17;
import org.opensourcephysics.controls.*;

/**
 * RigidBodyApp displays rigid body dynamics using quaternions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class RigidBodyApp extends AbstractSimulation {

   RigidBody rigidBody = new RigidBody(new double[]{1, 0, 0, 0});
   // The space view displays the rigid body as seen from the intertial laboratory frame.
   RigidBodySpaceView spaceView = new RigidBodySpaceView(rigidBody);

   /**
    * Initializes the simulation by reading the parameters and initial conditions in the rigid body.
    */
   public void initialize() {
      double Ix = control.getDouble("Ix");
      double Iy = control.getDouble("Iy");
      double Iz = control.getDouble("Iz");
      double wx = control.getDouble("wx");
      double wy = control.getDouble("wy");
      double wz = control.getDouble("wz");
      rigidBody.setInertia(new double[]{Ix, Iy, Iz});
      rigidBody.setBodyOmegaFromSpaceOmega(new double[]{wx, wy, wz});
      spaceView.initialize();
   }

   /**
    * Does an simulation step by advancing the time and updating the space view.
    */
   protected void doStep() {
      rigidBody.advanceTime();
      spaceView.update();
   }

   /**
    * Resets the simulation.
    */
   public void reset() {
      control.setValue("Ix", 1.0);
      control.setValue("Iy", 4.0);
      control.setValue("Iz", 4.0);
      control.setValue("wx", 0.5);
      control.setValue("wy", 0.5);
      control.setValue("wz", 0);
      rigidBody.setOrientation(new double[]{1, 0, 0, 0});
      initialize();
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new RigidBodyApp());
   }
}
