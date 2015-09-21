module statistics
   implicit none
   !public :: mean, var, stdev
   !public :: amean, avar, astdev
   !public :: dmean, dvar, dstdev
   public :: damean, davar, dastdev

contains

   function damean(idimx, x) result (res)
      implicit none
      integer, intent(in) :: idimx ! Dimension of input array x
      integer, dimension(idimx), intent(in) :: x
      double precision :: res
      integer :: i
      res = 0.d0
      do i = 1, idimx
         res = res + dfloat(x(i))
      enddo
      res = res / dfloat(idimx)
   end function damean
   function davar(idimx, x) result (res)
      implicit none
      integer, intent(in) :: idimx ! Dimension of input array x
      integer, dimension(idimx), intent(in) :: x
      double precision :: res, av, dx
      integer :: i
      res = 0.d0
      av = damean(idimx,x)
      do i = 1, idimx
         dx = dfloat(x(i)) - av
         res = res + dx*dx
      enddo
      res = res / dfloat(idimx)
   end function davar
   function dastdev(idimx, x) result (res)
      implicit none
      integer, intent(in) :: idimx ! Dimension of input array x
      integer, dimension(idimx), intent(in) :: x
      double precision :: res
      res = dsqrt(damean(idimx, x))
   end function dastdev

end module statistics
