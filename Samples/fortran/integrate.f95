module integrate_module

public :: integral

contains

function integral (f, a, b, n)  result (integral_result)
!  Calculates a trapezoidal approximation to an area
!  using n trapezoids.

!  The region is bounded by lines x = a, y = 0, x = b,
!  and the curve y = f (x).

   interface
   function f(x) result (f_result)
      real, intent (in) :: x
      real :: f_result
   end function f
   end interface

   real, intent (in) :: a, b
   integer, intent (in) :: n
   real :: integral_result
   real :: h, total
   integer :: i

   h = (b - a) / n
!  Calculate the sum f(a)/2+f(a+h)+...+f(b-h)+f(b)/2
!  Do the first and last terms first
   total = 0.5 * (f (a) + f (b))
   do i = 1, n - 1
      total = total + f (a + i * h)
   end do

   integral_result = h * total

end function integral

end module integrate_module

module sine_module

public :: sine

contains

function sine (x) result (sine_result)

   intrinsic :: sin
   real, intent (in) :: x
   real :: sine_result

   sine_result = sin (x)

end function sine

end module sine_module

program integrate

use integrate_module
use sine_module

print *, integral (sine, a=0.0, b=3.14159, n=100)

end program integrate
