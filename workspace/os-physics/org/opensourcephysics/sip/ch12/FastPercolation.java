package org.opensourcephysics.sip.ch12;
import org.opensourcephysics.frames.PlotFrame;

/**
 * FastPercolation uses Newman-Ziff algorithm for cluster labeling.
 *
 * @author Jan Tobochnik, Wolfgang Christian, Harvey Gould
 * @version 1.0  revised 03/29/05
 */
public class FastPercolation {

   int[] site, next, occupiedSite;
   int[][] nn;
   int L, N;
   int[] properLabel, first, last;
   int clusterNumber = 0;
   double valueOfP[];
   int numberOfPValues;
   double pInfinity[];
   double connectednessLength[];
   double spanProbability[];
   double meanSize[];
   int numberOfTrials;
   double pMin, pMax, dp; // values of p for which the averages are calculated
   public void initialize() {
      N = L*L;
      pMin = (int) (N*pMin)/(1.0*N); // make pMin correspond to a specific number of occupied sites
      dp = (int) (N*dp)/(1.0*N);     // make dp correspond to a specific number of added occupied sites
      numberOfPValues = (int) ((pMax-pMin)/dp)+2;
      valueOfP = new double[numberOfPValues];
      pInfinity = new double[numberOfPValues];
      connectednessLength = new double[numberOfPValues];
      spanProbability = new double[numberOfPValues];
      meanSize = new double[numberOfPValues];
      site = new int[N+1];
      site[N] = -1;                  // used to refer to all border sites outside lattice
      occupiedSite = new int[N];
      next = new int[N];
      properLabel = new int[N];
      first = new int[N];
      last = new int[N];
      setNeighborTable();
      numberOfTrials = 0;
   } // finds the nerest neighbors for each site

   public void setNeighborTable() {
      nn = new int[N][4];
      for(int i = 0; i<N; i++) {
         nn[i][0] = i-1;   // left
         nn[i][1] = (i-L); // below
         nn[i][2] = i+1;   // right
         nn[i][3] = (i+L); // above
      }
      for(int j = 0; j<L; j++) {
         nn[j*L][0] = N;       // border sites not in lattice
         nn[j][1] = N;
         nn[(j+1)*L-1][2] = N;
         nn[N-j-1][3] = N;
      }
   }                           // creates an array that stores N integers and then randomly changes the positions of the integers in the array

   public void permutation() { // creates an array called order that holds the values from 0 to N
      for(int i = 0; i<N; i++) {
         occupiedSite[i] = i;
         next[i] = N;
         properLabel[i] = N;
         site[i] = -1;
         first[i] = -1;
         last[i] = -1;
      }
      for(int i = 0; i<N; i++) {
         int j = i+(int) ((N-i)*Math.random()); // mixes up the occupiedSite array so sites are added randomly
         int temp = occupiedSite[i];
         occupiedSite[i] = occupiedSite[j];
         occupiedSite[j] = temp;
      }
   }

   public void newLattice() {
      numberOfTrials++;
      clusterNumber = 0;
      permutation();
      int index = 0;
      double pAccumulate = pMin;
      double p = 0;
      int numberOccupied = 0;
      while(p<pMax) {
         p += 1.0/N;
         int i = occupiedSite[numberOccupied]; // get next occupied site
         numberOccupied++;
         assignLabel(i);
         if(p>=pAccumulate) {                  //accumulate data
            accumulateAverages(index, p, numberOccupied);
            pAccumulate += dp;
            index++;
         }
      }
   }

   public void assignLabel(int i) {
      site[i] = clusterNumber; // initially create new cluster from newly occupied site
      properLabel[clusterNumber] = clusterNumber;
      first[clusterNumber] = i;
      last[clusterNumber] = i;
      next[i] = i;
      int minLabel = clusterNumber;
      clusterNumber++;
      for(int jj = 0; jj<4; jj++) {
         int j = nn[i][jj];                            // sets j equal to the nearest neighbor site of new occupied site
         if(site[j]>0) {                               // occupied neighbor, thus merge clusters
            int jLabel = findProperLabel(site[j]);
            int temp = Math.min(minLabel, jLabel);
            int maxLabel = Math.max(minLabel, jLabel);
            minLabel = temp;
            if(minLabel!=maxLabel) {
               properLabel[maxLabel] = minLabel;
               next[last[minLabel]] = first[maxLabel]; //combine clusters
               last[minLabel] = last[maxLabel];
               first[maxLabel] = -1;                   // eliminate reference to clusterNumber that isn't proper
            }
         }
      }
   }

   public int findProperLabel(int label) {             // recursive method
      if(properLabel[label]==label) {
         return label;
      } else {
         return findProperLabel(properLabel[label]);
      }
   }

   public void accumulateAverages(int index, double p, int numberOccupied) {
      double s2sum = 0;
      double ssum = 0;
      double xi2 = 0;
      valueOfP[index] = p;
      boolean span = false;
      for(int label = 0; label<clusterNumber; label++) {
         if(first[label]>=0) { // cluster exists with this label
            boolean left = false;
            boolean right = false;
            double xbar = 0;
            double ybar = 0;
            double size = 0;
            int j = first[label];
            int i;
            do {
               i = j;
               int x = i%L;
               int y = i/L;
               if(x==0) {
                  left = true;
               } else if(x==L-1) {
                  right = true;
               }
               xbar += x;      // find center of mass
               ybar += y;
               size++;
               j = next[i];
            } while(i!=j);     // when i == j we have reached the end of cluster
            if(left&&right) {  //cluster spans horizontally
               if(!span) {
                  spanProbability[index]++;
                  span = true;
               }
               pInfinity[index] += size/numberOccupied;
            } else {
               s2sum += 1.0*(size*size);
               ssum += 1.0*size;
               xbar = xbar/size;
               ybar = ybar/size;
               double r2sum = 0;
               j = first[label];
               do {
                  i = j;
                  r2sum += Math.pow(i%L-xbar, 2)+Math.pow(i/L-ybar, 2);
                  j = next[i];
               } while(i!=j);
               xi2 += r2sum*size;
            }
         }                     // end sum over clusters
      }
      connectednessLength[index] += Math.sqrt(xi2/s2sum);
      meanSize[index] += s2sum/ssum;
   }

   public void calculateAverages(PlotFrame plotFrameFrame) { // calculates all the averages for a certain number of trials
      plotFrameFrame.clearData();
      for(int i = 0; i<numberOfPValues; i++) {
         plotFrameFrame.append(0, valueOfP[i], spanProbability[i]/numberOfTrials);
         plotFrameFrame.append(1, valueOfP[i], pInfinity[i]/numberOfTrials);
         plotFrameFrame.append(2, valueOfP[i], meanSize[i]/numberOfTrials);
         plotFrameFrame.append(3, valueOfP[i], connectednessLength[i]/numberOfTrials);
      }
      plotFrameFrame.render();
   }
}
