package org.opensourcephysics.sip.ch03;

import java.awt.*;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.displayejs.*;
import org.opensourcephysics.frames.*;

/**
 * A demonstration of how to simulate particle motion in 3D using EJS.
 * A group can later be positioned as a single object.
 *
 * @author Francisco Esquembre
 * @version 1.0
 */
public class EJSDemo3App extends AbstractSimulation {
  private int numElectrons = 50;
  private double radius = 7.0;
  private double[] alphas, betas;
  private ElementSet electrons;
  private TraceSet traces;
  EJSFrame frame = new EJSFrame("EJS Simulation");
  Group group = new Group();
  public EJSDemo3App() {
    frame.setPreferredMinMax(-10.0, 10.0, -10.0, 10.0, -10.0, 10.0);
    InteractiveParticle nucleus = new InteractiveParticle();
    nucleus.setXYZ(0.0, 0.0, 0.0);
    nucleus.setSizeXYZ(3.0, 3.0, 3.0);
    nucleus.setGroup(group);
    nucleus.setEnabled(true);
    frame.addDrawable(nucleus);
    InteractiveText caption = new InteractiveText("EJS Simulation");
    caption.setXYZ(0.0, 0.0, -10.0);
    frame.addDrawable(caption);
    createElectrons();
  }

  public void doStep() {
    moveElectrons(0.02);
  }

  private void createElectrons() {
    alphas = new double[numElectrons];
    betas = new double[numElectrons];
    electrons = new ElementSet(numElectrons, InteractiveParticle.class);
    traces = new TraceSet(numElectrons);
    frame.addDrawable(electrons);
    frame.addDrawable(traces);
    for(int i = 0;i<numElectrons;i++) {
      alphas[i] = Math.random()*Math.PI*2.0;
      betas[i] = -Math.PI*0.5+Math.random()*Math.PI;
      electrons.elementAt(i).setSizeXYZ(0.6, 0.6, 0.6);
      electrons.elementAt(i).getStyle().setFillPattern(Color.red);
      electrons.elementAt(i).setGroup(group);
      traces.traceAt(i).getStyle().setEdgeColor(Color.gray);
      traces.traceAt(i).setIgnoreEqualPoints(true);
      traces.traceAt(i).setMaximumPoints(5);
      traces.traceAt(i).setGroup(group);
    }
    moveElectrons(0);
  }

  private void moveElectrons(double _dt) {
    double x, y, z;
    for(int i = 0;i<numElectrons;i++) {
      alphas[i] += Math.PI*2.0*_dt;
      betas[i] += Math.PI*_dt;
      x = radius*Math.cos(alphas[i])*Math.cos(betas[i]);
      y = radius*Math.sin(alphas[i])*Math.cos(betas[i]);
      z = radius*Math.sin(betas[i]);
      electrons.elementAt(i).setXYZ(x, y, z);
      traces.traceAt(i).addPoint(x, y, z);
    }
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main(String[] args) {
    SimulationControl.createApp(new EJSDemo3App());
  }
}
