//import org.netlib.util.*;
//import org.netlib.lapack.Dsygv;

/**
 * DsygvTest - example of calling the Java version of Dsygv (from LAPACK).
 *
 * To compile and run:
 *
 * # javac -classpath .:f2jutil.jar:blas.jar:lapack.jar DsygvTest.java
 * # java -classpath .:f2jutil.jar:blas.jar:lapack.jar:xerbla.jar DsygvTest
 * on return info = 0
 *
 **/

public class DsygvTest {
/*
	public static void Main(String[] args) {
	    int itype = 1;
	    String jobz = new String("V");
	    String uplo = new String("U");
	    int n = 3;
	    double []a = {1.0, 2.0, 4.0, 0.0, 3.0, 5.0, 0.0, 0.0, 6.0};
	    int lda = n;
	    double []b = {2.5298, 0.6405, 0.2091, 0.3798, 2.7833, 0.6808, 0.4611, 0.5678, 2.7942};
	    int ldb = n;
	    double []w = new double[n];
	    int lwork = 9;
	    double []work = new double[lwork];
	    org.netlib.util.intW info = new org.netlib.util.intW(0);

	    Dsygv.dsygv(itype, jobz, uplo, n, a, 0, lda, b, 0, 
	       ldb, w, 0, work, 0, lwork, info);

	    System.out.println("on return info = " + info.val);
	  }
*/
	
  public static void main(String[] args) {
	double ep=-0.9;
	double es=6.5;
	double ed=0.0;
	double tpd=1.0;
	double tsp=2.0;
	double tpp=0.4;
	
	double pi=3.141592653589793;
	
	double px0=0.0;
	double py0=0.0;
	
	double px1=pi;
	double py1=pi;
	
	//sc.BlochHuckel bh = new sc.BlochHuckel(ep, es, ed, tpd, tsp, tpp);
	//sc.Eigen eigen=new sc.Eigen();
	
	sc.GetEigen eigen=new sc.GetEigen(ep, es, ed, tpd, tsp, tpp);
	
	eigen.EigenCalc(px0, py0);
	
	System.out.println("ep = "+ep);
	System.out.println("es = "+es);
	System.out.println("ed = "+ed);
	System.out.println("tpd = "+tpd);
	System.out.println("tsp = "+tsp);
	System.out.println("tpp = "+tpp);
	System.out.println("================================================= ");
	System.out.println("px = " + px0 + "  py = " + py0);
	System.out.println("ep = " + eigen.epsp);
	System.out.println("psi = {"+eigen.psi[0]+", "+eigen.psi[1]+", "+eigen.psi[2]+", "+eigen.psi[3]+"}");
	System.out.println("chip = " + eigen.chip);
	System.out.println("error code = " + eigen.err);
	
	eigen.EigenCalc(px1, py1);
	
	System.out.println("================================================= ");
	System.out.println("px = " + px1 + "  py = " + py1);
	System.out.println("ep = " + eigen.epsp);
	System.out.println("psi = {"+eigen.psi[0]+", "+eigen.psi[1]+", "+eigen.psi[2]+", "+eigen.psi[3]+"}");
	System.out.println("chip = " + eigen.chip);
	System.out.println("error code = " + eigen.err);
  }
}
