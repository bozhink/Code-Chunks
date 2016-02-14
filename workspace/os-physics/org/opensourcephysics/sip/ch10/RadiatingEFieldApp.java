package org.opensourcephysics.sip.ch10;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.Vector2DFrame;

/**
 * RadiatingEFieldApp models the radiating electric field from an accelerating point
 * charge using Lienard-Wiechert potentials.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class RadiatingEFieldApp extends AbstractSimulation {

   Vector2DFrame frame = new Vector2DFrame("x", "y", "Electric field");
   RadiatingCharge charge = new RadiatingCharge();
   int gridSize;     // linear dimension of grid used to compute fields
   double[][][] Exy; // x and y components of electric field
   double xmin = -20, xmax = 20, ymin = -20, ymax = 20;

   /**
    * The RadiationApp constructor.
    */
   public RadiatingEFieldApp() {
      frame.setPreferredMinMax(xmin, xmax, ymin, ymax);
      frame.setZRange(false, 0, 0.2);
      frame.addDrawable(charge);
   }

   /**
    * Initializes the animation.
    */
   public void initialize() {
      gridSize = control.getInt("size");
      Exy = new double[2][gridSize][gridSize];
      charge.vmax = control.getDouble("vmax"); // maximum speed of charge
      charge.dt = control.getDouble("dt");
      frame.setAll(Exy);
      initArrays();
   }

   /**
    * Initializes the arrays.
    */
   private void initArrays() {
      charge.resetPath();
      calculateFields();
   }

   /**
    * Calculates the fields.
    */
   private void calculateFields() {
      double[] fields = new double[3]; // Ex, Ey, Bz
      for(int i = 0; i<gridSize; i++) {
         for(int j = 0; j<gridSize; j++) {
            double x = frame.indexToX(i);                // x location where we calculate the field
            double y = frame.indexToY(j);                // y location where we calculate the field
            charge.calculateRetardedField(x, y, fields); // return the retarded time
            Exy[0][i][j] = fields[0];                    // Ex
            Exy[1][i][j] = fields[1];                    // Ey
         }
      }
      frame.setAll(Exy);
   }

   /**
    * Resets the model to a predefined state.
    */
   public void reset() {
      control.setValue("size", 31);
      control.setValue("dt", 0.5);
      control.setValue("vmax", 0.9);
      initialize(); // initialize the model
   }

   /**
    * doStep
    */
   protected void doStep() {
      charge.step();
      calculateFields();
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new RadiatingEFieldApp());
   }
}
