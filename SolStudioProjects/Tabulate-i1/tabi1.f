      program tabi1
      implicit none
      double precision i1, Temp, es, Ef
      external i1
      integer n
      parameter (n=15)
      double precision di1(n), T(n)
      double precision Jsd
      double precision Kelvin,pi
      parameter(Kelvin=1.d0/11604.d0)
      integer i

      pi=4.d0*datan(1.d0)
      call setriang(0.d0,0.d0,pi,pi)
      es=3.934d0
      Ef=1.543d0
      Temp=127.d0*Kelvin
      Jsd=5.66d0

      call linspace(1.d1*Kelvin,3.d2*Kelvin,n,T)

      do i=1,n
      di1(i)=i1(T(i),es,ef,.false.)
      print 10, T(i), T(i)/Kelvin, di1(i)
      enddo

      stop
   10 format(f9.6,1x,f7.2,1x,f9.6)
      end

