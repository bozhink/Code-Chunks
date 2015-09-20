program eigenvalue

   use calc_eigen
   implicit none
   ! Eigenvalue solution by Jacobi method
   
   real, allocatable, dimension(:,:) :: d
   real, allocatable, dimension(:,:) :: e
   real                              :: eps
   integer                           :: n, itmax
   integer                           :: i
   
   print *, "Matrix order?"
   read *, n
   
   allocate (d(n,n), e(n,n))
   
   do i = 1, n
      print "(a,i2,a)", "Elements of row ", i, " of d?"
      read *, d(i,1:n)
   end do
   
   print *, "Input magnitude of eps"
   read *, eps
   print *, "Enter itmax"
   read *, itmax
   call jacobi (d, n, e, eps, itmax)
   print *, "Eigenvalues:"
   print *
   do i = 1, n
      print "(f14.8)", d(i,i)
   end do
   print *
   print *, "Eigenvectors (columns):"
   print *
   do i = 1, n
      print "(4f14.8)", e(i,1:n)
   end do

end program eigenvalue

