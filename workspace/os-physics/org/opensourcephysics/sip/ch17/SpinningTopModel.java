package  org.opensourcephysics.sip.ch17;


/**
 * SpinningTopModel solves the Euler equations for a spinning top.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class SpinningTopModel extends RigidBodyModel {
  SpinningTopSpaceView spaceView = new SpinningTopSpaceView(this);

  void setInertia (double Is, double Iz) {
    I1 = Is;
    I2 = Is;
    I3 = Iz;
    setOrientation(new double[] {
      1/Math.sqrt(2), 1/Math.sqrt(2), 0, 0
    });         // orient top along y axis
    spaceView.initialize();
  }

  /**
   * Advances the time be solving the differential equation.
   */
  public void advanceTime () {
    super.advanceTime();
    spaceView.update();
  }

  /**
   * Sets the body frame angular velocity.
   *
   * @param wx
   * @param wy
   * @param wz
   */
  void setBodyFrameOmega (double[] omega) {
    super.setBodyFrameOmega(omega);
    spaceView.initialize();
  }

  /**
   * Computes the torque in the body frame.
   *
   * @param state
   */
  void computeBodyFrameTorque (double[] state) {
    double[] vec = new double[] {
      0, 0, 1
    };          // external force in space frame
    RigidBodyUtil.spaceToBody(state, vec);
    t1 = -vec[1];               // torque components declared in RigidBodyModel
    t2 = vec[0];
    t3 = 0;
  }
}



