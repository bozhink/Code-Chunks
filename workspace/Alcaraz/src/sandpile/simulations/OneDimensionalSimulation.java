package sandpile.simulations;

import sandpile.abeliansandpile.onedimensional.QuadraticAlgebra;

public class OneDimensionalSimulation {

	static double mu = 0.25;
	static int L = 50;
	static int MAX_ITERATIONS = 100000;
	/**
	 * @param args not used
	 */
	public static void main(String[] args) {
		QuadraticAlgebra model = new QuadraticAlgebra(L, mu);
		int t;
		int histogram[] = new int[L+1];
		double pt[] = new double[L+1];
		double X[] = new double[L+1];
		double Y[] = new double[L+1];
		double area = 0.0;
		// Some initialization
		for (int i=0; i<L+1; i++) {
			histogram[i]=0;
		}
		// Running simulation
		for (int i=0; i<MAX_ITERATIONS; i++) {
			t = model.NextStep();
			histogram[t]++;
			area += 1.0;
		}
		// Calculation of the probabilities
		for (int i=0; i<L+1; i++) {
			pt[i] = histogram[i] / area;
			X[i] = Math.log(i+1);
			Y[i] = Math.log(pt[i]+1.0e-14);
		}
		// Exporting data
		for (int i=0; i<L; i++) {
			System.out.println((i+1)+" "+histogram[i]+" "+pt[i]);
		}
	}

}
