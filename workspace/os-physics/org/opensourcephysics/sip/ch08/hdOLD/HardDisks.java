// start break
// heading
package org.opensourcephysics.sip.ch08.hdOLD;
import java.awt.*;
import org.opensourcephysics.display.*;

public class HardDisks implements Drawable {
   public double x[], y[], vx[], vy[];
   public double collisionTime[];
   public int partner[];
   public int N;
   public double Lx;
   public double Ly;
   public double keSum = 0, virialSum = 0;
   public int nextCollider, nextPartner;
   public double timeToCollision;
   public double t = 0;
   public double bigTime = 1.0E10;
   public double temperature;
   public int numberOfCollisions = 0; // end break
   // start break
   // setArrays
   public void setArrays() {
      x = new double[N];
      y = new double[N];
      vx = new double[N];
      vy = new double[N];
      collisionTime = new double[N];
      partner = new int[N];
   } // end break

   // start break
   // initialize
   public void initialize(String configuration) {
      reset();
      setArrays();
      if(configuration.equals("regular")) {
         setRegularPositions();
      } else {
         setRandomPositions();
      }
      setVelocities();
      for(int i = 0; i<N; ++i) {
         collisionTime[i] = bigTime; // unknown collision times set to a big number
      }                              // find initial collision times
      for(int i = 0; i<N-1; i++) {
         for(int j = i+1; j<N; j++) {
            checkCollision(i, j);
         }
      }
   } // end break

   // start break
   // utilities
   public void reset() {
      t = 0;
      virialSum = 0;
   }

   public double pbc(double s, double L) {
      if(s>L) {
         return s-L;
      } else if(s<0) {
         return s+L;
      } else {
         return s;
      }
   }

   public double separation(double ds, double L) {
      if(ds>0.5*L) {
         return ds-L;
      } else if(ds<-0.5*L) {
         return ds+L;
      } else {
         return ds;
      }
   } // end break

   // start break
   // setConfiguration
   public void setVelocities() {
      double vxSum = 0;
      double vySum = 0;
      for(int i = 0; i<N; ++i) {
         vx[i] = Math.random();
         vy[i] = Math.random();
         vxSum += vx[i];
         vySum += vy[i];
      }
      double vxCM = vxSum/N;
      double vyCM = vySum/N;
      double v2Sum = 0;
      for(int i = 0; i<N; ++i) { //zero center of mass velocity
         vx[i] -= vxCM;
         vy[i] -= vyCM;
         v2Sum += vx[i]*vx[i]+vy[i]*vy[i];
      }
      temperature = v2Sum/N;
   }

   public void setRandomPositions() {
      boolean overlap;
      for(int i = 0; i<N; ++i) {
         do {
            overlap = false;
            x[i] = Lx*Math.random();
            y[i] = Ly*Math.random();
            int j = 0;
            while((j<i)&&!overlap) {
               double dx = separation(x[i]-x[j], Lx);
               double dy = separation(y[i]-y[j], Ly);
               if(dx*dx+dy*dy<1.0) {
                  overlap = true;
               }
               j++;
            }
         } while(overlap);
      }
   }

   public void setRegularPositions() {
      double dnx = Math.sqrt(N);
      int nx = (int) dnx;
      if(dnx-nx>0.00001) {
         nx++; // N is not a perfect square
      }
      double ax = Lx/nx; // distance between columns of molecules
      double ay = Ly/nx; // distance between rows
      int i = 0;
      int iy = 0;
      while(i<N) {
         for(int ix = 0; ix<nx; ++ix) {       // loop through molecules in a row
            if(i<N) {
               y[i] = ay*(iy+0.5);
               if(iy%2==0) {                  // even rows displaced from odd rows
                  x[i] = ax*(ix+0.25);
               } else {
                  x[i] = ax*(ix+0.75);
               }
               i++;
            }
         }
         iy++;
      }
   }                                          // end break

   // start break
   // checkCollision
   public void checkCollision(int i, int j) { // consider collisions between i and periodic images of j
      for(int xCell = -1; xCell<=1; xCell++) {
         for(int yCell = -1; yCell<=1; yCell++) {
            double dx = x[i]-x[j]+xCell*Lx;
            double dy = y[i]-y[j]+yCell*Ly;
            double dvx = vx[i]-vx[j];
            double dvy = vy[i]-vy[j];
            double bij = dx*dvx+dy*dvy;
            if(bij<0) {
               double r2 = dx*dx+dy*dy;
               double v2 = dvx*dvx+dvy*dvy;
               double discriminant = bij*bij-v2*(r2-1);
               if(discriminant>0) {
                  double tij = (-bij-Math.sqrt(discriminant))/v2;
                  if(tij<collisionTime[i]) {
                     collisionTime[i] = tij;
                     partner[i] = j;
                  }
                  if(tij<collisionTime[j]) {
                     collisionTime[j] = tij;
                     partner[j] = i;
                  }
               }
            }
         }
      }
   } // end break

   // start break
   // step
   public void step() {
      minimumCollisionTime(); // find minimum collision time from list of collision times
      move();                 // move particles for time equal to minimum collision time
      t += timeToCollision;
      contact();                  // change velocities of two colliding particles
      // set collision times to bigTime for those particles set to collide with
      // two colliding particles.
      setDefaultCollisionTimes(); // find new collision times between all particles and the two colliding particles
      newCollisionTimes();
      numberOfCollisions++;
   }

   public void minimumCollisionTime() {
      timeToCollision = bigTime;
      for(int k = 0; k<N; k++) {
         if(collisionTime[k]<timeToCollision) {
            timeToCollision = collisionTime[k];
            nextCollider = k;
         }
      }
      nextPartner = partner[nextCollider];
   }

   public void move() {
      for(int k = 0; k<N; k++) {
         collisionTime[k] -= timeToCollision;
         x[k] = centerCell(x[k]+vx[k]*timeToCollision, Lx); // insure position in central cell
         y[k] = centerCell(y[k]+vy[k]*timeToCollision, Ly); // not in periodic image [xx don't understand this comment xx]
      }
   }

   public void contact() {                                  // compute collision dynamics between nextCollider and nextPartner at contact
      double dx = separation(x[nextCollider]-x[nextPartner], Lx);
      double dy = separation(y[nextCollider]-y[nextPartner], Ly);
      double dvx = vx[nextCollider]-vx[nextPartner];
      double dvy = vy[nextCollider]-vy[nextPartner];
      double factor = dx*dvx+dy*dvy;
      double delvx = -factor*dx;
      double delvy = -factor*dy;
      vx[nextCollider] += delvx;
      vy[nextCollider] += delvy;
      vx[nextPartner] -= delvx;
      vy[nextPartner] -= delvy;
      virialSum += delvx*dx+delvy*dy;
   }

   public void setDefaultCollisionTimes() {
      collisionTime[nextCollider] = bigTime;
      collisionTime[nextPartner] = bigTime;
      for(int k = 0; k<N; k++) {
         if(partner[k]==nextCollider) {
            collisionTime[k] = bigTime;
         } else if(partner[k]==nextPartner) {
            collisionTime[k] = bigTime;
         }
      }
   }

   public void newCollisionTimes() { // reset collsion list for relevant particles
      for(int k = 0; k<N; k++) {
         if((k!=nextCollider)&&(k!=nextPartner)) {
            checkCollision(k, nextPartner);
            checkCollision(k, nextCollider);
         }
      }
   } // end break

   // start break
   // centerCell
   public double centerCell(double s, double L) {
      if((s>0)&&(s<L)) {
         return s;
      } else if(s>0) {
         int f = (int) (s/L);
         return s-f*L;
      } else {
         int f = (int) (s/L);
         return s+(1-f)*L;
      }
   } // end break

   public double pressure() {
      double area = Lx*Ly;
      return 1+virialSum/(2*t*area*N*temperature);
   }

   public void draw(DrawingPanel myWorld, Graphics g) {
      double radius = 0.5;
      if(x==null) {
         return;
      }
      int pxRadius = Math.abs(myWorld.xToPix(radius)-myWorld.xToPix(0));
      int pyRadius = Math.abs(myWorld.yToPix(radius)-myWorld.yToPix(0));
      g.setColor(Color.red);
      for(int i = 0; i<N; i++) {
         int xpix = myWorld.xToPix(x[i])-pxRadius;
         int ypix = myWorld.yToPix(y[i])-pyRadius;
         g.fillOval(xpix, ypix, 2*pxRadius, 2*pyRadius);
      } // draw cell boundaries
      g.setColor(Color.black);
      int xpix = myWorld.xToPix(0);
      int ypix = myWorld.yToPix(Ly);
      int lx = myWorld.xToPix(Lx)-myWorld.xToPix(0);
      int ly = myWorld.yToPix(0)-myWorld.yToPix(Ly);
      g.drawRect(xpix, ypix, lx, ly);
   }
}
