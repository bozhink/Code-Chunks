module eqn_solver
   public :: gauss_elimination
contains

   subroutine gauss_elimination (a, b, n, np1, eps)
      implicit none
      real, dimension(:,:), intent(in out) :: a
      real, dimension(:), intent(in out) :: b
      real, intent(in) :: eps
      integer, intent(in) :: n, np1
      integer :: i, j, k, ii, jj, ji, kj, ll, nn, npivot
      real :: y, con
      
      ! Last column of matrix a set to vector b
      do i = 1, n
         a(i, np1) = b(i)
      end do
      ! Selecting proper pivot row
      do ii = 2, n
         i = ii - 1
         npivot = i
         do jj = ii, n
            if ( abs(a(npivot,i)) < abs(a(jj,i)) )then
               npivot = jj
            end if
         end do
         
         ! Checking for singularity of matrix n
         if ( abs(a(npivot,i)) < eps ) then
            print *, "Diagonal element zero,"
            print *, "matrix may be singular"
            stop
         end if
         if ( npivot == i ) then
         !......................
         else
            do jj = 1, np1
               y = a(i, jj)
               a(i, jj) = a(npivot, jj)
               a(npivot, jj) = y
            end do
         end if
         do ji = ii, n
            if ( abs(a(ji,i)) < eps ) then
            !.............................
            else
               con = a(ji, i) / a(i, i)
               a(ji, i) = con
               do kj = ii, np1
                  a(ji, kj) = a(ji, kj) - con * a(i, kj)
               end do
            end if
         end do
      end do
      
      if ( abs(a(n,n)) < eps ) then
         print *, "Diagonal element zero,"
         print *, "matrix may be singular"
         stop
      end if
      
      ! Back substitution
      a(n, np1) = a(n, np1) / a(n, n)
      do j = 2, n
         nn = np1 - j
         ll = nn + 1
         con = a(nn, np1)
         do k = ll, n
            con = con - a(nn, k) * a(k, np1)
         end do
         a(nn, np1) = con / a(nn, nn)
      end do
      do i = 1, n
         b(i) = a(i, np1)
      end do
   end subroutine gauss_elimination


end module eqn_solver