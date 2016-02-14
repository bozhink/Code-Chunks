package org.opensourcephysics.sip.ch16;

/**
 * BoxEigenstate defines the eigenfuntions and eigenvalues for a quantum mechanical particle in a box.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class BoxEigenstate {
  static double a = 1; // length of box 

  private BoxEigenstate() {
    // prohibit instantiation because all methods are static
  }

  static double[] getEigenstate(int n, int numberOfPoints) {
    double[] phi = new double[numberOfPoints];
    n++; // quantum number
    double norm = Math.sqrt(2 / a); 
    for (int i = 0; i < numberOfPoints; i++) {
      phi[i] = norm * Math.sin((n*Math.PI*i)/(numberOfPoints-1));
    }
    return phi;
  }

  static double getEigenvalue(int n) {
    n++;
    return (n*n*Math.PI*Math.PI)/2/a/a; // hbar = 1, mass = 1
  } 
}
