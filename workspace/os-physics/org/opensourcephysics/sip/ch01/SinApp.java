/*
 * The org.opensourcephysics.sip.ch1 package contains classes for chapter 2
 * of the book An Introdiction to Computer Simulation Methods Third Edition.
 * Copyright (c) 2005  H. Gould, J. Tobochnik, and W. Christian.
 */
package org.opensourcephysics.sip.ch01;
import javax.swing.JFrame;

import org.opensourcephysics.display.Dataset;
import org.opensourcephysics.display.DrawingFrame;
import org.opensourcephysics.display.PlottingPanel;


/**
 * SinApp creates a plot of a sin function.
 *
 * This class demonstrates:
 *   1)  how to instantiate objects.
 *   2)  how to add points to the dataset ot produce a plot
 */
public class SinApp  {

  public static void main(String[] args) {
    // create the plot
    PlottingPanel plot = new PlottingPanel("Time", "Amp", "Sin Function");
    DrawingFrame frame = new DrawingFrame(plot);  // create frame
    Dataset dataset = new Dataset();              // create dataset
    plot.addDrawable(dataset);                    // add dataset to plot
    double t=0, dt = 0.01;                        // initialize variables
    while ( t < 2)  {                             // start loop
      dataset.append(t, Math.sin(2*Math.PI*t));   // add point
      t += dt;                                    // increment time
    }
    frame.setVisible(true);                                 // show the frame
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

}
