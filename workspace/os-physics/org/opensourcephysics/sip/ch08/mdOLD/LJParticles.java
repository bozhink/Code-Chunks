// start break
// beginning
package org.opensourcephysics.sip.ch08.mdOLD;

import java.awt.Color;
import java.awt.Graphics;
import org.opensourcephysics.display.Drawable;
import org.opensourcephysics.display.DrawingPanel;
import org.opensourcephysics.display.Histogram;
import org.opensourcephysics.frames.HistogramFrame;
import org.opensourcephysics.numerics.ODE;
import org.opensourcephysics.numerics.ODESolver;
import org.opensourcephysics.numerics.Verlet;

public class LJParticles implements Drawable, ODE {
   public double state[];
   public double ax[], ay[];
   public int N, nx, ny;   // number of particles, number per row, number per column
   public double Lx, Ly;
   public double rho = N/(Lx*Ly);
   public double initialKineticEnergy;
   public int steps = 0;
   public double dt = 0.01;
   private double rCutoff2 = 3.0*3.0;
   public double t;
   public double totalPotentialEnergyAccumulator;
   public double totalKineticEnergyAccumulator,
                 totalKineticEnergySquaredAccumulator;
   public double virialAccumulator;
   public String initialConfiguration;
   Histogram velocityHistogram = new Histogram();
   public double radius = 0.5;   // radius of particles on screen
   ODESolver ode_solver = new Verlet(this);
   boolean computeAccelerationNow;   // used because we save acceleration between steps
   public void initialize() {
      N = nx*ny;
      reset();
      state = new double[1+4*N];
      ax = new double[N];
      ay = new double[N];
      if(initialConfiguration.equals("crystal")) {
         setTriangularLattice();
      } else if(initialConfiguration.equals("rectangular")) {
         setRectangularLattice();
      } else {
         setRandomPositions();
      }
      setVelocities();
      computeAcceleration();
      ode_solver.setStepSize(dt);
      computeAccelerationNow = false;
   }

   // end break
   // start break
   // setRandomPositions
   public void setRandomPositions() {   // particles placed at random, but not closer than rMinimumSquared
      double rMinimumSquared = Math.pow(2.0, 1.0/3.0);
      boolean overlap;
      for(int i = 0;i<N;++i) {
         do {
            overlap = false;
            state[4*i] = Lx*Math.random();   // x
            state[4*i+2] = Ly*Math.random();   // y
            int j = 0;
            while(j<i&&!overlap) {
               double dx = state[4*i]-state[4*j];
               double dy = state[4*i+2]-state[4*j+2];
               if(dx*dx+dy*dy<rMinimumSquared) {
                  overlap = true;
               }
               j++;
            }
         } while(overlap);
      }
   }

   // end break
   // start break
   // setRectangularLattice
   public void setRectangularLattice() {   // place particles on a rectangular lattice
      double dx = Lx/nx;   // distance between columns
      double dy = Ly/ny;   // distance between rows
      int i = 0;
      int iy = 0;
      while(i<N) {
         for(int ix = 0;ix<nx;++ix) {   // loop through particles in a row
            if(i<N) {
               state[4*i] = dx*(ix+0.5);
               state[4*i+2] = dy*(iy+0.5);
               i++;
            }
         }
         iy++;
      }
   }

   // end break
   // start break
   // setTriangularLattice
   public void setTriangularLattice() {   // place particles on triangular lattice
      double dnx = Math.sqrt(N);
      int ns = (int) dnx;
      if(dnx-ns>0.001) {
         ns++;
      }
      double dx = Lx/ns;
      double dy = Ly/ns;
      int i = 0;
      int iy = 0;
      while(i<N) {
         for(int ix = 0;ix<ns;++ix) {
            if(i<N) {
               state[4*i+2] = dy*(iy+0.5);
               if(iy%2==0) {
                  state[4*i] = dx*(ix+0.25);
               } else {
                  state[4*i] = dx*(ix+0.75);
               }
               i++;
            }
         }
         iy++;
      }
   }

   // end break
   // start break
   // setVelocities
   public void setVelocities() {
      double twoPi = 2.0*Math.PI;
      for(int i = 0;i<N;++i) {
         double r = Math.random();   // use to generate exponential distribution
         double a = -Math.log(r);
         double theta = twoPi*Math.random();   // assign velocities according to Maxwell-Boltzmann distribution using Box-Muller method
         state[4*i+1] = Math.sqrt(2.0*a*initialKineticEnergy)*Math.cos(theta);   // vx
         state[4*i+3] = Math.sqrt(2.0*a*initialKineticEnergy)*Math.sin(theta);   // vy
      }   // zero center of mass momentum
      double vxSum = 0.0;
      double vySum = 0.0;
      for(int i = 0;i<N;++i) {
         vxSum += state[4*i+1];
         vySum += state[4*i+3];
      }
      double vxcm = vxSum/N;   // center of mass momentum (velocity)
      double vycm = vySum/N;
      for(int i = 0;i<N;++i) {
         state[4*i+1] -= vxcm;
         state[4*i+3] -= vycm;
      }
   }

   // end break
   // start break
   // averages
   public double getMeanTemperature() {
      return totalKineticEnergyAccumulator/(N*steps);
   }

   public double getMeanEnergy() {
      return totalKineticEnergyAccumulator/steps+totalPotentialEnergyAccumulator/steps;
   }

   public double getMeanPressure() {
      double meanVirial;
      meanVirial = virialAccumulator/steps;
      return 1.0+0.5*meanVirial/(N*getMeanTemperature());   // quantity PA/NkT
   }

   public double getHeatCapacity() {
      double meanTemperature = getMeanTemperature();
      double meanTemperatureSquared = totalKineticEnergySquaredAccumulator/steps;
      double sigma2 = meanTemperatureSquared-meanTemperature*meanTemperature;   // heat capacity related to fluctuations of temperature
      double denom = sigma2/(N*meanTemperature*meanTemperature)-1.0;
      return N/denom;
   }

   public void reset() {
      t = 0;
      rho = N/(Lx*Ly);
      resetAverages();
      velocityHistogram.setBinWidth(2*initialKineticEnergy/N);   // assuming vmax=2*initalTemp and bin width = Vmax/N
      velocityHistogram.setBinOffset(initialKineticEnergy/N);
   }

   public void resetAverages() {
      steps = 0;
      virialAccumulator = 0;
      totalPotentialEnergyAccumulator = 0;
      totalKineticEnergyAccumulator = 0;
      totalKineticEnergySquaredAccumulator = 0;
      velocityHistogram.clear();
   }

   // end break
   // start break
   // computeAcceleration
   public void computeAcceleration() {
      for(int i = 0;i<N;i++) {
         ax[i] = 0;
         ay[i] = 0;
      }
      for(int i = 0;i<N-1;i++) {
         for(int j = i+1;j<N;j++) {
            double dx = pbcSeparation(state[4*i]-state[4*j], Lx);
            double dy = pbcSeparation(state[4*i+2]-state[4*j+2], Ly);
            double r2 = dx*dx+dy*dy;
            double oneOverR2 = 1.0/r2;
            double oneOverR6 = oneOverR2*oneOverR2*oneOverR2;
            double fOverR = 48.0*oneOverR6*(oneOverR6-0.5)*oneOverR2;
            double fx = fOverR*dx;
            double fy = fOverR*dy;
            ax[i] += fx;
            ay[i] += fy;
            ax[j] -= fx;
            ay[j] -= fy;
            totalPotentialEnergyAccumulator += 4.0*(oneOverR6*oneOverR6-oneOverR6);
            virialAccumulator += dx*fx+dy*fy;
         }
      }
   }

   // end break
   // start break
   // pbcSeparation
   private double pbcSeparation(double ds, double L) {
      if(ds>0.5*L) {
         ds -= L;
      } else if(ds<-0.5*L) {
         ds += L;
      }
      return ds;
   }

   // end break
   // start break
   // pbcPosition
   private double pbcPosition(double s, double L) {
      if(s>L) {
         s -= L;
      } else if(s<0) {
         s += L;
      }
      return s;
   }

   // end break
   // start break
   // odeMethods
   public void getRate(double[] state, double[] rate) {   // Compute accelerations every other call to getRate because
      // new velocity is computed from previous and current acceleration,
      // and previous acceleration is saved in step method of VelocityVerlet.
      // getRate is called twice for each call to step.
      if(computeAccelerationNow) {
         computeAcceleration();
         computeAccelerationNow = false;
      } else {
         computeAccelerationNow = true;
      }
      for(int i = 0;i<N;i++) {
         rate[4*i] = state[4*i+1];   // vx: rates for positions are velocities
         rate[4*i+2] = state[4*i+3];   // vy
         rate[4*i+1] = ax[i];   // rate for velocity is acceleration
         rate[4*i+3] = ay[i];
      }
      rate[4*N] = 1;   // dt/dt = 1
   }

   public double[] getState() {
      return state;
   }

   public void step(HistogramFrame xVelocityHistogram) {
      ode_solver.step();
      double totalKineticEnergy = 0;
      for(int i = 0;i<N;i++) {
         totalKineticEnergy += (state[4*i+1]*state[4*i+1]+state[4*i+3]*state[4*i+3]);
         xVelocityHistogram.append(state[4*i+1]);
         state[4*i] = pbcPosition(state[4*i], Lx);
         state[4*i+2] = pbcPosition(state[4*i+2], Ly);
      }
      totalKineticEnergy *= 0.5;
      steps++;
      totalKineticEnergyAccumulator += totalKineticEnergy;
      totalKineticEnergySquaredAccumulator += totalKineticEnergy*totalKineticEnergy;
      t += dt;
   }

   // end break
   // start break
   // draw
   public void draw(DrawingPanel myWorld, Graphics g) {
      if(state==null) {
         return;
      }
      int pxRadius = Math.abs(myWorld.xToPix(radius)-myWorld.xToPix(0));
      int pyRadius = Math.abs(myWorld.yToPix(radius)-myWorld.yToPix(0));
      g.setColor(Color.red);
      for(int i = 0;i<N;i++) {
         int xpix = myWorld.xToPix(state[4*i])-pxRadius;
         int ypix = myWorld.yToPix(state[4*i+2])-pyRadius;
         g.fillOval(xpix, ypix, 2*pxRadius, 2*pyRadius);
      }   // draw cell boundary
      g.setColor(Color.black);
      int xpix = myWorld.xToPix(0);
      int ypix = myWorld.yToPix(Ly);
      int lx = myWorld.xToPix(Lx)-myWorld.xToPix(0);
      int ly = myWorld.yToPix(0)-myWorld.yToPix(Ly);
      g.drawRect(xpix, ypix, lx, ly);
   }
   // end break
}
