/*  Creates percolation cluster with probability p and computes mass distribution */

package  org.opensourcephysics.sip.ch13.cluster;

public class Epidemic extends Cluster{	


public void step() {
  int pxsTemp[] = new int[perimeterNumber];
  int pysTemp[] = new int[perimeterNumber];
  for(int i = 0; i< perimeterNumber; i++) {
    pxsTemp[i] = pxs[i]; 
    pysTemp[i] = pys[i]; 
  }
  int currentPerimeterNumber = perimeterNumber;
  perimeterNumber = 0;
  for(int perimeter = 0; perimeter < currentPerimeterNumber; perimeter++) {
    int x = pxsTemp[perimeter];
    int y = pysTemp[perimeter];
    if(Math.random() < p ) {   //occupy site
      s[x][y] = 1;
      xs[occupiedNumber] = x;
      ys[occupiedNumber] = y;
      occupiedNumber++;
      for(int n = 0; n < 4; n++) {  // find new perimeter sites
        int px = x + nx[n];
        int py = y + ny[n];
        if(s[px][py] == 0) {  
          pxs[perimeterNumber] = px;
          pys[perimeterNumber] = py;
          s[px][py] = 2;
          perimeterNumber++;
        }
      }
    }
    else 
      s[x][y] = -1; 
   }  // end for
 }


}
