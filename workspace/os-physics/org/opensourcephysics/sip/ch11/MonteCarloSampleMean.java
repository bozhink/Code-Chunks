package org.opensourcephysics.sip.ch11;
import java.util.Random;
import org.opensourcephysics.controls.*;

/**
 *  MonteCarloSampleMean
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class MonteCarloSampleMean extends AbstractCalculation {

   Random rnd = new Random();
   int n;       // number of trials
   long seed;
   double a, b; // interval limits
   int nmax;
   double sum;
   public void reset() {
      control.setValue("lower limit a", 0);
      control.setValue("upper limit b", 1.0);
      control.setValue("seed", 1379);
      control.setValue("n", 10000);
   }

   public double evaluate(double x) {
      return Math.sqrt(1-x*x);
   }

   public void calculate() {
      a = control.getDouble("lower limit a");
      b = control.getDouble("upper limit b");
      nmax = control.getInt("n");
      nmax = nmax-1;
      n = 0;
      seed = (long) control.getInt("seed");
      sum = 0;
      rnd.setSeed(seed);
      while(n<=99999) {
         double x = rnd.nextDouble()*(b-a);
         sum = sum+evaluate(x);
         n++;
      }
      control.println("n = "+n+" estimated area = "+4.0*(b-a)*sum/n);
   }

   public static void main(String[] args) {
      CalculationControl.createApp(new MonteCarloSampleMean());
   }
}
