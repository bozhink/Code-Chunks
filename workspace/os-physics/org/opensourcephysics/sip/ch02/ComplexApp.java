package org.opensourcephysics.sip.ch02;

/**
 * ComplexApp tests the validity of the Complex class.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class ComplexApp {

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      Complex a = new Complex(3.0, 2.0);  // complex number 3 + i2
      Complex b = new Complex(1.0, -4.0); // complex number 1 - i4
      System.out.println(a); // print a using a.toString()
      System.out.println(b); // print b using b.toString()
      Complex sum = b.add(a); // add a to b
      System.out.println(sum); // print sum
      Complex product = b.multiply(a); // multiply b by a
      System.out.println(product); // print product
      a.conjugate();               // complex conjugate of a
      System.out.println(a);
   }
}
