module f_module

public :: f, g

contains

function f (x, y) result (f_result)

   real, intent (in) :: x, y
   real :: f_result

   f_result = -0.131*y

end function f

function g (x, y) result (g_result)

   real, intent (in) :: x, y
   real :: g_result

   g_result = 3.444444e-5 - 0.0015 * y

end function g

end module f_module

program test_ode

use slatec_module
use f_module

integer :: id
real :: y

call solve_ode (f, 0.0, 1.0, 4.0, y, indicator = id)
print *, y, id

call solve_ode (f, 0.0, 1.0, 4.0, y)
print *, y

call solve_ode (g, 0.0, 10.0, 0.0022, y)
print *, y

end program test_ode
