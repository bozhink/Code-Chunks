      program findtc
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

!      subroutine tabi1(n,T,es,ef,di1,ifprint)
!      implicit none
!c This subroutine tabulates integral i1 over temperatures T
!c
!c Parameters
!c 'n'   -- input; number of points to tabulate
!c 'T'   -- input; vector of size(n); temperatures (in [eV]) to tabulate
!c 'es'  -- input; es-parameter of BH hamiltonian
!c 'ef'  -- input; fermi energy
!c 'di1' -- output; tabulated values of i1 integral
!c 'ifprint' -- input; ifprint flag of i1 function
!      integer n, i
!      double precision T(n), di1(n), es, ef
!      logical ifprint
!      integer i1
!      external i1
!      do i=1,n
!         di1(i)=i1(T(i),es,ef,ifprint)
!      enddo
!      return
!      end
      
