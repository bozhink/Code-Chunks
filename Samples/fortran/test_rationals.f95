program test_rationals
   use rationals_module
   type(rational) :: r1, r2

   r1 = (/3, 4/)
   r2 = (/5, 6/)
   r1 = r1 + r2
   print *, real(r1)
end program test_rationals
