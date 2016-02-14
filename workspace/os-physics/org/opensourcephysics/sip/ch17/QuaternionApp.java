package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.controls.*;
import  org.opensourcephysics.numerics.Quaternion;
import  org.opensourcephysics.frames.*;
import  org.opensourcephysics.display3d.simple3d.VisualizationHints;


/**
 * QuaternionApp demonstrates how to use quaternions to rotate objects.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class QuaternionApp extends AbstractCalculation {
  Display3DFrame frame = new Display3DFrame("Quaternion rotations");
  Quaternion transformation = new Quaternion(1, 0, 0, 0);
  BoxWithArrows box = new BoxWithArrows();

  /**
   * Constructs the QuaternionApp.
   */
  public QuaternionApp () {
    frame.setDecorationType(VisualizationHints.DECORATION_AXES);
    frame.setAllowQuickRedraw(false); // scene is simple, so draw it properly when rotating
    frame.setPreferredMinMax(-6, 6, -6, 6, -6, 6);
    box.setTransformation(transformation);
    frame.addElement(box);
  }

  /**
   * Does a calcuation by setting the transformation and applying the transformation to the box.
   */
  public void calculate () {
    double q0 = control.getDouble("q0");
    double q1 = control.getDouble("q1");
    double q2 = control.getDouble("q2");
    double q3 = control.getDouble("q3");
    transformation.setCoordinates(q0, q1, q2, q3);
    box.setTransformation(transformation);
  }

  /**
   * Resets the default values.
   * The default quaternion represents the identity transformation.
   */
  public void reset () {
    control.clearMessages();
    control.setValue("q0", 1);
    control.setValue("q1", 0);                  // initial orientation is along x axis
    control.setValue("q2", 0);
    control.setValue("q3", 0);
    calculate();
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    CalculationControl.createApp(new QuaternionApp());
  }
}



