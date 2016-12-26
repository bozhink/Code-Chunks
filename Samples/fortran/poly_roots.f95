program poly_roots

   use slatec_module

   complex, dimension(2) :: roots
   integer :: ind

   call find_roots_of_polynomial( (/2.0,-3.0,1.0/), roots, ind)
   print *, "Indicator", ind
   print *, "Roots", roots

end program poly_roots
