/* Implements Hopfield model of a neural network */
package org.opensourcephysics.sip.ch14.hopfield;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

public class HopfieldApp extends AbstractSimulation {
   LatticeFrame lattice;
   int N;                        // Total number of elements in lattice
   double[][] connection;        // Connections array (N by N elements)
   int numberOfStoredMemories;


   public HopfieldApp() {
      lattice = new LatticeFrame("Hopfield State");
      lattice.setToggleOnClick(true, 0, 1);
      lattice.setIndexedColor(0, java.awt.Color.blue);
      lattice.setIndexedColor(1, java.awt.Color.green);
   }

   public void doStep() {
      int[] state = lattice.getAll();
      for (int s = 0; s < N; s++) {
         int i = (int)(N * Math.random());  // choose random neuron
         double sum = 0;
         for (int j = 0; j < N; j++)
            sum += connection[i][j] * state[j];
         state[i] = (sum > 0) ? 1 : 0;  // set state[i] to 1 if sum > 0 otherwise 0.
      }
      lattice.setAll(state);
   }

   public void initialize() {
      numberOfStoredMemories = 0;
      int lx = control.getInt("Lattice width");
      int ly = control.getInt("Lattice height");
      N = lx*ly;
      connection = new double[N][N];
      lattice.resizeLattice(lx, ly);
      for (int i = 0; i < lx; i++) {
        for (int j = 0; j < ly; j++) {
           lattice.setValue(i,j,0);
        }
      }
   }

   public void reset(){
      control.setValue("Lattice width", 20);
      control.setValue("Lattice height", 1);
   }

   public void addMemory() {
      numberOfStoredMemories++;
      int[] memory = lattice.getAll();
      for(int i = 0; i < N-1; i++) {
         for(int j = i+1; j < N; j++) {
            int connectionStrength = (2*memory[i] - 1) * (2*memory[j] -1);
            connection[i][j] += connectionStrength;
            connection[j][i] += connectionStrength;
         }
      }
      lattice.setMessage("# memories = " + numberOfStoredMemories);
   }


   public static void main(String args[]) {
      SimulationControl c = SimulationControl.createApp(new HopfieldApp());
      c.addButton("addMemory", "Remember");
   }
}
