package org.opensourcephysics.sip.ch03;
import org.opensourcephysics.displayejs.*;
import org.opensourcephysics.frames.*;

/**
 * A demonstration of an EJS group.
 * A group can later be positioned as a single object.
 *
 * @author Francisco Esquembre
 * @version 1.0
 */
public class EJSDemo2App {

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   static public void main(String args[]) {
      EJSFrame frame = new EJSFrame("EJS Demo 2");
      frame.setPreferredMinMax(-10.0, 10.0, -10.0, 10.0, -10.0, 10.0);
      Group group = new Group();
      InteractiveElement planet = new InteractiveSphere();
      planet.setXYZ(0.0, 0.0, 0.0);
      planet.setSizeXYZ(10.0, 10.0, 10.0);
      frame.addDrawable(planet);
      planet.setGroup(group);
      planet.setEnabled(true);
      InteractiveElement caption = new InteractiveText("Planet & Satellites");
      caption.setXYZ(0.0, 0.0, -10.0);
      frame.addDrawable(caption);
      for(int i = 0;i<10;i++) {
         double alpha = Math.random()*Math.PI*2.0;
         double beta = -Math.PI*0.5+Math.random()*Math.PI;
         double x = 7*Math.cos(alpha)*Math.cos(beta);
         double y = 7*Math.sin(alpha)*Math.cos(beta);
         double z = 7*Math.sin(beta);
         InteractiveElement satellite = new InteractiveParticle();  // new InteractiveCylinder();
         satellite.setSizeXYZ(2, 2, 2);
         satellite.getStyle().setFillPattern(java.awt.Color.red);
         satellite.setXYZ(x, y, z);
         frame.addDrawable(satellite);
         satellite.setGroup(group);
      }
      frame.setSize(300, 300);
      frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
      frame.setVisible(true);
   }
}
