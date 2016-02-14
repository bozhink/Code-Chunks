package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.controls.*;

/**
 * RecursiveFixedPointApp computes fixed points of the logistic map using the bisection root finding method.
 * This class uses recursion to calculate the map.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class RecursiveFixedPointApp extends AbstractCalculation {

   double r; // control parameter
   int period;
   double xleft, xright;
   double gleft, gright;

   /**
    * Resets the calculation's default values.
    */
   public void reset() {
      control.setValue("r", 0.8);             // control parameter r
      control.setValue("period", 2);          // period
      control.setValue("epsilon", 0.0000001); // desired precision
      control.setValue("xleft", 0.01);        // guess for xleft
      control.setValue("xright", 0.99);       // guess for xright
   }

   /**
    * Calculates the value of x for the trajectory that has the desired period.
    */
   public void calculate() {
      double epsilon = control.getDouble("epsilon"); // desired precision
      r = control.getDouble("r");
      period = control.getInt("period");
      xleft = control.getDouble("xleft");
      xright = control.getDouble("xright");
      gleft = map(xleft, r, period)-xleft;
      gright = map(xright, r, period)-xright;
      if(gleft*gright<0) {
         while(Math.abs(xleft-xright)>epsilon) {
            bisection();
         }
         double x = 0.5*(xleft+xright);
         control.println("explicit search for period "+period+" behavior");
         control.println(0+"\t"+x); // result
         for(int i = 1; i<=2*period+1; i++) {
            x = map(x, r, 1);
            control.println(i+"\t"+x);
         }
      } else {
         control.println("range does not enclose a root");
      }
   }

   /**
    * Implements the bisection method for finding the root.
    */
   public void bisection() {
      // midpoint between xleft and xright
      double xmid = 0.5*(xleft+xright);
      double gmid = map(xmid, r, period)-xmid;
      if(gmid*gleft>0) {
         xleft = xmid;  // change xleft
         gleft = gmid;
      } else {
         xright = xmid; // change xright
         gright = gmid;
      }
   }

   /**
    * Defines the logistic map using a recursive procedure.
    * @param x double
    * @param r double
    * @param period double
    * @return double
    */
   double map(double x, double r, double period) {
      if(period>1) {
         double y = map(x, r, period-1);
         return 4*r*y*(1-y);
      } else {
         return 4*r*x*(1-x);
      }
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new RecursiveFixedPointApp());
   }
}
