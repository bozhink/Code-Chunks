package org.opensourcephysics.sip.extras;

import org.opensourcephysics.numerics.Function;

public class MyMath {

   private MyMath(){}          // prohibit instantiation

   public static final double MAX_EXPONENT = Math.log(Double.MAX_VALUE);
   public static final double MIN_EXPONENT = Math.log(Double.MIN_VALUE);

   public static double sinh(double u) {
      return (Math.exp(u) - Math.exp(-u))/2;
   }

   public static double cosh(double u) {
      return (Math.exp(u) + Math.exp(-u))/2;
   }

   public static double tanh(double u) {
      if (u > MAX_EXPONENT)
        return 1.0;
      else if (u < MIN_EXPONENT)
        return -1.0;
      else
        return (Math.exp(u) - Math.exp(-u))/(Math.exp(u) + Math.exp(-u));
   }

   public static double derivative(Function f, double x, double dx){
     return  (f.evaluate(x+dx)-f.evaluate(x-dx))/(2*dx);
   }
}