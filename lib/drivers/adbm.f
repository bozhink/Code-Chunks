      subroutine adbm(idimv,t0,x0,n,t,x,h,func)
      implicit none
      integer :: idimv, n
      integer, parameter :: iorder = 4
      double precision :: t0(iorder), x0(iorder,idimv)
      double precision :: t(n), x(n,idimv)
      double precision :: h
      double precision :: f(n,idimv)
      integer :: i,j
      a1=55
      
      do i=1,n
      
