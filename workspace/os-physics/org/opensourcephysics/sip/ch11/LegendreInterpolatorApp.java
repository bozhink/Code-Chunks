package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.numerics.*;

/**
 * LegendreInterpolatorApp implements a visualization of Legendre interpolating polynomials.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0  revised 04/21/05
 */
public class LegendreInterpolatorApp extends AbstractCalculation {

   PlotFrame plotFrame = new PlotFrame("x", "f(x)", "Legendre Interpolation");

   /**
    * Resets the calculations's parameters and does the calculation.
    */
   public void resetCalculation() {
      control.setValue("f(x)", "sin(x)");
      control.setValue("sample start", -2);
      control.setValue("sample stop", 2);
      control.setValue("n", 5);
      control.setValue("random y-error", 0);
      calculate();
   }

   /**
    * Calculates and displays the Legendre interpolating polynomial.
    */
   public void calculate() {
      String fstring = control.getString("f(x)");
      double a = control.getDouble("sample start");
      double b = control.getDouble("sample stop");
      double err = control.getDouble("random y-error");
      int n = control.getInt("n"); // number of intervals
      double[] xData = new double[n];
      double[] yData = new double[n];
      double dx = (n>1)
                  ? (b-a)/(n-1)
                  : 0;
      Function f;
      try {
         f = new ParsedFunction(fstring);
      } catch(ParserException ex) {
         control.println(ex.getMessage());
         return;
      }
      plotFrame.clearData();
      double[] range = Util.getDomain(f, a, b, 100);
      plotFrame.setPreferredMinMax(a-(b-a)/4, b+(b-a)/4, range[0], range[1]);
      FunctionDrawer func = new FunctionDrawer(f);
      func.color = java.awt.Color.RED;
      plotFrame.addDrawable(func);
      double x = a;
      for(int i = 0; i<n; i++) {
         xData[i] = x;
         yData[i] = f.evaluate(x)*(1+err*(-0.5+Math.random()));
         plotFrame.append(0, xData[i], yData[i]);
         x += dx;
      }
      LegendreInterpolator interpolator = new LegendreInterpolator(xData, yData);
      plotFrame.addDrawable(new FunctionDrawer(interpolator));
      double[] coef = interpolator.getCoefficients();
      for(int i = 0; i<coef.length; i++) {
         control.println("c["+i+"]="+coef[i]);
      }
   }

   /**
    * Starts the Java applicaiton.
    * @param args String[] command line parameters
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new LegendreInterpolatorApp());
   }
}
