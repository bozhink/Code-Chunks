package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.display3d.simple3d.*;
import  org.opensourcephysics.frames.*;


/**
 * RigidBodySpaceView shows the rigid body as seen from the intertial laboratory frame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/10/2005
 */
public class FreeRotationSpaceView {
  Element ellipsoid = new ElementEllipsoid();
  Element omega = new ElementArrow();
  Element angularMomentum = new ElementArrow();
  ElementTrail omegaTrace = new ElementTrail();
  Display3DFrame frame = new Display3DFrame("Space view");
  FreeRotation rigidBody;
  double scale = 1;

  /**
   * Constucts space view for the given rigid body.
   * A space view shows the rigid body as seen from the intertial laboratory frame.
   * @param _rigidBody RigidBody
   */
  public FreeRotationSpaceView (FreeRotation _rigidBody) {      // eliminate _rigidBody and use this
    rigidBody = _rigidBody;
    frame.setSize(600, 600);
    frame.setDecorationType(VisualizationHints.DECORATION_AXES);
    omega.getStyle().setFillColor(java.awt.Color.RED);
    omegaTrace.getStyle().setLineColor(java.awt.Color.RED);
    angularMomentum.getStyle().setFillColor(java.awt.Color.GREEN);
    ellipsoid.setTransformation(rigidBody.getTransformation());
    frame.addElement(ellipsoid);
    frame.addElement(omega);
    frame.addElement(angularMomentum);
    frame.addElement(omegaTrace);
  }

  /**
   * Initializes the space view by setting the scale and clearing traces.
   *
   * @param a double
   * @param b double
   * @param c double
   */
  void initialize (double a, double b, double c) {
    ellipsoid.setSizeXYZ(2*a, 2*b, 2*c);
    scale = Math.max(Math.max(3*a, 3*b), 3*c);                  // bounding dimension for space frame
    frame.setPreferredMinMax(-scale, scale, -scale, scale, -scale, scale);
    omegaTrace.clear();
    update();
  }

  /**
   * Updates the space view when the orientation of the rigid body changes.
   */
  void update () {
    ellipsoid.setTransformation(rigidBody.getTransformation());
    double[] vec = ellipsoid.toSpaceFrame(rigidBody.getBodyFrameOmega());
    double norm = Math.sqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
    norm = Math.max(norm, 1.0e-6);
    double s = 0.75*scale/norm;
    omega.setSizeXYZ(s*vec[0], s*vec[1], s*vec[2]);
    omegaTrace.addPoint(s*vec[0], s*vec[1], s*vec[2]);
    vec = ellipsoid.toSpaceFrame(rigidBody.getBodyFrameAngularMomentum());
    // vec = rigidBody.getSpaceFrameAngularMomentum();
    norm = Math.sqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
    norm = Math.max(norm, 1.0e-6);
    s = 0.75*scale/norm;
    angularMomentum.setSizeXYZ(s*vec[0], s*vec[1], s*vec[2]);
    frame.repaint();
  }
}



