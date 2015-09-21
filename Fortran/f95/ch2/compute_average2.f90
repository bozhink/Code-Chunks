program compute_average2
   implicit none
   real :: x, sumx           ! data value and sum of values
   integer :: countx         ! number of data values
   integer :: status         ! status of input operation

   print *, "Enter data values, <EoF> to end"
   sumx = 0.0                ! initialize sum and count
   countx = 0
   do
      read (unit=*, fmt=*, iostat=status) x
      if (status /= 0) then  ! <EoF> entered
                             ! (or input error)
         exit
      end if
      sumx = sumx + x        ! data value: add it to sum
      countx = countx + 1    ! and count it
   end do
   print *, "Number of data values = ", countx
   if ( countx > 0 ) then
      print *, "Average = ", sumx/countx
   end if
end program compute_average2

