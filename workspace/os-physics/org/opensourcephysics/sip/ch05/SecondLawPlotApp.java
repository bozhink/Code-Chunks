package org.opensourcephysics.sip.ch05;
import org.opensourcephysics.frames.PlotFrame;

/**
 * SecondLawPlotApp demonstrates how to create log-log plots using
 * data from planetary orbits to demonstrate Kepler's second law.
 *
 * The program plots the log of the planet's semi-major axis vs. the log of the orbital period.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class SecondLawPlotApp {

   /**
    * Command line entry point for program.
    * @param args
    */
   public static void main(String[] args) {
      PlotFrame frame = new PlotFrame("ln(a)", "ln(T)", "Kepler's second law");
      frame.setLogScale(true, true);
      frame.setConnected(false);
      double[] period = {0.241, 0.615, 1.0, 1.88, 11.86, 29.50, 84.0, 165, 248};
      double[] a = {0.387, 0.723, 1.0, 1.523, 5.202, 9.539, 19.18, 30.06, 39.44};
      frame.append(0, a, period);
      frame.setVisible(true);
      // defines titles of table columns
      frame.setXYColumnNames(0, "T (years)", "a (AU)");
      // shows data table; can also be done from frame menu
      frame.showDataTable(true);
      frame.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
   }
}
