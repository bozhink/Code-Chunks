package org.opensourcephysics.sip.ch14.genetic;
import org.opensourcephysics.controls.*;
import org.opensourcephysics.frames.*;

/**
 * GeneticApp simulates and displays a genetic algorithm such GenePool.
 *
 * @author Jan Tobochnik, Wolfgang Christan, Harvey Gould
 * @version 1.0  revised 06/24/05
 */
public class GeneticApp extends AbstractSimulation {
   GenePool genePool = new GenePool();
   Phenotype phenotype = new Phenotype();
   DisplayFrame frame = new DisplayFrame("Gene pool");

public void initialize() {
     phenotype.L = control.getInt("Lattice size");
     genePool.populationNumber = control.getInt("Population size");
     genePool.recombinationRate = control.getInt("Recombination rate");
     genePool.mutationRate = control.getInt("Mutation rate");
     genePool.genotypeSize = phenotype.L*phenotype.L;
     genePool.initialize(phenotype);
     phenotype.initialize();
     frame.addDrawable(genePool);
     frame.setPreferredMinMax(-1.0,genePool.genotypeSize + 5,-1.0,genePool.populationNumber + 2 );
     frame.setSize(phenotype.L*phenotype.L*10,genePool.populationNumber*20);

}

   public void doStep() {
      genePool.evolve();
      phenotype.determineFitness(genePool);
      phenotype.select(genePool);
      control.clearMessages();
      control.println(genePool.generation + " generations, best fitness = "  + phenotype.bestFitness);
  }

   public void reset() {
      control.setValue("Lattice size", 8);
      control.setValue("Population size", 20);
      control.setValue("Recombination rate", 10);
      control.setValue("Mutation rate", 4);
   }

   public static void main(String args[]) {
      SimulationControl.createApp(new GeneticApp());
   }
}
