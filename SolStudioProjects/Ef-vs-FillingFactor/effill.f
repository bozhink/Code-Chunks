      program Ef vs Filling Factor
      implicit doubleprecision(a-h,o-z),integer(i-n)
      parameter (n=100, NMAX=15)
      double precision Kelvin,Jsd
      parameter(Kelvin=1.d0/11604.d0)
      external findef
      double precision filling(n)
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
!      Jsd=5.68d0
!      es=3.807d0
!      T=135*Kelvin
!      Ef=1.531d0
c Tl2223
!      Jsd=5.68d0
!      es=3.997d0
!      T=125*Kelvin
!      Ef=1.549d0
c
      pmin=0.0d0
      pmax=0.3d0
      call linspace(pmin,pmax,n,filling)
c
      call xfill(n,filling)
      
      z = findef(es,0.34d0)
      print '("#",f7.4,1x,f7.4)',Ef, z

      print '("#")'
      print '("#",f7.4,1x,f7.4)',dfill(0.34d0), z
      print '("#")'

      do i=1,n
         z = findef(es,filling(i))
         print '(f7.4,1x,f7.4)',dfill(filling(i)),z
      enddo
      stop
  100 format(f6.3,1x,f9.6,1x,f6.1,1x,i4,1x,i4)
  200 format(f6.3,1x,f9.6,1x,f6.1)
      end

      doubleprecision function dfill(x)
         double precision x
         dfill = 0.5d0 - x
      end

      subroutine xfill(n,x)
      integer n
      double precision x(*)
      do i=1,n
         x(i) = 0.5d0 - x(i)
      enddo
      end
