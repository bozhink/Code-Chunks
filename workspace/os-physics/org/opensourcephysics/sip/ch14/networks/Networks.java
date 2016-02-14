/*  Preferential attachment model for networks */
package org.opensourcephysics.sip.ch14.networks;

import java.awt.Color;
import java.awt.Graphics;
import org.opensourcephysics.frames.*;
import org.opensourcephysics.display.Drawable;
import org.opensourcephysics.display.DrawingPanel;

public class Networks implements Drawable {
   int[] node, linkFrom, edge;
   double[] x, y;  // positions for nodes, only meaningful for display purposes
   int N;   // maximum number of nodes
   int m = 2;   // number of attempted links per node
   int linkNumber = 0;
   int n = 0;   // current number of nodes
   int drawPositions = 1;   // = 0 for not drawing networks
   int numberOfCompletedNetworks = 0;

   public void initialize() {
      edge = new int[N];
      numberOfCompletedNetworks = 0;
      startNetwork();
   }

   public void addLink(int i, int j, int s) {
      linkFrom[i*m+s] = j;
      node[i]++;
      node[j]++;
      linkNumber += 2;
   }

   public void startNetwork() {
      n = 0;
      linkFrom = new int[m*N];
      node = new int[N];
      x = new double[N];
      y = new double[N];
      linkNumber = 0;
      for(int i = 0;i<=m;i++) {
         n++;
         setPosition(i);
      }
      for(int i = 1;i<m+1;i++) {
         for(int j = 0;j<i;j++) {
            addLink(i, j, j);
         }
      }
   }

   public void setPosition(int i) {
      double r2min = 1000./N;
      boolean ok = true;
      do {
         ok = true;
         x[i] = Math.random()*100;
         y[i] = Math.random()*100;
         int j = 0;
         while(j<i&&ok) {
            double dx = x[i]-x[j];
            double dy = y[i]-y[j];
            double r2 = dx*dx+dy*dy;
            if(r2<r2min) {
               ok = false;
            }
            j++;
         }
      } while(!ok);
   }

   public int findNode(int i, int s) {
      boolean ok = true;
      int j = 0;
      do {
         ok = true;
         int k = (int) (1+Math.random()*linkNumber);
         j = -1;
         int sum = 0;
         do {
            j++;
            sum += node[j];
         } while(k>sum);
         for(int r = 0;r<s;r++) {
            if(linkFrom[i*m+r]==j) {
               ok = false;
            }
         }
      } while(!ok);
      return j;
   }

   public void addNode(int i) {
      n++;
      if(drawPositions==1) {
         setPosition(i);
      }
      for(int s = 0;s<m;s++) {
         addLink(i, findNode(i, s), s);
      }
   }

   public void step() {
      if(n<N) {
         addNode(n);
      } else {
         numberOfCompletedNetworks++;
         for(int i = 0;i<n;i++) {   // accumulate data for edge distribution
            edge[node[i]]++;
         }
         startNetwork();  // start another network
      }
   }

   public void edgeDistribution(PlotFrame plot) {
      plot.clearData();
      for(int i = 1;i<N;i++) {
         if(edge[i]>0) {
            plot.append(0, Math.log(i), Math.log(edge[i]*1.0/(N*numberOfCompletedNetworks)));
         }
      }
   }

   public void draw(DrawingPanel myWorld, Graphics g) {
      if(node!=null && drawPositions==1) {
         int pxRadius = Math.abs(myWorld.xToPix(1.0)-myWorld.xToPix(0));
         int pyRadius = Math.abs(myWorld.yToPix(1.0)-myWorld.yToPix(0));
         g.setColor(Color.green);
         for(int i = 0;i<n;i++) {
            int xpix = myWorld.xToPix(x[i]);   
            int ypix = myWorld.yToPix(y[i]);   
            for(int s = 0;s<m;s++) {
               int j = linkFrom[i*m+s];
               int xpixj = myWorld.xToPix(x[j]);   
               int ypixj = myWorld.yToPix(y[j]);   
               g.drawLine(xpix, ypix, xpixj, ypixj);  // draw link
            }
         }
         g.setColor(Color.red);
         for(int i = 0;i<n;i++) {
            int xpix = myWorld.xToPix(x[i])-pxRadius;
            int ypix = myWorld.yToPix(y[i])-pyRadius;
            g.fillOval(xpix, ypix, 2*pxRadius, 2*pyRadius);  // draw node
         }
      }
   }
}
