package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.PlotFrame;

/**
 * GraphicalSolutionApp presents a graphical solution to the logistic map.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class GraphicalSolutionApp extends AbstractSimulation {

   PlotFrame plotFrame = new PlotFrame("iterations", "x", "graphical solution");
   double r;    // control parameter
   int iterate; // iterate of f(x)
   double x, y;
   double x0, y0;
   public GraphicalSolutionApp() {
      plotFrame.setPreferredMinMax(0, 1, 0, 1);
      plotFrame.setConnected(true);
      plotFrame.setXPointsLinked(true);
      plotFrame.setMarkerShape(0, 0); // second argument indicates no marker
      plotFrame.setMarkerShape(2, 0);
   }

   public void reset() {
      control.setValue("r", 0.89);
      control.setValue("x", 0.2);
      control.setAdjustableValue("iterate", 1);
   }

   public void initialize() {
      r = control.getDouble("r");
      x = control.getDouble("x");
      iterate = control.getInt("iterate");
      x0 = x;
      y0 = 0;
      clear();
   }

   public void startRunning(){
      if (iterate!=control.getInt("iterate")){
         iterate = control.getInt("iterate");
         clear();
      }
      r = control.getDouble("r");
   }

   public void doStep() {
      y = f(x, r, iterate);
      plotFrame.append(1, x0, y0);
      plotFrame.append(1, x0, y);
      plotFrame.append(1, y, y);
      x = x0 = y0 = y;
      control.setValue("x", x);
   }

   void drawFunction() {
      int nplot = 200; // # of points at which function computed
      double delta = 1.0/nplot;
      double x = 0;
      double y = 0;
      for(int i = 0; i<=nplot; i++) {
         y = f(x, r, iterate);
         plotFrame.append(0, x, y);
         x += delta;
      }
   }

   void drawLine() { // draws line y = x
      for(double x = 0; x<1; x += 0.001) {
         plotFrame.append(2, x, x);
      }
   }

   public double f(double x, double r, int iterate) {
      if(iterate>1) {
         double y = f(x, r, iterate-1);
         return 4*r*y*(1-y);
      } else {
         return 4*r*x*(1-x);
      }
   }

   public void clear() {
      plotFrame.clearData();
      drawFunction();
      drawLine();
      plotFrame.repaint();
   }

   public static void main(String[] args) {
      SimulationControl control = SimulationControl.createApp(new GraphicalSolutionApp());
      control.addButton("clear", "Clear", "Clears the trajectory.");
   }
}
