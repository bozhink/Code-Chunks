program linear_solver_test_1

use slatec_module

real, dimension (3,3) :: a
real, dimension (3) :: x, b
integer :: indicator

a = reshape ( (/1,2,3,2,-1,4,3,1,-1/), (/3,3/) )
b = (/14,3,8/)
!a = reshape ( (/2,3,1,3,5,-2,-1,2,-3/), (/3,3/) )
!b = (/1,8,-1/)
!a = reshape ( (/7,-4,0,-4,15,-6,0,-6,8/), (/3,3/) )
!b = (/30,0,40/)
!a = reshape ( (/1,2,0,2,4,-6,3,6,8/), (/3,3/) )
!b = (/30,0,40/)
print *, a
print *, b
call solve_linear_equation (a, x, b, indicator)

print *, indicator

print *, "x = ", x

print *, "a x = ", matmul (a, x)
print *, "b =", b

end program linear_solver_test_1
