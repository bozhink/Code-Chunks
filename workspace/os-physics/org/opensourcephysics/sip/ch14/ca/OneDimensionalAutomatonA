package org.opensourcephysics.sip.ch14.ca;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 *  OneDimensionalAutomatonApp takes the decimal representation of a rule as input and produces the rule array.
 *
 *  The rule array is computed in the updatemethod using periodic boundary conditions.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */
public class OneDimensionalAutomatonApp extends AbstractCalculation {
   LatticeFrame automaton = new LatticeFrame("");
   int[] update = new int[8]; // update[] maps neighborhood configurations to 0 or 1

   public void calculate() {
      control.clearMessages();
      int L = control.getInt("Linear dimension");
      int tmax = control.getInt("Maximum time");
      automaton.resizeLattice(L,tmax);     // default is lattice sites all zero
      // seed lattice by putting 1 in middle of first row
      automaton.setValue(L/2,0,1);
      // choose color of empty and occupied sites
      automaton.setIndexedColor(0, java.awt.Color.YELLOW);   // empty
      automaton.setIndexedColor(1, java.awt.Color.BLUE);     // occupied
      setRule(control.getInt("Rule number"));
      for (int t = 1; t < tmax; t++) {
         iterate(t, L);
      }
   }

   public void iterate(int t, int L) {
     for (int i = 0; i < L; i++) {
       // read the neighborhood bits around index i, using periodic b.c's
       int left   = automaton.getValue((i-1+L)%L, t-1);
       int center = automaton.getValue(i, t-1);
       int right  = automaton.getValue((i+1)%L, t-1);
       // encode left, center, and right bits into one integer value
       // between 0 and 7
       int neighborhood = (left << 2) + (center << 1) + (right << 0);
       // update[neighborhood] gives the new site value for this neighborhood
       automaton.setValue(i, t, update[neighborhood]);
     }
   }

   public void setRule(int ruleNumber) {
      control.println("Rule = " + ruleNumber + "\n");
      control.println("111   110   101   100   011   010   001   000");
      for (int i = 7; i >= 0; i--) {
         // (ruleNumber >>> i) shifts the contents of ruleNumber to the right by i
         // bits. In particular, the ith bit of ruleNumber resides in the rightmost
         // position of this expression. After "and"ing with the number 1, we are
         // left with either the number 0 or 1, depending on whether the ith
         // bit of ruleNumber was cleared or set.
         update[i] = ((ruleNumber >>> i) & 1);
         control.print("  " + update[i] + "     ");
      }
      control.println();
   }

   public void reset(){
      control.setValue("Rule number", 90);
      control.setValue("Maximum time", 100);
      control.setValue("Linear dimension", 500);
   }

   public static void main(String args[]) {
       CalculationControl.createApp(new OneDimensionalAutomatonApp());
   }
}
