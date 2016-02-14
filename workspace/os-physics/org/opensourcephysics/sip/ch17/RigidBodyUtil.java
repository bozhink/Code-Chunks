package  org.opensourcephysics.sip.ch17;


/**
 * A utility class for rigid bodies to handle conversions between the space frame and the body frame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
class RigidBodyUtil {

  private RigidBodyUtil () {
  }             // prohibit instantiation

  /**
   * Normalizes the quaternion.
   *
   * @param state
   */
  static void normalize (double[] state) {
    double norm = 1/Math.sqrt(state[0]*state[0] + state[2]*state[2] + state[4]*state[4] + state[6]*state[6]);
    state[0] *= norm;
    state[2] *= norm;
    state[4] *= norm;
    state[6] *= norm;
  }

  /**
   * Converts a vector from the space frame to the body frame.
   *
   * @param state the current state of the body
   * @param vec the vector to be converted
   */
  static void spaceToBody (double[] state, double[] vec) {
    // use components for clarity
    double q0 = state[0], q1 = state[2], q2 = state[4], q3 = state[6];
    double v0 = (0.5 - q2*q2 - q3*q3)*vec[0] + (q1*q2 + q0*q3)*vec[1] + (q1*q3 - q0*q2)*vec[2];
    double v1 = (q1*q2 - q0*q3)*vec[0] + (0.5 - q1*q1 - q3*q3)*vec[1] + (q2*q3 + q0*q1)*vec[2];
    double v2 = (q1*q3 + q0*q2)*vec[0] + (q2*q3 - q0*q1)*vec[1] + (0.5 - q1*q1 - q2*q2)*vec[2];
    vec[0] = 2*v0;
    vec[1] = 2*v1;
    vec[2] = 2*v2;
  }

  /**
   * Converts a vector from the body fram to the space frame.
   *
   * @param state the current state of the body
   * @param vec the vector to be converted
   */
  static void bodyToSpace (double[] state, double[] vec) {
    // use q components for clarity
    double q0 = state[0], q1 = state[2], q2 = state[4], q3 = state[6];
    double v0 = (0.5 - q2*q2 - q3*q3)*vec[0] + (q1*q2 - q0*q3)*vec[1] + (q1*q3 + q0*q2)*vec[2];
    double v1 = (q1*q2 + q0*q3)*vec[0] + (0.5 - q1*q1 - q3*q3)*vec[1] + (q2*q3 - q0*q1)*vec[2];
    double v2 = (q1*q3 - q0*q2)*vec[0] + (q2*q3 + q0*q1)*vec[1] + (0.5 - q1*q1 - q2*q2)*vec[2];
    vec[0] = 2*v0;
    vec[1] = 2*v1;
    vec[2] = 2*v2;
  }
}



