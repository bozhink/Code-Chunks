package org.opensourcephysics.sip.ch10;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.Vector2DFrame;

/**
 * MaxwellApp  creates the Maxwell model and displays time dependent solution to Maxwell's equations.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class MaxwellApp extends AbstractSimulation {

   Vector2DFrame frame = new Vector2DFrame("x", "y", "EField in XY Plane");
   int size;
   Maxwell maxwell;
   double[][][] Exy; //  x and y components of E for middle plane in z direction

   /**
    * Constructor MaxwellApp
    */
   public MaxwellApp() {
      frame.setZRange(false, 0, 1.0);
   }

   /**
    * Resets the model to a predefined state.
    */
   public void reset() {
      control.setValue("size", 31);
      control.setValue("dt", 0.5);
   }

   /**
    * Initializes the animation.
    */
   public void initialize() {
      size = control.getInt("size");
      Exy = new double[2][size][size];
      maxwell = new Maxwell(size);
      frame.setAll(Exy);
      frame.setPreferredMinMax(0, Maxwell.dl*size, Maxwell.dl*size, 0);
      plotField();
   }

   /**
    * Does a time step.
    */
   protected void doStep() {
      maxwell.doStep();
      plotField();
      frame.setMessage("t="+decimalFormat.format(maxwell.t));
   }

   /**
    * Plots the electric field using the arrays in the Maxwell object.
    */
   void plotField() {
      double[][][][] E = maxwell.E; // electric field
      int mid = size/2;
      for(int i = 0; i<size; i++) {
         for(int j = 0; j<size; j++) {
            Exy[0][i][j] = E[i][j][mid][0]; // Ex
            Exy[1][i][j] = E[i][j][mid][1]; // Ey
         }
      }
      frame.setAll(Exy);
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new MaxwellApp());
   }
}
