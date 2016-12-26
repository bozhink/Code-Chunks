module f_module

public :: f1, f2, f3

contains

function f1 (x) result (f1_result)

real, intent (in) :: x
real :: f1_result

f1_result = x**3 - 5*x**2 + 2*x + 8

end function f1

function f2 (x) result (f2_result)

real, intent (in) :: x
real :: f2_result

f2_result = x**5 + 3*x**4 - 4*x**3 - 26*x**2 - 40*x - 24

end function f2

function f3 (x) result (f3_result)

real, intent (in) :: x
real :: f3_result

f3_result = x**5 - 9*x**4 + 35*x**3 - 65*x**2 + 64*x - 26

end function f3

end module f_module


program test_interval

use slatec_module
use f_module

real :: root
integer :: indicator

call find_root_in_interval (f1, 1.0, 3.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f1, -2.0, 0.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f1, 0.0, 5.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f1, 5.0, 6.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f2, -3.0, -1.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f2, 2.0, 4.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f3, 0.0, 2.0, root, indicator)

print*, root, indicator

call find_root_in_interval (f3, 0.0, 1.0, root, indicator)

print*, root, indicator

end program test_interval
