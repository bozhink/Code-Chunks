package org.opensourcephysics.sip.ch18;
import java.awt.*;
import java.awt.geom.*;
import org.opensourcephysics.display.*;

/**
 * ContractedRing models the Lorentz-Fitzgerald contraction
 * of a ring moving in the x direction.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class ContractedRing implements Drawable {

   double vx = 0, time = 0;
   Point2D[] labPoints, pixPoints;

   /**
    * ContractedRing models the shape of a ring at relativistic speeds.
    *
    * @param x0 double  initial center x coordinate
    * @param y0 double  initial center y coordinate
    * @param vx double  x velocity
    * @param numPts int number of points for rendering
    */
   public ContractedRing(double x0, double y0, double vx, int numberOfPoints) {
      labPoints = new Point2D[numberOfPoints];
      pixPoints = new Point2D[numberOfPoints];
      double theta = 0, dtheta = 2*Math.PI/(numberOfPoints-1);
      // unit radius circle
      for(int i = 0; i<numberOfPoints; i++) {
         double x = Math.cos(theta);  // x coordinate
         double y = Math.sin(theta);  // y coordinate
         labPoints[i] = new Point2D.Double(x, y);
         theta += dtheta;
      }
      this.vx = vx;
      // Lorentz-Fitzgerald contraction
      AffineTransform at = AffineTransform.getScaleInstance(Math.sqrt(1-vx*vx), 1);
      at.transform(labPoints, 0, labPoints, 0, labPoints.length);
      // translate to initial position
      at = AffineTransform.getTranslateInstance(x0, y0);
      at.transform(labPoints, 0, labPoints, 0, labPoints.length);
   }

   /**
    * Sets the time and translates the shape to its position at the given time.
    * @param t double the time
    */
   public void setTime(double t) {
      double dt = t-time;
      // convert position to position at new time
      AffineTransform at = AffineTransform.getTranslateInstance(vx*dt, 0);
      at.transform(labPoints, 0, labPoints, 0, labPoints.length);
      time = t;
   }

   void drawShape(DrawingPanel panel, Graphics2D g2) {
      // convert from lab coordinates to pixels
      AffineTransform at = panel.getPixelTransform();
      at.transform(labPoints, 0, pixPoints, 0, labPoints.length);
      g2.setColor(Color.RED);
      for(int i = 1, n = labPoints.length; i<n; i++) {
         g2.draw(new Line2D.Double(pixPoints[i-1], pixPoints[i]));
      }
   }

   /**
    * Draws the contracted circle.
    *
    * @param panel DrawingPanel
    * @param g Graphics
    */
   public void draw(DrawingPanel panel, Graphics g) {
      Graphics2D g2 = (Graphics2D) g;
      drawShape(panel, g2);
   }
}
