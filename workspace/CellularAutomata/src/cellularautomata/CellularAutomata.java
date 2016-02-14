package cellularautomata;

public class CellularAutomata {
	
	public int matrix[][];
	public int nx, ny;
	private Code code;
	public String codeName;
	
	public CellularAutomata(int nx, int ny) {
		this.nx = nx;
		this.ny = ny;
		matrix = new int[nx][ny];
		for (int i=0; i<nx; i++) {
			for (int j=0; j<ny; j++) {
				matrix[i][j] = 0;
			}
		}
		matrix[0][(ny-1)/2+1] = 1;
		code = new Code(90);
		codeName = "Rule "+90;
	}
	
	public CellularAutomata(int n) {
		this.nx = n;
		this.ny = n;
		matrix = new int[n][n];
		for (int i=0; i<n; i++) {
			for (int j=0; j<n; j++) {
				matrix[i][j] = 0;
			}
		}
		matrix[0][(ny-1)/2+1] = 1;
		code = new Code(90);
		codeName = "Rule "+90;
	}
	
	public CellularAutomata(int nx, int ny, int rule) {
		this.nx = nx;
		this.ny = ny;
		matrix = new int[nx][ny];
		for (int i=0; i<nx; i++) {
			for (int j=0; j<ny; j++) {
				matrix[i][j] = 0;
			}
		}
		matrix[0][(ny-1)/2+1] = 1;
		code = new Code(rule);
		codeName = "Rule "+rule;
	}
	
	public void SetPeaks(int peaks[]) {
		for (int j=0; j<ny; j++) {
			matrix[0][j]=0;
		}
		for (int k=0; k<peaks.length; k++) {
			if (peaks[k]<ny) {
				matrix[0][peaks[k]] = 1;
			}
		}
	}
	
	public void Calculate() {
		// If there is just one row:
		if (nx == 1) {
			return;
		}
		// If there is just one column
		if (ny == 1) {
			for (int i=1; i<nx; i++) {
				matrix[i][0] = code.Calculate(0, matrix[i-1][0], 0);
			}
			return;
		}
		// If there are more than one row and column
		for (int i=1; i<nx; i++) {
			// First stage: Calculate the first column: j=0:
			matrix[i][0] = code.Calculate(0, matrix[i-1][0], matrix[i-1][1]);
			// Second stage: 0 < j < ny-1
			for (int j=1; j<ny-1; j++) {
				matrix[i][j] = code.Calculate(
						matrix[i-1][j-1],
						matrix[i-1][j],
						matrix[i-1][j+1]);
			}
			// Third stage: Calculate the last column: j=ny-1
			matrix[i][ny-1] = code.Calculate(matrix[i-1][ny-2], matrix[i-1][ny-1], 0);
		}
	}
	
	public void CalculatePeriodic() {
		// If there is just one row:
		if (nx == 1) {
			return;
		}
		// If there is just one column
		if (ny == 1) {
			for (int i=1; i<nx; i++) {
				matrix[i][0] = code.Calculate(0, matrix[i-1][0], 0);
			}
			return;
		}
		// If there are more than one row and column
		int jm1, jp1;
		for (int i=1; i<nx; i++) {
			for (int j=1; j<ny; j++) {
				jm1 = (j-1+ny) % ny;
				jp1 = (j+1+ny) % ny;
				matrix[i][j] = code.Calculate(
						matrix[i-1][jm1],
						matrix[i-1][j],
						matrix[i-1][jp1]);
			}
		}
	}
}
