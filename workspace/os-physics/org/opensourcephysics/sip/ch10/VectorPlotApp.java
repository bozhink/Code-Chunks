package org.opensourcephysics.sip.ch10;
import javax.swing.JFrame;
import org.opensourcephysics.frames.Vector2DFrame;

/**
 * VectorPlotApp plots a 1/(r*r) vector field.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class VectorPlotApp {

   /**
    * The main method that starts the Java application.
    * @param args[]  the input parameters
    */
   public static void main(String[] args) {
      Vector2DFrame frame = new Vector2DFrame("x", "y", "Vector field");
      double a = 2; // half width of frame in world coordinates
      frame.setPreferredMinMax(-a, a, -a, a);
      int nx = 15, ny = 15; // grid sizes in x and y direction
      // generate sample data
      double[][][] vectorField = new double[2][nx][ny];
      frame.setAll(vectorField); // vector field displays zero data
      for(int i = 0; i<nx; i++) {
         double x = frame.indexToX(i);
         for(int j = 0; j<ny; j++) {
            double y = frame.indexToY(j);
            double r2 = x*x+y*y;           // distance squared
            double r3 = Math.sqrt(r2)*r2;  // distance cubed
            vectorField[0][i][j] = (r2==0)
                                   ? 0
                                   : x/r3; // x component
            vectorField[1][i][j] = (r2==0)
                                   ? 0
                                   : y/r3; // y component
         }
      }
      frame.setAll(vectorField); // vector field displays new data
      frame.setVisible(true);
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   }
}
