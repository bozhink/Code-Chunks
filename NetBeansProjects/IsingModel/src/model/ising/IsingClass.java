package model.ising;

import java.util.Random;

/**
 * Ising Model Class.
 * @author Bozhin A. Karaivanov
 * @version 1.0
 */
public class IsingClass 
{
    /*
     * param idimx x-dimension of the spin lattice
     * param idimy y-dimension of the spin lattice
     * param J Exchange integral
     * param B External magnetic field
     */
    private int idimx, idimy;
    private double J, B;

    /**
     * Array, containing the spin matrix.
     */
    public int[] spinMatrix;
    /**
     * Value of the total magnetic moment on the spin matrix.
     * <br /> This value will be set after the execution of the
     * "MagneticMoment()" or the "Hamiltonian()" method.
     */
    public double magneticMoment=0.0;
    /**
     * Value of the total magnetic Energy on the spin matrix.
     * <br /> It is calculated using the hamiltonian formula.
     * <br /> This value will be set after the execution of the 
     * "Hamiltonian()" method.
     */
    public double magneticEnergy=0.0;
    /*
     * R-matrix.
     * <br /> Auxiliary matrix, wich contains exponent's values.
     * <br />
     * <br /> R-Matrix:
     * <br /> R(Spin,NeighbourSum):
     * <br />   Spin = -1, +1
     * <br />   NeighbourSum (NS) = -4, -2, 0, 2, 4
     * <br /> To use a normal array we redefine indices as follow:
     * <br /> +------------+------+------+
     * <br /> |     Spin   |  -1  |  +1  |
     * <br /> +------------+------+------+
     * <br /> | (Spin+1)/2 |   0  |   1  |
     * <br /> +------------+------+------+
     * <br />
     * <br /> +----------+------+------+------+------+------+
     * <br /> |       NS |  -4  |  -2  |   0  |  +2  |  +4  |
     * <br /> +----------+------+------+------+------+------+
     * <br /> | (NS+4)/2 |   0  |   1  |   2  |   3  |   4  |
     * <br /> +----------+------+------+------+------+------+
     * <br />
     * <br /> R(Spin,NS) = exp ( -2*Spin* ( B + J*NS ) )
     * <br /> R[i,j]     = exp ( -2*(2*i-1)*(B+J*(2*j-4)) ),
     * <br /> i = 0, 1; j = 0, 1, 2, 3, 4
     */
    private double[][] rMatrix = new double[2][5];
    /*
     * Random generator.
     */
    private Random rand;
    /*
     * Topology factor:
     * <br /> topology = 0  --> Toroidal topology
     * <br /> topology = 1  --> Local Klein bottle topology
     * <br /> topology = 2  --> Local Cross cap topology
     * <br /> topology = 4  --> Klein bottle topology
     * <br /> topology = 5  --> Cross cap topology
     */
    private int topology;
    /**
     * Initialization using default topology (toroidal).
     * <br /> WARNING: Initial spin state will not be set!
     * <br /> You must do it explicitly calling the StateGen method.
     * @param dimx x-dimension of the spin lattice.
     * @param dimy y-dimension of the spin lattice.
     * @param _J Exchange integral.
     * @param _B External magnetic field.
     */
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
    /**
     * Initialization.
     * <br /> WARNING: Initial spin state will not be set!
     * <br /> You must do it explicitly calling the StateGen method.
     * @param dimx x-dimension of the spin lattice.
     * @param dimy y-dimension of the spin lattice.
     * @param _J Exchange integral.
     * @param _B External magnetic field.
     * @param _topology Topology factor:
     * <br />&nbsp&nbsp&nbsp&nbsp _topology == 0  - Toroidal topology.
     * <br />&nbsp&nbsp&nbsp&nbsp _topology == 1  - Local Klein bottle topology.
     * <br />&nbsp&nbsp&nbsp&nbsp _topology == 2  - Local Cross cap topology.
     * <br />&nbsp&nbsp&nbsp&nbsp _topology == 4  - Klein bottle topology.
     * <br />&nbsp&nbsp&nbsp&nbsp _topology == 5  - Cross cap topology.
     */
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
    /**
     * x-dimension
     * @return x-dimension of the spin matrix.
     */
    public int Dimx()
    {
    	return idimx;
    }
    /**
     * y-dimension
     * @return y-dimension of the spin matrix.
     */
    public int Dimy()
    {
    	return idimy;
    }
    /**
     * Generation of initial spin state.
     * In this method is used hot start: uniform distribution of spins
     * with equal probability for -1 and +1 values.
     */
    public void StateGen()
    {
        for (int i = 0; i < idimx; i++)	for (int j=0; j<idimy; j++)
        	spinMatrix[i*idimx + j] = 2*Math.abs(rand.nextInt() % 2)-1;
    }
    /**
     * Generation of initial spin state.
     * @param startMode Defines the mode of initial state:
     * <br />&nbsp&nbsp&nbsp&nbsp startMode == 0 - Hot initial state: 
     * Uniform distribution of spins with equal probability for -1 and +1 values.
     * <br />&nbsp&nbsp&nbsp&nbsp startMode <> 0 - Cold initial state:
     * All spins have value 1.
     */
    public void StateGen(int startMode)
    {
        if (startMode==0) // Hot start
        {
            for (int i = 0; i < idimx; i++) for (int j=0; j<idimy; j++)
                spinMatrix[i*idimx + j] = 2*Math.abs(rand.nextInt() % 2)-1;
        }
        else // Cold start
        {
            for (int i = 0; i < idimx; i++) for (int j=0; j<idimy; j++)
                spinMatrix[i*idimx + j] = 1;
        }
        
        	
    }
    /**
     * Neighbour Sum.
     * <br /> WARNING: If topology <> 0, 1, 2, 3, 4, or 5 toroidal topology is used!
     * @param i x-position in spin matrix.
     * @param j y-position in spin matrix.
     * @return Neighbour sum according to the topology.
     */
    public int NeighbourSum(int i, int j)
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
        case 1: // Local Klein Bottle topology
        	Ir = idimx-nip-1; Jr = j;
        	Il = idimx-nim-1; Jl = j;
        	Iu = idimx-i-1;   Ju = njp;
        	Id = idimx-i-1;   Jd = njm;
        	break;
        case 2: // Local Cross cap topology
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
    /**
     * Monte Carlo Micro Step.
     */
    public void MCmS()
    {
        int i = rand.nextInt(idimx);
        int j = rand.nextInt(idimy);
        int rx = (spinMatrix[i*idimx + j] + 1) / 2;
        int ry = (NeighbourSum(i, j) + 4) / 2;
        if (rand.nextDouble() < rMatrix[rx][ry])
            spinMatrix[i*idimx + j] = -spinMatrix[i*idimx + j];
    }
    /**
     * Monte Carlo Macro Step
     * @param numSteps Number of MC micro steps to be done.
     */
    public void MCMS(int numSteps)
    {
        for (int i = 0; i < numSteps; i++) MCmS();
    }
    /**
     * Magnetic Moment calculation.
     * <br /> This method will set the value of the "magneticMoment"
     * class parameter.
     * @return Total magnetic moment on the spin matrix.
     */
    public double MagneticMoment()
    {
        magneticMoment = 0.0;
        for (int i = 0; i < idimx; i++)
        	for (int j=0; j<idimy; j++)
        		magneticMoment += spinMatrix[i*idimx + j];
        return magneticMoment;
    }
    /**
     * Calculation of Hamiltonian.
     * <br /> This method will set the value of the "magneticMoment"
     * and "magneticEnergy" class parameters.
     * @return Total magnetic energy on the spin matrix according to used
     * topology.
     */
    public double Hamiltonian()
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
    /**
     * Converts the values in the spin matrix to bytes.
     * <br /> WARNING: The size of returned data will be truncated to the size
     * of input-ounput array x.
     * @param x Input-Output byte array. In it will be stored lattice's spin values.
     * This array must be initialized, i. e. it must have defined length.
     * All the information in it will be overwritten.
     */
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
