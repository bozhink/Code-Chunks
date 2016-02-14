package org.opensourcephysics.sip.ch08;

import javax.swing.JFrame;

import org.opensourcephysics.frames.PlotFrame;
import org.opensourcephysics.numerics.PBC;

public class PBCPlotApp {

  public static void main (String[] args) {
     PlotFrame frame=new PlotFrame("x","pbc", "PBC Demo");
     double dx=0.02;
     for (double x= -10; x <= 10; x+=dx) {
       frame.append(0, x, PBC.separation(x,4));
     }
     frame.setVisible(true);
     frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }
}
