package org.opensourcephysics.sip.ch16;

/**
 * A Gaussian wave function with a momentum boost.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class GaussianPacket {

   double w, x0, p0;
   double w42;
   double norm;

   /**
    * Constructs the Gaussian wave function with the given center and momentum boost.\
    * @param width double
    * @param center double
    * @param momentum double
    */
   public GaussianPacket(double width, double center, double momentum) {
      w = width;
      w42 = 4*w*w;
      x0 = center;
      p0 = momentum;
      norm = Math.pow(2*Math.PI*w*w, -0.25);
   }

   /**
    * Gets the real part of the Gaussian wave function at the given x.
    * @param x double
    * @return double
    */
   public double getReal(double x) {
      return norm*Math.exp(-(x-x0)*(x-x0)/w42)*Math.cos(p0*(x-x0));
   }

   /**
    * Gets the imaginary part of the Gaussian wave function at the given x.
    * @param x double
    * @return double
    */
   public double getImaginary(double x) {
      return norm*Math.exp(-(x-x0)*(x-x0)/w42)*Math.sin(p0*(x-x0));
   }
}
