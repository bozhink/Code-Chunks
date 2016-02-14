package org.opensourcephysics.sip.ch16;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * TISchroedingerApp displays a solution to the time-independent Schroedinger equation.
 */
public class TISchroedingerApp
    extends AbstractCalculation {
  PlotFrame frame = new PlotFrame("x", "Psi", "Time Independent Wave Function");

  /**
   * Constructs TISchroedingerApp and sets plotting frame parameters.
   */
  public TISchroedingerApp() {
    frame.setConnected(0, true);
    frame.setMarkerShape(0, Dataset.NO_MARKER);
  }

  /**
   * Calculates the wave function.
   */
  public void calculate() {
    double xmax = control.getDouble("a");
    int numpts = control.getInt("numpts");
    double energy = control.getDouble("energy");
    TISchroedinger eigenstate = new TISchroedinger(numpts, xmax);
    eigenstate.solve(energy);
    frame.append(0, eigenstate.x, eigenstate.psi);
  }

  /**
   * Resets the calculation parameters.
   */
  public void reset() {
    control.setValue("a", 5);
    control.setValue("numpts", 300);
    control.setValue("energy", 2);
    calculate();
  }

  /**
   * The main method starts the Java application.
   * @param args[]  the input parameters
   */
  public static void main(String[] args) {
    CalculationControl.createApp(new TISchroedingerApp());
  }
}
