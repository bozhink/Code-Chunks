package org.opensourcephysics.sip.ch05;
import java.awt.event.*;
import javax.swing.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * MouseApp demonstrates how to handle actions from an interactive drawing panel.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class MouseApp implements InteractiveMouseHandler {
   PlotFrame frame = new PlotFrame("x", "y", "Interactive Handler");

   /**
    * Constructs the MouseApp.
    */
   public MouseApp() {
      frame.setInteractiveMouseHandler(this);
      frame.setVisible(true);
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   }

   /**
    * Handles mouse actions in the plot frame.
    *
    * @param panel
    * @param evt
    */
   public void handleMouseAction(InteractivePanel panel, MouseEvent evt) {
      switch(panel.getMouseAction()) {
      case InteractivePanel.MOUSE_DRAGGED :
         panel.setMessage("Dragged");
         break;
      case InteractivePanel.MOUSE_PRESSED :
         panel.setMessage("Pressed");
         break;
      case InteractivePanel.MOUSE_RELEASED :
         panel.setMessage(null);
         break;
      }
   }

   /**
    * Starts the program.
    *
    * @param args
    */
   public static void main(String[] args) {
      new MouseApp();
   }
}
