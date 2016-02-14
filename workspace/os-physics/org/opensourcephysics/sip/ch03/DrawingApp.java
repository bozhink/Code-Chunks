package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * DrawingApp demonstrates how to create and use Drawable objects.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class DrawingApp extends AbstractCalculation {

   DisplayFrame frame = new DisplayFrame("x", "y", "Graphics");

   /**
    * Constructs the DrawingApp and sets the world coordinate scale.
    */
   public DrawingApp() {
      frame.setPreferredMinMax(0, 10, 0, 10);
   }

   /**
    * Creates a rectangle and adds it to the DisplayFrame.
    */
   public void calculate() {
      // gets rectangle location
      int left = control.getInt("xleft");
      int top = control.getInt("ytop");
      // gets rectangle dimensions
      int width = control.getInt("width");
      int height = control.getInt("height");
      Drawable rectangle = new PixelRectangle(left, top, width, height);
      frame.addDrawable(rectangle);
      // frame is automatically rendered after Calculate button is pressed
   }

   /**
    * Resets the program to its initial state.
    */
   public void reset() {
      frame.clearDrawables();               // removes drawables added by the user
      control.setValue("xleft", 60);        // sets default input values
      control.setValue("ytop", 70);
      control.setValue("width", 100);
      control.setValue("height", 150);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // creates a calculation control structure using this class
      CalculationControl.createApp(new DrawingApp());
   }
}
