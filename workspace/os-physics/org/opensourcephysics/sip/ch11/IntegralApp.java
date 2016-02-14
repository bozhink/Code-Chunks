package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.numerics.Function;
import org.opensourcephysics.numerics.Integral;

/**
 * IntegralApp tests the static methods in the Integral class.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0  revised 04/21/05
 */
public class IntegralApp {

   static final double LN2 = Math.log(2); // integral of 1/x from 1 to 2

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] Args) {
      Function f = new TestFunction();
      double a = 1, b = 2;
      double tolerance = 1.0e-10;
      double area = Integral.ode(f, a, b, tolerance);
      System.out.println("ODE area = "+area+"  err = "+(area-LN2));
      area = Integral.trapezoidal(f, a, b, 2, tolerance);
      System.out.println("Trapezoidal area = "+area+"  err = "+(area-LN2));
      area = Integral.simpson(f, a, b, 2, tolerance);
      System.out.println("Simpson area = "+area+"  err = "+(area-LN2));
      area = Integral.romberg(f, a, b, 2, tolerance);
      System.out.println("Romberg area ="+area+"  err = "+(area-LN2));
   }
}

/**
 * A test function for numeric integration.
 */
class TestFunction implements Function {

   public double evaluate(double x) {
      return 1.0/x;
   }
}
