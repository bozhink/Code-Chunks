package org.opensourcephysics.sip.ch09;
import java.awt.Graphics;
import org.opensourcephysics.display.*;

/**
 * Oscillators models the analytic soution of a chain of oscillators
 * with fixed end points.
 *
 * Students should implement the ODE interface to
 * complete the exercise in "An Introduction to Computer Simulation Methods."
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Oscillators implements Drawable {

   OscillatorsMode normalMode;
   Circle circle = new Circle();
   double[] x; // drawing positions
   double[] u; // displacement
   double time = 0;

   /**
    * Constructs a chain of coupled oscillators in the given mode and number of oscillators.
    *
    * @param mode int
    * @param N int
    */
   public Oscillators(int mode, int N) {
      u = new double[N+2]; // includes the two ends of the chain
      x = new double[N+2]; // includes the two ends of the chain
      normalMode = new OscillatorsMode(mode, N);
      double xi = 0;
      for(int i = 0; i<N+2; i++) {
         x[i] = xi;
         u[i] = normalMode.evaluate(xi); // initial displacement
         xi ++;                          // increment x[i] by lattice spacing of one
      }
   }

   /**
    * Steps the time using the given time step.
    *
    * @param dt
    */
   public void step(double dt) {
      time += dt;
   }

   /**
    * Draws the oscillators
    *
    * @param drawingPanel
    * @param g
    */
   public void draw(DrawingPanel drawingPanel, Graphics g) {
      normalMode.draw(drawingPanel, g); // draw initial condition
      double phase = Math.cos(time*normalMode.omega);
      for(int i = 0, n = x.length; i<n; i++) {
         circle.setXY(x[i], u[i]*phase);
         circle.draw(drawingPanel, g);
      }
   }
}
