package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.frames.RasterFrame;
import org.opensourcephysics.numerics.FFT2D;

/**
 * Fraunhofer2DApp computes the 2D Fraunhofer diffraction pattern using the FFT alogrithm.
 *
 * @author       Wolfgang Christian
 * @version 1.0
 */
public class Fraunhofer2DApp {
  static final double PI2 = Math.PI*2;
  static final double LOG10 = Math.log(10);
  static final double ALPHA = Math.log(1.0e-3)/LOG10;  // cutoff value

  /**
   * Starts the Java application.
   * @param args[]  the input parameters
   */
  public static void main(String[] args) {
    int n = 512;
    FFT2D fft2d = new FFT2D(n, n);
    double[] cdata = new double[2*n*n];
    double a = 10;  // aperture screen dimension
    double dx = 2*a/n, dy = 2*a/n;
    double y = -a;
    for(int iy = 0;iy<n;iy++) {
      int offset = 2*iy*n;  // offset to beginning of row
      double x = -a;
      for(int ix = 0;ix<n;ix++) {
        double r = Math.sqrt(x*x+y*y);
        cdata[offset+2*ix] = (r<0.5) ? 1 : 0;  // circular aperture r=1
        cdata[offset+2*ix+1] = 0;
        x += dx;
      }
      y += dy;
    }
    fft2d.transform(cdata);
    fft2d.toNaturalOrder(cdata);
    double max = 0;
    // find the peak value
    for(int i = 0, n2 = n*n;i<n2;i++) {
      double re = cdata[2*i];  // real
      double im = cdata[2*i+1];  // imaginary
      max = Math.max(max, re*re+im*im);
    }
    int[] data = new int[n*n];
    //compute the intensity
    for(int i = 0, n2 = n*n;i<n2;i++) {
      double re = cdata[2*i];  // real
      double im = cdata[2*i+1];  // imaginary
      // log scale increases visibility of weaker fringes
      double logIntensity = Math.log((re*re+im*im)/max)/LOG10;
      data[i] = (logIntensity<=ALPHA) ? 0 : (int) (255*(1-logIntensity/ALPHA));
    }
    //raster for least memory and best speed
    RasterFrame frame = new RasterFrame("Fraunhofer Diffraction");
    frame.setBWPalette();
    frame.setAll(data, n, -0.5, 0.5, -0.5, 0.5);  //send the fft data to the raster frame
    frame.setVisible(true);
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
  }
}
