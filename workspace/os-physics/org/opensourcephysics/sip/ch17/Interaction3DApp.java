package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.display3d.simple3d.*;
import  org.opensourcephysics.frames.*;
import  org.opensourcephysics.display3d.core.interaction.*;


/**
 * Interaction3DApp demonstrates how to add and handle actions in an Display3DFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class Interaction3DApp
    implements InteractionListener {

  Interaction3DApp () {
    Display3DFrame frame = new Display3DFrame("3D interactions");
    frame.setPreferredMinMax(-2.5, 2.5, -2.5, 2.5, -2.5, 2.5);
    frame.addInteractionListener(this);         // accepts interactions from the frame's 3D drawing panel
    Element particle = new ElementCircle();
    particle.setSizeXYZ(1, 1, 1);
    particle.getInteractionTarget(Element.TARGET_POSITION).setEnabled(true);                    // enables interactions that change positions
    particle.addInteractionListener(this);      // accepts interactions from the particle
    frame.addElement(particle);                 // adds the particle to the panel
    ElementArrow arrow = new ElementArrow();
    // enables interactions that change the size
    arrow.getInteractionTarget(Element.TARGET_SIZE).setEnabled(true);
    arrow.addInteractionListener(this);         // accepts interactions from the arrow
    frame.addElement(arrow);                    // adds the arrow to the panel
    frame.enableInteraction(true);              // enables interactions with the 3D Frame
    frame.addInteractionListener(this);         // accepts interactions from the frame
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
    frame.setVisible(true);
  }

  /**
   * Handles the interactions sent to this class.
   * @param _evt InteractionEvent
   */
  public void interactionPerformed (InteractionEvent _evt) {
    Object source = _evt.getSource();
    if (_evt.getID() == InteractionEvent.MOUSE_PRESSED) {
      System.out.println("Mouse clicked");
    }
    if (source instanceof ElementCircle) {
      System.out.println("A particle has been hit");
    }
  }

  static public void main (String args[]) {
    new Interaction3DApp();
  }
}



