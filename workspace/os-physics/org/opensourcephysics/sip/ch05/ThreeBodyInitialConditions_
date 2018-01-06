package org.opensourcephysics.sip.ch05;

/**
 * ThreeBodyInitialConditions stores interesting initial conditions for the three-body problem.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0
 */
public class ThreeBodyInitialConditions {

   static final double sn = Math.sin(Math.PI/3);
   static final double half = Math.cos(Math.PI/3);
   static final double x1 = 0.97000436;
   static final double v1 = 0.93240737/2;
   static final double y1 = 0.24308753;
   static final double v2 = 0.86473146/2;
   static final double v = 0.8; // inital speed
   // state = {x1, vx1, y1, vy1, x2, vx2, y2, vy2, x3, vx3, y3, vy3, t}
   // EULER places masses on a line
   static final double[] EULER = {0, 0, 0, 0, 1, 0, 0, v, -1, 0, 0, -v, 0};
   // LAGRANGE places masses on an equilateral triangle
   static final double[] LAGRANGE = {1, 0, 0, v, -half, -v*sn, sn, -v*half, -half, v*sn, -sn, -v*half, 0};
   static final double[] MONTGOMERY = {x1, v1, -y1, v2, -x1, v1, y1, v2, 0, -2*v1, 0, -2*v2, 0};
}
