/*
 * The org.opensourcephysics.sip.ch1 package contains classes for chapter 1
 * of the book An Introdiction to Computer Simulation Methods Third Edition.
 * Copyright (c) 2005  H. Gould, J. Tobochnik, and W. Christian.
 */
package org.opensourcephysics.sip.ch01;

import org.opensourcephysics.display.Circle;
import org.opensourcephysics.numerics.ODE;
import org.opensourcephysics.numerics.ODESolver;
import org.opensourcephysics.numerics.RK4;

/**
 * SHOModel defines a damped simple harmonic oscillator using a system of
 * first order differential equations.
 *
 * @author Wolfgang Christian
 * @version 1.0
 */
public class SHOModel extends Circle implements ODE {
  // initial state values = {x, v, t}
  double[] state = new double[] { 0.0, 0.0, 0.0};
  double k = 1;   // spring constant
  double b = 0.2; // damping constant
  ODESolver ode_solver = new RK4(this);


  /**
   * Initializes the position, velocity, and time.
   *
   * @param x
   * @param v
   * @param t
   */
  void initialize(double x, double v, double t){
    this.x=x;
    state[0]=x;
    state[1]=v;
    state[2]=t;
  }

  /**
   * Gets the time.
   * @return
   */
  double getTime(){
    return state[2];
  }


  /**
   * Gets the state array.
   *
   * @return an array containing {x, v, t}
   */
  public double[] getState() {
    return state;
  }

  /**
   * Calculates the rate array using the given state.
   *
   * Values in the rate array are overwritten.
   *
   * @param state  the state
   * @param rate   the rate
   */
  public void getRate(double[] state, double[] rate) {
    double force = -k * state[0] - b * state[1];
    rate[0] = state[1]; // dx/dt = v
    rate[1] = force; // dv/dt = force
    rate[2] = 1;     // dt/dt = 1
  }

  /**
   * Moves the particle.
   */
  public void move() {
    ode_solver.step();
    setX(state[0]);
  }

}
