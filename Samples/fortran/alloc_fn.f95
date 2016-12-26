module comp_module

public :: compress

contains

! The result of this function is the original argument with
! adjacent duplicate entries deleted (so if it was sorted,
! each element is unique).

function compress(array) result (ra)

   integer, allocatable, &
            dimension(:) :: ra
   integer, intent(in), dimension(:) :: array
   integer :: i, n

   n = count(array(:size(array)-1) /= array(2:))
   allocate(ra(n))
   n = 1
   ra(1) = array(1)
   do i = 2, size(array)
      if (array(i) /= ra(n)) then
         n = n + 1
         ra(n) = array(i)
      end if
   end do

end function compress

end module comp_module


program test_comp

   use comp_module

   integer, dimension(9) :: &
      x = (/ 1, 2, 2, 2, 3, 4, 4, 5, 5 /)

   print *, compress(x)

end program test_comp

