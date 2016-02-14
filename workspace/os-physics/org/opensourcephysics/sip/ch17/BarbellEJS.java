package org.opensourcephysics.sip.ch17;
import org.opensourcephysics.displayejs.*;

/**
 * BarbellEJS creates a 3D visualization of a barbell using an EJS GroupDrawable.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class BarbellEJS extends GroupDrawable {
   public BarbellEJS() {
      InteractiveCylinderSimple bar = new InteractiveCylinderSimple();
      bar.setXYZ(0,0,5);
      bar.setSizeXYZ(0,0,10);
      bar.setRadius(0.2);
      add(bar);
      InteractiveElement sphere = new InteractiveSphere();
      sphere.setXYZ(0,0,-5);
      sphere.setSizeXYZ(4,4,4);
      add(sphere);
      sphere = new InteractiveSphere();
      sphere.setXYZ(0, 0, 5);
      sphere.setSizeXYZ(4,4,4);
      add(sphere);
  }
}
