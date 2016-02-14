package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * DrawingApp demonstrates how to create and use Drawable objects.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class DrawingWorldApp extends AbstractCalculation {

   DisplayFrame frame = new DisplayFrame("x", "y", "Graphics");

   /**
    * Constructs the DrawingApp and sets the world coordinate scale.
    */
   public DrawingWorldApp() {
      frame.setPreferredMinMax(0, 10, 0, 10);
   }

   /**
    * Creates a rectangle and adds it to the DisplayFrame.
    */
   public void calculate() {
      // gets rectangle location
      double left = control.getDouble("xleft");
      double top = control.getDouble("ytop");
      // gets rectangle dimensions
      double width = control.getDouble("width");
      double height = control.getDouble("height");
      Drawable rectangle = new WorldRectangle(left, top, width, height);
      frame.addDrawable(rectangle);
      // frame is automatically rendered after Calculate button is pressed
   }

   /**
    * Resets the program to its initial state.
    */
   public void reset() {
      frame.clearDrawables();               // removes drawables added by the user
      control.setValue("xleft", 3);        // sets default input values
      control.setValue("ytop",3);
      control.setValue("width", 1.0);
      control.setValue("height", 1.5);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // creates a calculation control structure using this class
      CalculationControl.createApp(new DrawingWorldApp());
   }
}
