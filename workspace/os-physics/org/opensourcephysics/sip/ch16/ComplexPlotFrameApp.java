package org.opensourcephysics.sip.ch16;
import org.opensourcephysics.frames.ComplexPlotFrame;

/**
 * ComplexPlotFrameApp demonstrates the use of a ComplexFrame by displaying
 * a one-dimensional Gaussian wave function with a momentum boost.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class ComplexPlotFrameApp {
   public static void main(String[] args) {
      ComplexPlotFrame frame = new ComplexPlotFrame("x", "Psi(x)", "Complex function");
      int n = 128;
      double xmin = -Math.PI, xmax = Math.PI;
      double x = xmin, dx = (xmax-xmin)/n;
      double[] xdata = new double[n];
      double[] zdata = new double[2*n];   // real and imaginary values alternate
      int mode = 4; // test function is e^(-x*x/4)e^(i*mode*x) for x=[-pi,pi)
      for(int i = 0; i<n; i++) {
         double a = Math.exp(-x*x/4);
         zdata[2*i] = a*Math.cos(mode*x);
         zdata[2*i+1] = a*Math.sin(mode*x);
         xdata[i] = x;
         x += dx;
      }
      frame.append(xdata, zdata);
      frame.setVisible(true);
      frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
   }
}
