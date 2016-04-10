!     
! File:   calc_eigen.f90
! Author: bozhin
!
! Created on Вторник, 2012, Януари 17, 19:45
!

module calc_eigen
   public :: jacobi

   contains

   subroutine jacobi(d,n,e,eps,itmax)
      implicit none
      ! Arguments
      real, intent(in out), dimension(:,:) :: d
      real, intent(in out), dimension(:,:) :: e
      real, intent(in)                     :: eps
      integer, intent(in)                  :: n
      integer, intent(in)                  :: itmax
      !
      ! Local variables
      integer :: i,j,iter,nm1,ip1,ir,ic
      real :: yy,zz,yyy,zzz,dif,tanz,cosz,sinz
      !
      iter = 0
      do i = 1, n
         do j = 1, n
            e(i,j) = 0.0
         enddo
         e(i,i) = 1.0
      enddo
      !
      do
         if (iter >= itmax) then
            exit
         endif
         yy = 0.0
         zz = 0.0
         nm1 = n-1
         do i = 1, nm1
            ip1 = i+1
            do j = ip1, n
               if (abs(d(i,j)) > zz) then
                  zz = abs(d(i,j))
                  ir = i
                  ic = j
               endif
            enddo
         enddo
         !
         if ((iter > 0) .or. (iter < 0)) then
            yy = zz*eps
         endif
         !
         if (zz <= yy) then
            return
         endif
         !
         dif = d(ir,ir) - d(ic,ic)
         tanz = (-dif + sqrt(dif*dif + 4.0*zz*zz))/(2.0*d(ir,ic))
         cosz = 1.0/sqrt(1.0+tanz*tanz)
         sinz = cosz*tanz
         !
         do i = 1, n
            zzz = e(i,ir)
            e(i,ir) = cosz*zzz + sinz*e(i,ic)
            e(i,ic) = cosz*e(i,ic) - sinz*zzz
         enddo
         !
         i = 1
         do
            if (.not.((i > ir) .or. (i < ir))) then
               exit
            endif
            yyy = d(i,ir)
            d(i,ir) = cosz*yyy + sinz*d(i,ic)
            d(i,ic) = cosz*d(i,ic) - sinz*yyy
            i = i + 1
         enddo
         !
         i = ir + 1
         do
            if (.not.((i > ic) .or. (i < ic))) then
               exit
            endif
            yyy = d(ir,i)
            d(ir,i) = cosz*yyy + sinz*d(i,ic)
            d(i,ic) = cosz*d(i,ic) - sinz*yyy
            i = i + 1
         enddo
         !
         i = ic + 1
         do
            if (.not.(i <= n)) then
               exit
            endif
            zzz = d(ir,i)
            d(ir,i) = cosz*zzz + sinz*d(ic,i)
            d(ic,i) = cosz*d(ic,i) - sinz*zzz
            i = i + 1
         enddo
         !
         yyy = d(ir,ir)
         d(ir,ir) = yyy*cosz*cosz + 2.0*d(ir,ic)*cosz*sinz &
                    + d(ic,ic)*sinz*sinz
         d(ic,ic) = d(ic,ir)*cosz*cosz + yyy*sinz*sinz &
                    - d(ir,ic)*2.0*cosz*sinz
         d(ir,ic) = 0.0
         !
         iter = iter + 1
      enddo
   end subroutine jacobi
   end module calc_eigen
   


