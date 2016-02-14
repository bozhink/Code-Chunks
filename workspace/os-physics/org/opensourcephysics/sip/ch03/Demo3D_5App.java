package org.opensourcephysics.sip.ch03;

import org.opensourcephysics.display3d.simple3d.*;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.Display3DFrame;

/**
 * Demo3D_5App creates a basic simulation of a ball in a Box by extending AbstractSimulation
 * and implementing the doStep method.
 *
 * @author F. Esquembre and W. Christian
 * @version 1.0  05/16/05
 */
public class Demo3D_5App extends AbstractSimulation {
  // Graphical elements
  Display3DFrame frame = new Display3DFrame("Ball in box.");
  ElementCircle ball;
  ElementTrail trail;

   double ballRadius = 0.05;
   double x,y,z,vx,vy,vz;
   double dt=0.1;
   double min = -1.0, max = 1.0;

  /**
   * Constructs a Demo3D_5App.
   */
  public Demo3D_5App() {
    frame.setPreferredMinMax(min,max,min,max,min,max);
    ball= new ElementCircle();
    ball.setSizeXYZ(2*ballRadius,2*ballRadius,2*ballRadius);
    frame.addElement(ball);
    trail= new ElementTrail();
    trail.setMaximumPoints(30);
    trail.getStyle().setLineColor(java.awt.Color.GRAY);
    frame.addElement(trail);
  }

  public void initialize(){
     x = (max-min)* (Math.random()-0.5);
     y = (max-min)* (Math.random()-0.5);
     z = (max-min)* (Math.random()-0.5);
     vx = (max-min)* (Math.random()-0.5);
     vy = (max-min)* (Math.random()-0.5);
     vz = (max-min)* (Math.random()-0.5);
     ball.setXYZ(x,y,z);
     trail.clear();
  }

  /**
   * Does an animation step.
   */
  protected void doStep() {
    x += vx*dt; y += vy*dt; z += vz*dt;
    if (x<min || x>max) { vx = -vx; }
    if (y<min || y>max) { vy = -vy; }
    if (z<min || z>max) { vz = -vz; }
    ball.setXYZ(x,y,z);
    trail.addPoint (x,y,z);
  }

  public static void main(String[] args) {
     SimulationControl.createApp( new Demo3D_5App());
  }
}
