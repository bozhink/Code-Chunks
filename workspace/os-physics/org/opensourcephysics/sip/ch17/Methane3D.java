package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.display3d.simple3d.*;
import  org.opensourcephysics.numerics.Quaternion;
import  org.opensourcephysics.numerics.VectorMath;


/**
 * Methane3D creates a 3D visualization of methane using a 3D Group.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class Methane3D extends Group {
  static final double c = Math.cos(Math.PI/6);          // cosine of 30 degrees
  static final double s = Math.sin(Math.PI/6);          // sine of 30 degrees
  static final double h = Math.sqrt(1.0 - 4.0*c*c/9.0); // trapezoid height

  public Methane3D () {
    Element carbon = new ElementSphere();
    carbon.setSizeXYZ(0.4, 0.4, 0.4);
    carbon.setXYZ(0, 0, 0);
    carbon.getStyle().setFillColor(java.awt.Color.GREEN);
    addElement(carbon);
    //create H atoms
    Element hatom = new ElementSphere();
    hatom.setXYZ(0, 0, 0.75*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    addElement(hatom);
    hatom = new ElementSphere();
    hatom.setXYZ(2.0*c/3.0, 0, -0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    addElement(hatom);
    hatom = new ElementSphere();
    hatom.setXYZ(-c/3.0, s, -0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    addElement(hatom);
    hatom = new ElementSphere();
    hatom.setXYZ(-c/3.0, -s, -0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    addElement(hatom);
    // create bonds
    Element bond = new ElementCylinder();
    bond.setZ(0.75*h/2);
    bond.setSizeXYZ(0.02, 0.02, 0.75*h);        // along z direction
    addElement(bond);
    bond = new ElementCylinder();
    bond.setSizeXYZ(0.02, 0.02, 0.75*h);        // along z direction
    bond.setZ(0.75*h/2);
    Group group = new Group();
    group.addElement(bond);
    group.setTransformation(alignZToVec(new double[] {
      2.0*c/3.0, 0, -0.25*h
    }));
    addElement(group);
    bond = new ElementCylinder();
    bond.setSizeXYZ(0.02, 0.02, 0.75*h);        // along z direction
    bond.setZ(0.75*h/2);
    group = new Group();
    group.addElement(bond);
    group.setTransformation(alignZToVec(new double[] {
      -c/3.0, s, -0.25*h
    }));
    addElement(group);
    bond = new ElementCylinder();
    bond.setSizeXYZ(0.02, 0.02, 0.75*h);        // along z direction
    bond.setZ(0.75*h/2);
    group = new Group();
    group.addElement(bond);
    group.setTransformation(alignZToVec(new double[] {
      -c/3.0, -s, -0.25*h
    }));
    addElement(group);
  }

  Quaternion alignZToVec (double[] vec) {
    vec = VectorMath.normalize(vec);
    double theta = Math.acos(VectorMath.dot(new double[] {
      0, 0, 1
    }, vec));
    double[] perp = VectorMath.cross3D(new double[] {0, 0, 1}, vec);  // perpendicular vector
    perp = VectorMath.normalize(perp);
    double sin = Math.sin(theta/2);
    return  new Quaternion(Math.cos(theta/2), sin*perp[0], sin*perp[1], sin*perp[2]);
  }
}



