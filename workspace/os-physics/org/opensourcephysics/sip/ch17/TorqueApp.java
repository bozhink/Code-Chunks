package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.controls.*;
import  org.opensourcephysics.display3d.simple3d.*;
import  org.opensourcephysics.frames.Display3DFrame;
import  org.opensourcephysics.numerics.*;


public class TorqueApp extends AbstractSimulation {
  Display3DFrame frame = new Display3DFrame(" Rotation test");
  Element body = new ElementBox();              // shows rigid body
  Element shaft = new ElementCylinder();        // shows shaft
  Element arrowOmega = new ElementArrow();      // shows angular velocity of shaft
  Element arrowL = new ElementArrow();          // shows angular momentum of body
  Element arrowTorque = new ElementArrow();     // shows torque on shaft
  Group shaftGroup = new Group();               // contains shaft and arrowOmega
  Group bodyGroup = new Group();                // contains body, arrowL, and arrowTorque
  double theta = 0, omega = 0.1, dt = 0.1;
  double Ixx = 1.0, Iyy = 1.0, Izz = 2.0;       // principal moments of inertia

  public TorqueApp () {
    frame.setDecorationType(VisualizationHints.DECORATION_AXES);
    body.setSizeXYZ(1.0, 1.0, 0.1);             // thin rectangle
    shaft.setSizeXYZ(0.1, 0.1, 0.8);
    arrowL.getStyle().setLineColor(java.awt.Color.MAGENTA);
    arrowTorque.getStyle().setLineColor(java.awt.Color.CYAN);
    bodyGroup.addElement(body);
    bodyGroup.addElement(arrowTorque);
    bodyGroup.addElement(arrowL);
    shaftGroup.addElement(bodyGroup);
    shaftGroup.addElement(arrowOmega);
    shaftGroup.addElement(shaft);
    frame.addElement(shaftGroup);
  }

  void computeVectors () {
    // convert omega to body frame
    double[] omega = body.toBodyFrame(new double[] {
      0, 0, this.omega
    });
    double[] angularMomentum = new double[] {
      omega[0]*Ixx, omega[1]*Iyy, omega[2]*Izz
    };          // L in body frame
    // torque is computed in body frame
    double[] torque = VectorMath.cross3D(omega, angularMomentum);
    arrowL.setSizeXYZ(angularMomentum);
    arrowTorque.setSizeXYZ(torque);
    // position torque arrow at tip of angular momentum
    arrowTorque.setXYZ(angularMomentum);
  }

  public void initialize () {
    omega = control.getDouble("omega");
    arrowOmega.setSizeXYZ(0, 0, omega);
    double tilt = control.getDouble("tilt");
    double cos = Math.cos(tilt/2), sin = Math.sin(tilt/2);
    Transformation rotation = new Quaternion(cos, sin, 0, 0);
    bodyGroup.setTransformation(rotation);
    computeVectors();
  }

  public void reset () {
    control.setValue("omega", "pi/4");
    control.setValue("tilt", "pi/5");
  }

  protected void doStep () {
    theta += omega*dt;
    double cos = Math.cos(theta/2), sin = Math.sin(theta/2);
    shaftGroup.setTransformation(new Quaternion(cos, 0, 0, sin));
    computeVectors();
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    SimulationControl.createApp(new TorqueApp());
  }
}



