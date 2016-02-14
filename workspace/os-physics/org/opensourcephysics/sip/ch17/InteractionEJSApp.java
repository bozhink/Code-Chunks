package org.opensourcephysics.sip.ch17;
import javax.swing.*;
import org.opensourcephysics.displayejs.*;
import org.opensourcephysics.frames.*;

/**
 * InteractionEJSApp demonstrates how to add and handle actions in an EJSFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class InteractionEJSApp implements InteractionListener {
   InteractionEJSApp () {
      EJSFrame frame= new EJSFrame("EJS Interactions");
      frame.setPreferredMinMax(-0.25,0.25,-0.25,0.25,-0.25,0.25);
      frame.addListener(this);  // send interactions FROM the panel to this app
      InteractiveParticle particle = new InteractiveParticle();
      particle.setEnabled(true);   // enables interactions such as dragging
      particle.addListener(this);  // sends interactions FROM the particle to this app
      frame.addDrawable(particle); // adds the particle to the panel
      InteractiveArrow arrow = new InteractiveArrow();
      arrow.setEnabled(true);  // enables interactions such as dragging
      arrow.addListener(this);  // sends interactions FROM the arrow to this app
      frame.addDrawable(arrow); // adds the arrow to the panel
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      frame.setVisible(true);
   }

   /**
   * Handles the interactions sent to this class.
   * @param _evt InteractionEvent
   */
   public void interactionPerformed (InteractionEvent _evt) {
      if (_evt.getID()!=InteractionEvent.MOUSE_PRESSED) return;
      if (_evt.getSource() instanceof InteractiveParticle ) {
         System.out.println("A particle has been hit");
      } else if (_evt.getSource()instanceof InteractiveArrow) {
         if (_evt.getTarget().getClass()==InteractionTargetElementSize.class)
            System.out.println("An arrow's head has been hit");
         else System.out.println("An arrow's tail has been hit");
      }
   }

   static public void main (String args[]) {
      new InteractionEJSApp();
   }
}
