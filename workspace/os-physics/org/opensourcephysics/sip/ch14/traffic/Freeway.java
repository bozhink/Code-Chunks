package org.opensourcephysics.sip.ch14.traffic;
import java.awt.Graphics;
import org.opensourcephysics.display.*;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.display2d.*;
import org.opensourcephysics.controls.*;

/**
 * Freeway uses the Nagel-Schreckenberg model of single lane traffic
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */

public class Freeway implements Drawable {
   public int [] v, x, xtemp;
   public LatticeFrame spaceTime;
   public double [] distribution;
   public int roadLength;
   public int numberOfCars;
   public int maximumVelocity;
   public double p;       // probability of reducing velocity
   private CellLattice road;
   public double flow;
   public int steps,t;
   public int scrollTime = 100; // number of time steps before scrolling space-time diagram

  /**
   * Initializes arrays and starting configuration of cars.
   */
   public void initialize(LatticeFrame spaceTime) {
      this.spaceTime = spaceTime;
      x = new int[numberOfCars];
      xtemp = new int[numberOfCars];  // used to allow parallel updating
      v = new int[numberOfCars];
      spaceTime.resizeLattice(roadLength,100);
      road = new CellLattice(roadLength,1);
      road.setIndexedColor(0, java.awt.Color.RED);
      road.setIndexedColor(1, java.awt.Color.GREEN);
      spaceTime.setIndexedColor(0, java.awt.Color.RED);
      spaceTime.setIndexedColor(1, java.awt.Color.GREEN);
      int d = roadLength/numberOfCars;
      x[0] = 0;
      v[0] = maximumVelocity;
      for(int i = 1; i < numberOfCars; i++) {
         x[i] = x[i-1] + d;
         if(Math.random() < 0.5)
           v[i] = 0;
         else
            v[i] = 1;
      }
      flow = 0;
      steps = 0;
      t = 0;
   }

  /**
   * Does one time step
   */
   public void step() {
      for(int i = 0; i < numberOfCars; i++)
         xtemp[i] = x[i];
      for(int i = 0; i < numberOfCars; i++) {
         if(v[i] < maximumVelocity) v[i]++;   // acceleration
         int d = xtemp[(i+1) % numberOfCars] - xtemp[i];  // distance between cars
         if(d <= 0)    // periodic boundary conditions, d = 0 correctly treats one car on road
            d += roadLength;
         if(v[i] >= d) v[i] = d-1;  // slow down due to cars in front
         if((v[i] > 0) && (Math.random() < p)) v[i]--;  // randomization
         x[i] = (xtemp[i] + v[i]) % roadLength;
         flow += v[i];
      }
      steps++;
      computeSpaceTimeDiagram();
   }

   public void computeSpaceTimeDiagram() {
      t++;
      if(t < scrollTime) {
         for(int i = 0; i < numberOfCars; i++) spaceTime.setValue(x[i],t,1);
      }
      else {  //scroll diagram
         for(int y = 0; y < scrollTime-1; y++) {
            for(int i = 0; i < roadLength; i++) {
               spaceTime.setValue(i,y,spaceTime.getValue(i,y+1));
         } }
         for(int i = 0; i < roadLength; i++) {
            spaceTime.setValue(i,scrollTime-1,0);   // zero last row
         }
         for(int i = 0; i < numberOfCars; i++) {
           spaceTime.setValue(x[i],scrollTime-1,1);    // add new row
         }
      }
 }

 /**
   * Draws freeway.
   */
   public void draw(DrawingPanel panel, Graphics g) {
      if(x==null) return;
      road.setBlock(0,0,new byte[roadLength][1]);
      for(int i = 0; i < numberOfCars; i++) {
          road.setValue(x[i],0,(byte)1);
      }
      road.draw(panel,g);
      g.drawString("Number of Steps = " + steps,10,20);
      g.drawString("Flow = " + ControlUtils.f3((double)flow/(roadLength*steps)),10,40);
      g.drawString("Density = " + ControlUtils.f3((double)numberOfCars/(roadLength)),10,60);
   }
}
