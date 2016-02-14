package org.opensourcephysics.sip.ch02;

/**
 * Complex defines a new data type that models a complex number.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould, Joshua Gould
 * @version 1.0 05/07/05
 */
public class Complex {
   private double real = 0;
   private double imag = 0; // real, imag are instance variables

   /**
    * Constructs a complex number.
    */
   public Complex() {
      this(0,0); // invokes second constructor with 0 + i0
   }

   /**
    * Constructs a complex number with given real and imaginary parts.
    *
    * @param real double
    * @param imag double
    */
   public Complex(double real, double imag) {
      this.real = real;
      this.imag = imag;
   }

   /**
    * Conjugates this complex number.
    * The current complex number is changed.
    */
   public void conjugate() {
      imag = -imag;
   }

   /**
    * Adds a complex number to this complex number and returns the new complex number.
    * The current complex number is not changed.
    *
    * @param c Complex
    * @return Complex
    */
   public Complex add(Complex c) {
      // result also is complex so need to introduce another variable of type Complex
      Complex sum = new Complex();
      sum.real = real + c.real;
      sum.imag = imag + c.imag;
      return sum;
   }

   /**
    * Multiples this complex number by another complex number and returns the new complex number.
    * The current complex number is not changed.
    *
    * @param c Complex
    * @return Complex
    */
   public Complex multiply(Complex c) {
      Complex product = new Complex();
      product.real = (real*c.real) - (imag*c.imag);
      product.imag = (real*c.imag) + (imag*c.real);
      return product;
   }

   /**
    * Represents this complex number as a string.
    *
    * @return String
    */
   public String toString() {
      // note example of method overriding
      if (imag >= 0)
         return real + " + i" + Math.abs(imag);
      else
         return real + " - i" + Math.abs(imag);
   }
}
