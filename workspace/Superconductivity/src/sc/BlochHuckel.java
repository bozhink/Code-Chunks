package sc;

public class BlochHuckel {
	private int n=4;
	public double ep;
	public double es;
	public double ed;
	public double tpd;
	public double tsp;
	public double tpp;
	public double [] hamiltonian = new double[n*n];
	
	public BlochHuckel(double ep, double es, double ed, double tpd, double tsp, double tpp)
	{
		this.ep=ep;
		this.es=es;
		this.ed=ed;
		this.tpd=tpd;
		this.tsp=tsp;
		this.tpp=tpp;
	}
	
	public void Hamiltonian(double px, double py)
	{
		double sx=2.0*Math.sin(0.5*px);
		double sy=2.0*Math.sin(0.5*py);
		// First row
		hamiltonian[0]=ed;
		hamiltonian[1]=0.0;
		hamiltonian[2]=tpd*sx;
		hamiltonian[3]=-tpd*sy;
		// Second row
		hamiltonian[4]=0.0;
		hamiltonian[5]=es;
		hamiltonian[6]=tsp*sx;
		hamiltonian[7]=tsp*sy;
		// Third row
		hamiltonian[8]=hamiltonian[2];
		hamiltonian[9]=hamiltonian[6];
		hamiltonian[10]=ep;
		hamiltonian[11]=-tpp*sx*sy;
		// Fourth row
		hamiltonian[12]=hamiltonian[3];
		hamiltonian[13]=hamiltonian[7];
		hamiltonian[14]=hamiltonian[11];
		hamiltonian[15]=ep;
	}
	
	public double [] HamiltonianCalc(double px, double py)
	{
		double sx=2.0*Math.sin(0.5*px);
		double sy=2.0*Math.sin(0.5*py);
		double [] ham = {     ed,    0.0,     tpd*sx,    -tpd*sy,
				             0.0,     es,     tsp*sx,     tsp*sy,
				          tpd*sx, tsp*sx,         ep, -tpp*sx*sy,
				         -tpd*sy, tsp*sy, -tpp*sx*sy,         ep};
		return ham;
	}
}
