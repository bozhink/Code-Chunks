package org.opensourcephysics.sip.ch10;
import java.awt.Graphics;
import java.util.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.numerics.*;

/**
 * FieldLine computes a electric field line
 * in the vicinity of one or more point charges.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FieldLine implements Drawable, ODE, Runnable {

   DrawingFrame frame;
   double[] state = new double[2]; // Ex and Ey for ODE
   ODESolver odeSolver = new RK45MultiStep(this);
   ArrayList chargeList;           // list of charged particles
   Trail trail;
   double stepSize;
   volatile boolean done = false;

   /**
    * Constructs a FieldLine for use in the given drawing frame.
    *
    * @param frame
    * @param x0
    * @param y0
    * @param stepSize
    */
   public FieldLine(DrawingFrame frame, double x0, double y0, double stepSize) {
      this.stepSize = stepSize;
      this.frame = frame;
      odeSolver.setStepSize(stepSize);
      state[0] = x0;
      state[1] = y0;
      chargeList = frame.getDrawables(Charge.class);
      trail = new Trail();
      trail.addPoint(x0, y0);
      Thread thread = new Thread(this);
      thread.start();
   }

   /**
    * Gets the state vector of the field line.
    * @return the state
    */
   public double[] getState() {
      return state;
   }

   /**
    * Gets the rate for the field line using the given state.
    *
    * @param state  the given state
    * @param rate   the rate
    */
   public void getRate(double[] state, double[] rate) {
      double ex = 0;
      double ey = 0;
      for(Iterator it = chargeList.iterator(); it.hasNext(); ) {
         Charge charge = (Charge) it.next();
         double dx = (charge.getX()-state[0]);
         double dy = (charge.getY()-state[1]);
         double r2 = dx*dx+dy*dy;
         double r = Math.sqrt(r2);
         if((r<2*stepSize)||(r>100)) { // done if too close or too far
            done = true;
         }
         ex += (r==0)
               ? 0
               : charge.q*dx/r2/r;
         ey += (r==0)
               ? 0
               : charge.q*dy/r2/r;
      }
      double mag = Math.sqrt(ex*ex+ey*ey);
      rate[0] = (mag==0)
                ? 0
                : ex/mag;
      rate[1] = (mag==0)
                ? 0
                : ey/mag;
   }

   /**
    * Runs the field line calculation.
    */
   public void run() {
      int counter = 0;
      while(((counter<1000)&&!done)) {
         odeSolver.step();
         trail.addPoint(state[0], state[1]);
         if(counter%50==0) {     // repaint every 50th step
            frame.repaint();
            try {
               Thread.sleep(20); // give the event queue a chance
            } catch(InterruptedException ex) {}
         }
         counter++;
         Thread.yield();
      }
      frame.repaint();
   }

   /**
    * Draws the field line.
    *
    * @param panel
    * @param g
    */
   public void draw(DrawingPanel panel, Graphics g) {
      trail.draw(panel, g);
   }
}
