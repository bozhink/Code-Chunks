program test_find_roots

use slatec_module

complex, dimension (3) :: roots3
complex, dimension (5) :: roots5
integer :: indicator

call find_roots_of_polynomial ((/8.0,2.0,-5.0,1.0/), roots3)
print *, roots3
! -1 2 4

call find_roots_of_polynomial ((/-48.0,28.0,32.0,-9.0,-4.0,1.0/), roots5, indicator)
print *, roots5, indicator
! -2 -2 1 3 4

call find_roots_of_polynomial ((/-24.0,-40.0,-26.0,-4.0,3.0,1.0/), roots5, indicator)
print *, roots5, indicator
! -2 -2 3 (-1-i) (-1+i)

call find_roots_of_polynomial ((/-26.0,64.0,-65.0,35.0,-9.0,1.0/), roots5, indicator)
print *, roots5, indicator
! 1 (1+i) (1-i) (3+2i) (3-2i)

call find_roots_of_polynomial ((/4.0,-4.0,0.0,4.0,-3.0,1.0/), roots5, indicator)
print *, roots5, indicator
! -1 (1+i) (1+i) (1-i) (1-i)

end program test_find_roots
