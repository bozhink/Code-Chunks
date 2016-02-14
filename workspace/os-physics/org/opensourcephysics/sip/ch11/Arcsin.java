package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.numerics.*;

/**
 * Arcsin demonstrates how to use interpolation to define an inverse function.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class Arcsin {

   static Function arcsin;
   private Arcsin() {} // probibit instantiation because all methods are static

   /**
    * Evaluates the arcsin function.
    *
    * @param x double
    * @return double the angle
    */
   static public double evaluate(double x) {
      if((x<-1)||(x>1)) {
         return Double.NaN;
      } else {
         return arcsin.evaluate(x);
      }
   }

   static {  // creates the static function arcsin when class is loaded
      int n = 10;
      double[] xValues = new double[n];
      double[] yValues = new double[n];
      double x = -Math.PI/2, dx = Math.PI/(n-1);
      for(int i = 0; i<n; i++) {
         xValues[i] = x;
         yValues[i] = Math.sin(x);
         x += dx;
      }
      arcsin = new CubicSpline(yValues, xValues);
   }
}
