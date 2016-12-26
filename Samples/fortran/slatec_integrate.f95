module f_module

public :: f, my_sin

contains

function f (x) result (f_result)

real, intent (in) :: x
real :: f_result

f_result = 4.0 * exp(-x)

end function f

function my_sin(x) result(my_sin_result)

real, intent(in) :: x
real :: my_sin_result
intrinsic :: sin

my_sin_result = sin(x)

end function my_sin

end module f_module

program test_integral

use slatec_module
use f_module

real :: value
integer :: indicator

call integrate (my_sin, 0.0, 4*atan(1.0), value, indicator=indicator)

print*, value, indicator

call integrate (my_sin, 0.0, 4*atan(1.0), value)

print*, value

call integrate (my_sin, 0.0, 4*atan(1.0), value, 0.01, indicator)

print*, value, indicator

call integrate (my_sin, 0.0, 15*4*atan(1.0), value, 0.00001, indicator)

print*, value, indicator

call integrate (my_sin, 0.0, 15*4*atan(1.0), value, 0.01, indicator)

print*, value, indicator

call integrate (f, 0.0, 1.0, value)

print*, value

call integrate (f, 0.0, epsilon(0.0), value, indicator=indicator)

print*, value, indicator

end program test_integral
