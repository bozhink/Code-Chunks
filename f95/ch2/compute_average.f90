program compute_average
   implicit none
   real :: x, sumx           ! data value and sum of values
   integer :: countx         ! number of data values

   print *, "Enter data values, -1 to end"
   sumx = 0.0                ! initialize sum and count
   countx = 0
   do
      read *, x
      if (x < 0.0) then      ! sentinel value encountered
         exit
      end if
      sumx = sumx + x        ! data value: add it to sum
      countx = countx + 1    ! and count it
   end do
   print *, "Number of data values = ", countx
   if (countx > 0) then
      print *, "Average = ", sumx/countx
   end if
end program compute_average

