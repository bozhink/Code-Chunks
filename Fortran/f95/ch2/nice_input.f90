program nice_input
   real :: x

   print *, "Enter a positive number"

   do
      read *, x
      if ( x > 0 ) then
         exit
      end if
      print *, "Input must be positive, please try again"
   end do
end program nice_input

