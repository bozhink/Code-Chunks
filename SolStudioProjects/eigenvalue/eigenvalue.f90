!     
! File:   eigenvalue.f90
! Author: bozhin
!
! Created on Вторник, 2012, Януари 17, 20:10
!

program eigenvalue
   ! Eigenvalue solution by Jacobi method
   use calc_eigen
   implicit none
   !
   real, allocatable, dimension(:,:) :: d
   real, allocatable, dimension(:,:) :: e
   real                              :: eps
   integer                           :: n, itmax
   integer :: i
   !
   print*, "Matrix order?"
   read*,n
   !
   allocate (d(n,n),e(n,n))
   !
   do i=1,n
      print "(a,i2,a)","Elements of row ",i," od d?"
      read*,d(i,1:n)
   enddo
   !
   print*,"Input magnitude of eps?"
   read*,eps
   print*,"Enter itmax"
   read*,itmax
   call jacobi(d,n,e,eps,itmax)
   print*,"Eigenvalues:"
   print*
   do i=1,n
      print "(f14.8)",d(i,i)
   enddo
   print*
   print*, "Eigenvectors (columns):"
   print*
   do i=1,n
      print "(4f14.8)",e(i,1:n)
   enddo
end program eigenvalue


