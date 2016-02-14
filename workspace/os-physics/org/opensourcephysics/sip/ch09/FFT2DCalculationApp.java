package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.FFT2DFrame;

/**
 * FFT2DCalculationApp tests the FFT2DFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FFT2DCalculationApp extends AbstractCalculation {

   FFT2DFrame frame = new FFT2DFrame("k_x", "k_y", "2D FFT");

   /**
    * Calculates and displays a 2D FFT.
    */
   public void calculate() {
      int xMode = control.getInt("x mode"), yMode = control.getInt("y mode");
      double xmin = control.getDouble("xmin");
      double xmax = control.getDouble("xmax");
      int nx = control.getInt("Nx");
      double ymin = control.getDouble("ymin");
      double ymax = control.getDouble("ymax");
      int ny = control.getInt("Ny");
      double[] zdata = new double[2*nx*ny];    // data stored in row-major format
      double y = 0, yDelta = 2*Math.PI/ny;
      for(int iy = 0; iy<ny; iy++) { // loop over rows in array
         int offset = 2*iy*nx;       // offset to beginning of a row;  each row is nx long
         double x = 0, xDelta = 2*Math.PI/nx;
         for(int ix = 0; ix<nx; ix++) {
            // z function is e^(i*xmode*x)e^(i*ymode*y)
            zdata[offset+2*ix] =     //real part
               Math.cos(xMode*x)*Math.cos(yMode*y)-Math.sin(xMode*x)*Math.sin(yMode*y);
            zdata[offset+2*ix+1] =   // imaginary part
               Math.sin(xMode*x)*Math.cos(yMode*y)+Math.cos(xMode*x)*Math.sin(yMode*y);
            x += xDelta;
         }
         y += yDelta;
      }
      frame.doFFT(zdata, nx, xmin, xmax, ymin, ymax);
   }

   /**
    * Rests the default conditions.
    */
   public void reset() {
      control.setValue("x mode", 0);
      control.setValue("y mode", 1);
      control.setValue("xmin", 0);
      control.setValue("xmax", "2*pi");
      control.setValue("ymin", 0);
      control.setValue("ymax", "2*pi");
      control.setValue("Nx", 16);
      control.setValue("Ny", 16);
   }

   /**
    * Starts the Java application by creating the CalculationControl and the Calculation.
    * @param args String[]
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new FFT2DCalculationApp());
   }
}
