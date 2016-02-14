/** *@author     Jan Tobochnik *@created    Dec 24, 2002 */package org.opensourcephysics.sip.ch14.minoritygame;/* There are N players or agents in the game. Each chooses one of two possible acts (herelabeled true and false) An agent gets a point if the choice made is in the minority of allagents for that time step. Each agent has a list of s randomly chosen strategies which tellthe agent what to do based on the history of the last m events. Each agent chooses from her list of strategies the one with the best performance so far in the game. The performance of all the strategies are updated after each time step.This is a simple model of adaptive competition which may be relevant to financial markets, individuals, economic firms, animals and any other entities trying to maximize their ownresources by making choices that others don't make (i.e. being in the minority).References:D. Challet and Y.-C. Zhang, "Emergence of Cooperation and organization in an Evolutionary Game," Physica A 246, 407 (1997). Robert Savit, Radu Manuca, and Rick Riolo,  "Adaptive Competition, Market Efficiency, and Phase Transitions," Phys. Rev. Lett. 82, 2203 (1999). */public class MG {public int N = 101; // number of playerspublic int minority = N/2; // maximum number of agents to be in the minoritypublic int m; // length of memorypublic int nPast; // number of possible pastspublic int s = 2; // number of strategies for each agentpublic int nStep = 10000; // number of trials public int nRun = 32; // number of independent runspublic boolean strategies[][][];public int performance[][];public int agentValue[];public int chosenStrategy[];public int bestStrategies[];public int timeSeries[];public double sigma,sigma2,spread, agentScore;public int initial() {   // initialize for new game  minority = N/2;  nPast =1;  for(int i = 0; i < m;i++) nPast *= 2;  strategies = new boolean[N][s][nPast];  performance = new int[N][s];  agentValue = new int[N];  chosenStrategy = new int[N];  bestStrategies = new int[s];  timeSeries = new int[nStep];  for (int i = 0; i < N; i++)      for(int j = 0; j < s;j++)        for(int k = 0; k < nPast; k++) {          if(Math.random() < 0.5)             strategies[i][j][k] = true;          else            strategies[i][j][k] = false;    }            return (int)(Math.random()*nPast);}public void play() { boolean winner = false; sigma = 0; agentScore = 0; sigma2 = 0; for(int iRun = 0; iRun < nRun;iRun++){  int past = initial();  double g = 0;  for(int iStep = 0; iStep < nStep; iStep++) {    int numberTrue = 0;    for (int i = 0; i < N; i++) {       int bestPerformance = 0;       int numberBest = 0;       for(int j = 0; j < s;j++) {        if(performance[i][j] > bestPerformance) {          bestStrategies[0] = j;          numberBest = 1;          bestPerformance = performance[i][j];        }        else if (performance[i][j] == bestPerformance) {          bestStrategies[numberBest] = j;          numberBest++;        }       } // end for s       chosenStrategy[i] = bestStrategies[(int)(Math.random()*numberBest)];       if(strategies[i][chosenStrategy[i]][past])numberTrue++;   // number of agents choosing true;    }// end for i    timeSeries[iStep] = numberTrue;    g += numberTrue;    if(numberTrue > minority)      winner = false;    else      winner = true;    for (int i = 0; i < N; i++) {      if(strategies[i][chosenStrategy[i]][past] == winner) agentValue[i]++;        for(int j = 0; j < s; j++)        if(strategies[i][j][past] == winner)performance[i][j]++;  // update performance      }     // update past    past %= (nPast/2);    // eliminate "oldest" bit    past *= 2;            // shift bits over     if(winner)past++;     // set newest bit   }// end for iStep   double sumOfSquares = 0;   g /= 1.0*nStep;   for(int iStep = 0; iStep < nStep; iStep++)      sumOfSquares += Math.pow(timeSeries[iStep] - g, 2.0);   double sig = Math.sqrt(sumOfSquares/nStep);   // sigma is a measure of the efficiency of the game, the larger sigma is the smaller the    // mean agent score is.    sigma += sig;   sigma2 += sig*sig;   for (int i = 0; i < N; i++) agentScore += agentValue[i];  } // end for iRun agentScore /= nRun*N*nStep; sigma /= nRun; sigma2 /= nRun; spread = Math.sqrt(sigma2 - sigma*sigma); //spread of sigma values System.out.println(N +"\t" + m + "\t" + sigma2/N + "\t" + (1.0*nPast)/N); // data needed to see scaling behavior}         }