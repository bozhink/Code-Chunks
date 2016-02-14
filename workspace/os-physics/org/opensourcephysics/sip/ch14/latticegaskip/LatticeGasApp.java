package org.opensourcephysics.sip.ch14.latticegaskip;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class LatticeGasApp extends AbstractSimulation {
   LatticeGas2 model = new LatticeGas2();
   DisplayFrame display = new DisplayFrame("Lattice Gas");

   public LatticeGasApp() {
      display.addDrawable(model);
      display.setSize(800, (int) (400*Math.sqrt(3)/2));
   }

   public void initialize() {
     int lx = control.getInt("lx");
     int ly = control.getInt("ly");
     double density = control.getDouble("Particle density");
     model.initialize(lx, ly, density);
     model.flowSpeed = control.getDouble("Flow speed");
     model.spatialAveragingLength = control.getInt("Spatial averaging length");
     model.velocityScale = control.getInt("Velocity scaling");
     display.setPreferredMinMax(-1, lx, -Math.sqrt(3)/2, ly*Math.sqrt(3)/2);
   }

   public void doStep() {
      model.flowSpeed = control.getDouble("Flow speed");
      model.spatialAveragingLength = control.getInt("Spatial averaging length");
      model.velocityScale = control.getDouble("Velocity scaling");
      model.step();
   }

   public void reset() {
      control.setValue("lx", 1000);
      control.setValue("ly", 500);
      control.setValue("Particle density", 0.3);
      control.setAdjustableValue("Flow speed", 0.2);
      control.setAdjustableValue("Spatial averaging length", 20);
      control.setAdjustableValue("Velocity scaling", 2);
      enableStepsPerDisplay(true);
      control.setAdjustableValue("steps per display", 100);
   }

   public static void main (String[] args) {
      SimulationControl.createApp(new LatticeGasApp());
   }
}
