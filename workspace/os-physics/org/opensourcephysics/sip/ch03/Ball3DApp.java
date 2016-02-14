package org.opensourcephysics.sip.ch03;
import java.awt.*;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.Display3DFrame;
import org.opensourcephysics.display3d.simple3d.*;
import org.opensourcephysics.display3d.core.Resolution;

/**
 * Ball3DApp demonstrates the 3D drawing framework by creating a bouncing ball simulation.
 * and implementing the doStep method.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  05/16/05
 */
public class Ball3DApp extends AbstractSimulation {

   Display3DFrame frame = new Display3DFrame("3D Ball");
   Element ball = new ElementEllipsoid();
   double time = 0, dt = 0.1;
   double vz = 0;

   /**
    *
    * Constructs Ball3DApp and initializes the drawing.
    *
    */
   public Ball3DApp() {
      frame.setPreferredMinMax(-5.0, 5.0, -5.0, 5.0, 0.0, 10.0);
      ball.setXYZ(0, 0, 9);
      ball.setSizeXYZ(1, 1, 1); // ball displayed in 3D as a planar ellipse of size (dx,dy,dz)
      frame.addElement(ball);
      Element box = new ElementBox();
      box.setXYZ(0, 0, 0);
      box.setSizeXYZ(4, 4, 1);
      box.getStyle().setFillColor(Color.RED);
      // divide sides of box into smaller rectangles
      box.getStyle().setResolution(new Resolution(5, 5, 2));
      frame.addElement(box);
      frame.setMessage("time = "+ControlUtils.f2(time));
   }

   /**
    *
    * Does an animation step by moving the ball.
    *
    */
   protected void doStep() {
      time += 0.1;
      double z = ball.getZ()+vz*dt-4.9*dt*dt;
      vz -= 9.8*dt;
      if((vz<0)&&(z<1)) {
         vz = -vz;
      }
      ball.setZ(z);
      frame.setMessage("time = "+ControlUtils.f2(time));
   }

   /**
    *
    * Starts the Java application.
    *
    * @param args  command line parameters
    *
    */
   public static void main(String[] args) {
      SimulationControl.createApp(new Ball3DApp());
   }
}
