package org.opensourcephysics.sip.ch03;
import java.awt.*;
import org.opensourcephysics.displayejs.*;
import org.opensourcephysics.frames.*;

/**
 * A demonstration of EJS Interactive Elements
 * @author Francisco Esquembre
 * @version 1.0
 */
public class EJSDemo1App {

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   static public void main(String args[]) {
      EJSFrame frame = new EJSFrame("EJS Demo 1");
      //   panel = new DrawingPanel3D(DrawingPanel3D.DISPLAY_PLANAR_XY);
      frame.setPreferredMinMax(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);
      frame.setDecorationType(DrawingPanel3D.DECORATION_AXES);
      frame.setCursorMode(DrawingPanel3D.CURSOR_CROSSHAIR);
      frame.setAlpha(0.6);
      frame.setBeta(0.2);
      InteractiveCylinder cylinder1 = new InteractiveCylinder(InteractiveCylinder.Z_AXIS);
      cylinder1.setXYZ(0, 0, -0.4);
      cylinder1.setSizeXYZ(0.4, 0.4, 0.8);
      cylinder1.setResolution(Resolution.createDivisions(0.15));
      cylinder1.setMinAngleU(-45);
      cylinder1.setMaxAngleU(225);
      cylinder1.setCustomAxes(new double[] {
         1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0/Math.sqrt(2.),
         1.0/Math.sqrt(2.)
      });
      cylinder1.setEnabled(true);
      frame.addDrawable(cylinder1);
      InteractiveCylinderSimple cylinder2 = new InteractiveCylinderSimple();
      cylinder2.setXYZ(0.8, -0.8, -0.4);
      cylinder2.setSizeXYZ(0.0, 0.0, 0.8);
      cylinder2.setRadius(0.2);
      cylinder2.setResolution(Resolution.createDivisions(0.15));
      cylinder2.setEnabled(true);
      frame.addDrawable(cylinder2);
      InteractiveSphere sphere1 = new InteractiveSphere(InteractiveSphere.Z_AXIS);
      sphere1.setXYZ(-0.8, 0.8, 0);
      sphere1.setSizeXYZ(0.4, 0.4, 0.4);
      sphere1.setEnabled(true);
      frame.addDrawable(sphere1);
      InteractiveCone cone1 = new InteractiveCone(InteractiveCone.X_AXIS);
      cone1.setXYZ(-0.8, -0.8, 0.0);
      cone1.setSizeXYZ(0.4, 0.4, 0.8);
      cone1.setResolution(Resolution.createDivisions(0.15));
      cone1.getStyle().setFillPattern(java.awt.Color.pink);
      cone1.setEnabled(true);
      frame.addDrawable(cone1);
      InteractiveSurface surface1 = new InteractiveSurface();
      surface1.setXYZ(-1, -1, -1);
      surface1.getStyle().setFillPattern(java.awt.Color.red);
      surface1.setEnabled(true);
      frame.addDrawable(surface1);
      int nu = 16, nv = 32;
      double[][][] data = new double[nu][nv][3];
      for(int i = 0;i<nu;i++) {
         for(int j = 0;j<nv;j++) {
            data[i][j][1] = 0.0+i*2.0/(nu-1);
            data[i][j][0] = 0.0+j*2.0/(nv-1);
            data[i][j][2] = Math.cos(3.0*(data[i][j][1]-1))*(data[i][j][0]-1)*(1.5-data[i][j][0])/2.0;
         }
      }
      surface1.setData(data);
      frame.setSize(600, 600);
      frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
      frame.setVisible(true);
   }
}
