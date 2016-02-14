package  org.opensourcephysics.sip.ch17;

import  org.opensourcephysics.controls.*;


/**
 * SpinningTopApp displays the dynamics of a spinning top using quaternions.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0  revised 06/05/2005
 */
public class SpinningTopApp extends AbstractSimulation {
  SpinningTop spinningTop = new SpinningTop();

  public void initialize () {
    double Is = control.getDouble("Is");
    double Iz = control.getDouble("Iz");
    double wx = control.getDouble("initial body wx");
    double wy = control.getDouble("initial body wy");
    double wz = control.getDouble("initial body wz");
    double dt = control.getDouble("dt");
    spinningTop.solver.setStepSize(dt);
    spinningTop.setInertia(Is, Iz);
    spinningTop.setBodyFrameOmega(new double[] {
      wx, wy, wz
    });
  }

  protected void doStep () {
    spinningTop.advanceTime();
  }

  public void reset () {
    control.setValue("Is", 4.0);
    control.setValue("Iz", 1.0);
    control.setValue("initial body wx", 0.5);
    control.setValue("initial body wy", 0.0);
    control.setValue("initial body wz", 10);
    control.setValue("dt", 0.1);
    enableStepsPerDisplay(true);
    initialize();
  }

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main (String[] args) {
    SimulationControl.createApp(new SpinningTopApp());
  }
}



