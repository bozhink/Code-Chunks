program test_xp
   use xp_real_module
   type (xp_real) :: x, y
   x = 1.0
   y = 4.0
   call xp_print(y*atan(x))
end program test_xp
