package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.numerics.*;


/**
 * RigidBody models rigid body dynamics by solving  Euler's equations using an ODE solver.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class FeynmanPlate {
  Quaternion toBody = new Quaternion(1, 0, 0, 0);
  // spaceview displays the plate as seen from the laboratory
  FeynmanPlateView spaceView = new FeynmanPlateView(this);
  double[] spaceL = new double[3];              // space frame angular momentum
  double I1 = 1, I2 = 1, I3 = 1;                // default moments of inertia
  double wx = 0, wy = 0, wz = 0;                // angular velocity in the body frame
  double q0, q1, q2, q3;        // quaternion components
  double dt = 0.1;

  /**
   * Sets the orientation
   * @param q double[]
   */
  void setOrientation (double[] q) {
    double norm = Math.sqrt(q[0]*q[0] + q[1]*q[1] + q[2]*q[2] + q[3]*q[3]);
    q0 = q[0]/norm;
    q1 = q[1]/norm;
    q2 = q[2]/norm;
    q3 = q[3]/norm;
    toBody.setCoordinates(q0, q1, q2, q3);
    spaceView.initialize();
  }

  /**
   * Gets the transformation to the current position.
   * @return Quaternion
   */
  Transformation getTransformation () {
    toBody.setCoordinates(q0, q1, q2, q3);
    return  toBody;
  }

  /**
   * Sets the principal moments of inertia.
   *
   * @param I1 double
   * @param I2 double
   * @param I3 double
   */
  void setInertia (double I1, double I2, double I3) {
    setOrientation(new double[] {
      1, 0, 0, 0
    });         // default orientation
    this.I1 = I1;
    this.I2 = I2;
    this.I3 = I3;
    spaceView.initialize();
  }

  /**
   * Computes the omega components in the body frame.
   */
  void computeOmegaBody () {
    double[] bodyL = (double[])spaceL.clone();
    toBody.inverse(bodyL);
    wx = bodyL[0]/I1;
    wy = bodyL[1]/I2;
    wz = bodyL[2]/I3;
  }

  /**
   * Advances the time be solving the differential equation.
   */
  public void advanceTime () {
    computeOmegaBody();
    // compute quaternion rate of change
    double q0dot = 0.5*(-q1*wx - q2*wy - q3*wz);                // dq0/dt
    double q1dot = 0.5*(q0*wx - q3*wy + q2*wz);                 // dq1/dt
    double q2dot = 0.5*(q3*wx + q0*wy - q1*wz);                 // dq2/dt
    double q3dot = 0.5*(-q2*wx + q1*wy + q0*wz);                // dq3/dt
    // update quaternion
    q0 += q0dot*dt;
    q1 += q1dot*dt;
    q2 += q2dot*dt;
    q3 += q3dot*dt;
    double norm = 1/Math.sqrt(q0*q0 + q1*q1 + q2*q2 + q3*q3);   // normalize to eliminate drift
    q0 *= norm;
    q1 *= norm;
    q2 *= norm;
    q3 *= norm;
    toBody.setCoordinates(q0, q1, q2, q3);
    spaceView.update();
  }
}



