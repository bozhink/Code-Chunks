module tridiagonal_systems
    private :: tri_gauss, back_tri_substitution
    public :: tri_solve
    
contains

    subroutine tri_solve(a, d, c, b, error)
    implicit none
    !
    ! This subroutine solves a diagonally dominant
    ! tridiagonal system by Gaussian elimination
    ! and back substitution
    !
    ! Dummy arguments
    ! Array a holds the subdiagonal coefficients
    ! Array d holds the diagonal coefficients
    ! Array c holds the above-diagonal coefficients
    ! Array b holds the right-hand-side coefficients
    ! Array b will contain the solution on exit
    
    real, dimension(:), intent(in)  :: a, c
    real, dimension(:), intent(out) :: d, b
    integer, intent(out)            :: error
    
    call tri_gauss(a, d, c, b, error)
    if (error==0) then
        call back_tri_substitution(d, c, b)
    end if
    end subroutine tri_solve
    
    subroutine tri_gauss(a, d, c, b, error)
    implicit none
    !
    ! This subroutine perform Gaussian elimination
    ! with no pivoting on a tridiagonal, diagonally
    ! dominant, set of linear equations
    !
    ! Dummy arguments
    real, dimension(:), intent(in)  :: a, c
    real, dimension(:), intent(out) :: d, b
    integer, intent(out)            :: error
    !
    ! Local variables
    real    :: m
    integer :: n, i
    !
    ! Validity check
    n=size(a,1)
    if (n==0) then
        ! There is no problem to solve
        error = -1
        return
    end if
    if ( n /= size(d, 1) .or.  &
         n /= size(c, 1) .or.  &
         n /= size(b, 1) ) then
        ! The arrays of coefficients do not have
        ! the same size
        error = -2
        return
    end if
    !
    ! Calculate new coefficients of upper diagonal system
    do i = 1, n-1
        m = a(i+1)/d(i)
        d(i+1) = d(i+1) - m*c(i)
        b(i+1) = b(i+1) - m*b(i)
    end do
    error = 0
    end subroutine tri_gauss
    
    subroutine back_tri_substitution(d, c, b)
    implicit none
    !
    ! This subroutine perfoms back substitution to
    ! a tridiagonal set of linear equations that
    ! has been reduced to upper triagonal form
    !
    ! Dummy arguments
    real, dimension(:), intent(in)  :: d, c
    real, dimension(:), intent(out) :: b
    !
    ! Local variables
    integer :: i, n
    n = size(d)
    b(n) = b(n)/d(n)
    do i = n-1, 1, -1
        b(i) = (b(i)-c(i)*b(i+1)) / d(i)
    end do
    end subroutine back_tri_substitution

end module tridiagonal_systems



module spline
    use tridiagonal_systems
    private
    public :: cubic_spline

contains

    subroutine cubic_spline(x, y, a, b, c, d, error)
    implicit none
    !
    ! This subroutine calculates the coefficients of
    ! a cubic spline though the set of data points
    ! with x-coordinates int the x array and
    ! corresponding y-coordinates in the array y.
    ! The coefficients of the cubic polynomials will
    ! be put in arrays a, b, c, d
    ! error will indicate the success or failure of
    ! the fit
    !
    ! Dummy arguments
    real, dimension(0:), intent(in)  :: x, y
    real, dimension(0:), intent(out) :: a, b, c, d
    integer, intent(out)             :: error
    !
    ! Local variables
    integer :: n, i
    real, dimension(0:size(x,1)-2) :: h ! Automatic array
    ! Automatic arrays for tridiagonal equations
    real, dimension(0:size(x,1)-1) :: t, u, v, w
    !
    ! Validity check
    n = size(x) - 1
    if (n<1) then
        ! There is no problem to solve
        error = -1
        return
    end if
    
    if ( n+1 /= size(y) .or. &
           n /= size(a) .or. &
           n /= size(b) .or. &
           n /= size(c) .or. &
           n /= size(d) ) then
        ! The arrays' sizes don't correspond
        error = -2
        return
    end if
    !
    ! Test that the x-coordinate are either strictly
    ! increasing or strictly decreasing
    if ( x(0) < x(1) ) then
        ! Test that x-coordinates are ordered increasingly
        do i = 1, n-2
            if (x(i)<x(i+1)) then
                cycle
            end if
            ! x-coordinates aren't monotonically increasing
            error = -3
            return
        end do
    else if (x(0)==x(1)) then
        ! x-coordinates aren't distinct
        error = -3
        return
    else
        ! Test that x-coordinates are ordered decreasingly
        do i = 1, n-2
            if (x(i) > x(i+1)) then
                cycle
            end if
            ! x-coordinates aren't monotonically increasing
            error = -3
            return
        end do
    end if
    !
    ! Data is OK
    error = 0
    !
    ! Set h array to interval lengths
    do i = 0, n-1
       h(i) = x(i+1) - x(i)
    end do
    !
    ! Fill up coefficient arrays for the tridiagonal set
    do i = 1, n-1
       t(i) = h(i-1)
       u(i) = 2.0*(h(i-1)-h(i))
       v(i) = h(i)
       w(i) = 6.0*((y(i+1)-y(i))/h(i) - (y(i)-y(i-1))/h(i-1))
    end do
    !
    ! Set end-point contitions
    u(0) = 1.0
    v(0) = 0.0
    w(0) = 0.0
    t(n) = 0.0
    u(n) = 1.0
    w(n) = 0.0
    !
    ! Calculate the sigma values
    call tri_solve(t, u, v, w, error)
    if (error /= 0) then
       print*, "An 'IMPOSSIBLE' error has occured - " &
               //"call consultant."
       stop
    end if
    !
    ! Calculate the spline coefficients from the sigmas
    do i = 0, n-1
       a(i) = (w(i+1) - w(i))/(6.0*h(i))
       b(i) = 0.5*w(i)
       c(i) = (y(i+1)-y(i))/h(i) - (w(i+1)+2.0*w(i))*h(i)/6.0
       d(i) = y(i)
    end do
    end subroutine cubic_spline

end module spline


module test_function
    public :: f

contains
    
    function f(x) result(fx)
        implicit none
        real, intent(in) :: x
    	real :: fx
    	fx = exp(-0.5*x*x)
    end function f

end module test_function



program test_spline
! This program tests the subroutine cubic_spline
   use spline
   use test_function
   implicit none
   !
   ! Maximum coefficient for data points
   integer, parameter :: n = 17
   !
   ! Local variables
   integer                :: error, i, j
   real, dimension(0:n)   :: x
   real, dimension(0:n)   :: y
   real, dimension(0:n-1) :: a, b, c, d
   real                   :: z, zj, yz
   !
   ! Set x-values
   x = (/ -2.95, -2.60, -2.10, -1.80, -1.40, -1.0,  &
          -0.75, -0.30, -0.05,  0.20,  0.55,  0.90, &
           1.25,  1.60,  1.70,  2.10,  2.40,  3.00 /)
   !
   ! Calculate y-coordinates corresponding to data values of x
   do i = 0, n
      y(i) = f(x(i))
   end do
   !
   ! Call cubic_spline to fit a set of n polynomials
   call cubic_spline(x, y, a, b, c, d, error)
   if (error /= 0) then
      print*, "Error ", error
      stop
   end if
   !
   ! Now compare interpolated values with true
   ! ones using evenly spaced set of values
   ! between -2.8 and  +2.8
   print *
   print "(t9,a)", "x    exp(-0.5x**2)   Spline value"
   print *
   do i = 0, 14
      ! Calculate z (the value to be used)
      z = -2.8 + 0.4*i
      ! Find in which interval z lies
      do j = 0, n-1
         if (x(j) <= z .and. z <=x(j+1)) then
             exit
          end if
      end do
      !
      ! Calculate s(z) for x(j) <= z <= x(j+1)
      zj = z-x(j)
      yz = ((a(j)*zj + b(j))*zj + c(j))*zj + d(j)
      !
      ! Print comparative results
      print "(t6, f6.2, 2es15.6)", z, f(z), yz
   end do
end program test_spline

