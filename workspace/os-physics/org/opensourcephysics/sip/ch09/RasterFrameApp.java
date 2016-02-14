package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.frames.RasterFrame;

/**
 * Tests the RasterFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class RasterFrameApp {
  public static void main(String[] args) {
    RasterFrame frame = new RasterFrame("x", "y", "Raster Frame");
    frame.setPreferredMinMax(-10, 10, -10, 10);
    // generate random data
    int nx = 256, ny = 256;
    int[][] data = new int[nx][ny];
    for(int i = 0;i<nx;i++) {
      for(int j = 0;j<ny;j++) {
        data[i][j] = (int) (255*Math.random());
      }
    }
    frame.setAll(data);
    frame.setVisible(true);
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
  }
}
