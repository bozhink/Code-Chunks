c This program calculates maximal critical temperature Tc
c for fixed parameter es for given cuprate as a function of E_Fermi
      program tcef
      implicit none
      double precision Kelvin,pi
      parameter(Kelvin=1.d0/11604.d0)
      double precision getzero
      external getzero
      integer n, i, NMAX
      parameter (n=100, NMAX=15)
      double precision RELERR, ABSERR
      double precision z, x0, f0, x1, f1, Tc
      integer iter, ierr
      double precision Ef, efmin, efmax, Efermi(n)
      double precision T, es, Jsd
      common /tcefroot/ Ef, es, Jsd
c
      pi=4.d0*datan(1.d0)
      call setriang(0.d0,0.d0,pi,pi)
      RELERR=1.d-3
      ABSERR=1.d-4
c Hg1212
      Jsd=5.68d0
      es=3.934d0
      T=127*Kelvin
      Ef=1.543d0
c Hg1223
      Jsd=5.68d0
      es=3.807d0
      T=135*Kelvin
      Ef=1.531d0
c Tl2223
      Jsd=5.68d0
      es=3.997d0
      T=125*Kelvin
      Ef=1.549d0
c
      efmin=0.6d0
      efmax=2.4d0
      call linspace(efmin,efmax,n,Efermi)
c
!      z=getzero(T)
!      print*,z
c
c
!      Ef=Efermi(50)
!      x0=10*Kelvin
!      x1=300*Kelvin
!      f0=getzero(x0)
!      print*
!      print*,'f0=',f0/Kelvin,'Ef=',Ef
!      print*
!      f1=getzero(x1)
!      print*
!      print*,'f1=',f1/Kelvin,'Ef=',Ef
!      print*
!      call secant(getzero,NMAX,RELERR,ABSERR,x0,f0,x1,f1,
!     * z,iter,.true.,ierr)
!      print*,z/Kelvin,'Ef=',Ef
!      
      open(unit=20,file='/tmp/tcef-tl2223.dat',status='replace')
!      
      do i=1,n
         Ef=Efermi(i)
         x0=10*Kelvin
         x1=300*Kelvin
         f0=getzero(x0)
         f1=getzero(x1)
      call secant(getzero,NMAX,RELERR,ABSERR,x0,f0,x1,f1,
     *     z,iter,.true.,ierr)
      print 100,Ef,z,z/Kelvin,iter,ierr
         write(unit=20,fmt=100)Ef,z,z/Kelvin,iter,ierr
      enddo
!      
      close(unit=20)

      stop
  100 format(f6.3,1x,f9.6,1x,f6.1,1x,i4,1x,i4)
      end

      function getzero(T)
      implicit none
      double precision getzero, T
      double precision i1
      external i1
      double precision Ef, es, Jsd
      common /tcefroot/ Ef, es, Jsd
      getzero=2.d0*T-Jsd*i1(T,es,Ef,.false.)
      return
      end
      
