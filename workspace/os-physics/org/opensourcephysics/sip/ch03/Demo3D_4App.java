package org.opensourcephysics.sip.ch03;

import java.awt.*;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.display3d.simple3d.*; // Change this line to get a new implementation


/**
 * A demonstration of how to simulate particle motion using OSP 3D.
 * A group can later be positioned as a single object.
 *
 * @author Francisco Esquembre
 * @version 1.0  05/16/05
 */
public class Demo3D_4App extends AbstractSimulation {
  private int numElectrons = 50;
  private double radius = 7.0;
  private double[] alphas, betas;
  private ElementCircle[] electrons;
  private ElementTrail[] traces;
  Display3DFrame frame = new Display3DFrame("OSP 3D");
  Group group = new Group();
  public Demo3D_4App() {
    frame.setPreferredMinMax(-10.0, 10.0, -10.0, 10.0, -10.0, 10.0);
    Element nucleus = new ElementCircle();
    nucleus.setXYZ(0.0, 0.0, 0.0);
    nucleus.setSizeXYZ(3.0, 3.0, 3.0);
    group.addElement(nucleus);
    frame.addElement(group);
    ElementText caption = new ElementText();
    caption.setText("OSP 3D Simulation");
    caption.setXYZ(0.0, 0.0, -10.0);
    frame.addElement(caption);
    createElectrons();
  }

  public void doStep() {
    moveElectrons(0.02);
  }

  private void createElectrons() {
    alphas = new double[numElectrons];
    betas = new double[numElectrons];
    electrons = new ElementCircle[numElectrons];
    traces = new ElementTrail[numElectrons];
    for(int i = 0;i<numElectrons;i++) {
      alphas[i] = Math.random()*Math.PI*2.0;
      betas[i] = -Math.PI*0.5+Math.random()*Math.PI;
      electrons[i]= new ElementCircle();
      electrons[i].setSizeXYZ(0.6, 0.6, 0.6);
      electrons[i].getStyle().setFillColor(Color.RED);
      group.addElement(electrons[i]);
      traces[i]=new ElementTrail();
      traces[i].getStyle().setLineColor(Color.GRAY);
      traces[i].setMaximumPoints(5);
      group.addElement(traces[i]);
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
      electrons[i].setXYZ(x, y, z);
      traces[i].addPoint(x, y, z);
    }
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main(String[] args) {
    SimulationControl.createApp(new Demo3D_4App());
  }
}
