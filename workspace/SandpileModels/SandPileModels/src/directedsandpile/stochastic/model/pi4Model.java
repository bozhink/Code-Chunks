package directedsandpile.stochastic.model;

public class pi4Model {
	
	public final static int THRESHOLD = 2;
	
	private int L; // Lattice size
	private int t; // Avalanche duration
	private int s; // Number of topplings
	private int [][] lattice; // The lattice array
	
	/**
	 * Construct pi/4 model of size L
	 * @param L
	 */
	public pi4Model(int L) {
		this.L = L;
		lattice = new int[L][];
		for (int i=0; i<L; i++)
			lattice[i] = new int[i+1];
	}
	
	/**
	 * Generates new state of lattice with 0 and 1
	 */
	public void Randomize() {
		for (int i=0; i<L; i++) {
			for (int j=0; j<i+1; j++) {
				lattice[i][j] = (int)(THRESHOLD*Math.random());
			}
		}
	}
	
	/**
	 * Recalculation of the lattice using model's rules
	 * Here alpha=1/4, beta=1/4, gamma=1/2
	 */
	public void update() {
	    int i, i1, j, j1, p;
	    s = 0;
	    t = 0;
	    for (i=0; i<L-1; i++) {
	        i1 = i + 1;
	        for (j=0; j<i1; j++) {
	            while (lattice[i][j] >= THRESHOLD) {
	                t = Math.max(t, i1);
	                s++;
	                lattice[i][j] -= THRESHOLD;
	                p = (int) (4.0*Math.random());
	                j1 = (j+1+i1) % i1;
	                switch (p) {
	                    case 0:
	                        lattice[i1][j] += THRESHOLD;
	                        break;
	                    case 1:
	                        lattice[i1][j1] += THRESHOLD;
	                        break;
	                    default:
	                        lattice[i1][j] += THRESHOLD/2;
	                        lattice[i1][j1] += THRESHOLD/2;
	                }
	            }
	        }
	    }
	    t++;
	    /* Last line */
	    i1 = L-1;
	    for (j=0; j<L; j++) {
	        while (lattice[i1][j] >= THRESHOLD) {
	            s++;
	            lattice[i1][j] -= THRESHOLD;
	        }
	    }
	}
	
	/**
	 * Get calculated t-value
	 * @return value of the avalanche length t
	 */
	public int Get_t() {
		return t;
	}
	
	/**
	 * Get calculated s-value
	 * @return value of the number of topplings s
	 */
	public int Get_s() {
		return s;
	}
	
	/**
	 * Get the value of the (i,j)-th lattice's element
	 * @param i row number
	 * @param j coordinate in current row
	 * @return value of the (i,j)-th lattice's element
	 */
	public int GetLatticeElement(int i, int j) {
		return lattice[i][j];
	}
	
	/**
	 * Drop one sand grain
	 * Increments the (0,0)-th element of the lattice by 1
	 */
	public void DropSand() {
		lattice[0][0]++;
	}

}
