package  org.opensourcephysics.sip.ch17;


/**
 * SpinningTop solves the Euler equations for a spinning top.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class FreeRotation extends RigidBody {
  FreeRotationSpaceView spaceView = new FreeRotationSpaceView(this);

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
    spaceView.update();
  }

  /**
   * Initializes the space view by setting the inertia and initializing the space view.
   *
   * @param a double
   * @param b double
   * @param c double
   */
  void setSize (double a, double b, double c) {
    setOrientation(new double[] {
      1, 0, 0, 0
    });         // put object back into standard orientation
    I1 = (b*b + c*c)/5;
    I2 = (a*a + c*c)/5;
    I3 = (b*b + a*a)/5;
    updateVectors();
    spaceView.initialize(a, b, c);
  }
}



