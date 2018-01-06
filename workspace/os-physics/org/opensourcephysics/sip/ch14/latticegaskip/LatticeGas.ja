package org.opensourcephysics.sip.ch14.latticegaskip;
import org.opensourcephysics.display.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;

public class LatticeGas implements Drawable {
  public double flowSpeed = 0.2; // XXX
  public double velocityScale = 1;
  public int spatialAveragingLength = 1;

  private int[][] lattice, newLattice;
  private int lx,ly;         // length of lattice
  private double numParticles;

  static final double SQRT3_OVER2 = Math.sqrt(3) / 2;
  static final double SQRT2 = Math.sqrt(2);
  static final int RIGHT = 1, RIGHT_DOWN = 2,  LEFT_DOWN = 4;
  static final int LEFT  = 8, LEFT_UP    = 16, RIGHT_UP  = 32;
  static final int STATIONARY = 64, BARRIER = 128;
  static final int NUM_CHANNELS = 7;              // maximum number of particles per site
  static final int NUM_BITS = 8;                  // 7 channels bits plus 1 barrier bit per site
  static final int NUM_RULES = 1 << 8;            // total number of possible site configurations
  static final double ux[] = {1.0, 0.5, -0.5, -1.0, -0.5, 0.5, 0};
  static final double uy[] = {0.0, -SQRT3_OVER2, -SQRT3_OVER2, 0.0, SQRT3_OVER2, SQRT3_OVER2, 0};

  static final double[] vx,vy;  // averaged velocities for every site configuration
  static final int[] rule;

  static { // set rule table
    // default rule is the identity rule
    rule = new int[NUM_RULES];
    for (int i = 0; i < BARRIER; i++)
      rule[i] = i;
    // abbreviations for channel bit indices
    int RI=RIGHT, DR=RIGHT_DOWN, DL=LEFT_DOWN;
    int LE=LEFT,  UL=LEFT_UP,    UR=RIGHT_UP;
    int S=STATIONARY;
    // three particle zero momentum rules
    rule[UL|DL|RI] = UR|LE|DR; rule[UR|LE|DR] = UL|DL|RI;
    // three particle rules with unperturbed particle
    rule[UR|UL|DL] = UL|LE|RI; rule[UL|LE|RI] = UR|UL|DL;
    rule[UR|UL|DR] = UR|LE|RI; rule[UR|LE|RI] = UR|UL|DR;
    rule[UR|DL|DR] = LE|DR|RI; rule[LE|DR|RI] = UR|DL|DR;
    rule[UL|DL|DR] = LE|DL|RI; rule[LE|DL|RI] = UL|DL|DR;
    rule[UR|DL|RI] = UL|DR|RI; rule[UL|DR|RI] = UR|DL|RI;
    rule[UL|LE|DR] = UR|LE|DL; rule[UR|LE|DL] = UL|LE|DR;
    // two particle cyclic rules
    rule[LE|RI] = UR|DL;
    rule[UR|DL] = UL|DR;
    rule[UL|DR] = LE|RI;
    // four particle cyclic rules
    rule[UL|LE|DR|RI] = UR|LE|DL|RI;
    rule[UR|LE|DL|RI] = UR|UL|DL|DR;
    rule[UR|UL|DL|DR] = UL|LE|DR|RI;
    // stationary particle creation rules
    rule[UL|RI] = UR|S;
    rule[UR|LE] = UL|S;
    rule[UL|DL] = LE|S;
    rule[LE|DR] = DL|S;
    rule[DL|RI] = DR|S;
    rule[DR|UR] = RI|S;
    rule[UL|LE|DL|DR|RI] = UR|LE|DL|DR|S;
    rule[UR|LE|DL|DR|RI] = UL|DL|DR|RI|S;
    rule[UR|UL|DL|DR|RI] = UR|LE|DR|RI|S;
    rule[UR|UL|LE|DR|RI] = UR|UL|DL|RI|S;
    rule[UR|UL|LE|DL|RI] = UR|UL|LE|DR|S;
    rule[UR|UL|LE|DL|DR] = UL|LE|DL|RI|S;
    // add all rules indexed with a stationary particle (dual rules)
    for (int i = 0; i < S; i++)
      rule[i^(UR|UL|LE|DL|DR|RI|S)] = rule[i]^(UR|UL|LE|DL|DR|RI|S);
    // add rules to bounce back at barriers
    for (int i = BARRIER; i < NUM_RULES; i++) {
      int high_bits = i & (LE|UL|UR);
      int low_bits  = i & (RI|DR|DL);
      rule[i] = BARRIER | (high_bits >> 3) | (low_bits << 3);
    }
  }

  static { // set velocities
    // for every particle configuration i, calculate total net velocity
    // in vx[i], vy[i]
    vx = new double[NUM_RULES];
    vy = new double[NUM_RULES];
    for (int i = 0; i < NUM_RULES; i++) {
      for (int dir = 0; dir < NUM_CHANNELS; dir++) {
        if((i & (1 << dir)) != 0) {
          vx[i] += ux[dir];
          vy[i] += uy[dir];
        }
      }
    }
  }

  public void initialize(int _lx, int _ly, double density) {
    lx = _lx;
    ly = _ly - _ly%2;
    numParticles = lx*ly*NUM_CHANNELS*density;
    lattice = new int[lx][ly];
    newLattice = new int[lx][ly];
    for (int i = 0; i < lx; i++) {
      for (int j = 2; j < ly-2; j++)  {
        int randomSite = Math.random() < density ? ((1<<NUM_CHANNELS)-1) : 0;
        lattice[i][j] = randomSite;                    // random particle configuration
        lattice[i][1] = lattice[i][ly-2] = BARRIER;    // wall at top and bottom
      }
    }
    for (int j = 3*ly/10; j < 7*ly/10; j++)
      lattice[2*lx/10][j] = BARRIER;                   // obstruction at left
  }

  public void step() {
    // move all particles forward
    for (int i = 0; i < lx; i++) {
      int[] newLattice_left = newLattice[(i-1+lx)%lx];
      int[] newLattice_cent = newLattice[i];
      int[] newLattice_rght = newLattice[(i+1)%lx];
      for (int j = 1; j < ly-2; j += 2) {
        int site1 = lattice[i][j];
        int site2 = lattice[i][j+1];
        newLattice_rght[j-1] |= site1 & RIGHT_DOWN;
        newLattice_cent[j-1] |= site1 & LEFT_DOWN;
        newLattice_rght[j]   |= site1 & RIGHT;
        newLattice_cent[j]   |= site1 & (STATIONARY|BARRIER) | site2 & RIGHT_DOWN;
        newLattice_left[j]   |= site1 & LEFT                 | site2 & LEFT_DOWN;
        newLattice_rght[j+1] |= site1 & RIGHT_UP             | site2 & RIGHT;
        newLattice_cent[j+1] |= site1 & LEFT_UP              | site2 & (STATIONARY|BARRIER);
        newLattice_left[j+1] |= site2 & LEFT;
        newLattice_cent[j+2] |= site2 & RIGHT_UP;
        newLattice_left[j+2] |= site2 & LEFT_UP;
      }
    }
    // handle collisions, find average x velocity
    double vxTotal = 0;
    for (int i = 0; i < lx; i++) {
      for (int j = 0; j < ly; j++) {
        int site = rule[newLattice[i][j]];
        lattice[i][j] = site;
        newLattice[i][j] = 0;
        vxTotal += vx[site];
      }
    }
    // inject horizontal momentum at random sites to obtain desired flowSpeed
    int injections = (int) ((flowSpeed*numParticles - vxTotal) / 4);
    for (int k = 0; k < Math.abs(injections); k++) {
      int i = (int)(Math.random()*lx);
      int j = (int)(Math.random()*ly);
      if ((lattice[i][j] & (RIGHT|LEFT)) == ((injections > 0) ? LEFT : RIGHT))
        lattice[i][j] ^= RIGHT|LEFT;
    }
  }


   public void draw (DrawingPanel panel, Graphics g) {
      if (lattice == null)
         return;

      // if s = 1 draw lattice and particle details explicitly
      // otherwise average velocity over an s by s square
      int s = spatialAveragingLength;
      Graphics2D g2 = (Graphics2D) g;
      AffineTransform toPixels = panel.getPixelTransform();
      Line2D.Double line = new Line2D.Double();

      for (int i = 0; i < lx; i++) {
        for (int j = 2; j < ly-2; j++) {
          double x = i + (j % 2) * 0.5;
          double y = j * SQRT3_OVER2;
          if (s == 1) {
            g2.setPaint(Color.BLACK);
            for (int dir = 0; dir < NUM_CHANNELS; dir++) {
              if ((lattice[i][j] & (1<<dir)) != 0) {
                line.setLine(x, y, x+ux[dir]*0.4, y+uy[dir]*0.4);
                g2.draw(toPixels.createTransformedShape(line));
              }
            }
          }
          if ((lattice[i][j]&BARRIER) == BARRIER || s == 1) {
            Circle c = new Circle(x, y);
            c.pixRadius = ((lattice[i][j]&BARRIER) == BARRIER) ? 2 : 1;
            c.draw(panel, g);
          }
        }
      }
      if (s == 1) return;
      for (int i = 0; i < lx; i += s) {
        for (int j = 0; j < ly; j += s) {
          double x = i + s/2.0;
          double y = (j + s/2.0) * SQRT3_OVER2;
          double wx = 0, wy = 0;
          for (int m = i; m != (i+s)%lx; m=(m+1)%lx) {
            for (int n = j; n != (j+s)%ly; n=(n+1)%ly) {
              wx += vx[lattice[m][n]];
              wy += vy[lattice[m][n]];
            }
          }
          Arrow a = new Arrow(x, y, velocityScale*wx/s, velocityScale*wy/s);
          a.setHeadSize(2);
          a.draw(panel, g);
        }
      }
   }
}
