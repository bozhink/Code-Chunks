package org.opensourcephysics.sip.ch15;

public class KineticIsing extends Ising {


public void createRandomConfiguration() {
      magnetization = 0;
      energy = 0;
      for (int i = 0; i < L; ++i) {
         for (int j = 0; j < L; ++j) {
            if(Math.random() > 0.5)
               spin[i][j] = 1;  // all spins up
            else
               spin[i][j] = -1;
          }
      }
      for (int i = 0; i < L; ++i) {
         for (int j = 0; j < L; ++j) {
            magnetization += spin[i][j];
            energy += -spin[i][j]*(spin[(i+1)%L][j] + spin[i][(j+1)%L]);
          }
      }

}


}