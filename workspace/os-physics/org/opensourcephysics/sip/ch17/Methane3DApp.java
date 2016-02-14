package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.frames.*;


/**
 * Methane3DApp displays a methane model in a Display3DFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class Methane3DApp {
  Display3DFrame frame = new Display3DFrame("3D Methane visualization");

  public Methane3DApp () {
    frame.addElement(new Methane3D());
    frame.setAllowQuickRedraw(false); // scene is simple, so draw it properly when rotating
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
    frame.setVisible(true);
  }

  static public void main (String args[]) {
    new Methane3DApp();
  }
}



