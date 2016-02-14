package org.opensourcephysics.sip.ch14.ca;

import org.opensourcephysics.controls.*;
import org.opensourcephysics.display.*;
import org.opensourcephysics.display2d.*;
import java.awt.*;
import java.awt.event.*;

public class VoterApp extends AbstractAnimation   {

 PlottingPanel     plottingPanel = new PlottingPanel("x","y","  ");
 DrawingFrame      frame = new DrawingFrame(plottingPanel);
 CellLattice     ca;  // cellular automata lattice
 int L;
 int nnx[] = {0,1,0,-1};
 int nny[] = {1,0,-1,0};

public VoterApp() {
  frame.show();
}

public void initializeAnimation() {
  L = control.getInt("Lattice size");
  plottingPanel.clear();   // added by WC
  ca = new CellLattice(L,L);
  plottingPanel.addDrawable(ca);
  ca.setIndexedColor(0, Color.red);
  ca.setIndexedColor(1, Color.green);
  for(int i = 0; i < L; i++) {
    for(int j = 0; j < L; j++) {
      if(Math.random() > 0.5) {
        ca.setValue(i, j, (byte)0);
      }
      else {
        ca.setValue(i, j, (byte)1);
      }
  } }
  plottingPanel.repaint();
}



public void doStep() {
  int steps = control.getInt("Number of steps between plotting");
  for(int m = 0; m < steps; m++) {
     int ix = (int)(Math.random()*L);
     int iy = (int)(Math.random()*L);
     int direction = (int)(Math.random()*4);
     int jx = (ix + L + nnx[direction]) % L;
     int jy = (iy + L + nny[direction]) % L;
     byte opinion = ca.getValue(ix,iy);
     if(opinion == ca.getValue(jx,jy)) { // change opinions of neighbors of i and j
        for(int k = 0; k < 4; k++) {
           int kx = (ix + L + nnx[direction]) % L;
           int ky = (iy + L + nny[direction]) % L;
           ca.setValue(kx,ky,opinion); 
           kx = (jx + L + nnx[direction]) % L;
           ky = (jy + L + nny[direction]) % L;
           ca.setValue(kx,ky,opinion); 
     }  }
   }
   plottingPanel.repaint();
 }




  public void resetAnimation(){
    super.resetAnimation();
    control.setValue("Lattice size", 40);
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
  VoterApp app = new VoterApp();
  AnimationControl control = new AnimationControl(app);
  control.addButton("clear", "Clear"); // optional custom action
  app.setControl(control);
}
}
