package org.opensourcephysics.sip.ch17;
import org.opensourcephysics.displayejs.*;
import org.opensourcephysics.frames.*;

/**
 * RigidBodySpaceView shows the rigid body as seen from the intertial laboratory frame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class RigidBodySpaceView {
  InteractiveSphere ellipsoid = new InteractiveSphere();
  InteractiveArrow omega = new InteractiveArrow();
  InteractiveArrow angularMomentum = new InteractiveArrow();
  InteractiveTrace omegaTrace = new InteractiveTrace();
  InteractiveTrace momentumTrace = new InteractiveTrace();
  EJSFrame frame = new EJSFrame("Space View");
  RigidBody rigidBody;
  double scale=1;

  /**
   * Constucts space view for the given rigid body.
   * A space view shows the rigid body as seen from the intertial laboratory frame.
   * @param _rigidBody RigidBodyModel
   */
  public RigidBodySpaceView(RigidBody _rigidBody) {
    rigidBody = _rigidBody;
    frame.setSize(600, 600);
    frame.setDecorationType(DrawingPanel3D.DECORATION_AXES);
    omega.getStyle().setFillPattern(java.awt.Color.RED);
    omegaTrace.getStyle().setEdgeColor(java.awt.Color.RED);
    angularMomentum.getStyle().setFillPattern(java.awt.Color.GREEN);
    momentumTrace.getStyle().setEdgeColor(java.awt.Color.GREEN);
    ellipsoid.setTransformation(rigidBody.getQuaternionRotation());
    frame.addDrawable(ellipsoid);
    frame.addDrawable(omega);
    frame.addDrawable(angularMomentum);
    frame.addDrawable(omegaTrace);
    frame.addDrawable(momentumTrace);
    frame.repaint();
    frame.setVisible(true);
  }

  /**
   * Initializes the space view by setting the scale and clearing traces.
   */
  void initialize() {
    double dx = 1/Math.sqrt(rigidBody.I1); // dimension of ellipsoid is inverse to inertia
    double dy = 1/Math.sqrt(rigidBody.I2);
    double dz = 1/Math.sqrt(rigidBody.I3);
    ellipsoid.setSizeXYZ(dx,dy,dz);
    scale = Math.max(Math.max(2*dx,2*dy),2*dz); // bounding dimension
    frame.setPreferredMinMax( -scale, scale, -scale, scale, -scale, scale);
    omegaTrace.clear();
    momentumTrace.clear();
    update();
  }

  /**
   * Updates the space view when the orientation of the rigid body changes.
   */
  void update() {
    ellipsoid.setTransformation(rigidBody.getQuaternionRotation());
    double[] vec = rigidBody.getSpaceFrameOmega();
    double norm = Math.sqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
    norm = Math.max(norm, 1.0e-6);
    double s = 1.25*scale/norm;
    omega.setSizeXYZ(s*vec[0], s*vec[1], s*vec[2]);
    omegaTrace.addPoint(s*vec[0], s*vec[1], s*vec[2]);
    vec = rigidBody.getSpaceFrameAngularMomentum();
    norm = Math.sqrt(vec[0]*vec[0]+vec[1]*vec[1]+vec[2]*vec[2]);
    norm = Math.max(norm,1.0e-6);
    s = 1.25*scale/norm;
    angularMomentum.setSizeXYZ(s*vec[0], s*vec[1], s*vec[2]);
    momentumTrace.addPoint(s*vec[0], s*vec[1], s*vec[2]);
    frame.repaint();
  }
}
