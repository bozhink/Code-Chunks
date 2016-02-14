package org.opensourcephysics.sip.ch09;
import java.awt.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.numerics.*;

/**
 * OscillatorsMode models a chain of oscillators in a single mode.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class OscillatorsMode implements Drawable, Function {
  static final double OMEGA_SQUARED = 1;  // equals k/m
  FunctionDrawer functionDrawer;  // draws the initial condition
  double omega;      // oscillation frequency of mode
  double wavenumber; // wavenumber = 2*pi/wavelength
  double amplitude;

  /**
   * Constructs OscillatorsMode with the given mode and number of particles.
   *
   * The particle separation is one in this model.
   *
   * @param mode int
   * @param N int
   */
  OscillatorsMode(int mode, int N) {
    amplitude = Math.sqrt(2.0/(N+1));
    omega = 2*Math.sqrt(OMEGA_SQUARED)*Math.abs(Math.sin(mode*Math.PI/N/2));
    wavenumber=Math.PI*mode/(N+1);
    functionDrawer = new FunctionDrawer(this);
    functionDrawer.initialize(0, N+1, 300, false); // draws the initial displacement
    functionDrawer.color = Color.LIGHT_GRAY;
  }

  /**
   * Evaluates the displacement for an oscillator at postion x
   *
   * @param x postion along chain
   *
   * @return the displacement
   */
  public double evaluate(double x) {
    return amplitude*Math.sin(x*wavenumber);
  }

  /**
   * Draws the normal mode's initial condtion
   *
   * @param panel DrawingPanel
   * @param g Graphics
   */
  public void draw(DrawingPanel panel, Graphics g) {
    functionDrawer.draw(panel, g);
  }
}
