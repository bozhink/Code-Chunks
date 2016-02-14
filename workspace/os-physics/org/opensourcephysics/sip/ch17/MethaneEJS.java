package org.opensourcephysics.sip.ch17;
import org.opensourcephysics.displayejs.*;

/**
 * MethaneEJS creates a 3D visualization of methane using an EJS GroupDrawable.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class MethaneEJS  extends GroupDrawable{
  static final double c = Math.cos(Math.PI / 6); //cosine of 30 degrees
  static final double s = Math.sin(Math.PI / 6); //sine of 30 degrees
  static final double h = Math.sqrt(1.0 - 4.0 * c * c / 9.0); // trapezoid height

  public MethaneEJS() {
    InteractiveElement carbon = new InteractiveSphere(InteractiveSphere.Z_AXIS);
    carbon.setSizeXYZ(0.4, 0.4, 0.4);
    carbon.setXYZ(0,0,0);
    carbon.getStyle().setFillPattern(java.awt.Color.green);
    add(carbon);
    //create H atoms
    InteractiveElement hatom = new InteractiveSphere(InteractiveSphere.Z_AXIS);
    hatom.setXYZ(0,0,0.75*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    add(hatom);
    hatom = new InteractiveSphere(InteractiveSphere.Z_AXIS);
    hatom.setXYZ(2.0*c/3.0,0,-0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    add(hatom);
    hatom = new InteractiveSphere(InteractiveSphere.Z_AXIS);
    hatom.setXYZ(-c/3.0,s,-0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    add(hatom);
    hatom = new InteractiveSphere(InteractiveSphere.Z_AXIS);
    hatom.setXYZ(-c/3.0,-s,-0.25*h);
    hatom.setSizeXYZ(0.2, 0.2, 0.2);
    add(hatom);
    // create bonds
    InteractiveCylinderSimple bond=new InteractiveCylinderSimple();
    bond.setSizeXYZ(0,0,0.75*h);
    bond.setRadius(0.02);
    add(bond);
    bond=new InteractiveCylinderSimple();
    bond.setSizeXYZ(2.0*c/3.0,0,-0.25*h);
    bond.setRadius(0.02);
    add(bond);
    bond=new InteractiveCylinderSimple();
    bond.setSizeXYZ(-c/3.0,s,-0.25*h);
    bond.setRadius(0.02);
    add(bond);
    bond = new InteractiveCylinderSimple();
    bond.setSizeXYZ(-c/3.0,-s,-0.25*h);
    bond.setRadius(0.02);
    add(bond);
  }
}
