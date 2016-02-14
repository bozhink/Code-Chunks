package org.opensourcephysics.sip.ch03;
import java.awt.*;
import org.opensourcephysics.display.*;

/**
 * WorldRectangle demonstrates how to draw an object using a drawing panel's world coordinates.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class WorldRectangle implements Drawable {

   double left, top;     // position of rectangle in world coordinates
   double width, height; // size of rectangle in world units

   /**
    * Constructs a WorldRectangle with position and dimensions values given in world coordinates.
    *
    * @param left double
    * @param top double
    * @param width double
    * @param height double
    */
   public WorldRectangle(double left, double top, double width, double height) {
      this.left = left; // location of left edge
      this.top = top;   // location of top edge
      this.width = width;
      this.height = height;
   }

   /**
    * Draws this rectangle using a drawing panel's world coordinates.
    * Required to implement the Drawable interface.
    *
    * @param panel DrawingPanel
    * @param g Graphics
    */
   public void draw(DrawingPanel panel, Graphics g) {
      // This method implements the Drawable interface
      g.setColor(Color.RED); // set drawing color to red
      // convert from world to pixel coordinates
      int leftPixels = panel.xToPix(left);
      int topPixels = panel.yToPix(top);
      int widthPixels = (int) (panel.getXPixPerUnit()*width);
      int heightPixels = (int) (panel.getYPixPerUnit()*height);
      g.fillRect(leftPixels, topPixels, widthPixels, heightPixels); // draws rectangle
   }
}
