module calc_eigen

   implicit none
   public :: jacobi
   
contains

   subroutine jacobi (d, n, e, eps, itmax)
   implicit none
   ! Arguments
   real, intent(in out), dimension(:,:) :: d
   real, intent(in out), dimension(:,:) :: e
   real, intent(in)                     :: eps
   integer, intent(in)                  :: n
   integer, intent(in)                  :: itmax
   
   ! Local variables
   integer :: i, j, iter, nm1, ip1, ir, ic
   real    :: yy, zz, yyy, zzz, dif, tanz, cosz, sinz
   
   iter = 0
   do i = 1, n
      do j = 1, n
         e(i,j) = 0.0
      end do
      e(i,i) = 1.0
   end do
   do
      if (iter >= itmax) exit
      yy = 0.0
      zz = 0.0
      nm1 = n-1
      do i = 1, nm1
         ip1 = i + 1
         do j = ip1, n
            if (abs(d(i,j)) > zz) then
               zz = abs(d(i,j))
               ir = i
               ic = j
            end if
         end do
      end do
      if ((iter > 0) .or. (iter < 0)) yy = zz * eps
      if (zz <= yy) return
      
      dif = d(ir,ir) - d(ic,ic)
      tanz = 0.5 * (-dif + sqrt(dif*dif + 4.0*zz*zz)) / d(ir,ic)
      cosz = 1.0 / sqrt(1.0 + tanz*tanz)
      sinz = cosz * tanz
      
      do i = 1, n
         zzz = e(i,ir)
         e(i,ir) = cosz * zzz + sinz * e(i,ic)
         e(i,ic) = cosz * e(i,ic) - sinz * zzz
      end do
      
      i = 1
      do
         if (.not.((i > ir) .or. (i < ir))) exit
         yyy = d(i,ir)
         d(i,ir) = cosz * yyy + sinz * d(i,ic)
         d(i,ic) = cosz * d(i,ic) - sinz * yyy
         i = i + 1
      end do
      
      i = ir + 1
      do
         if (.not.((i > ic) .or. (i < ic))) exit
         yyy = d(ir,i)
         d(ir,i) = cosz * yyy + sinz * d(i, ic)
         d(i,ic) = cosz * d(i,ic) - sinz * yyy
         i = i + 1
      end do
      
      i = ic + 1
      do
         if (.not.(i <= n)) exit
         zzz = d(ir, i)
         d(ir,i) = cosz * zzz + sinz * d(ic,i)
         d(ic,i) = cosz * d(ic,i) - sinz * zzz
         i = i + 1
      end do
      
      yyy = d(ir,ir)
      d(ir,ir) = yyy * cosz*cosz + d(ir,ic) * 2.0*cosz*sinz + d(ic,ic) * sinz*sinz
      d(ic,ic) = d(ic,ic) * cosz*cosz - d(ir,ic) * 2.0*cosz*sinz + yyy * sinz*sinz
      d(ir,ic) = 0.0
      
      iter = iter + 1
   end do
   
   end subroutine jacobi

end module calc_eigen

