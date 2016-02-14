package org.opensourcephysics.sip.ch16;

/**
 * A superposition of particle in a box quantum eigenstates.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class BoxSuperposition {
   double[] realCoef;
   double[] imagCoef;
   double[][] states;   // eigenfunctions
   double[] eigenvalues;   // eigenvalues
   double[] x, realPsi, imagPsi;
   double[] zeroArray;

   /**
    * Constructs a time dependent superposition of particle in a box eigenstates.
    *
    * @param numberOfPoints int
    * @param realCoef double[]
    * @param imagCoef double[]
    */
   public BoxSuperposition(int numberOfPoints, double[] realCoef, double[] imagCoef) {
      if(realCoef.length!=imagCoef.length) {
         throw new IllegalArgumentException("Real and imaginary coefficients must have equal number of elements.");
      }
      this.realCoef = realCoef;
      this.imagCoef = imagCoef;
      int nstates = realCoef.length;
      // delay allocation of arrays for eigenstates
      states = new double[nstates][];   // eigenfunctions
      eigenvalues = new double[nstates];   // eigenvalues
      realPsi = new double[numberOfPoints];
      imagPsi = new double[numberOfPoints];
      zeroArray = new double[numberOfPoints];
      x = new double[numberOfPoints];
      double dx = BoxEigenstate.a/(numberOfPoints-1);
      double xo = 0;
      for(int j = 0, n = numberOfPoints; j<n; j++) {
         x[j] = xo;
         xo += dx;
      }
      for(int n = 0; n<nstates; n++) {
         states[n] = BoxEigenstate.getEigenstate(n, numberOfPoints);
         eigenvalues[n] = BoxEigenstate.getEigenvalue(n);
      }
      update(0);   // compute the superpositon at t = 0
   }

   /**
    * Computes the superposition state at the given time.
    *
    * @param time double
    */
   void update(double time) {
      // set real and imaginary parts of wave function to zero 
      System.arraycopy(zeroArray, 0, realPsi, 0, realPsi.length);
      System.arraycopy(zeroArray, 0, imagPsi, 0, imagPsi.length);
      for(int i = 0, nstates = realCoef.length; i<nstates; i++) {
         double[] phi = states[i];
         double re = realCoef[i];
         double im = imagCoef[i];
         double sin = Math.sin(time*eigenvalues[i]);
         double cos = Math.cos(time*eigenvalues[i]);
         for(int j = 1, n = phi.length-1; j<n; j++) {
            realPsi[j] += (re*cos-im*sin)*phi[j];
            imagPsi[j] += (im*cos+re*sin)*phi[j];
         }
      }
   }
}
