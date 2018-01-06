/*
 * The org.opensourcephysics.manual directory contains examples from the
 * Open Source Physics user's manual.  These examples are proof-of-concept only.
 *
 * Copyright (c) 2005 W. Christian.
 */
package org.opensourcephysics.sip.ch14.ca;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

import org.opensourcephysics.display.*;
import org.opensourcephysics.display2d.*;

/**
 * BinaryLatticeApp demonstrates how to create and use a binary lattice.
 *
 * @author       Wolfgang Christian
 * @version 1.0
 */
public class InteractiveLatticeTestApp implements InteractiveMouseHandler {
  int size=8;
  BinaryLattice lattice = new BinaryLattice(size, size);

  public InteractiveLatticeTestApp(){
    PlottingPanel plottingPanel = new PlottingPanel("nx", "ny", "Interactive Demo");
    plottingPanel.setInteractiveMouseHandler(this);  // register this object as the mouse handler
    plottingPanel.addDrawable(lattice);
    DrawingFrame frame = new DrawingFrame(plottingPanel);
    lattice.randomize(); //randomize all cells
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.show();
  }

  /**
 * Handles mouse actions in the plotting panel.
 *
 * @param panel
 * @param evt
 */
public void handleMouseAction(InteractivePanel panel, MouseEvent evt) {
  panel.handleMouseAction(panel, evt);
  switch (panel.getMouseAction()) {
    case InteractivePanel.MOUSE_PRESSED:
      int ix= (int)panel.getMouseX();
      int iy= (int)panel.getMouseY();
      if (ix < 0 || iy < 0 || ix >= size || iy >= size)
        return; // outside the lattice
      if (lattice.getValue(ix, iy) == 0)
        lattice.setValue(ix, iy, 1);
      else
        lattice.setValue(ix, iy, 0);
      break;
  }
}


/**
 * Starts the Java application.
 * @param args[]  the input parameters
 */
  public static void main(String[] args) {
     new InteractiveLatticeTestApp();
  }
}
