program quadratic_equation_solver_3

!  Calculates and prints the roots
!  of a quadratic formula even if they are complex

!  Variables:  a, b, c = coefficients
!              z1, z2 = roots

   real :: a, b, c
   complex :: z1, z2

   a = 4.0
   b = 8.0
   c = 21.0

!  Calculate the roots
   z1 = (-b + sqrt (cmplx (b**2 - 4*a*c))) / (2*a)
   z2 = (-b - sqrt (cmplx (b**2 - 4*a*c))) / (2*a)

!  Print the roots
   print *, "The roots are:"
   print *, "z1 =", z1
   print *, "z2 =", z2

end program quadratic_equation_solver_3
