package org.opensourcephysics.sip.ch17;
import java.awt.*;
import javax.swing.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.displayejs.*;

/**
 * BoxEJSApp demonstrates various EJS features.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/31/05
 */
public class BoxEJSApp {

   public static void main(String[] args) {
      // create a drawing frame and a drawing panel
      EJSFrame frame=new EJSFrame("EJS Demo");
      frame.setPreferredMinMax(-10,10,-10,10,-10,10);
      frame.setDecorationType (DrawingPanel3D.DECORATION_AXES);
      InteractiveElement block = new InteractiveBox();
      block.setXYZ( 0, 0, 0);
      block.setSizeXYZ(6, 6, 3);
      block.getStyle().setFillPattern(Color.RED);
      block.setResolution(Resolution.createDivisions(1.0)); // divide the block in subblocks
      frame.addDrawable(block);
      frame.setVisible(true);
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   }
}
