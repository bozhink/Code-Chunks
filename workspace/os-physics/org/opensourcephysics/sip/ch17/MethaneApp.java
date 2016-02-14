package  org.opensourcephysics.sip.ch17;

import  java.awt.event.MouseEvent;
import  javax.swing.JFrame;
import  org.opensourcephysics.frames.*;
import  org.opensourcephysics.display.InteractiveMouseHandler;
import  org.opensourcephysics.display.InteractivePanel;


/** MethaneApp models CH4 in order to demonstrates how to transform 3D shapes.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class MethaneApp
    implements InteractiveMouseHandler {
  DisplayFrame frame = new DisplayFrame("Methane");
  Methane methane = new Methane();
  double mouseX = 0, mouseY = 0;


  /**
   * Constructs the MethaneApp.
   */
  public MethaneApp () {
    frame.addDrawable(methane);
    frame.setPreferredMinMax(-1, 1, -1, 1);
    frame.setInteractiveMouseHandler(this);
    frame.setVisible(true);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

  /**
   * Handles the mouse action.
   *
   * @param panel InteractivePanel
   * @param evt MouseEvent
   */
  public void handleMouseAction (InteractivePanel panel, MouseEvent evt) {
    switch (panel.getMouseAction()) {
      case InteractivePanel.MOUSE_DRAGGED:
        double dx = panel.getMouseX() - mouseX;
        double dy = panel.getMouseY() - mouseY;
        Rotation3D rotation = new Rotation3D(Math.sqrt(dx*dx + dy*dy), new double[] {
          dy, 0, dx
        });
        methane.transform(rotation);
        mouseX += dx;
        mouseY += dy;
        panel.repaint();
        break;
      case InteractivePanel.MOUSE_PRESSED:
        mouseX = panel.getMouseX();
        mouseY = panel.getMouseY();
        break;
    }
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    new MethaneApp();
  }
}



