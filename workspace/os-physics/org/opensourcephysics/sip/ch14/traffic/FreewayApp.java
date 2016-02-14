package org.opensourcephysics.sip.ch14.traffic;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * FreewayApp models traffic flow by showing  the movement of the cars and a space-time diagram.
 *
 * Time is on the vertical axis and space on the horizontal axis.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */
public class FreewayApp extends AbstractSimulation {
   Freeway freeway = new Freeway();
   DisplayFrame display = new DisplayFrame("Freeway");
   LatticeFrame spaceTime = new LatticeFrame("space", "time", "Space Time Diagram");

  /**
   * Constructs the FreewayApp.
   */
   public FreewayApp() {
      display.addDrawable(freeway);
  }

  /**
   * Initializes the animation using the values in the control.
   */
   public void initialize() {
      freeway.numberOfCars = control.getInt("Number of cars");
      freeway.roadLength = control.getInt("Road length");
      freeway.p = control.getDouble("Slow down probability");
      freeway.maximumVelocity = control.getInt("Maximum velocity");
      display.setPreferredMinMax(0,freeway.roadLength,-3,4);
      freeway.initialize(spaceTime);
   }

  /**
   * Does one iteration.
   */

   public void doStep() {
      freeway.step();
   }

  /**
   * Resets animation to a predefined state.
   */
   public void reset() {
      control.setValue("Number of cars", 10);
      control.setValue("Road length",50);
      control.setValue("Slow down probability",0.5);
      control.setValue("Maximum velocity",2);
      control.setValue("Steps between plots",1);
      enableStepsPerDisplay(true);
   }

  /**
   * Resets data without changing configuration
   */
   public void resetAverages() {
      freeway.flow = 0;
      freeway.steps = 0;
   }

  /**
   * Starts Java application.
   * @param args  command line parameters
   */
   public static void main (String[] args) {
      SimulationControl control = SimulationControl.createApp(new FreewayApp());
      control.addButton("resetAverages","resetAverages");
   }
}
