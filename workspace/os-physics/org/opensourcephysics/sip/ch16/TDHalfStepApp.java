package org.opensourcephysics.sip.ch16;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.ComplexPlotFrame;

/**
 * TDHalfStepApp solves the time-independent Schroedinger equation using the half-step algorithm.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class TDHalfStepApp extends AbstractSimulation {
   ComplexPlotFrame psiFrame = new ComplexPlotFrame("x", "|Psi|", "Wave function");
   TDHalfStep wavefunction;
   double time;

   /**
    * Constructors TDHalfStepApp
    */
   public TDHalfStepApp() {
      psiFrame.limitAutoscaleY(-1, 1);   // do not autoscale within this y-range.
   }

   /**
    * Initializes the wave function.
    */
   public void initialize() {
      time = 0;
      psiFrame.setMessage("t="+0);
      double xmin = control.getDouble("xmin");
      double xmax = control.getDouble("xmax");
      int numberOfPoints = control.getInt("number of points");
      double width = control.getDouble("packet width");
      double x0 = control.getDouble("packet offset");  
      double momentum = control.getDouble("packet momentum");
      GaussianPacket packet = new GaussianPacket(width, x0, momentum);
      wavefunction = new TDHalfStep(packet, numberOfPoints, xmin, xmax);
      psiFrame.clearData();   // removes old data
      psiFrame.append(wavefunction.x, wavefunction.realPsi, wavefunction.imagPsi);
   }

   /**
    * Does a simulation step.
    */
   public void doStep() {
      time += wavefunction.step();
      psiFrame.clearData();
      psiFrame.append(wavefunction.x, wavefunction.realPsi, wavefunction.imagPsi);
      psiFrame.setMessage("t="+decimalFormat.format(time));
   }

   /**
    * Resets the simulation.
    */
   public void reset() {
      control.setValue("xmin", -20); 
      control.setValue("xmax", 20);  
      control.setValue("number of points", 500);
      control.setValue("packet width",1); 
      control.setValue("packet offset", -15); 
      control.setValue("packet momentum", 2);
      setStepsPerDisplay(10);   // multiple computations per animation step
      enableStepsPerDisplay(true);
      initialize();
   }

   /**
    * Starts the Java application.
    * @param args[]  the input parameters
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new TDHalfStepApp());
   }
}
