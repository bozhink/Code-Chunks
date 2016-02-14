package org.opensourcephysics.sip.ch05;
import org.opensourcephysics.frames.PlotFrame;

/**
 * ScatterAnalysis accumulates particle scattering data and plots the differential cross section.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class ScatterAnalysis {
   int numBins = 20;
   PlotFrame frame = new PlotFrame("angle", "sigma", "differential cross section");
   double[] bins = new double[numBins];
   double dtheta = Math.PI/(numBins-1);
   double totalN = 0;  // total number of scattered particles

   /**
    * Clears the cross section data.
    */
   void clear() {
      for(int i = 0;i<numBins;i++) {
         bins[i] = 0;
      }
      totalN = 0;
      frame.clearData();
      frame.repaint();
   }

   /**
    * Detects a particle and accumulates cross section data.
    *
    * @param b the impact parameter
    * @param db the impact parameter increment
    * @param theta the sacttering angle
    */
   void detectParticle(double b, double theta) {
      theta = Math.abs(theta);  // treats positive and negative angles equally to get better statistics
      int index = (int) (theta/dtheta);
      bins[index] += b;
      totalN += b;
   }

   /**
    * Plots the cross section data.
    *
    * @param  radius the beam radius
    */
   void plotCrossSection(double radius) {
      double targetDensity = 1/Math.PI/radius/radius;
      double delta = (dtheta*180)/Math.PI;  // uses degrees for plot
      frame.clearData();
      for(int i = 0;i<numBins;i++) {
         double domega = 2*Math.PI*Math.sin((i+0.5)*dtheta)*dtheta;
         double sigma = bins[i]/totalN/targetDensity/domega;
         frame.append(0, (i+0.5)*delta, sigma);
      }
      frame.setVisible(true);
   }
}
