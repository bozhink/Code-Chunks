package org.opensourcephysics.sip.ch16;

/**
 * TDHalfStep implements the half-step method for solving the
 * time-dependent Schroedinger equation.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class TDHalfStep {
   double[] x, realPsi, imagPsi, potential;
   double dx, dx2;
   double dt = 0.001;  // why not an input parameter? anyway its determined below

   /**
    * Constructs TDHalfStep algorithm in the given x-domain.
    *
    *  Units such that m = hbar = 1
    *
    * @param packet
    * @param numberOfPoints
    * @param xmin
    * @param xmax
    */
   public TDHalfStep(GaussianPacket packet, int numberOfPoints, double xmin, double xmax) {
      realPsi = new double[numberOfPoints];
      imagPsi = new double[numberOfPoints];
      potential = new double[numberOfPoints];
      x = new double[numberOfPoints];
      dx = (xmax-xmin)/(numberOfPoints-1);
      dx2 = dx*dx;
      double x0 = xmin;
      for(int i = 0, n = realPsi.length; i<n; i++) {
         x[i] = x0;
         potential[i] = getV(x0);
         realPsi[i] = packet.getReal(x0);
         imagPsi[i] = packet.getImaginary(x0);
         x0 += dx;
      }
      dt = getMaxDt();
      // advances the imaginary part by 1/2 step at start 
      for(int i = 1, n = realPsi.length-1; i<n; i++) {
         // deltaRe = change in real part of psi in 1/2 step
         double deltaRe = potential[i]*realPsi[i]-0.5*(realPsi[i+1]-2*realPsi[i]+realPsi[i-1])/dx2;
         imagPsi[i] -= deltaRe*dt/2;
      }
   }

   /**
    * Gets the maximum value of dt consistent with stability solution.
    * @return
    */
   double getMaxDt() {
      double dt = Double.MAX_VALUE;
      for(int i = 0, n = potential.length; i<n; i++) {
         if(potential[i]<0) {
            dt = Math.min(dt, -2/potential[i]);
         }
         double a = potential[i]+2/dx2;
         if(a>0) {
            dt = Math.min(dt, 2/a);
         }
      }
      return dt;
   }

   /**
    * Steps the wave function in time and returns the time increment.
    *
    * @return dt
    */
   double step() {
      for(int i = 1, n = imagPsi.length-1; i<n; i++) {
      // don't like notation imH and reH. H is real 
         double imH = potential[i]*imagPsi[i]-0.5*(imagPsi[i+1]-2*imagPsi[i]+imagPsi[i-1])/dx2;
         realPsi[i] += imH*dt;
      }
      for(int i = 1, n = realPsi.length-1; i<n; i++) {
         double reH = potential[i]*realPsi[i]-0.5*(realPsi[i+1]-2*realPsi[i]+realPsi[i-1])/dx2;
         imagPsi[i] -= reH*dt;
      }
      return dt;
   }

   /**
    * Gets the potential energy at x.
    *
    * @param x
    * @return the potential
    */
   public double getV(double x) {
      return 0;   // change this statement to model other potentials
   }
}
