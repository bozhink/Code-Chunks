package org.opensourcephysics.sip.ch02;
import org.opensourcephysics.display.Circle;

/**
 * BouncingBall models a falling ball as it bounces off of a floor or a wall.
 *
 * @author Wolfgang Christian, Jan Tobochnik, Harvey Gould
 * @version 1.0 05/07/05
 */
public class BouncingBall extends Circle { // Circle is a class that can draw itself
  final static double g = 9.8;  // constant
  final static double WALL=10;
  private double x, y, vx, vy;  // initial position and velocity

  /**
   * Constructs a BouncingBall with the given initial conditions.
   *
   * @param x double
   * @param vx double
   * @param y double
   * @param vy double
   */
  public BouncingBall(double x, double vx, double y, double vy) { // constructor
    this.x = x;  // sets instance value equal to passed value
    this.vx = vx;  // sets instance value equal to passed value
    this.y = y;
    this.vy = vy;
    setXY(x, y);  // sets the position using setXY in Circle superclass
  }

  /**
   * Steps (advances) the time.
   * @param dt double
   */
  public void step(double dt) {
    x = x+vx*dt;  // Euler algorithm for numerical solution
    y = y+vy*dt;
    vy = vy-g*dt;
    if(x>WALL) {
      vx = -Math.abs(vx);  // bounce off right wall
    } else if(x<-WALL) {
      vx = Math.abs(vx);  // bounce off left wall
    }
    if(y<0) {
      vy = Math.abs(vy);  // bounce off floor
    }
    setXY(x, y);
  }
}
