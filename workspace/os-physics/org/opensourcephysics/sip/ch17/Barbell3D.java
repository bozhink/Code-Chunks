package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.display3d.simple3d.*;


/**
 * Barbell3D creates a 3D visualization of a barbell using an 3D Group.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class Barbell3D extends Group {

  public Barbell3D () {
    ElementCylinder bar = new ElementCylinder();
    bar.setXYZ(0, 0, 5);
    bar.setSizeXYZ(0.2, 0.2, 10);
    addElement(bar);
    Element sphere = new ElementSphere();
    sphere.setXYZ(0, 0, -5);
    sphere.setSizeXYZ(4, 4, 4);
    addElement(sphere);
    sphere = new ElementSphere();
    sphere.setXYZ(0, 0, 5);
    sphere.setSizeXYZ(4, 4, 4);
    addElement(sphere);
  }
}



