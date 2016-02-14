package org.opensourcephysics.sip.ch02;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * BouncingBall models a collection of bouncing balls.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 05/07/05
 */
public class BouncingBallApp extends AbstractSimulation {
   // declares and instantiates a window to draw balls
   DisplayFrame frame = new DisplayFrame("x", "y", "Bouncing Balls");
   BouncingBall[] ball;  // declares an array of BouncingBall objects
   double time, dt;

   /**
    * Initializes the simulation by creating the BouncingBall objects and adding them
    * to the frame.
    */
   public void initialize() {
      // sets boundaries of window in world coordinates
      frame.setPreferredMinMax(-10.0, 10.0, 0, 10);
      time = 0;
      frame.clearDrawables();  // removes old particles
      int n = control.getInt("number of balls");
      int v = control.getInt("speed");
      ball = new BouncingBall[n];  // instantiates array of n BouncingBall objects
      for(int i = 0;i<n;i++) {
         double theta = Math.PI*Math.random();  // random angle
         // instantiates the ith BouncingBall object
         ball[i] = new BouncingBall(0, v*Math.cos(theta), 0, v*Math.sin(theta));
         frame.addDrawable(ball[i]);  // // adds ball to frame so that it will be displayed
      }
      // decimalFormat instantiated in superclass and used to format numbers conveniently
      frame.setMessage("t = "+decimalFormat.format(time));  // appears in lower right hand corner
   }

   /**
    * Does a simulation step by stepping (advancing) each ball.
    */
   public void doStep() { // invoked every 1/10 second by timer in AbstractSimulation superclass
      for(int i = 0;i<ball.length;i++) {
         ball[i].step(dt);
      }
      time += dt;
      frame.setMessage("t="+decimalFormat.format(time));
   }

   /**
    * Checks the time step parameter whenever the start or step button is pressed.
    */
   public void startRunning() { // invoked when start or step button is pressed
      dt = control.getDouble("dt");
   }  // gets time step

   /**
    * Resets the simulation parameters to their intial state.
    */
   public void reset() { // invoked when reset button is pressed
      control.setAdjustableValue("dt", 0.1);  // allows dt to be changed after initializaton
      control.setValue("number of balls", 40);
      control.setValue("speed", 10);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {  // sets up animation control structure using this class
      SimulationControl.createApp(new BouncingBallApp());
   }
}
