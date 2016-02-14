package org.opensourcephysics.sip.ch03;

import org.opensourcephysics.display3d.simple3d.*; // Change this line to get a new implementation
import org.opensourcephysics.numerics.Matrix3DTransformation;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;


/**
 * Elements3DApp tests the simple3d package by creating various 3D Elements.
 *
 * @version 1.0  05/16/05
 */
public class Demo3D_3App extends AbstractSimulation {
  Display3DFrame frame = new Display3DFrame("3D Elements");
  Group trihedron;
  ElementArrow arrow,extraDir;
  ElementBox box;
  ElementSurface torus;
  ElementPlane plane;
  ElementCone cone;

  double angle=0;
  double[] axis = {0,0,1};

  public Demo3D_3App() {
    arrow = new ElementArrow();
    arrow.setXYZ(-0.5,-0.5,-1);
    arrow.setSizeXYZ(1,0,0);
    frame.addElement(arrow);

    trihedron = new Group ();
    trihedron.setXYZ(0.5,0.5,1);
    trihedron.setSizeXYZ(2,2,2);
    frame.addElement(trihedron);

    ElementArrow xDir = new ElementArrow();
    xDir.setXYZ(0,0,0);
    xDir.setSizeXYZ(0.3,0,0);
    trihedron.addElement(xDir);
    ElementArrow yDir = new ElementArrow();
    yDir.setXYZ(0,0,0);
    yDir.setSizeXYZ(0,0.3,0);
    trihedron.addElement(yDir);
    ElementArrow zDir = new ElementArrow();
    zDir.setXYZ(0,0,0);
    zDir.setSizeXYZ(0,0,0.3);
    trihedron.addElement(zDir);

    extraDir = new ElementArrow();
    extraDir.setXYZ(0.1,0.1,0.1);
    extraDir.setSizeXYZ(0.4,0,0);
    extraDir.getStyle().setLineColor(java.awt.Color.RED);
    extraDir.getStyle().setFillColor(null);
    extraDir.getStyle().setLineWidth(1.5f);
    extraDir.getStyle().setResolution(new Resolution(5,1,1));
    trihedron.addElement(extraDir);

    box = new ElementBox ();
    box.setXYZ(0.5,-0.5,-0.75);
    box.setSizeXYZ(0.5,0.5,0.3);
    box.getStyle().setResolution(new Resolution (5,3,2));
    box.setClosedTop(false);
    frame.addElement(box);

    int nu = 20, nv = 15;
    double R = 0.7, r = 0.2;
    double[][][] data = new double[nu][nv][3];
    for (int i=0; i<nu; i++) {
      double u = i*2*Math.PI/(nu-1);
      for (int j=0; j<nv; j++) {
        double v = j*2*Math.PI/(nv-1);
        data[i][j][0] = (R+r*Math.cos(v))*Math.cos(u);
        data[i][j][1] = (R+r*Math.cos(v))*Math.sin(u);
        data[i][j][2] = r*Math.sin(v);
      }
    }
    torus = new ElementSurface ();
    torus.setXYZ(0,0.5,0.5);
    torus.setData(data);
    frame.addElement(torus);

    plane = new ElementPlane ();
    plane.getStyle().setResolution(new Resolution(5,5,1)); // The 1 is irrelevant
    plane.setFirstDirection (new double[]{1,0,0});
    plane.setSecondDirection(new double[]{0,1/Math.sqrt(2),-1/Math.sqrt(2)});
    plane.setXYZ(0,0,0);
    plane.setSizeXYZ(2,Math.sqrt(8),0);
    plane.getStyle().setFillColor(new java.awt.Color(0,0,255,128));
    frame.addElement(plane);

    cone = new ElementCone ();
    cone.setXYZ(1,0,-1+0.25);
    cone.setSizeXYZ(0.5,0.5,0.5);
    cone.getStyle().setResolution(new Resolution (3,12,3));
    cone.setTruncationHeight(0.2);
    frame.addElement(cone);
  }

  public void doStep() {
    // Rotate the elements
    angle += 0.1;
    trihedron.setTransformation(Matrix3DTransformation.rotation (angle,axis));
    extraDir.setTransformation(Matrix3DTransformation.rotation (-angle,axis));
    arrow.setTransformation(Matrix3DTransformation.rotation (angle,axis));
    box.setTransformation(Matrix3DTransformation.rotation (angle,axis));
    torus.setTransformation(Matrix3DTransformation.rotation (angle,axis));
  }

  public static void main (String args[]) {
     SimulationControl.createApp(new Demo3D_3App());
  }

}
