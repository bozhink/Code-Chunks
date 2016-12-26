module quick_sort2_module

public :: quick_sort
private :: quick_sort_1, interchange_sort

contains

subroutine quick_sort (list)

   real, dimension (:), intent (in out) :: list
   call quick_sort_1 (list, 1, size (list))

end subroutine quick_sort

recursive subroutine quick_sort_1  &
      (list, left_end, right_end)

   real, dimension (:), intent (in out) :: list
   integer, intent (in) :: left_end, right_end
   integer :: i, j
   real :: chosen, temp
   integer, parameter :: max_simple_sort_size = 6

   if (right_end < left_end + max_simple_sort_size) then
      ! Use interchange sort for small lists
      call interchange_sort (list, left_end, right_end)
   else
      ! Use partition ("quick") sort for larger lists.
      chosen = list ((left_end + right_end) / 2)
      i = left_end - 1
      j = right_end + 1

      do
         ! Scan list from left end
         ! until element >= chosen is found
         do
            i = i + 1
            if (list (i) >= chosen) then
               exit
            end if
         end do
         ! Scan list from right end
         ! until element <= chosen is found
         do
            j = j - 1
            if (list (j) <= chosen) then
               exit
            end if
         end do
         if (i < j) then
            ! swap two out of place elements
            temp = list (i)
            list (i) = list (j)
            list (j) = temp
         else if (i == j) then
            i = i + 1
            exit
         else
            exit
         end if
      end do

      if (left_end < j) then
         call quick_sort_1 (list, left_end, j)
      end if
      if (i < right_end) then
         call quick_sort_1 (list, i, right_end)
      end if
   end if

end subroutine quick_sort_1

subroutine interchange_sort (list, left_end, right_end)

   real, dimension (:), intent (in out) :: list
   integer, intent (in) :: left_end, right_end
   integer :: i, j
   real :: temp

   do i = left_end, right_end - 1
      do j = i + 1, right_end
         if (list (i) >  list (j)) then
            temp = list (i)
            list (i) = list (j)
            list (j) = temp
         end if
      end do
   end do

end subroutine interchange_sort

end module quick_sort2_module
program p_quick_sort2
use quick_sort2_module
integer :: i
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
call quick_sort(x)
do i=1,16
print "(f20.0)", x(i)
end do
end program p_quick_sort2
