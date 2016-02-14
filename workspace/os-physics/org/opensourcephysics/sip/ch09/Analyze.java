package org.opensourcephysics.sip.ch09;
import org.opensourcephysics.numerics.Function;

/**
 * Analyze  Fourier sine and cosine coefficients.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Analyze {

   Function f;
   double period, delta;
   double omega0;
   int N;

   /**
    * Constructs the Analyze object
    *
    * @param N the number of points
    * @param dt     the sampling interval
    */
   Analyze(Function f, int N, double delta) {
      this.f = f;
      this.delta = delta;
      this.N = N;
      period = N*delta;
      omega0 = 2*Math.PI/period;
   }

   /**
    * Gets a Fourier sine coefficient
    *
    * @param n coeff index
    *
    * @return the coefficient
    */
   double getSineCoefficient(int n) {
      double sum = 0;
      double t = 0;
      for(int i = 0; i<N; i++) {
         sum += f.evaluate(t)*Math.sin(n*omega0*t);
         t += delta;
      }
      return 2*delta*sum/period;
   }

   /**
    * Gets a Fourier cosine coefficient.
    *
    * @param n coeff index
    *
    * @return the coefficient
    */
   double getCosineCoefficient(int n) {
      double sum = 0;
      double t = 0;
      for(int i = 0; i<N; i++) {
         sum += f.evaluate(t)*Math.cos(n*omega0*t);
         t += delta;
      }
      return 2*delta*sum/period;
   }
}
