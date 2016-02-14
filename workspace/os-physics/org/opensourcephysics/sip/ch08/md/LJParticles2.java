// start break
// beginning
package org.opensourcephysics.sip.ch08.md;
import java.awt.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;

/**
 * LJParticlesApp evolves a two-cimensional system of interacting particles
 * via the Lennard-Jones potential without using an ODESolver.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0 revised 03/28/05
 */
public class LJParticles2 implements Drawable {
   public double[] x,y,vx,vy;
   public double[] ax, ay;
   public int N, nx, ny;   // number of particles, number per row, number per column
   public double Lx, Ly;
   public double rho = N/(Lx*Ly);
   public double initialKineticEnergy;
   public int steps = 0;
   public double dt = 0.01,halfdt2, halfdt;
   private double rCutoff2 = 3.0*3.0;
   public double t;
   public double totalPotentialEnergyAccumulator;
   public double totalKineticEnergyAccumulator,
                 totalKineticEnergySquaredAccumulator;
   public double virialAccumulator;
   public String initialConfiguration;
   public double radius = 0.5;   // radius of particles on screen

   public void initialize() {
      N = nx*ny;
      t = 0;
      rho = N/(Lx*Ly);
      resetAverages();
      x = new double[N];
      y = new double[N];
      vx = new double[N];
      vy = new double[N];
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
      halfdt2 = 0.5*dt*dt;
      halfdt = 0.5*dt;
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
            vx[i] = Lx*Math.random();   // x
            vy[i] = Ly*Math.random();   // y
            int j = 0;
            while(j<i&&!overlap) {
               double dx = x[i]-x[j];
               double dy = y[i]-y[j];
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
               x[i] = dx*(ix+0.5);
               y[i] = dy*(iy+0.5);
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
               y[i] = dy*(iy+0.5);
               if(iy%2==0) {
                  x[i] = dx*(ix+0.25);
               } else {
                  x[i] = dx*(ix+0.75);
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
      double vxSum = 0.0;
      double vySum = 0.0;
      for(int i = 0;i<N;++i) {
         vx[i] = Math.random() - 0.5;
         vy[i] = Math.random() - 0.5;
         vxSum += vx[i];
         vySum += vy[i];
      }
      // zero center of mass momentum
      double vxcm = vxSum/N;   // center of mass momentum (velocity)
      double vycm = vySum/N;
      for(int i = 0;i<N;++i) {
         vx[i] -= vxcm;
         vy[i] -= vycm;
      }
      double v2sum = 0;     // rescale velocities to get desired initial kinetic energy
      for(int i = 0;i<N;++i) {
         v2sum += vx[i]*vx[i] + vy[i]*vy[i];
      }
      double kineticEnergyPerParticle = 0.5*v2sum/N;
      double rescale = Math.sqrt(initialKineticEnergy/kineticEnergyPerParticle);
      for(int i = 0;i<N;++i) {
         vx[i] *= rescale;
         vy[i] *= rescale;
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

   public void resetAverages() {
      steps = 0;
      virialAccumulator = 0;
      totalPotentialEnergyAccumulator = 0;
      totalKineticEnergyAccumulator = 0;
      totalKineticEnergySquaredAccumulator = 0;
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
            double dx = pbcSeparation(x[i]-x[j], Lx);
            double dy = pbcSeparation(y[i]-y[j], Ly);
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


   public void step(HistogramFrame xVelocityHistogram) {
      for(int i = 0;i<N;i++) {   // use old acceleration
         x[i] += vx[i]*dt + ax[i]*halfdt2;
         y[i] += vy[i]*dt + ay[i]*halfdt2;
         vx[i] += ax[i]*halfdt;   // add in half old acceleration
         vy[i] += ay[i]*halfdt;
      }
      computeAcceleration();
      for(int i = 0;i<N;i++) {    // add in half new acceleration
         vx[i] += ax[i]*halfdt;
         vy[i] += ay[i]*halfdt;
      }
      double totalKineticEnergy = 0;
      for(int i = 0;i<N;i++) {
         totalKineticEnergy += (vx[i]*vx[i]+vy[i]*vy[i]);
         xVelocityHistogram.append(vx[i]);
         x[i] = pbcPosition(x[i], Lx);
         y[i] = pbcPosition(y[i], Ly);
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
      if(x==null) {
         return;
      }
      int pxRadius = Math.abs(myWorld.xToPix(radius)-myWorld.xToPix(0));
      int pyRadius = Math.abs(myWorld.yToPix(radius)-myWorld.yToPix(0));
      g.setColor(Color.red);
      for(int i = 0;i<N;i++) {
         int xpix = myWorld.xToPix(x[i])-pxRadius;
         int ypix = myWorld.yToPix(y[i])-pyRadius;
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
