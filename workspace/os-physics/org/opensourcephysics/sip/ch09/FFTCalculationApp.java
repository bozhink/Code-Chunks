package org.opensourcephysics.sip.ch09;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.FFTFrame;

/**
 * Calculates the fft and displays the result.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FFTCalculationApp
    extends AbstractCalculation {
  FFTFrame frame = new FFTFrame("frequency", "amplitude", "FFT Frame Test");

  /**
   * Calculates the FFT.
   */
  public void calculate() {
    double xmin = control.getDouble("xmin");
    double xmax = control.getDouble("xmax");
    int n = control.getInt("N");
    double xi = xmin, delta = (xmax - xmin) / n;
    double[] data = new double[2 * n];
    int mode = control.getInt("mode");
    for (int i = 0; i < n; i++) {
      data[2 * i] = Math.cos(mode * xi);
      data[2 * i + 1] = Math.sin(mode * xi);
      xi += delta;
    }
    frame.doFFT(data, xmin, xmax);
    frame.showDataTable(true);
  }

  /**
   * Rests the default conditions.
   */
  public void reset() {
    control.setValue("mode", 1);
    control.setValue("xmin", 0);
    control.setValue("xmax", "2*pi");
    control.setValue("N", 32);
    calculate();
  }

  /**
   * Starts the Java application by creating the CalculationControl and the Calculation.
   * @param args String[]
   */
  public static void main(String[] args) {
    CalculationControl.createApp(new FFTCalculationApp());
  }
}
