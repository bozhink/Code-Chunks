program mp
   use mp_module
   type(mp_real) :: pi

   call mpinit()
   pi = 4.0 * atan(mpreal(1.0))
   call mpwrite(6, pi)
end program mp
