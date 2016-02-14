// example of a single line comment statement (ignored by compiler)
package org.opensourcephysics.sip.ch02;     // location of file

/**
 * FirstFallingBallApp computes the time for a ball to fall 10 meters and displays the variables.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class FirstFallingBallApp {          // beginning of class definition

   /**
    * Starts the Java application.
    * @param args  command line parameters
    */
   public static void main(String[] args) { // beginning of method definition
      // braces { } used to group statements.
      // indent statements within a block so that they can be easily identified
      // following statements form the body of main method
      double y0 = 10;   // example of declaration and assignment statement
      double v0 = 0;    // initial velocity
      double t = 0;     // time
      double dt = 0.01; // time step
      double y = y0;
      double v = v0;
      double g = 9.8;   // gravitational field
      for(int n = 0; n<100; n++) { // beginning of loop, n++ equivalent to n = n + 1
         // repeat following three statements 100 times
         y = y+v*dt;               // indent statements in loop for clarity
         v = v-g*dt;               // use Euler algorithm
         t = t+dt;
      }                            // end of for loop
      System.out.println("Results");
      System.out.println("final time = "+t);
      // display numerical result
      System.out.println("y = "+y+" v = "+v);
      // display analytic result
      double yAnalytic = y0+v0*t-0.5*g*t*t;
      double vAnalytic = v0-g*t;
      System.out.println("analytic y = "+yAnalytic+" v = "+vAnalytic);
   } // end of method definition
} // end of class definition

