package sc;

public class BlochHuckel {
	public double ep;
	public double es;
	public double ed;
	public double tpd;
	public double tsp;
	public double tpp;
	public double [] hamiltonian = new double[4*4];
	public BlochHuckel(double _ep,double _es,double _ed,
			double _tpd,double _tsp,double _tpp)
	{
		ep=_ep;
		es=_es;
		ed=_ed;
		tpd=_tpd;
		tsp=_tsp;
		tpp=_tpp;
	}
	
	public void Hamiltonian(double px,double py)
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
}
