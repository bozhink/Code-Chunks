import java.util.Random;

public class IsingClass 
{	
	private int idimx, idimy;
    public int[] spinMatrix;
    private double J; // exchange integral
    private double B=0.0; //external magnetic field

    public double magneticMoment=0.0;
    public double magneticEnergy=0.0;

    // R-Matrix:
    // R(Spin,NeighbourSum):
    //   Spin = -1, +1
    //   NeighbourSum (NS) = -4, -2, 0, 2, 4
    // To use a normal array we redefine indices as follow:
    // +------------+------+------+
    // |     Spin   |  -1  |  +1  |
    // +------------+------+------+
    // | (Spin+1)/2 |   0  |   1  |
    // +------------+------+------+
    //
    // +----------+------+------+------+------+------+
    // |       NS |  -4  |  -2  |   0  |  +2  |  +4  |
    // +----------+------+------+------+------+------+
    // | (NS+4)/2 |   0  |   1  |   2  |   3  |   4  |
    // +----------+------+------+------+------+------+
    //
    // R(Spin,NS) = exp ( -2*Spin* ( B + J*NS ) )
    // R[i,j]     = exp ( -2*(2*i-1)*(B+J*(2*j-4)) ),
    // i = 0, 1; j = 0, 1, 2, 3, 4
    private double[][] rMatrix = new double[2][5];

    //private int seed;
    private Random rand;

    // Initialization
    public IsingClass(int dimx, int dimy, double _J, double _B)
    {
        this.idimx = dimx;
        this.idimy = dimy;
        this.J = _J;
        this.B = _B;
        int i, j;
        for (i = 0; i < 2; i++) for (j = 0; j < 5; j++)
        {
            rMatrix[i][j] = Math.exp(-2 * (2 * i - 1) * (B + J * (2 * j - 4)));
        }
        this.spinMatrix = new int[idimx*idimy];
        this.rand = new Random();
    }
    
    public int Dimx()
    {
    	return idimx;
    }
    
    public int Dimy()
    {
    	return idimy;
    }

    // Generation of new initial state.
    // In this program is used hot start: uniform distribution of
    // probability of -1 and +1
    public void StateGen()
    {
        for (int i = 0; i < idimx; i++)	for (int j=0; j<idimy; j++)
        	spinMatrix[i*idimx + j] = 2*Math.abs(rand.nextInt() % 2)-1;
    }

    // Monte Carlo Micro Step with toroidal topology
    private int NeighbourSum(int i, int j)
    {
        int ni = idimx + i, nj = idimy + j;
        return spinMatrix[((ni + 1) % idimx) + j] +
             spinMatrix[((ni - 1) % idimx) + j] +
             spinMatrix[i*idimx + ((nj + 1) % idimy)] +
             spinMatrix[i*idimx + ((nj - 1) % idimy)];
    }


    public void MCMSTT()
    {
        int i = rand.nextInt(idimx);
        int j = rand.nextInt(idimy);
        int rx = (spinMatrix[i*idimx + j] + 1) / 2;
        int ry = (NeighbourSum(i, j) + 4) / 2;
        if (rand.nextDouble() < rMatrix[rx][ry])
            spinMatrix[i*idimx + j] = -spinMatrix[i*idimx + j];
    }

    // Monte Carlo Macro Step
    public void MCMS(int numSteps) // numSteps = number of micro steps to do
    {
        for (int i = 0; i < numSteps; i++) MCMSTT();
    }

    // Magnetic Moment calculation
    public double MagneticMoment()
    {
        magneticMoment = 0.0;
        for (int i = 0; i < idimx; i++)
        	for (int j=0; j<idimy; j++)
        		magneticMoment += spinMatrix[i*idimx + j];
        return magneticMoment;
    }

    // Calculation of Hamiltonian in case of Toroidal Topology
    public double HamiltonianTT()
    {
        int i, j;
        int im = 0, ns = 0;
        for (i = 0; i < idimx; i++) for (j = 0; j < idimy; j++)
        {
            im += spinMatrix[i*idimx + j];
            ns += spinMatrix[i*idimx + j] * NeighbourSum(i, j);
        }
        magneticMoment = im;
        magneticEnergy = -J * ns + B * im;
        return magneticEnergy;
    }
    
    public void SpinToBytes(byte[] x)
    {
    	if (idimx*idimy>=x.length)
    	{
    		for (int i=0; i<x.length; i++)
    		{
    			x[i] = (byte) ((spinMatrix[i]+1) / 2);
    		}
    	}
    }
}