package sc;

public class Eigen {
	private int n=4;
	private int lda=n;
	private int ldb=n;
	private int eigenNumber=3;
	private int neigen=eigenNumber-1;
	
	public double ep;
	public double chip;
	public double [] psi=new double[n];
	public double [] a=new double[lda*n];
	public double [] w=new double[n];
	
	private int itype = 1;
    private String jobz = new String("V");
    private String uplo = new String("U");
	public double [] eye4={1.0, 0.0, 0.0, 0.0,
			               0.0, 1.0, 0.0, 0.0,
			               0.0, 0.0, 1.0, 0.0,
			               0.0, 0.0, 0.0, 1.0};
	private int lwork=n*n;
	private double [] work=new double[lwork];
	public org.netlib.util.intW info = new org.netlib.util.intW(0);
	
	public void GetEigen(BlochHuckel BH, double px, double py)
	{
		BH.Hamiltonian(px, py);
		a=BH.hamiltonian;
		org.netlib.lapack.Dsygv.dsygv(itype, jobz, uplo, n, a, 0, lda, eye4, 0, 
			       ldb, w, 0, work, 0, lwork, info);
		ep=w[neigen];
		for (int i=0; i<n; i++) psi[i]=a[neigen+i];
		chip=psi[0]*psi[1];		
	}
}
