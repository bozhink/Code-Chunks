program test_determinant
! This program defines the elements of a matrix
! of rank n and calculates its determinant using
! the module procedure matrix_determinant
! Allocate arrays for elements
   use matrix_determinant_module
   implicit none
   real, allocatable, dimension(:,:)  :: a
   integer, allocatable, dimension(:) :: indx
   integer, parameter :: nmax = 100
   real :: d

   ! Size of array
   integer :: n
   ! Loop variable
   integer :: i

   ! Get size of matrix
   print *, 'What is the matrix rank?'
   read *, n

   if (n > nmax) then
      print *, 'The dimension is too large.'
      stop
   endif

   allocate(a(n,n), indx(n))

   ! Get elements
   print *, 'Type in elements for each row'
   do i = 1, n
      print *, 'Input elements of row ', i, ' of a'
      read *, a(i, 1:n)
   enddo
   print *
   print *, 'The original matrix a is:'
   print *
   do i = 1, n
      print *, a(i, 1:n)
   enddo

   ! Find the determinant of the matrix
   call determinant_calculate(a,n,d,indx)
   print *
   print *, 'The value of its determinant is=', d

end program test_determinant

