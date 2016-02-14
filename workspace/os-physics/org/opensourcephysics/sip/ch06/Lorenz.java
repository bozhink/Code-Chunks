package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.display3d.simple3d.*;
import org.opensourcephysics.numerics.*;

/**
 * Lorenz model.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/06/05
 */
public class Lorenz extends Group implements ODE {

   double[] state = new double[4];
   double a = 28.0;
   double b = 2.667;
   double c = 10.0;
   ODESolver ode_solver = new RK45MultiStep(this);
   Element ball = new ElementEllipsoid();
   ElementTrail trail = new ElementTrail();

   /**
    * Lorenz constructor.
    */
   public Lorenz() {
      ball.setSizeXYZ(1, 1, 1); // sets size of ball in world coordinates
      ball.getStyle().setFillColor(java.awt.Color.RED);
      addElement(trail);        // adds trace to Loren
      addElement(ball);         // adds ball to Lorenz
      ode_solver.setStepSize(0.01);
   }

   /**
    * Does an animation step.
    */
   protected void doStep() {
      for(int i = 0; i<10; i++) {
         ode_solver.step();
         trail.addPoint(state[0], state[1], state[2]);
         ball.setXYZ(state[0], state[1], state[2]);
      }
   }

   /**
    * The state[] array contains:
    * x,y,z, t
    * @return  the state
    */
   public double[] getState() {
      return state;
   }

   public void initialize(double x, double y, double z) {
      state[0] = x;
      state[1] = y;
      state[2] = z;
      state[3] = 0; // time
      trail.clear();
      trail.addPoint(x, y, z);
      ball.setXYZ(x, y, z);
   }

   public void getRate(double[] state, double[] rate) {
      rate[0] = -(state[0]-state[1])*c;                 // x rate
      rate[1] = -state[1]-state[0]*state[2]+state[0]*a; // y rate
      rate[2] = (state[0]*state[1]-state[2])*b;         // z rate
      rate[3] = 1;                                      // time rate
   }
}
