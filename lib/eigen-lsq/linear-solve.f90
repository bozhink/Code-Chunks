module linear_solve

   public :: krout

   integer, parameter, public :: &
                       long = selected_real_kind(15,307)

contains

   subroutine krout (mo, n, m, A, kA, b, kb, ierr)
   implicit none
   !-------------------------------------------------------
   ! Procedure for inverting matrices and solving equations
   !-------------------------------------------------------
   ! A is a matrix of order n where n is greater than or
   ! equal to 1. If mo = 0 then the inverse of A is computed
   ! and stored in A. If mo is not 0 then the inverse is not
   ! computed.
   
   ! If m is greater than 0 then b is a matrix having n rows
   ! and m columns. In this case Ax = b is solved and the
   ! solution x is stored in b. If m = 0 then there are no
   ! equations to be solved.
   ! N.B. b is passed as a VECTOR not as a matrix.
   
   ! kA = length of the columns of the array A
   ! kB = length of the columns of the array b (if m > 0)
   
   ! ierr is a variable that reports the status of the
   ! results. When the routine terminates ierr has one of the
   ! following values:
   !     ierr =  0  the requested task was performed
   !     ierr = -1  either n, kA, or kb is incorrect
   !     ierr =  k the k-th pivot element is 0
   
   ! Adapted from the routine KROUT in the NSWC Math.
   ! Library by Alan Miller, edited by Ivan Zhelyazkov
   
   integer, intent(in)                              :: mo
   integer, intent(in)                              :: n
   integer, intent(in)                              :: m
   real (kind=long), intent(in out), dimension(:,:) :: A
   integer, intent(in)                              :: kA
   real (kind=long), intent(in out), dimension(:)   :: b
   integer, intent(in)                              :: kb
   integer, intent(out)                             :: ierr
   
   ! indx is an array of dimension n-1 or larger that is
   ! used by the routine for keeping track of the row
   ! interchanges that are made. If mo is not 0 then this
   ! array is not needed.
   
   ! temp is an array of dimension n or larger that is
   ! used when A(kA,n) is inverted.
   ! If mo is not 0 then this array is not needed.
   
   integer, allocatable, dimension(:)          :: indx
   real (kind=long), allocatable, dimension(:) :: temp
   
   integer :: i, j, jp1, k, kj, km1, kp1, l, lj, maxb, &
              nj, nmj, nmk, nm1, onej
   real (kind=long) :: d, dsum, p, t
   real (kind=long), parameter :: zero = 0.0_long, &
                                   one = 1.0_long
   
   if (n < 1 .or. kA < n) then
      ierr = -1
      return
   end if
   if (m > 0 .and. kb < n) then
      ierr = -1
      return
   endif
   
   ierr = 0
   if (n < 2) then
   
   ! Case when n = 1
      
      d = A(1,1)
      if (d == zero) then
         ierr = n
         return
      end if
      if (mo == 0) then
         A(1,1) = one / d
      end if
      
      if (m <= 0) then
         return
      end if
      
      maxb = kb * m
      
      do kj = 1, maxb, kb
         b(kj) = b(kj) / d
      end do
      
      return
   end if
   
   ! General case
   
   if (mo == 0) then
      allocate (indx(n-1), temp(n))
   end if
   
   nm1 = n - 1
   do k = 1, nm1
      kp1 = k + 1
   
     ! Search for the k-th pivot element
   
      p = abs(A(k,k))
      l = k
      do i = kp1, n
         t = abs(A(i,k))
         if (p < t) then
            p = t
            l = i
         end if
      end do
      if (p == zero) then
      ! k-th pivot element is 0
         ierr = k
         return
      end if
      
      p = A(l,k)
      if (mo == 0) then
         indx(k) = l
      end if
      if (k /= l) then
      ! Interchanging rows k and l
         do j = 1, n
            t = A(k,j)
            A(k,j) = A(l,j)
            A(l,j) = t
         end do
         if (m > 0) then
            kj = k
            lj = l
            do j = 1, m
               t = b(kj)
               b(kj) = b(lj)
               b(lj) = t
               kj = kj + kb
               lj = lj + kb
            end do
         end if
      end if
      
      ! Compute the k-th row of U
      
      if (k <= 1) then
         do j = kp1, n
            A(k,j) = A(k,j) / p
         end do
      else
         km1 = k - 1
         do j = kp1, n
            dsum = A(k,j) - dot_product( A(k,1:km1), A(1:km1, j) )
            A(k,j) = dsum / p
         end do
      end if
      
      ! Compute the (k+1)-st column of L
      
      do i = kp1, n
         A(i,kp1) = A(i,kp1) - dot_product( A(i,1:k), A(1:k,kp1) )
      end do
      
      km1 = k
   end do

   ! Check the n-th pivot element
   
   if (A(n,n) == zero) then
      ierr = n
      return
   end if
   
   ! Solving the equation Ly = b
   
   if (m > 0) then
      maxb = kb * m
      do onej = 1, maxb, kb
         kj = onej
         b(kj) = b(kj) / A(1,1)
         do k = 2, n
            kj = kj + 1
            dsum = b(kj)
            km1 = k - 1
            lj = onej
            do l = 1, km1
               dsum = dsum - A(k,l) * b(lj)
               lj = lj + 1
            end do
            b(kj) = dsum / A(k,k)
         end do
      end do
      
      ! Solving the equation Ux = y
      
      do nj = n, maxb, kb
         kj = nj
         do nmk = 1, nm1
            k = n - nmk
            lj = kj
            kj = kj - 1
            dsum = b(kj)
            kp1 = k + 1
            do l = kp1, n
               dsum = dsum - A(k,l) * b(lj)
               lj = lj + 1
            end do
            b(kj) = dsum
         end do
      end do
   end if
   
   ! Replace L with the inverse of L
   
   if (mo /= 0) then
      return
   end if
   
   do j = 1, nm1
      A(j,j) = one / A(j,j)
      jp1 = j + 1
      do i = jp1, n
         dsum = dot_product( A(i,j:i-1), A(j:i-1,j) )
         A(i,j) = -dsum / A(i,i)
      end do
   end do
   A(n,n) = one / A(n,n)
   
   ! Solve Ux = Y where Y is the inverse of L
   
   do nmk = 1, nm1
      k = n - nmk
      kp1 = k + 1
      do j = kp1, n
         temp(j) = A(k,j)
         A(k,j) = zero
      end do
      do j = 1, n
         A(k,j) = A(k,j) - dot_product( temp(kp1:n), A(kp1:n,j) )
      end do
   end do
   
   ! Column interchange
   
   do nmj = 1, nm1
      j = n - nmj
      k = indx(j)
      if (j == k) then
         cycle
      end if
      do i = 1, n
         t = A(i,j)
         A(i,j) = A(i,k)
         A(i,k) = t
      end do
   end do
   
   if (mo == 0) then
      deallocate (indx, temp)
   end if
   
   end subroutine krout


end module linear_solve

