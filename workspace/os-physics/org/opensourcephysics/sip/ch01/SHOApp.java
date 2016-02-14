/*
 * The org.opensourcephysics.sip.ch1 package contains classes for chapter 1
 * of the book An Introdiction to Computer Simulation Methods Third Edition.
 * Copyright (c) 2005  H. Gould, J. Tobochnik, and W. Christian.
 */
package org.opensourcephysics.sip.ch01;

import org.opensourcephysics.controls.Animation;
import org.opensourcephysics.controls.OSPControl;

public class SHOApp {

  /**
   * Starts the Java application.
   * @param args  command line parameters
   */
  public static void main(String[] args) {
    Animation animation = new SHOView();
    OSPControl control = new OSPControl(animation);
    control.addButton("startAnimation", "Start");
    control.addButton("stopAnimation", "Stop");
    control.addButton("initializeAnimation", "Initialize");
    animation.setControl(control);
  }

}
