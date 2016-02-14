package org.opensourcephysics.sip.ch03;
import java.awt.*; // uses Abstract Window Toolkit (awt)
import org.opensourcephysics.display.*;

/**
 * PixelRectangle demonstrates how to draw an object using the AWT drawing API.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class PixelRectangle implements Drawable {

   int left, top;     // position of rectangle in pixels
   int width, height; // size of rectangle in pixels

   /**
    * Constructs a PixelRectangle with position and dimensions values given in pixel coordinates.
    *
    * @param left int
    * @param top int
    * @param width int
    * @param height int
    */
   PixelRectangle(int left, int top, int width, int height) {
      this.left = left; // location of left edge
      this.top = top;   // location of top edge
      this.width = width;
      this.height = height;
   }

   /**
    * Draws this rectangle using the AWT drawing API.
    * Required to implement the Drawable interface.
    *
    * @param panel DrawingPanel
    * @param g Graphics
    */
   public void draw(DrawingPanel panel, Graphics g) {
      // this method implements the Drawable interface
      g.setColor(Color.RED);                // set drawing color to red
      g.fillRect(left, top, width, height); // draws rectangle
   }
}
