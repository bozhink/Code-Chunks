program inverse_matrix
   use linear_solve
   implicit none
   integer                           :: i, ierr, m, n
   real (kind=long), allocatable, dimension(:,:) :: A
   real (kind=long), allocatable, dimension(:)   :: b
   
   print "(a)", " Enter size of matrix A: "
   read *, n
   print "(a)", " How many RHS vectors? "
   read *, m
   
   allocate ( A(n,n), b(n*m) )
   
   do i= 1, n
      print *, "Input elements of row ", i, " of A"
      read *, A(i, 1:n)
   end do
   
   print *
   print *, "The original matrix is:"
   print *
   do i = 1, n
      print *, A(i,1:n)
   end do
   
   call krout(0, n, m, A, n, b, n, ierr)
   print *, "ierr = ", ierr
   
   print *
   print *, "The inverted matrix AA is:"
   print *
   do i = 1, n
      print *, A(i,1:n)
   end do
   print *
   stop
end program inverse_matrix

