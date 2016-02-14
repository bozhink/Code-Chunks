package org.opensourcephysics.sip.ch18;
import java.awt.*;
import java.awt.geom.*;
import org.opensourcephysics.display.*;

/**
 * ObservedRing models the appearance of a ring at relativistic speeds.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class ObservedRing extends ContractedRing {

   Point2D[] retardPts;

   /**
    * Constructs an ObservedRing at the given position.
    * @param x0 double
    * @param y0 double
    * @param vx double
    * @param numPts int
    */
   public ObservedRing(double x0, double y0, double vx, int numPts) {
      super(x0, y0, vx, numPts); // x would change to numberOfPoints
      retardPts = new Point2D[numPts];
      for(int i = 0; i<numPts; i++) {
         retardPts[i] = new Point2D.Double();
      }
   }

   /**
    * Sets the postion of the retarded points.
    */
   void setRetardedPts() {
      double oneOverGammaSquared = (1-vx*vx);
      for(int i = 0, n = labPoints.length; i<n; i++) {
         double x = labPoints[i].getX();
         double y = labPoints[i].getY();
         double tau = (-vx*x+Math.sqrt(x*x*vx*vx+oneOverGammaSquared*(x*x+y*y)))/oneOverGammaSquared;
         retardPts[i].setLocation(x-vx*tau, y);
      }
   }

   /**
    * Draws the ring as seen at the origin.
    * @param panel DrawingPanel
    * @param g2 Graphics2D
    */
   void drawObservedShape(DrawingPanel panel, Graphics2D g2) {
      setRetardedPts();
      // converts from view to pixel coordinates
      AffineTransform at = panel.getPixelTransform();
      at.transform(retardPts, 0, pixPoints, 0, retardPts.length);
      g2.setColor(Color.BLACK);
      for(int i = 1, n = retardPts.length; i<n; i++) {
         g2.draw(new Line2D.Double(pixPoints[i-1], pixPoints[i]));
      }
   }

   /**
    * Draws the ring as seen by a single observer at the origin.
    *
    * @param panel DrawingPanel
    * @param g Graphics
    */
   public void draw(DrawingPanel panel, Graphics g) {
      Graphics2D g2 = (Graphics2D) g;
      drawShape(panel, g2);
      drawObservedShape(panel, g2);
   }
}
