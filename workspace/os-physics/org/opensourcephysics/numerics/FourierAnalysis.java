package org.opensourcephysics.numerics;

import org.opensourcephysics.numerics.FFT;

/**
 *
 * FourierAnalysis adds gutter points to time series data before performing a fast Fourier transform.
 * Gutter points increase the number points in order to approximate a nonperiodic function.
 * The FFT output is phase shifted to adjust for the FFT domain [0, 2*pi].
 *
 * @author W. Christian
 * @version 1.0
 */
public class FourierAnalysis {

  static final double PI2 = 2*Math.PI;
  FFT fft = new FFT();
  double[] fftData, omega, freqs;
  double[] cosVec, sinVec, gutterVec;

  /**
   * Fourier analyzes the given complex data z[] after adding gutter points at the start and end of the z[] array.
   *
   * @param x double[]
   * @param z double[]
   * @param gutter int
   * @return double[] the Fourier spectrum
   */
  public double[] doAnalysis(double[] x, double[] z, int gutter){
    fftData=new double[z.length+4*gutter];
    gutterVec = new double[2*gutter];
    System.arraycopy(z,0,fftData,2*gutter,z.length);
    fft.transform(fftData); // Computes the FFT of data leaving the result in fft_pts.
    fft.toNaturalOrder(fftData);
    double dx=x[1]-x[0];
    double xmin=x[0]-gutter*dx;
    double xmax=x[x.length-1]+(gutter+1)*dx;
    omega=fft.getNaturalOmega(xmin, xmax);
    freqs=fft.getNaturalFreq(xmin, xmax);
    cosVec = new double[omega.length];
    sinVec = new double[omega.length];
    for (int i = 0, nOmega = omega.length; i < nOmega; i++) {
      cosVec[i] = Math.cos(omega[i] * xmin);
      sinVec[i] = Math.sin(omega[i] * xmin);
    }
    for (int i = 0, nOmega = omega.length; i < nOmega; i++) {
      double re = fftData[2 * i];
      double im = fftData[2 * i + 1];
      fftData[2 * i] = re * cosVec[i] + im * sinVec[i];
      fftData[2 * i + 1] = im * cosVec[i] - re * sinVec[i];
    }
   return fftData;
  }

  /**
   * Repeats the Fourier analysis of the complex data z[] with the previously set scale and gutter.
   *
   * @param z double[]
   * @return double[] the Fourier spectrum
   */
  public double[] repeatAnalysis(double[] z){
  System.arraycopy(gutterVec,0,fftData,0,gutterVec.length);  // zero the left gutter
  System.arraycopy(gutterVec,0,fftData,fftData.length-1-gutterVec.length,gutterVec.length);  // zero the right gutter
  System.arraycopy(z,0,fftData,gutterVec.length,z.length);
  fft.transform(fftData); // Computes the FFT of data leaving the result in fft_pts.
  fft.toNaturalOrder(fftData);
  for (int i = 0, nOmega = omega.length; i < nOmega; i++) {
    double re = fftData[2 * i];
    double im = fftData[2 * i + 1];
    fftData[2 * i] = re * cosVec[i] + im * sinVec[i];
    fftData[2 * i + 1] = im * cosVec[i] - re * sinVec[i];
  }
 return fftData;
}

  /**
   * Gets the angular frequencies of the Fourier spectrum.
   * @return double[]
   */
  public double[] getNaturalOmega(){
    return omega;
  }

  /**
   * Gets the frequencies of the Fourier spectrum.
   * @return double[]
   */
  public double[] getNaturalFreq() {
    return freqs;
  }

}
