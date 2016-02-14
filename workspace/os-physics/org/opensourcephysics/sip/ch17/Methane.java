package  org.opensourcephysics.sip.ch17;

import  java.awt.*;
import  org.opensourcephysics.display.*;


/**
 * Methane implements a visualization of the methane molecule (CH_4).
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class Methane implements Drawable {
  static final double cos30 = Math.cos(Math.PI/6);              // cosine of 30 degrees
  static final double sin30 = Math.sin(Math.PI/6);              // sine of 30 degrees
  static final double h = Math.sqrt(1.0 - 4.0*cos30*cos30/9.0); // trapezoid height
  double[][] atoms = new double[5][];
  Circle circle = new Circle();

  /**
   * Creates a Methane model in the standard position.
   */
  public Methane () {
    // atom locations in 3D homogeneous coordinates
    atoms[0] = new double[] {
      0, 0, 0, 1
    };          // C atom at origin
    atoms[1] = new double[] {
      0, 0, 0.75*h, 1
    };          // H atom on z axis
    atoms[2] = new double[] {
      2.0*cos30/3.0, 0, -0.25*h, 1
    };          // H atom
    atoms[3] = new double[] {
      -cos30/3.0, sin30, -0.25*h, 1
    };          // H atom
    atoms[4] = new double[] {
      -cos30/3.0, -sin30, -0.25*h, 1
    };          // H atom
  }

  /**
   * Transforms each atoms coordinates.
   *
   * @param t Transformation
   */
  void transform (Rotation3D t) {
    for (int i = 0, n = atoms.length; i < n; i++) {
      t.direct(atoms[i]);
    }
  }

  /**
   * Draws the methane molecule using orthographic projection onto xy plane.
   * @param panel DrawingPanel
   * @param g Graphics
   */
  public void draw (DrawingPanel panel, Graphics g) {
    g.setColor(Color.black);
    int x0 = panel.xToPix(0);
    int y0 = panel.yToPix(0);
    for (int i = 0, n = atoms.length; i < n; i++) {
      int xpix = panel.xToPix(atoms[i][0]);
      int ypix = panel.yToPix(atoms[i][1]);
      g.drawLine(x0, y0, xpix, ypix);
    }
    for (int i = 0, n = atoms.length; i < n; i++) {
      circle.setXY(atoms[i][0], atoms[i][1]);
      circle.draw(panel, g);
    }
  }
}



