package org.opensourcephysics.sip.ch08;

import javax.swing.JFrame;

import org.opensourcephysics.frames.PlotFrame;
import org.opensourcephysics.numerics.PBC;


public class PBCPlotIntApp {

  public static void main (String[] args) {
     PlotFrame frame=new PlotFrame("x","pbc", "PBC Demo");
     for (int x= -20; x <= 20; x++) {
       frame.append(0, x, PBC.separation(x,6));
     }
     frame.setVisible(true);
     frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }
}
