package org.opensourcephysics.sip.ch08.mdOLD;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class LJParticlesApp extends AbstractSimulation {
   LJParticles md = new LJParticles();
   PlotFrame pressureData = new PlotFrame("time", "PA/NkT", "Mean Pressure");
   PlotFrame temperatureData = new PlotFrame("time", "temperature", "Mean Temperature");
   HistogramFrame xVelocityHistogram = new HistogramFrame("vx", "H(v)", "Velocity Histogram");
   DisplayFrame display = new DisplayFrame("x", "y", "Lennard-Jones Particles");
   public void initializeAnimation() {
      md.nx = control.getInt("nx"); // number of particles per row
      md.ny = control.getInt("ny"); // number of particles per column
      md.initialKineticEnergy = control.getDouble("initial kinetic energy per particle");
      md.Lx = control.getDouble("Lx");
      md.Ly = control.getDouble("Ly");
      md.initialConfiguration = control.getString("initial configuration");
      md.dt = control.getDouble("dt");
      md.initialize();
      display.addDrawable(md);
      display.setPreferredMinMax(0, md.Lx, 0, md.Ly); // assumes vmax = 2*initalTemp and bin width = Vmax/N
      xVelocityHistogram.setBinWidth(2*md.initialKineticEnergy/md.N);
   }

   public void doStep() {
      md.step(xVelocityHistogram);
      pressureData.append(0, md.t, md.getMeanPressure());
      temperatureData.append(0, md.t, md.getMeanTemperature());
   }

   public void stopAnimation() {
      super.stopAnimation();
      control.println("Density = "+decimalFormat.format(md.rho));
      control.println("Number of time steps = "+md.steps);
      control.println("Time step dt = "+decimalFormat.format(md.dt));
      control.println("<T>= "+decimalFormat.format(md.getMeanTemperature()));
      control.println("<E> = "+decimalFormat.format(md.getMeanEnergy()));
      control.println("Heat capacity = "+decimalFormat.format(md.getHeatCapacity()));
      control.println("<PA/NkT> = "+decimalFormat.format(md.getMeanPressure()));
   }

   public void startRunning() {
      md.dt = control.getDouble("dt");
      double Lx = control.getDouble("Lx");
      double Ly = control.getDouble("Ly");
      if((Lx!=md.Lx)||(Ly!=md.Ly)) {
         md.Lx = Lx;
         md.Ly = Ly;
         md.computeAccelerationNow = false;
         md.computeAcceleration();
         display.setPreferredMinMax(0, Lx, 0, Ly);
         resetData();
      }
   }

   public void reset() {
      control.setValue("nx", 8);
      control.setValue("ny", 8);
      control.setAdjustableValue("Lx", 20.0);
      control.setAdjustableValue("Ly", 15.0);
      control.setValue("initial kinetic energy per particle", 1.0);
      control.setAdjustableValue("dt", .01);
      control.setValue("initial configuration", "rectangular");
      enableStepsPerDisplay(true);
      display.setSquareAspect(true); // so particles will appear as circular disks
   }

   public void resetData() {
      xVelocityHistogram.clearData();
      md.resetAverages();
   }

   public static void main(String[] args) {
      SimulationControl control = SimulationControl.createApp(new LJParticlesApp());
      control.addButton("resetData", "Reset Data");
   }
}
