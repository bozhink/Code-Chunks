package org.opensourcephysics.sip.ch06;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.PlotFrame;
import org.opensourcephysics.numerics.RK4;

/**
 * PoincareApp plots a phase diagram and a Poincare map for the damped, driven pendulum.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 03/23/05
 */
public class PoincareApp extends AbstractSimulation {

   final static double PI = Math.PI;                                                      // defined for brevity
   PlotFrame phaseSpace = new PlotFrame("theta", "angular velocity", "Phase space plot");
   PlotFrame poincare = new PlotFrame("theta", "angular velocity", "Poincare plot");
   int nstep = 100;                                                                       // # iterations between Poincare plot
   DampedDrivenPendulum pendulum = new DampedDrivenPendulum();
   RK4 odeMethod = new RK4(pendulum);

   /**
    * Constructs a PoincareApp.
    */
   public PoincareApp() {
      // angular frequency of external force equals two and hence period of external force equals pi
      odeMethod.setStepSize(PI/nstep); // dt = PI/nsteps
      phaseSpace.setMarkerShape(0, 6); // second argument indicates a pixel
      poincare.setMarkerSize(0, 2);    // smaller size gives better resolution
      poincare.setMarkerColor(0, java.awt.Color.RED);
      phaseSpace.setMessage("t = "+0);
   }

   /**
    * Resets all parameters to their defaults.
    */
   public void reset() {
      control.setValue("theta", 0.2);
      control.setValue("angular velocity", 0.6);
      control.setValue("gamma", 0.2); // damping constant
      control.setValue("A", 0.85);    // amplitude
   }

   /**
    * Does a step by advancing the time by PI.
    *
    * Multiple data points are added to the phase space plot in a single step in order
    * to produce a smooth curve.
    *
    * Because the angular frequency of the external force equals two, a single data point
    * is added to the Poincare map at the end of the step.
    */
   public void doStep() {
      double state[] = pendulum.getState();
      for(int istep = 0; istep<nstep; istep++) {
         odeMethod.step();
         if(state[0]>PI) {
            state[0] = state[0]-2.0*PI;
         } else if(state[0]<-PI) {
            state[0] = state[0]+2*PI;
         }
         phaseSpace.append(0, state[0], state[1]);
      }
      poincare.append(0, state[0], state[1]);
      phaseSpace.setMessage("t = "+decimalFormat.format(state[2]));
      poincare.setMessage("t = "+decimalFormat.format(state[2]));
      if(phaseSpace.isShowing()) {
         phaseSpace.render();
      }
      if(poincare.isShowing()) {
         poincare.render();
      }
   }

   /**
    * Initializes the animation and clears the plots.
    */
   public void initialize() {
      double theta = control.getDouble("theta");            // initial angle
      double omega = control.getDouble("angular velocity"); // initial angular velocity
      pendulum.gamma = control.getDouble("gamma"); // damping constant
      pendulum.A = control.getDouble("A");         // amplitude of external force
      pendulum.initializeState(new double[]{theta, omega, 0});
      clear();
   }

   /**
    * Clears the plots.
    */
   public void clear() {
      phaseSpace.clearData();
      poincare.clearData();
      phaseSpace.render();
      poincare.render();
   }

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) {
      SimulationControl control = SimulationControl.createApp(new PoincareApp());
      control.addButton("clear", "Clear");
   }
}
