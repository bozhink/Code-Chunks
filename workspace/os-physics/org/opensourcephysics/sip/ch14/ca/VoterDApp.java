package org.opensourcephysics.sip.ch14.ca;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.display2d.*;
import java.awt.*;
import java.awt.event.*;

/* Simulation of the Sznajd model
*
*/
public class VoterDApp extends AbstractAnimation   {

 PlottingPanel     plottingPanel = new PlottingPanel("x","y","  ");
 DrawingFrame      frame = new DrawingFrame(plottingPanel);
 CellLattice     ca;  // cellular automata lattice
 int L;
 int nnx[] = {0,1,0,-1};
 int nny[] = {1,0,-1,0};
 int epsilon;
 double w;

public VoterDApp() {
  frame.show();
}

public void initializeAnimation() {
  L = control.getInt("Lattice size");
  epsilon = control.getInt("Minimum opinion difference");
  w = 0.5*control.getDouble("Consensus weight");
  plottingPanel.clear();   // added by WC
  ca = new CellLattice(L,L);
  plottingPanel.addDrawable(ca);
  ca.setIndexedColor(0, Color.red);
  ca.setIndexedColor(1, Color.green);
  for(int i = 0; i < L; i++) {
    for(int j = 0; j < L; j++) {
        ca.setValue(i, j, (byte)(Math.random()*256));
  } }
  plottingPanel.repaint();
}



public void doStep() {
  int steps = control.getInt("Number of steps between plotting");
  for(int m = 0; m < steps; m++) {
     int ix = (int)(Math.random()*L);
     int iy = (int)(Math.random()*L);
     int jx = (int)(Math.random()*L);
     int jy = (int)(Math.random()*L);
     int opinionI = (int)(ca.getValue(ix,iy)); 
     int opinionJ = (int)(ca.getValue(jx,jy)); 
     int opinionDifference = Math.abs(opinionI - opinionJ);
     if(opinionDifference < epsilon) { // change opinions of neighbors of i and j
        int change = (int)(w*opinionDifference);
        if(opinionI > opinionJ) {
          ca.setValue(ix,iy, (byte)(opinionI - change));
          ca.setValue(jx,jy, (byte)(opinionJ + change));
        }
        else{
          ca.setValue(ix,iy, (byte)(opinionI + change));
          ca.setValue(jx,jy, (byte)(opinionJ - change));
        }
      }  
   }
   plottingPanel.repaint();
 }




  public void resetAnimation(){
    super.resetAnimation();
    control.setValue("Lattice size", 40);
    control.setValue("Minimum opinion difference", 10);
    control.setValue("Consensus weight", 0.3);
    control.setValue("Number of steps between plotting", 1);
  }

 /**
   * Clears the cells.
   */
  public void clear() {
    ca.setBlock(0, 0, new int[L][L]);
    plottingPanel.repaint();
  }

 /* --------------- application target  --------------- */

public static void main(String args[]) {
  VoterDApp app = new VoterDApp();
  AnimationControl control = new AnimationControl(app);
  control.addButton("clear", "Clear"); // optional custom action
  app.setControl(control);
}
}
