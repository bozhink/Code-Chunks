package org.opensourcephysics.sip.ch04;
import java.awt.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.numerics.*;

/**
 * Pendulum models the dynamics of a pendulum.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Pendulum implements Drawable, ODE {

   double omega0Squared = 3;               //  g/L
   double[] state = new double[]{0, 0, 0}; // {theta, dtheta/dt, t}
   Color color = Color.RED;
   int pixRadius = 6;
   EulerRichardson odeSolver = new EulerRichardson(this);

   /**
    * Sets the ODESolver's time step.
    *
    * @param dt double
    */
   public void setStepSize(double dt) {
      odeSolver.setStepSize(dt);
   }

   /**
    * Steps (advances) the time.
    *
    * @param dt the time step.
    */
   public void step() {
      odeSolver.step(); // execute one Euler-Richardson step
   }

   /**
    * Sets the state.
    *
    * @param theta
    * @param dtheta/dt
    */
   public void setState(double theta, double thetaDot) {
      state[0] = theta;
      state[1] = thetaDot; // time rate of change of theta
   }

   /**
    * Gets the state.  Required for ODE interface.
    * @return double[] the state
    */
   public double[] getState() {
      return state;
   }

   /**
    * Gets the rate.  Required for ODE inteface
    * @param state double[] the state
    * @param rate double[]  the computed rate
    */
   public void getRate(double[] state, double[] rate) {
      rate[0] = state[1];                          // rate of change of angle
      rate[1] = -omega0Squared*Math.sin(state[0]); // rate of change of dtheta/dt
      rate[2] = 1;                                 // rate of change of time dt/dt = 1
   }

   /**
    * Draws the pendulum. Required for Drawable interface.
    *
    * @param drawingPanel
    * @param g
    */
   public void draw(DrawingPanel drawingPanel, Graphics g) {
      int xpivot = drawingPanel.xToPix(0);
      int ypivot = drawingPanel.yToPix(0);
      int xpix = drawingPanel.xToPix(Math.sin(state[0]));
      int ypix = drawingPanel.yToPix(-Math.cos(state[0]));
      g.setColor(Color.black);
      g.drawLine(xpivot, ypivot, xpix, ypix);                               // the string
      g.setColor(color);
      g.fillOval(xpix-pixRadius, ypix-pixRadius, 2*pixRadius, 2*pixRadius); // bob
   }
}
