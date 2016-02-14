package org.opensourcephysics.sip.ch16;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.ComplexPlotFrame;

/**
 * BoxSuperpositionApp creates a linear superposition of quantum eigenstates.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class BoxSuperpositionApp extends AbstractSimulation {

   ComplexPlotFrame psiFrame = new ComplexPlotFrame("x", "|Psi|", "Time dependent wave function");
   BoxSuperposition superposition;
   double time, dt;
   public BoxSuperpositionApp() {
      psiFrame.limitAutoscaleY(-1, 1);
   }

   public void initialize() {
      time = 0;
      psiFrame.setMessage("t = "+decimalFormat.format(time));
      dt = control.getDouble("dt");
      double[] re = (double[]) control.getObject("real coef");
      double[] im = (double[]) control.getObject("imag coef");
      int numberOfPoints = control.getInt("number of points");
      superposition = new BoxSuperposition(numberOfPoints, re, im);
      psiFrame.append(superposition.x, superposition.realPsi, superposition.imagPsi);
   }

   public void doStep() {
      time += dt;
      superposition.update(time);
      psiFrame.clearData();
      psiFrame.append(superposition.x, superposition.realPsi, superposition.imagPsi);
      psiFrame.setMessage("t = "+decimalFormat.format(time));
   }

   public void reset() {
      control.setValue("dt", 0.005);
      control.setValue("real coef", new double[]{0.707, 0, 0.707});
      control.setValue("imag coef", new double[]{0, 0, 0});
      control.setValue("number of points", 50);
      initialize();
   }

   public static void main(String[] args) {
      SimulationControl.createApp(new BoxSuperpositionApp());
   }
}
