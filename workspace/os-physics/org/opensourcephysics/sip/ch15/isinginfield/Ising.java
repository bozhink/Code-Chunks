package org.opensourcephysics.sip.ch15.isinginfield;import org.opensourcephysics.display.*;import org.opensourcephysics.display2d.*;import java.awt.*;public class Ising implements Drawable {   public static final double criticalTemperature = 2.0/Math.log(1.0 + Math.sqrt(2.0));   public int [][] spin;   public int L = 32;   public int N = L*L;   public double temperature = criticalTemperature;   public double field;   public int mcs = 0;  // number of MC moves per spin   public double energy;   public double energyAccumulator = 0;   public double energySquaredAccumulator = 0;   public int magnetization = 0;   public double magnetizationAccumulator = 0;   public double magnetizationSquaredAccumulator = 0;   public int acceptedMoves = 0;   private double [] w = new double[10];  // array to hold Boltzmann factors   private CellLattice lattice;   public void initialize(int _L) {      L=_L;      lattice = new CellLattice(L,L);         // only used for drawing       lattice.setIndexedColor(0, Color.red);         lattice.setIndexedColor(2, Color.green);      spin = new int[L][L];      N = L*L;      for (int i = 0; i < L; ++i) {         for (int j = 0; j < L; ++j) {            spin[i][j] = 1;  // all spins up          }      }      magnetization = N;      energy = -2*N;      resetData();      for(int spin = -1; spin <= 1; spin += 2) {  //spin = -1 or 1        for(int localField = -4; localField <= 4; localField += 2) {//field of 4 neighbors           int index = ((localField+4)/2) + ((spin+1)/2)*5;           w[index] = Math.exp(-2.0*spin*(localField + field)/temperature);        }      }   }   public double specificHeat() {      double energySquaredAverage = energySquaredAccumulator/mcs;      double energyAverage = energyAccumulator/mcs;      double heatCapacity = energySquaredAverage - energyAverage*energyAverage;      heatCapacity = heatCapacity/(temperature*temperature);      return (heatCapacity/N);   }   public double susceptibility() {      double magnetizationSquaredAverage = magnetizationSquaredAccumulator/mcs;      double magnetizationAverage = magnetizationAccumulator/mcs;      return (magnetizationSquaredAverage - Math.pow(magnetizationAverage,2))/(temperature*N);   }   public void resetData() {      mcs = 0;      energyAccumulator = 0;      energySquaredAccumulator = 0;      magnetizationAccumulator = 0;      magnetizationSquaredAccumulator = 0;      acceptedMoves = 0;   }   public void doOneMCStep() {      for (int k = 0; k < N; ++k) {         int i = (int)(Math.random()*L);         int j = (int)(Math.random()*L);         int localField = spin[(i+1)%L][j] + spin[(i-1+L)%L][j] + spin[i][(j+1)%L] + spin[i][(j-1+L)%L];         double dE = 2*spin[i][j]*(localField + field);         int index = ((localField+4)/2) + ((spin[i][j]+1)/2)*5;         if ((dE <= 0) || (w[index] > Math.random())) {            spin[i][j] = -spin[i][j];            acceptedMoves++;            energy += dE;            magnetization += 2*spin[i][j];         }      }      energyAccumulator += energy;      energySquaredAccumulator += energy*energy;      magnetizationAccumulator += magnetization;      magnetizationSquaredAccumulator += magnetization*magnetization;      mcs++;   }   public void draw (DrawingPanel panel, Graphics g) {      if(lattice==null) return;      for(int i = 0; i < L; i++)         for(int j = 0; j < L; j++)            lattice.setValue(i,j,(byte)(spin[i][j]+1));      lattice.draw(panel,g);   }}