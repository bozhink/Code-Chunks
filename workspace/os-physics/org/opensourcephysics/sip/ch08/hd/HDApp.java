package org.opensourcephysics.sip.ch08.hd;

import org.opensourcephysics.controls.AbstractSimulation;
import org.opensourcephysics.controls.SimulationControl;
import org.opensourcephysics.frames.DisplayFrame;
import org.opensourcephysics.frames.PlotFrame;

public class HDApp extends AbstractSimulation {
  HD hd = new HD();
  PlotFrame pressureData = new PlotFrame("time", "PA/NkT", "Pressure");
  DisplayFrame display = new DisplayFrame("x", "y", "Lennard-Jones Particles");
  double timeToPlot;
  public void initializeAnimation() {
    hd.N = control.getInt("N");
    hd.Lx = control.getDouble("Lx");
    hd.Ly = control.getDouble("Ly");
    String configuration = control.getString("initial configuration");
    hd.initialize(configuration);
    display.addDrawable(hd);
    display.setPreferredMinMax(0, hd.Lx, 0, hd.Ly);
    display.setSquareAspect(true);
    control.println("Temperature = "+hd.temperature);
    timeToPlot = 1;
  }

  public void doStep() {
    while(hd.t<timeToPlot) {  // plot at roughly equal time intervals
      hd.step();
    }
    timeToPlot++;
    pressureData.append(0, hd.t, hd.pressure());
    display.setMessage("Number of Collisions =  "+hd.numberOfCollisions);
  }

  public void reset() {
    enableStepsPerDisplay(true);
    control.setValue("N", 16);
    control.setValue("Lx", 8.0);
    control.setValue("Ly", 8.0);
    control.setValue("initial configuration", "regular");
  }

  public void resetData() {}

  public static void main(String[] args) {  // set up animation control structure using this class
    SimulationControl control = SimulationControl.createApp(new HDApp());
    control.addButton("resetData", "Reset Data");
  }
}
