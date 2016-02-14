package org.opensourcephysics.sip.ch16;
import org.opensourcephysics.frames.PlotFrame;
import org.opensourcephysics.numerics.Function;

/**
 * EigenstateApp tests the Eigenstate class by calculating simple harmonic oscillator eigenfunctions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class EigenstateApp {

  /**
   * Starts the Java application.
   * @param args[]  the input parameters
   */
  public static void main(String[] args) {
    PlotFrame drawingFrame = new PlotFrame("x", "|phi|", "eigenstate"); 
    int numberOfPoints = 300;
    double xmin = -5, xmax = +5;
    Eigenstate eigenstate = new Eigenstate(new Potential(), numberOfPoints, xmin, xmax);
    int n = 3;  // quantum number
    double[] phi = eigenstate.getEigenstate(n);
    double[] x = eigenstate.getXCoordinates();
    if(eigenstate.getErrorCode()==Eigenstate.NO_ERROR) {
      drawingFrame.setMessage("energy = "+eigenstate.energy); 
    } else {
      drawingFrame.setMessage("eigenvalue did not converge");
    }
    drawingFrame.append(0, x, phi);
    drawingFrame.setVisible(true);
    drawingFrame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
  }
}

/**
 * Simple harmonic oscillator potential.
 */
class Potential implements Function {
  public double evaluate(double x) {
    return(x*x)/2;
  }
}
