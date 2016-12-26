module quick_select_module
public :: quick_select
contains
recursive subroutine quick_select  &
      (list, k, element, error)

   real, dimension (:), intent (in) :: list
   integer, intent (in) :: k
   real, intent (out) :: element
   logical, intent (out) :: error
   real, dimension (:), allocatable :: smaller, larger
   integer :: i,  &
         number_smaller, number_equal, number_larger
   real :: chosen

   if (size (list) <= 1) then
      error = .not. (size (list) == 1 .and. k == 1)
      if (error) then
         element = 0.0  ! a value must be assigned
                 ! because element is intent (out)
      else
         element = list (1)
      end if

   else
      allocate (smaller (size (list)), &
                larger (size (list)))
      chosen = list (1)
      number_smaller = 0
      number_equal = 1
      number_larger = 0

      do i = 2, size (list)
         if (list (i) < chosen) then
            number_smaller = number_smaller + 1
            smaller (number_smaller) = list (i)
         else if (list (i) == chosen) then
            number_equal = number_equal + 1
         else
            number_larger = number_larger + 1
            larger (number_larger) = list (i)
         end if
      end do

      if (k <= number_smaller) then
         call quick_select  &
               (smaller (1 : number_smaller),  &
                k, element, error)
      else if (k <= number_smaller + number_equal) then
         element = chosen
         error = .false.
      else
         call quick_select  &
               (larger (1 : number_larger),  &
                k - number_smaller - number_equal,  &
                element, error)
      end if
   deallocate (smaller, larger)
   end if

end subroutine quick_select
end module quick_select_module
program p_quick_sel
use quick_select_module
logical :: err
real :: element
real, dimension(16) :: x
x = (/ &
2980957, &
3269017, &
1202604, &
2718281, &
8103083, &
2202646, &
8886110, &
2008553, &
4424133, &
1627547, &
4034287, &
5459815, &
7389056, &
1096633, &
1484131, &
5987414 /)
call quick_select(x,1,element,err)
print "(f20.0,l9)", element, err
call quick_select(x,8,element,err)
print "(f20.0,l9)", element, err
call quick_select(x,16,element,err)
print "(f20.0,l9)", element, err
call quick_select(x,0,element,err)
print "(f20.0,l9)", element, err
call quick_select(x,17,element,err)
print "(f20.0,l9)", element, err
end program p_quick_sel
