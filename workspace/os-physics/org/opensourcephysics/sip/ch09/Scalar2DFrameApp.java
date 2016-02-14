package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.frames.Scalar2DFrame;

/**
 * Tests the Scalar2DFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Scalar2DFrameApp {
  final static int SIZE=16; // array size
  public static void main(String[] args) {
    Scalar2DFrame frame = new Scalar2DFrame("x", "y", "Scalar Field");
    double[][] data = new double[16][16];
    frame.setAll(data,-10, 10, -10, 10);
    // generate sample data
    for(int i = 0;i<SIZE;i++) {
      double x = frame.indexToX (i);
      for(int j = 0;j<SIZE;j++) {
        double y = frame.indexToY(j);
        data[i][j] = x*y;
      }
    }
    frame.setAll(data);
    frame.setVisible(true);
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
  }
}
