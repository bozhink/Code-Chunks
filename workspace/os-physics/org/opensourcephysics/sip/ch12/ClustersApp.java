package  org.opensourcephysics.sip.ch12;

import  org.opensourcephysics.controls.*;
import  org.opensourcephysics.frames.*;

/**
 *  ClustersApp models the Newman-Ziff algorithm for identifying clusters and displays the clusters.
 *
 *  @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 *  @version 1.0 06/15/05
 */
public class ClustersApp extends AbstractSimulation {
  Scalar2DFrame grid = new Scalar2DFrame("Newman-Ziff cluster algorithm");
  PlotFrame plot1 = new PlotFrame("p", "Mean Cluster Size", "Mean cluster size");
  PlotFrame plot2 = new PlotFrame("p", "P_?", "P_?");
  PlotFrame plot3 = new PlotFrame("p", "P_span", "P_span");
  PlotFrame plot4 = new PlotFrame("s", "<n_s>", "Cluster size distribution");
  Clusters lattice;
  double pDisplay;
  double[] meanClusterSize;
  double[] P_infinity;
  double[] P_span;              // probability of a spanning cluster
  double[] numClustersAccum;                    // number of clusters of size s
  int numberOfTrials;

  public void initialize () {
    int L = control.getInt("Lattice size L");
    grid.resizeGrid(L, L);
    lattice = new Clusters(L);
    pDisplay = control.getDouble("Display lattice at this value of p");
    grid.setMessage("p = " + pDisplay);
    plot4.setMessage("p = " + pDisplay);
    plot4.setLogScale(true, true);
    meanClusterSize = new double[L*L];
    P_infinity = new double[L*L];
    P_span = new double[L*L];
    numClustersAccum = new double[L*L + 1];
    numberOfTrials = 0;
  }

  public void doStep () {
    control.clearMessages();
    control.println("Trial " + numberOfTrials);                 // same as number of configurations
    // adds sites to new cluster, and accumulate results
    lattice.newLattice();
    for (int i = 0; i < lattice.N; i++) {
      lattice.addRandomSite();
      meanClusterSize[i] += (double)lattice.getMeanClusterSize();
      P_infinity[i] += (double)lattice.getSpanningClusterSize()/lattice.numSitesOccupied;
      P_span[i] += (lattice.getSpanningClusterSize() == 0 ? 0 : 1);
      if ((int)(pDisplay*lattice.N) == i) {
        for (int j = 0; j < lattice.N; j++)
          numClustersAccum[j] += lattice.numClusters[j];
        displayLattice();
      }
    }
    // display accumulated results
    numberOfTrials++;
    plotAverages();
  }

  private void plotAverages () {
    plot1.clearData();
    plot2.clearData();
    plot3.clearData();
    plot4.clearData();
    for (int i = 0; i < lattice.N; i++) {
      double p = (double)i/lattice.N;           // occupation probability
      plot1.append(0, p, meanClusterSize[i]/numberOfTrials);
      plot2.append(0, p, P_infinity[i]/numberOfTrials);
      plot3.append(0, p, P_span[i]/numberOfTrials);
      if (numClustersAccum[i + 1] > 0)
        plot4.append(0, i + 1, numClustersAccum[i + 1]/numberOfTrials);
    }
  }

  private void displayLattice () {
    double display[] = new double[lattice.N];
    for (int s = 0; s < lattice.N; s++)
      display[s] = lattice.getClusterSize(s);
    grid.setAll(display);
  }

  public void reset () {
    control.setValue("Lattice size L", 128);
    control.setValue("Display lattice at this value of p", 0.5927);
  }

  public static void main (String args[]) {
    SimulationControl.createApp(new ClustersApp());
  }
}



