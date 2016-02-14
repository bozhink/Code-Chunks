package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.numerics.*;

/**
 * PolynomialFitApp implements a visualization of a polynomial lest squares fit to a function.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class PolynomialFitApp extends AbstractCalculation {

   PlotFrame frame = new PlotFrame("x", "f(x)", "Polynomial Best Fit");

   /**
    * Constructs a PolynomialFitApp.
    */
   public PolynomialFitApp() {
      frame.setConnected(false);
   }

   /**
    * Resets the calculations's parameters and does the calculation.
    */
   public void reset() {
      control.setValue("f(x)", "20-10*x-4.9*x*x");
      control.setValue("sample start", -2);
      control.setValue("sample stop", 2);
      control.setValue("number of samples", 16);
      control.setValue("degree of polynomial", 3);
      control.setValue("random y-error", 0);
   }

   /**
    * Calculates and displays the best polynomial fit.
    */
   public void calculate() {
      String fstring = control.getString("f(x)");
      double a = control.getDouble("sample start");
      double b = control.getDouble("sample stop");
      int n = control.getInt("number of samples"); // number of samples
      int degree = control.getInt("degree of polynomial");
      double err = control.getDouble("random y-error");
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
      double[] range = Util.getRange(f, a, b, 100);
      frame.clearDrawables();
      frame.setPreferredMinMax(a-(b-a)/4, b+(b-a)/4, range[0], range[1]);
      FunctionDrawer func = new FunctionDrawer(f);
      func.color = java.awt.Color.RED;
      frame.addDrawable(func);
      double x = a;
      double[] xpts = new double[n], ypts = new double[n];
      for(int i = 0; i<n; i++) {
         xpts[i] = x;
         ypts[i] = f.evaluate(x)*(1+err*(-0.5+Math.random()));
         x += dx;
      }
      frame.append(0, xpts, ypts);
      Polynomial interpolator = new PolynomialLeastSquareFit(xpts, ypts, degree);
      frame.addDrawable(new FunctionDrawer(interpolator));
      control.println("p(x)="+interpolator);
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
      CalculationControl.createApp(new PolynomialFitApp());
   }
}
