package org.opensourcephysics.sip.ch15;
import java.awt.*;
import org.opensourcephysics.frames.*;
/**
 * IsingDemon  implements the Ising model in one dimension using periodic boundary conditions
 * and the demon algorithm.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class IsingDemon {
   public int [] demonEnergyDistribution;
   int N;   // number of spins
   public int systemEnergy;
   public int demonEnergy = 0;
   public int mcs = 0;       // number of MC steps per spin
   public double systemEnergyAccumulator = 0;
   public double demonEnergyAccumulator = 0;
   public int magnetization = 0;
   public double mAccumulator = 0, m2Accumulator = 0;
   public int acceptedMoves = 0;
   private LatticeFrame lattice;

   public IsingDemon(LatticeFrame displayFrame) {
      lattice = displayFrame;
   }


   public void initialize(int N) {
      this.N = N;
      lattice.resizeLattice(N,1);    // set lattice size
      lattice.setIndexedColor(1, Color.red);
      lattice.setIndexedColor(-1, Color.green);
      demonEnergyDistribution = new int[N];
      for (int i = 0; i < N; ++i) {
         lattice.setValue(i,0,1);    // all spins up, second argument is always 0 for 1D lattice
      }
      int tries = 0;
      int E = -N;         // start system in ground state
      magnetization = N;  // all spins up
      // try to 10*N times to flip spins so that system has desired energy
      while ( (E < systemEnergy) && (tries < 10*N)) {
         int k = (int) (N*Math.random());
         int dE = 2*lattice.getValue(k,0)*(lattice.getValue((k+1)%N,0)+lattice.getValue((k-1+N)%N,0));
         if (dE > 0) {
            E += dE;
            int newSpin = -lattice.getValue(k,0);
            lattice.setValue(k,0,newSpin);
            magnetization += 2*newSpin;
         }
         tries++;
      }
      systemEnergy = E;
      resetData();
   }

   public double temperature() {
      return 4.0/Math.log(1.0 + 4.0/(demonEnergyAccumulator/(mcs*N)));
   }

   public void resetData() {
      mcs = 0;
      systemEnergyAccumulator = 0;
      demonEnergyAccumulator = 0;
      mAccumulator = 0;
      m2Accumulator = 0;
      acceptedMoves = 0;
   }

   public void doOneMCStep() {
      for (int j = 0; j < N; ++j) {
         int i = (int) (N*Math.random());
         int dE = 2*lattice.getValue(i,0)*(lattice.getValue((i+1)%N,0)+lattice.getValue((i-1+N)%N,0));;
         if (dE <= demonEnergy) {
            int newSpin = -lattice.getValue(i,0);
            lattice.setValue(i,0,newSpin);
            acceptedMoves++;
            systemEnergy += dE;
            demonEnergy -= dE;
            magnetization += 2*newSpin;
         }
         systemEnergyAccumulator += systemEnergy;
         demonEnergyAccumulator += demonEnergy;
         mAccumulator += magnetization;
         m2Accumulator += magnetization*magnetization;
         demonEnergyDistribution[demonEnergy]++;
      }
      mcs++;
   }

}
