package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.display.Dataset;
import org.opensourcephysics.numerics.Function;

/**
 * RectangularApproximation displays a rectangular approximation to an integral.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class RectangularApproximation extends Dataset {

   double sum = 0; // will contain the integral

   /**
    * Constructs a RectangularApproximation to the integral for the given function.
    *
    * @param f Function
    * @param a double the lower limit
    * @param b double the upper limit
    * @param num int
    */
   public RectangularApproximation(Function f, double a, double b, int n) {
      setMarkerColor(new java.awt.Color(255, 0, 0, 128)); // transparent red
      setMarkerShape(Dataset.AREA);
      sum = 0;
      double x = a;        // lower limit
      double y = f.evaluate(a);
      double dx = (b-a)/n;
      // use methods in Dataset superclass
      append(x, 0); // start on the x axis
      append(x, y); // the top left hand corner of the first rectangle
      while(x<b) {          // b is the upper limit
         x += dx;
         append(x, y);      // top right hand corner of current rectangle
         sum += y;
         y = f.evaluate(x); // calculate a new y at the new x
         append(x, y);      // the top left hand corner of the next rectangle
      }
      append(x, 0); // finish on the x axis
      sum *= dx;
   }
}
