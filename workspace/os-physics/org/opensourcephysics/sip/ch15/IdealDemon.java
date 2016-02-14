package org.opensourcephysics.sip.ch15;

/**
 * IdealDemon modles the demon algorithm for the one-dimensional ideal gas.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 07/05/05
 */
public class IdealDemon {
   public double v[];
   public int N;
   public double systemEnergy;
   public double demonEnergy;
   public int mcs = 0;       // number of MC moves per particle
   public double systemEnergyAccumulator = 0;
   public double demonEnergyAccumulator = 0;
   public int acceptedMoves = 0;
   public double delta;

   public void initialize() {
      v = new double[N];    // array to hold particle velocities
      double v0 = Math.sqrt(2.0*systemEnergy/N);
      for (int i = 0; i < N; ++i) {
        v[i] = v0;  // give all particles the same initial velocity
      }
      demonEnergy = 0;
      resetData();
   }

   public void resetData() {
      mcs = 0;
      systemEnergyAccumulator = 0;
      demonEnergyAccumulator = 0;
      acceptedMoves = 0;
   }

   public void doOneMCStep() {
      for (int j = 0; j < N; ++j) {
         int particleIndex = (int)(Math.random()*N);    // choose particle at random
         double dv = (2.0*Math.random() - 1.0)*delta;   // random change in velocity
         double trialVelocity = v[particleIndex] + dv;
         double dE = 0.5*(trialVelocity*trialVelocity - v[particleIndex]*v[particleIndex]);
         if (dE <= demonEnergy) {
            v[particleIndex] = trialVelocity;
             acceptedMoves++;
             systemEnergy += dE;
             demonEnergy -= dE;
         }
         systemEnergyAccumulator += systemEnergy;
         demonEnergyAccumulator += demonEnergy;
      }
      mcs++;
   }
}
