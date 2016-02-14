package org.opensourcephysics.sip.ch15;import org.opensourcephysics.controls.*;import org.opensourcephysics.frames.*;import org.opensourcephysics.numerics.*;/** * @author Jan Tobochnik  revised 12/20/04 */public class PersistentSpinsApp extends AbstractSimulation {  PlotFrame			fFrame = new PlotFrame("t", "f", "Data");  PlotFrame			qFrame = new PlotFrame("t", "q", "Data");  int L, Tmax,plotTime,numberOfTrials;  int p[][];  int s[],f[];  /**   * Initializes the animation using the values in the control.   *   */  public void initialize() {    L = control.getInt("Chain length");    Tmax = control.getInt("Maximum time");    s = new int[L];    p = new int[L][Tmax];   // distribution of persistent values     f = new int[Tmax];      // number of persistent spins as a function of time    numberOfTrials = 0;  }  /**   * One Trial   */  public void doStep() {    for(int step = 0; step < control.getInt("steps between plots"); step++) {    int persistent = L;    for(int i = 0; i < L; i++) {       if(Math.random() > 0.5) {         s[i] = 1;       }       else {         s[i] = -1;       }    }    for(int t = 0; t < Tmax; t++) {      for(int i = 0; i < L; i++) {        int j = (int)(Math.random()*L);        int jLeft = PBC.position(j-1,L);        int jRight = PBC.position(j+1,L);        if( ((s[j]*s[jLeft] < 0) && (s[j]*s[jRight] < 0)) ||            (((s[j]*s[jLeft] < 0) || (s[j]*s[jRight] < 0)) && (Math.random() > 0.5))) { // flip spin           s[j] = -s[j];  // flip spin           if(s[j]*s[j] == 1) {              persistent--;  // one less spin persistent              s[j] = 2*s[j];  // indicate that this spin has been flipped            }        }      }      f[t] += persistent;      p[persistent][t]++;    }    numberOfTrials++;    }    fFrame.clearData();    qFrame.clearData();    int t1 = Tmax/2;    int t2 = Tmax - 1;    for(int i= 0; i < L; i++) {       if(p[i][t1] > 0)qFrame.append(0,i,1.0*p[i][t1]/(numberOfTrials));       if(p[i][t2] > 0)qFrame.append(1,i,1.0*p[i][t2]/(numberOfTrials));    }    int t = 1;    while (t < Tmax) {        fFrame.append(0,Math.log(t),Math.log(1.0*f[t]/(numberOfTrials*L)));        t *= 2;    }    control.clearMessages();    control.println("numberOfTrials = " + numberOfTrials);  }    /**   * Resets animation to a predefined state.   */  public void reset() {    control.setValue("Chain length",100);    control.setValue("Maximum time",128);    control.setValue("steps between plots",10);  }  /**   * Start Java application.   * @param args  command line parameters   */  public static void main(String[] args) {   SimulationControl.createApp(new PersistentSpinsApp());   }}