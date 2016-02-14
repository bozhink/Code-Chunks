package org.opensourcephysics.sip.ch10;
import java.awt.Color;
import org.opensourcephysics.display.InteractiveCircle;

/**
 * A drawable charged particle.
 *
 * This class is used by the ElectricFieldApp and FieldLineApp.
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class Charge extends InteractiveCircle {

   double q = 0;
   public double getQ() {
      return q;
   }

   public Charge(double x, double y, double q) { //
      super(x, y);
      this.q = q;
      if(q>0) {
         color = Color.red;
      } else {
         color = Color.blue;
      }
   }
}
