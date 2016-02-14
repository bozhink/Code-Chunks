package org.opensourcephysics.sip.ch11;
import java.util.Random;
import org.opensourcephysics.controls.*;

/**
 *  MonteCarloEstimatorApp
 *
 *  @author Wolfgang Christian,  Jan Tobochnik, Harvey Gould, Joshua Gould
 *  @version 1.0   revised 06/09/05
 */
public class MonteCarloEstimatorApp extends AbstractSimulation {

   Random rnd = new Random();
   int nSampled; // number of points already sampled
   int nTotal;   // total number of samples
   long seed;
   double a, b;  // interval limits
   double ymax;
   int hits = 0;
   public void reset() {
      control.setValue("lower limit a", 0);
      control.setValue("upper limit b", 1.0);
      control.setValue("upper limit on y", 1.0);
      control.setValue("seed", 137933);
   }

   public double evaluate(double x) {
      return Math.sqrt(1-x*x);
   }

   public void initialize() {
      a = control.getDouble("lower limit a");
      b = control.getDouble("upper limit b");
      ymax = control.getDouble("upper limit on y");
      nSampled = 0;
      nTotal = 2;
      seed = (long) control.getInt("seed");
      hits = 0;
      rnd.setSeed(seed);
   }

   public void doStep() {
      // nextDouble returns random double between 0 (inclusive) and 1 (exclusive)
      for(int i = nSampled; i<nTotal; i++) {
         double x = a+rnd.nextDouble()*(b-a);
         double y = rnd.nextDouble()*ymax;
         if(y<=evaluate(x)) {
            hits++;
         }
      }
      control.println("# of samples = "+nTotal+" estimated area = "+(hits*(b-a)*ymax)/nTotal);
      nSampled = nTotal; // number of points sample so far
      nTotal *= 2;       // increase number of samples by a factor of 2 for next step
   }

   public static void main(String[] args) {
      SimulationControl.createApp(new MonteCarloEstimatorApp());
   }
}
