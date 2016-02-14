package org.opensourcephysics.sip.ch11;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.numerics.*;

/**
 * PolynomialApp test the Polynomial class.
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class PolynomialApp extends AbstractCalculation {

   PlotFrame plotFrame = new PlotFrame("x", "f(x)", "Polynomial visualization");
   double xmin, xmax;
   Polynomial p;

   /**
    * Resets the default polynomial.
    */
   public void reset() {
      control.setValue("coefficients", "-2,0,1");
      control.setValue("minimum x", -10);
      control.setValue("maximum x", 10);
   }

   /**
    * Calculates and displays the polynomial.
    */
   public void calculate() {
      xmin = control.getDouble("minimum x");
      xmax = control.getDouble("maximum x");
      String[] coefficients = control.getString("coefficients").split(",");
      p = new Polynomial(coefficients);
      plotAndCalculateRoots();
   }

   void plotAndCalculateRoots() {
      plotFrame.clearDrawables();
      plotFrame.addDrawable(new FunctionDrawer(p));
      double[] range = Util.getRange(p, xmin, xmax, 100); // finds ymin and ymax within (xmin, xmax) domain.
      plotFrame.setPreferredMinMax(xmin, xmax, range[0], range[1]);
      plotFrame.repaint();
      double[] roots = p.roots(0.001); //desired precision of roots is 0.001
      control.clearMessages();
      control.println("polynomial = "+p);
      for(int i = 0, n = roots.length; i<n; i++) {
         control.println("root = "+roots[i]); // print each root
      }
   }

   public void derivative() {
      p = p.derivative();
      plotAndCalculateRoots();
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      CalculationControl control = CalculationControl.createApp(new PolynomialApp());
      control.addButton("derivative", "Derivative", "The derivative of the polynomial.");
   }
}
