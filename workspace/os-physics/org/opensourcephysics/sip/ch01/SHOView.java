/*
 * The org.opensourcephysics.sip.ch1 package contains classes for chapter 1
 * of the book An Introdiction to Computer Simulation Methods Third Edition.
 * Copyright (c) 2005  H. Gould, J. Tobochnik, and W. Christian.
 */
package org.opensourcephysics.sip.ch01;

import org.opensourcephysics.controls.AbstractAnimation;
import org.opensourcephysics.display.Dataset;
import org.opensourcephysics.display.DrawingFrame;
import org.opensourcephysics.display.DrawingPanel;
import org.opensourcephysics.display.PlottingPanel;
import org.opensourcephysics.display.Stripchart;
import org.opensourcephysics.display.axes.XAxis;

/**
 * SHOView draws the oscillator in a drawing panel and plots the oscillator position graph.
 *
 * The oscillator is represented as a red ball.
 *
 * @author W. Christian
 * @version 1.0
 */
public class SHOView extends AbstractAnimation {
  PlottingPanel plot = new PlottingPanel("time", "x", "x(t)");
  DrawingFrame plottingFrame = new DrawingFrame("SHO Data",plot);
  DrawingPanel drawing = new DrawingPanel();
  DrawingFrame drawingFrame = new DrawingFrame("SHO Simulation",drawing);
  Dataset stripChart = new Stripchart(20, 10);  // strip chart of x(t)
  SHOModel sho = new SHOModel();                // harmonic oscillator

  /**
   * Constructs SHOView.
   */
  public SHOView() {
    drawing.setPreferredMinMax( -5, 5, -1, 1);
    drawing.addDrawable(new XAxis("x"));
    drawing.addDrawable(sho);
    drawingFrame.setSize(300, 150);
    drawingFrame.setVisible(true);
    plot.addDrawable(stripChart);
    plottingFrame.setSize(300,375);
    plottingFrame.setVisible(true);
  }

  /**
   * Initializes the animation.
   */
  public void initializeAnimation() {
    super.initializeAnimation();
    double x=control.getDouble("x0");
    double v=control.getDouble("v0");
    sho.initialize(x,v,0);
    drawing.setMessage("t=0");
    stripChart.clear();
    stripChart.append(0, x);
    drawing.repaint();
    plot.repaint();
  }

  /**
   * Does an animation step.
   */
  protected void doStep() {
    sho.move();  // moves the particle
    stripChart.append(sho.getTime(), sho.getX());
    drawing.setMessage("t="+decimalFormat.format(sho.getTime()) );
    drawing.repaint();
    plot.repaint();
  }

  /**
   * Resets the animation to a predefined state.
   */
  public void resetAnimation() {
    super.resetAnimation();
    control.setValue("x0",4);
    control.setValue("v0",0);
    initializeAnimation();
  }

}
