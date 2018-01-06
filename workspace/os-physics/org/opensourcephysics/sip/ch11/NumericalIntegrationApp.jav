package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.numerics.*;

/**
 *  NumericalIntegrationApp implements a visualization of the integral of f(x) from x = a to x = b.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class NumericalIntegrationApp extends AbstractCalculation {

   PlotFrame plotFrame = new PlotFrame("x", "f(x)", "Numerical integration visualization");
   public void reset() {
      control.setValue("f(x)", "cos(x)");
      control.setValue("lower limit a", 0);
      control.setValue("upper limit b", Math.PI/2);
      control.setValue("number of intervals n", 4);
   }

   public void calculate() {
      String fstring = control.getString("f(x)");
      double a = control.getDouble("lower limit a");
      double b = control.getDouble("upper limit b");
      int n = control.getInt("number of intervals n");
      Function f;
      try {
         f = new ParsedFunction(fstring);
      } catch(ParserException ex) {
         control.println(ex.getMessage());
         plotFrame.clearDrawables();
         return;
      }
      plotFrame.clearDrawables();
      plotFrame.setPreferredMinMaxX(a, b); // sets the domain of x to the integration limits
      plotFrame.addDrawable(new FunctionDrawer(f));
      RectangularApproximation approximate = new RectangularApproximation(f, a, b, n);
      plotFrame.addDrawable(approximate);
      plotFrame.setMessage("area = "+decimalFormat.format(approximate.sum));
      control.println("approximate area under curve = "+approximate.sum);
   }

   public static void main(String[] args) {
      CalculationControl.createApp(new NumericalIntegrationApp());
   }
}
