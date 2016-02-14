package org.opensourcephysics.sip.ch16;

import org.opensourcephysics.numerics.*;

/**
 * TISchroedinger solves the time independent Schroedinger equation without satisfying boundary conditions.
 */
public class TISchroedinger
    implements ODE {
  double energy = 0;
  double[] psi; // wave function
  double[] x; // positions
  double xstart; // starting x
  double[] state = new double[3]; // state= psi, d psi/dx, x
  ODESolver solver = new RK45MultiStep(this);

  /**
   * Constructs a simple quantum mechanical model.
   * The potential enegy is coded into the evaluate method.
   *
   * @param numpts  number of grid points
   * @param a      half interval
   */
  public TISchroedinger(int numpts, double a) {
    xstart = -a;
    psi = new double[numpts];
    x = new double[numpts];
    double dx = 2 * a / (numpts - 1);
    solver.setStepSize(dx);
  }

  /**
   * Solves the Schroedinger equation and stores the result in the psi array.
   *
   * @param energy
   * @return
   */
  void solve(double energy) {
    this.energy = energy;
    for (int i = 0, n = psi.length; i < n; i++) { // zero the wavefunction
      psi[i] = 0;
    }
    state[0] = 0; // initial psi
    state[1] = 1.0; // nonzero initial d psi/dx
    state[2] = xstart; // initial x
    for (int i = 0, n = psi.length; i < n; i++) {
      psi[i] = state[0]; // store the wavefunction value
      x[i] = state[2];
      solver.step(); // step Schroedinger eqn
      if (Math.abs(state[0]) > 1.0e9) { // check for diverging soln
        break; // break out of the loop
      }
    }
  }

  /**
   * Gets the state.
   * The state for the ode solver is: psi, d psi/dx, x.
   *
   * @return the state
   */
  public double[] getState() {
    return state;
  }

  /**
   * Gets the rate using the given state.
   *
   * @param state
   * @param rate
   */
  public void getRate(double[] state, double[] rate) {
    rate[0] = state[1];
    rate[1] = 2 * ( -energy + evaluate(state[2])) * state[0];
    rate[2] = 1;
  }

  /**
   * Evaluates the potential using a step at x=0.
   * Change this function to model other qm systems.
   *
   * @param x
   * @return
   */
  public double evaluate(double x) {
    if (x < 0) {
      return 0;
    }
    else {
      return 2;
    }
  }

}
