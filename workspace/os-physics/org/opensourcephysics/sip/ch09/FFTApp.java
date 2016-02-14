package org.opensourcephysics.sip.ch09;
import java.text.DecimalFormat;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.numerics.FFT;

/**
 * FFTApp tests the FFT class by computing the transform of a complex exponential.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FFTApp extends AbstractCalculation {

   /**
    * Main method for FFTApp program.
    *
    * @param args command line arguments
    */
   public void calculate() {
      DecimalFormat decimal = new DecimalFormat("0.0000"); // output format
      int N = 8;                                           // number of Fourier coefficients
      double[] z = new double[2*N];                        // array that will be transformed
      FFT fft = new FFT(N);                                // FFT implementation for N points
      int mode = control.getInt("mode");                   // mode or harmonic of e^(i*x)
      double x = 0, delta = 2*Math.PI/N;                   // signal will be sampled at f(x)
      for(int i = 0; i<N; i++) {
         z[2*i] = Math.cos(mode*x);                        // real component of e^(i*mode*x)
         z[2*i+1] = Math.sin(mode*x);                      // imaginary component of e^(i*mode*x)
         x += delta;                                       // increase x
      }
      fft.transform(z); // transform data; data will be in wrap-around order
      for(int i = 0; i<N; i++) {
         System.out.println("index = "+i+"\t real = "+decimal.format(z[2*i])+"\t imag = "
                            +decimal.format(z[2*i+1]));
      }
   }

   public void reset() {
      control.setValue("mode", -1);
   }

   /**
    *   Starts the Java application by creating the CalculationControl and the Calculation.
    *   @param args String[]
    */
   public static void main(String[] args) {
      CalculationControl.createApp(new FFTApp());
   }
}
