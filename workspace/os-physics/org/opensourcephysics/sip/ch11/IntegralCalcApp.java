package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.*;

/**
 * IntegralCalcApp tests static methods in the Integral class.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould
 *  @version 1.0   revised 06/09/05
 */
public class IntegralCalcApp extends AbstractCalculation {

   public void reset() {
      control.setValue("a", 0);
      control.setValue("b", 1);
      control.setValue("tolerance", 1.0e-2);
      control.setValue("f(x)", "sin(2*pi*x)^2");
   }

   public void calculate() {
      Function f;
      String fx = control.getString("f(x)");
      try { // read in function to integrate
         f = new ParsedFunction(fx);
      } catch(ParserException ex) {
         control.println(ex.getMessage());
         return;
      }
      double a = control.getDouble("a");
      double b = control.getDouble("b");
      double tolerance = control.getDouble("tolerance");
      double area = Integral.ode(f, a, b, tolerance);
      control.println("ODE area = "+area);
      area = Integral.trapezoidal(f, a, b, 2, tolerance);
      control.println("Trapezoidal area = "+area);
      area = Integral.simpson(f, a, b, 2, tolerance);
      control.println("Simpson area = "+area);
      area = Integral.romberg(f, a, b, 2, tolerance);
      control.println("Romberg area ="+area);
   }

   public static void main(String[] args) {
      CalculationControl.createApp(new IntegralCalcApp());
   }
}
