package sc;

public class GetEigen {
	private int n=4;
	private int lda=n;
	private int ldb=n;
	private int eigenNumber=3;
	private int neigen=eigenNumber-1;
	
	public double epsp;
	public double chip;
	public double [] psi=new double[n];
	public double [] hbh=new double[lda*n];
	public double [] w=new double[n];
	
	public double ep;
	public double es;
	public double ed;
	public double tpd;
	public double tsp;
	public double tpp;
	
	public GetEigen(double ep, double es, double ed, double tpd, double tsp, double tpp)
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
		hbh[0]=     ed; hbh[1]=    0.0; hbh[2]=  tpd*sx; hbh[3]=    -tpd*sy;
		hbh[4]=    0.0; hbh[5]=     es; hbh[6]=  tsp*sx; hbh[7]=     tsp*sy;
		hbh[8]= hbh[2]; hbh[9]= hbh[6]; hbh[10]=     ep; hbh[11]=-tpp*sx*sy;
		hbh[12]=hbh[3]; hbh[13]=hbh[7]; hbh[14]=hbh[11]; hbh[15]=        ep;
	}

    private String jobz = new String("V");
    private String uplo = new String("U");
    private int itype = 1;
    private int lwork=n*n*n;
	private double [] work=new double[lwork];
	private org.netlib.util.intW info = new org.netlib.util.intW(0);
	public int err;
	
	public double [] eye4={1.0, 0.0, 0.0, 0.0,
			               0.0, 1.0, 0.0, 0.0,
			               0.0, 0.0, 1.0, 0.0,
			               0.0, 0.0, 0.0, 1.0};
	
	public void EigenCalc(double px, double py)
	{
		Hamiltonian(px, py);
		org.netlib.lapack.Dsygv.dsygv(itype, jobz, uplo, n, hbh, 0, lda, eye4, 0, 
			       ldb, w, 0, work, 0, lwork, info);
		epsp=w[neigen];
		//System.out.println(hbh[0]+" "+hbh[1]+" "+hbh[2]+" "+hbh[3]);
		//System.out.println(hbh[4]+" "+hbh[5]+" "+hbh[6]+" "+hbh[7]);
		//System.out.println(hbh[8]+" "+hbh[9]+" "+hbh[10]+" "+hbh[11]);
		//System.out.println(hbh[12]+" "+hbh[13]+" "+hbh[14]+" "+hbh[15]);
		psi[0]=hbh[8];
		psi[1]=hbh[9];
		psi[2]=hbh[10];
		psi[3]=hbh[11];
		chip=psi[0]*psi[1];
		err=info.val;
		if (err !=0 ) System.out.println("Error code="+err+" at px="+px+", py="+py);
	}
	
	public double [] EpChi(double px, double py)
	{
		Hamiltonian(px, py);
		org.netlib.lapack.Dsygv.dsygv(itype, jobz, uplo, n, hbh, 0, lda, eye4, 0, 
			       ldb, w, 0, work, 0, lwork, info);
		double [] epchi={w[neigen], hbh[8]*hbh[9]};
		err=info.val;
		if (err !=0 ) System.out.println("Error code="+err+" at px="+px+", py="+py);
		return epchi;	
	}
	
	public double Td(double x)
	{
		double td;
		if (Math.abs(x)<0.01)
		{
			td= (0.4*x*x-1.0)*x*x/3.0+1.0;
		}
		else
		{
			td=Math.tanh(x)/x;
		}
		return td;
	}
	
	public double Integrand(double px, double py, double T)
	{
		EigenCalc(px, py);
		double integrand=chip*chip*Td(epsp*0.5/T);
		return integrand;
	}
}
