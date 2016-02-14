package org.opensourcephysics.sip.ch17;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.displayejs.*;

/**
 * MethaneEJSApp displays a methane model in an EJSFrame.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class MethaneEJSApp{
  EJSFrame frame = new EJSFrame("EJS Methane Visualization");


  public MethaneEJSApp() {
    Drawable3D  methane= new MethaneEJS();
    frame.addDrawable(methane);
    frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
    frame.setVisible(true);
  }

  static public void main(String args[]) {
    new MethaneEJSApp();
  }
}
