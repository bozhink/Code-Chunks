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
    
    // Topology factor:
    private int topology;
    // topology = 0  --> Toroidal topology
    // topology = 1  --> Klein bottle topology
    // topology = 2  --> Cross cap topology

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
        this.topology = 0;
    }
    
    public IsingClass(int dimx, int dimy, double _J, double _B, int _topology)
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
        this.topology = _topology;
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

    
    // Monte Carlo Micro Step with Klein topology
    private int NeighbourSum(int i, int j)
    {
        int nip = (idimx + i + 1) % idimx;
        int nim = (idimx + i - 1) % idimx;
        int njp = (idimy + j + 1) % idimy;
        int njm = (idimy + j - 1) % idimy;
        
        int Il, Ir, Iu, Id, Jl, Jr, Ju, Jd;
        
        switch (topology)
        {
        case 0: // Toroidal topology
        	Ir = nip; Jr = j;
        	Il = nim; Jl = j;
        	Iu = i;   Ju = njp;
        	Id = i;   Jd = njm;
        	break;
        case 1: // Klein Bottle topology
        	Ir = idimx-nip-1; Jr = j;
        	Il = idimx-nim-1; Jl = j;
        	Iu = idimx-i-1;   Ju = njp;
        	Id = idimx-i-1;   Jd = njm;
        	break;
        case 2: // Cross cap topology
        	Ir = idimx-nip-1; Jr = idimy-j-1;
        	Il = idimx-nim-1; Jl = idimy-j-1;
        	Iu = idimx-i-1;   Ju = idimy-njp-1;
        	Id = idimx-i-1;   Jd = idimy-njm-1;
        	break;
        case 3: // Klein topology
        	Ir = nip;
        	Il = nim;
        	Jr = ((i+1)>=idimx) ? idimy-j-1 : j;
        	Jl = ((i-1)<0) ? idimy-j-1 : j;
        	Iu = i;   Ju = njp;
        	Id = i;   Jd = njm;
        	break;
        case 4: //Cross cap topology
        	Ir = nip;
        	Il = nim;
        	Jr = ((i+1)>=idimx) ? idimy-j-1 : j;
        	Jl = ((i-1)<0) ? idimy-j-1 : j;
        	Ju = njp;
        	Jd = njm;
        	Iu = ((j+1)>=idimy) ? idimx-i-1 : i;
        	Id = ((j-1)<0) ? idimx-i-1 : i;
        	break;
        default:
        	System.err.println("Error: Unknown toplogy");
        	System.err.println("It is assumed toroidal topology");
        	Ir = nip; Jr = j;
        	Il = nim; Jl = j;
        	Iu = i;   Ju = njp;
        	Id = i;   Jd = njm;
        }
        
        return spinMatrix[Ir*idimx + Jr] +
               spinMatrix[Il*idimx + Jl] +
               spinMatrix[Iu*idimx + Ju] +
               spinMatrix[Id*idimx + Jd];
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