module constants

  integer, public, parameter ::  stdin = 5, stdout = 6

  integer, public, parameter ::  working_precision =        &
                                    selected_real_kind(8)

  real, public, parameter    ::  pi = 3.141592653,          &
                                  e = 2.71828,              &
                             log10e = 2.30256850930,        &
                            radians = 180/pi

end module constants

module working_storage
!  In this case, we only need the working precision from the constants
!  module.  We'll rename it to a shorter name for convenience

use constants, only:  prec => working_precision

private  ! indicates that parameters in the constants module
         ! are not to be passed along with the public
         ! constants in this module

integer, public, parameter                               :: w_size = 100

real(kind=prec), public, save, dimension (w_size,w_size) :: a, b, c=0

integer, public, save, dimension (2*w_size, 3)           :: d = -1

logical, public, save                                    :: problems = .false.

end module working_storage
