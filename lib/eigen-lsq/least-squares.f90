module constants
   integer, parameter, public :: q = selected_real_kind(12,60)
end module constants

module eqn_solver
   public :: gauss_elimination
contains
   subroutine gauss_elimination (a, b, n, np1, eps)
      use constants
      implicit none
      real (kind=q), dimension(:,:), intent(in out) :: a
      real (kind=q), dimension(:), intent(in out)   :: b
      real (kind=q), intent(in) :: eps
      integer, intent(in) :: n, np1
      integer :: i, j, k, ii, jj, ji, kj, ll, nn, npivot
      real (kind=q) :: y, con
      
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
         if ( npivot /= i ) then
            do jj = 1, np1
               y = a(i, jj)
               a(i, jj) = a(npivot, jj)
               a(npivot, jj) = y
            end do
         end if
         do ji = ii, n
            if ( abs(a(ji,i)) >= eps ) then
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

module least_squares
   use constants
   public :: least_squares_line, least_squares_poly
contains
   subroutine least_squares_line (n, x, y, a, b, syx, r2, sa, sb)
   ! This subroutine calculates the least squares fit
   ! line ax + b to the x--y data pairs
      implicit none
      ! Dummy arguments
      integer, intent(in) :: n
      real (kind=q), dimension(:), intent(in) :: x, y
      real (kind=q), intent(out) :: a, b, syx, r2, sa, sb
      ! Local variables
      real (kind=q) :: sum_x, sum_y, sum_xy, sum_xx
      real (kind=q) :: st, sr, xmean, ymean
      integer :: i
      ! Calculate sums
      sum_x = x(1)
      sum_y = y(1)
      sum_xy = x(1)*y(1)
      sum_xx = x(1)*x(1)
      do i = 2, n
         sum_x = sum_x + x(i)
         sum_y = sum_y + y(i)
         sum_xy = sum_xy + x(i)*y(i)
         sum_xx = sum_xx + x(i)*x(i)
      end do
      ! Calculate coefficients of least squares fit line
      a = (sum_x*sum_y - n*sum_xy) / (sum_x*sum_x - n*sum_xx)
      b = (sum_y - a*sum_x) / n
      ! Calculate sume coefficients and errors
      xmean = sum_x / n
      ymean = sum_y / n
      st = 0.0_q
      sr = 0.0_q
      do i = 1, n
         st = st + (y(i) - ymean)**2
         sr = sr + (y(i) - a*x(i) - b)**2
      end do
      syx = sqrt(sr/(n-2))
      r2 = (st-sr)/st
      sa = syx * sqrt(1.0_q/(sum_xx - sum_x*sum_x / n))
      sb = syx * sqrt(1.0_q/(n - sum_x*sum_x / sum_xx))
   end subroutine least_squares_line
   subroutine least_squares_poly(n, m, x, y, eps, b, r2, sumr, sum0)
   ! Least squares polynomial regression
   ! Least squares polynomial of order m through n
   ! data points (x(i), y(i)), i = 1, 2, ..., n
      use eqn_solver
      use constants
      implicit none
      integer, intent(in) :: n, m
      real (kind=q), intent(in) :: eps
      real (kind=q), intent(out) :: r2, sumr, sum0
      real (kind=q), dimension(:), intent(in)    :: x, y
      real (kind=q), dimension(:), intent(out)   :: b
      real (kind=q), allocatable, dimension(:)   :: sx
      real (kind=q), allocatable, dimension(:)   :: sxy
      real (kind=q), allocatable, dimension(:,:) :: a
      real (kind=q) :: sum1, ybar
      integer :: i, j, m2, mp1, mp2
      
      m2 = 2*m
      mp1 = m+1
      mp2 = m+2
      allocate (sx(m2), sxy(mp1), a(mp1,mp2))
      sx(1) = x(1)
      do j = 2, n
         sx(1) = sx(1) + x(j)
      end do
      do i = 2, m2
         sx(i) = 0.0_q
         do j = 1, n
            sx(i) = sx(i) + x(j)**i
         end do
      end do
      sxy(1) = y(1)
      do j = 2, n
         sxy(1) = sxy(1) + y(j)
      end do
      do i = 2, mp1
         sxy(i) = 0.0_q
         do j = 1, n
            sxy(i) = sxy(i) + y(j) * x(j)**(i-1)
         end do
      end do
      do i = 1, mp1
         do j = 1, mp1
            if ( (i==1) .and. (j==1) ) then
               a(i, j) = 1.0_q * n
            else
               a(i, j) = sx(i+j-2)
            end if
         end do
      end do
      do i = 1, mp1
         b(i) = sxy(i)
      end do
   
      call gauss_elimination(a, b, mp1, mp2, eps)
      
      ybar = sxy(1) / n
      sum0 = 0.0_q
      sumr = 0.0_q
      do i = 1, n
         sum0 = sum0 + (y(i) - ybar)**2
         sum1 = b(1)
         do j = 2, mp1
            sum1 = sum1 + b(j) * x(i)**(j-1)
         end do
         sumr = sumr + (y(i) - sum1)**2
      end do
      r2 = (sum0 - sumr)/sum0
      deallocate (sx, sxy, a)
   end subroutine least_squares_poly

end module least_squares
