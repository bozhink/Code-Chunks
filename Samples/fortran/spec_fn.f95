module m

  public :: ll

  contains

  pure function ll (n) result (rl)

     integer, intent(in) :: n
     integer :: rl

     rl = ceiling(log(real(n)))

  end function ll

end module m

program p

  use m
  implicit none

  integer, dimension (1000) :: a = 1
  real, dimension(:), allocatable :: x

  allocate (x(2*ll(8)))
  print *, "Size(x) = ", size(x)
  call ss (a)

contains

  subroutine ss (d)

    integer, dimension(:), intent(in) :: d
    integer, dimension(ll(size(d))) :: td

    td = d (1:size(td))

    print *, size(d), size(td), exp(6.0), exp(7.0)

  end subroutine ss

end program p
