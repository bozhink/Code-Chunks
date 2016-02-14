package org.opensourcephysics.sip.ch13;
import java.awt.Graphics;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.display.*;

/**
 *  Draws a Koch curve.
 *
 *  @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 06/21/05
 */
public class KochApp extends AbstractCalculation implements Drawable {

   DisplayFrame frame = new DisplayFrame("Koch Curve");
   int n = 0;
   public KochApp() {
      frame.setPreferredMinMax(-100, 600, -100, 600);
      frame.setSquareAspect(true);
      frame.addDrawable(this);
   }

   public void calculate() {
      n = control.getInt("Number of iterations");
      frame.setVisible(true);
   }

   public void iterate(double x1, double y1, double x2, double y2, int n, DrawingPanel panel, Graphics g) { // draw Koch curve using recursion
      if(n>0) {
         double dx = (x2-x1)/3;
         double dy = (y2-y1)/3;
         double xOneThird = x1+dx;                       // new endpoint at 1/3 of line segment
         double yOneThird = y1+dy;
         double xTwoThird = x1+2*dx;                     // new endpoint at 2/3 of line segment
         double yTwoThird = y1+2*dy;
         // rotates line segment (dx, dy) by 60 degrees and adds to (xOneThird,yOneThird)
         double xMidPoint = (0.5*dx-0.866*dy+xOneThird);
         double yMidPoint = (0.5*dy+0.866*dx+yOneThird); // each line segment generates 4 new ones
         iterate(x1, y1, xOneThird, yOneThird, n-1, panel, g);
         iterate(xOneThird, yOneThird, xMidPoint, yMidPoint, n-1, panel, g);
         iterate(xMidPoint, yMidPoint, xTwoThird, yTwoThird, n-1, panel, g);
         iterate(xTwoThird, yTwoThird, x2, y2, n-1, panel, g);
      } else {
         int ix1 = panel.xToPix(x1);
         int iy1 = panel.yToPix(y1);
         int ix2 = panel.xToPix(x2);
         int iy2 = panel.yToPix(y2);
         g.drawLine(ix1, iy1, ix2, iy2);
      }
   }

   public void draw(DrawingPanel panel, Graphics g) {
      iterate(0, 0, 500, 0, n, panel, g);
   }

   public void reset() {
      control.setValue("Number of iterations", 3);
   }

   public static void main(String args[]) {
      CalculationControl.createApp(new KochApp());
   }
}
