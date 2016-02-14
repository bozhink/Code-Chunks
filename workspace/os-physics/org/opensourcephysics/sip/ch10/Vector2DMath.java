package org.opensourcephysics.sip.ch10;

/**
 * VectorMath defines vector operations for use by the RadiatingCharge class.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
final class Vector2DMath {

   private Vector2DMath() {
      // a private constructor prohibits users from instantiating this class
   }

   /**
    * Calculate the two-component dot product.
    * @param a  the first  vector
    * @param b  the second vector
    * @return the dot product
    */
   static public double dot2D(double[] a, double[] b) {
      double sum = 0;
      for(int i = 0; i<2; i++) {
         sum += a[i]*b[i];
      }
      return sum;
   }

   /**
    * Calculate the magnitude of a two-component vector.
    * @param a  the  vector
    * @return the magnitude
    */
   static public double mag2D(double[] a) {
      double sum = 0;
      for(int i = 0; i<2; i++) {
         sum += a[i]*a[i];
      }
      return Math.sqrt(sum);
   }

   /**
    * Calculate the cross product of two-component vectors.
    * The result is the component perpendicular to the plane.
    *
    * @param a  the first  vector
    * @param b  the second vector
    * @return the cross product.
    */
   static public double cross2D(double[] a, double[] b) {
      return a[0]*b[1]-a[1]*b[0];
   }

   /**
    * Calculate the cross product of a vector within the xy plane and a vector perpendicular to that plane.
    * The operation returns the xy vector.
    *
    * @param a  the vector in the plane
    * @param b  the vector perpendicular to the plane
    */
   static public double[] crossZ(double[] a, double bz) {
      double temp = a[0];
      a[0] = a[1]*bz;
      a[1] = -temp*bz;
      return a;
   }
}
