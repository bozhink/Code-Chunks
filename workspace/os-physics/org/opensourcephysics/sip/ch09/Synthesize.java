package org.opensourcephysics.sip.ch09;

import org.opensourcephysics.numerics.Function;

/**
 * Synthesize defines a Fourier series of sinusoidal functions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Synthesize implements Function {
  double[] cosCoefficients, sinCoefficients;  // cosine and sine coefficients
  double a0;  // the constant term
  double omega0;

  /**
   * Constructs Synthesize.
   *
   * @param period
   * @param a0
   * @param cosCoef
   * @param sinCoef
   */
  public Synthesize(double period, double a0, double[] cosCoef, double[] sinCoef) {
    omega0 = Math.PI*2/period;
    cosCoefficients = cosCoef;
    sinCoefficients = sinCoef;
    this.a0 = a0;
  }

  /**
   * Evalutates the Fourier series at x.
   *
   * @param x
   *
   * @return the value
   */
  public double evaluate(double x) {
    double f = a0/2;
    // sum the cosine terms
    for(int i = 0, n = cosCoefficients.length;i<n;i++) {
      f += cosCoefficients[i]*Math.cos(omega0*x*(i+1));
    }
    // sum the sine terms
    for(int i = 0, n = sinCoefficients.length;i<n;i++) {
      f += sinCoefficients[i]*Math.sin(omega0*x*(i+1));
    }
    return f;
  }
}
